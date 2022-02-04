echo "INSTALL Waveshare 3.5inch RPI LCD (C) on Volumio"

rm -rf LCD-show

apt update

apt -y install xserver-xorg-input-evdev xserver-xorg-video-fbturbo

git clone https://github.com/waveshare/LCD-show

cp LCD-show/waveshare35c-overlay.dtb /boot/overlays/

cp LCD-show/waveshare35c-overlay.dtb /boot/overlays/waveshare35c.dtbo

cp -rf LCD-show/usr/share/X11/xorg.conf.d/99-fbturbo.conf /usr/share/X11/xorg.conf.d/99-fbturbo.conf

cp -rf LCD-show/etc/X11/xorg.conf.d/99-calibration.conf-35c /etc/X11/xorg.conf.d/99-calibration.conf

cp -rf LCD-show/etc/X11/xorg.conf.d/99-calibration.conf-35c /usr/share/X11/xorg.conf.d/99-calibration.conf

cat <<'EOF' > /etc/X11/xorg.conf.d/99-calibration.conf
Section "InputClass"
		Identifier      "calibration"
		MatchProduct    "ADS7846 Touchscreen"
		Option  "Calibration"   "3932 300 294 3801"
		Option  "SwapAxes"      "1"
		Driver  "evdev"
EndSection
EOF

cat <<'EOF' > /usr/share/X11/xorg.conf.d/99-calibration.conf
Section "InputClass"
		Identifier      "calibration"
		MatchProduct    "ADS7846 Touchscreen"
		Option  "Calibration"   "3932 300 294 3801"
		Option  "SwapAxes"      "1"
		Driver  "evdev"
EndSection
EOF

grep -q "dtparam=spi=on" /boot/userconfig.txt || \
  echo "dtparam=spi=on" >> /boot/userconfig.txt
echo "dtoverlay=waveshare35c:rotate=270" >> /boot/userconfig.txt

echo "SUCCESS"

echo "REBOOTING"

reboot
