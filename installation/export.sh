TARGET="$*"
cp -rf . "$TARGET/installation"
cp -rf ../tps "$TARGET/tps"
cd "$TARGET/installation"
./fait_un_lanceur.sh install_signal.sh
