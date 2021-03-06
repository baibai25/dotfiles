# Note
## Mint settings
+ /etc/systemd/logind.conf
+ ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
+ /etc/grub.d/10_linux

### Language
```
$ LANG=C xdg-user-dirs-gtk-update
```

### Xfce4 Window
```
ウィンドウマネージャー(詳細) > コンポジット処理 > ドックウインドウに影を落とす 外す
ウィンドウマネージャー > 詳細 > ウィンドウのドラッグ時に巡回する 外す
```

### HiDPI
```
 <property name="IconSizes" type="string" value="gtk-large-toolbar=28,28:gtk-small-toolbar=20,20:gtk-menu=28,28:gtk-dnd=28,28"/>
```
+ [Adapt font and icon sizes to High Definition screen resolutions in Ubuntu-Studio XFCE](https://askubuntu.com/questions/652021/adapt-font-and-icon-sizes-to-high-definition-screen-resolutions-in-ubuntu-studio)
+ [ Bigger menu text and icons?](https://forum.xfce.org/viewtopic.php?id=6576)


### Mouse and touchpad
Reverse scroll
1. Check synclient number
2. Open autostart and set command
```
synclient
synclient VertScrollDelta=-91 && synclient HorizScrollDelta=-91
```


### Hardware acceleration
+ VAAPI
+ vainfo
+ [Chromium GPU](https://launchpad.net/~saiarcot895/+archive/ubuntu/chromium-beta)
```
cd /etc
sudo vim environment

(add these statements)
export GOOGLE_API_KEY="xxxxxx"
export GOOGLE_DEFAULT_CLIENT_ID="xxxxxx"
export GOOGLE_DEFAULT_CLIENT_SECRET="xxxxxx"
```

### Audio
Change the number of volume steps:
```
xfconf-query -c xfce4-mixer -n -p /volume-step-size -s 1 -t uint
```
or

1. check pulseaudio plugin number
2. set steps

```
xfconf-query -c xfce4-panel -lv | grep pulseaudio
xfconf-query -c xfce4-panel -p /plugins/plugin-"xx"/volume-step --create -t int -s 1
sudo reboot
```

Ref.
[How to set the number of steps (now it's 5 points for me), when audio volume is modified by Apple keyboard (fn F10, F11, F12)](https://askubuntu.com/questions/518412/how-to-set-the-number-of-steps-now-its-5-points-for-me-when-audio-volume-is)
[Change the number of steps in various volume controls](https://forum.xfce.org/viewtopic.php?id=12082)

### Change terminal language (Experimental)
Add following statement to your .bashrc:

```
export LANGUAGE= LC_ALL=en_US.utf8
```

[Crushed] Upgrade 18 to 19
Ref. [Temporarily change language for terminal messages/warnings/errors](https://askubuntu.com/questions/142812/temporarily-change-language-for-terminal-messages-warnings-errors)


## Install list
### Browser
+ Chrome
+ Chromium GPU
+ Vivaldi

### Editor
+ Vim
+ CsoundQt
+ Remarkable

### Fonts
+ Biststream Vera Sans (for Datetime)
+ [RictyDiminished-for-Powerline](https://github.com/mzyy94/RictyDiminished-for-Powerline)

powerline:

```
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
```

```
git clone https://github.com/mzyy94/RictyDiminished-for-Powerline.git
cd RictyDiminished-for-Powerline/powerline-fontpatched/
sudo mkdir /usr/share/fonts/powerline
sudo mv *.ttf /usr/share/fonts/powerline/
fc-cache
```

### Multimedia
+ ClipGrab
+ Discord
+ Peek
+ Rhythmbox
+ Rygel
+ SimpleScreenRecorder
+ Skype
+ Slack

### Utility
####Required
+ Anaconda
	+ tensorflow (だいたい必要なライブラリも一緒に入る)
	+ scikit-learn
	+ imbalanced-learn
	+ keras
	+ opencv
	+ dlib
+ numlockx
+ xbacklight
+ plank
	+ if you cannot open trash docklets:
	```
	$ exo-preferred-applications
	```
	+ Ref. [Trash Docklet doesn't open Thunar](https://bugs.launchpad.net/plank/+bug/1610183)
+ xfce4-goodies 
+ Gparted
+ Grub Customizer

#### Others
+ clamTk
+ Conky and Conky Manager
+ Easy stroke
+ OS-Uninstaller
+ Redshift
+ SoundConverter
+ TeamViewer
