#!/opt/local/
# -*- coding: utf-8 -*-

import re
import os
import shutil
from random import randint, seed, random, choice
import jinja2
import os
from jinja2 import Template
from numpy import log2, log10, ceil, sqrt, pi
import numpy.random as nprand
import numpy as np



def gen_sujet_latex(template_file, graine, version, correction):

    seed(graine)
    nprand.seed(graine)
    options = {}
    if correction:
        options['correction'] = 'correction'
    else:
        options['correction'] = ''


    gains=[[sqrt(2.),"tdB"], [2.,"sdB" ], [2.*sqrt(2.),"ndB"], [16./10.,"qdB"], [32./10.,"ddB"]]
    tetas=[180/3, 180/5, 180/6, 180/4]
    tetas = tetas + [x + 180 for x in tetas]
    tetas = tetas + [-x for x in tetas]

    gain = choice(gains)
    version += '=' +gain[1]
    #rA = random()*(7./gain - 2.) + 2.
    rA = random()*(7./gain[0] - 2.) + 2.
    rB = rA*gain[0]
    tA = int(random()*360.)
    tB = tA + choice(tetas)
    options['VERSION']= version
   
    print("\n\n\n\n________________________________________\n")
    print([rA,rB,tA,tB ])
    print("\n\n\n\n________________________________________\n")
    options['rA'] = rA.__str__()
    options['rB'] = rB.__str__()
    options['tA'] = tA.__str__()
    options['tB'] = tB.__str__()
   
    
    latex_jinja_env = jinja2.Environment(
        block_start_string='\BLOCK{',
        block_end_string='}',
        variable_start_string='\VAR{',
        variable_end_string='}',
        comment_start_string='\#{',
        comment_end_string='}',
        line_statement_prefix='%%',
        line_comment_prefix='%#',
        trim_blocks=True,
        autoescape=False,
        loader=jinja2.FileSystemLoader(os.path.abspath('/'))
    )

    template = latex_jinja_env.get_template(os.path.realpath(template_file))

    renderer_template = template.render(**options)

    return renderer_template.encode('utf8')


qcm = "qcm_1"
template_file = qcm+"_template.tex"
out_file = qcm+"_sujet_"

build_d = "_build_d"
if not os.path.exists(build_d):  # create the build directory if not exisiting
    os.makedirs(build_d)
else :
    os.system('rm ./'+build_d+'/*')
    os.system('rm ./_tex/*')




annee = 2024
groupes = ('Special','A', 'B')

#groupes = ('A', 'B', 'Special',)
#groupes = ('A','B')
correction=False
#seed_special = [0xDECE, 0xCACA, 0xABBA, 0xACDC]
seed_special = [0xFACE, 0xABBA, 0xACDC]

seed_groupes={}
seed(0xDECA + annee)
for groupe in groupes:
    seed_groupes[groupe] = randint(0, 2**16-1)

for groupe in groupes:
    os.system('rm ./'+build_d+'/*')

    print("Génère le groupe "+groupe)

    if groupe == "Special":
        versions = seed_special
        nb_sujets = len(versions)
    else:
        seed(seed_groupes[groupe])
        nb_sujets = 28
        versions = [0]*nb_sujets
        for i in range(nb_sujets):
            versions[i] = randint(0, 2 ** 16 - 1)


    for i in range(nb_sujets):
        seed(versions[i])
        version_string = annee.__str__() + '-' + 'groupe' + groupe + '-v' + i.__str__() + '-' + format(versions[i], '04x')
        out_version_file = out_file + version_string

        sujet = gen_sujet_latex(template_file, versions[i], version_string, False)
        sortie = "_tex/"+out_version_file+ ".tex"
        
        with open(sortie, "wb") as f:  # saves tex_code to outpout file
            f.write(sujet)
        os.system('pdflatex -output-directory {} {}'.format(os.path.realpath(build_d), os.path.realpath(sortie)))
        os.system('pdflatex -output-directory {} {}'.format(os.path.realpath(build_d), os.path.realpath(sortie)))

        if correction : 
            seed(versions[i])
            corrige = gen_sujet_latex(template_file, versions[i], version_string, True)
            sortie = "_tex/"+out_version_file+ "_corr.tex"
            with open(sortie, "wb") as f:  # saves tex_code to outpout file
                f.write(corrige)
            os.system('pdflatex -output-directory {} {}'.format(os.path.realpath(build_d), os.path.realpath(sortie)))
            os.system('pdflatex -output-directory {} {}'.format(os.path.realpath(build_d), os.path.realpath(sortie)))
        #os.system('./zip_les_pdfs.sh '+qcm+'_groupe_'+groupe)
        os.system('./joindre_les_pdfs.sh '+qcm+'_groupe_'+groupe)

