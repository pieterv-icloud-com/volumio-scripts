rm peppy_screensaver

apt update

apt -y install unzip

wget -O peppy_screensaver.zip https://github.com/2aCD-creator/volumio-plugins/raw/gh-pages/plugins/volumio/armhf/miscellanea/peppy_screensaver/peppy_screensaver.zip

mkdir peppy_screensaver

unzip peppy_screensaver.zip -d peppy_screensaver

cd peppy_screensaver

volumio plugin install