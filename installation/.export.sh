TARGET="$*"
rm -rf "$TARGET"
mkdir "$TARGET"
cp -rf . "$TARGET/installation"
cp -rf ../tps "$TARGET/tps"
cd "$TARGET/installation"
./.fait_un_lanceur.sh install_signal.sh
./.fait_un_lanceur.sh goSignal.sh .no_brain.jpg
./.fait_un_lanceur.sh goSignalGeek.sh .geeke.png 
