cd
touch .bashrc
mv .bashrc .bashrc.vieux
conda init bash
mv .bashrc .initialise_conda.sh
mv .bashrc.vieux .bashrc
echo "echo""Pour initiliser python, ou jupyter notebook: cd && source ./initialise_conda.sh" >> .bashrc
