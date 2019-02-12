# Note
## Mint settings
+ /etc/systemd/logind.conf
+ ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
+ /etc/grub.d/10_linux

### Language

	$ LANG=C xdg-user-dirs-gtk-update

### Xfce4 Window
	ウィンドウマネージャー(詳細) > コンポジット処理 > ドックウインドウに影を落とす 外す
	ウィンドウマネージャー > 詳細 > ウィンドウのドラッグ時に巡回する 外す

### HiDPI
	 <property name="IconSizes" type="string" value="gtk-large-toolbar=28,28:gtk-small-toolbar=20,20:gtk-menu=28,28:gtk-dnd=28,28"/>
    
+ [Adapt font and icon sizes to High Definition screen resolutions in Ubuntu-Studio XFCE](https://askubuntu.com/questions/652021/adapt-font-and-icon-sizes-to-high-definition-screen-resolutions-in-ubuntu-studio)
+ [ Bigger menu text and icons?](https://forum.xfce.org/viewtopic.php?id=6576)

### Hardware acceleration
+ VAAPI
+ vainfo
+ [Chromium GPU](https://launchpad.net/~saiarcot895/+archive/ubuntu/chromium-beta)

### Audio
Change the number of volume steps:
1. check pulseaudio plugin number
2. set steps

	xfconf-query -c xfce4-panel -lv | grep pulseaudio
	xfconf-query -c xfce4-panel -p /plugins/plugin-"xx"/volume-step --create -t int -s 1
	sudo reboot

Ref. [Change the number of steps in various volume controls](https://forum.xfce.org/viewtopic.php?id=12082)

### Change terminal language (Experimental)
Add following statement to your .bashrc:

    export LANGUAGE= LC_ALL=en_US.utf8

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

	git clone https://github.com/powerline/fonts.git
	cd fonts
	./install.sh
	
	git clone https://github.com/mzyy94/RictyDiminished-for-Powerline.git
	cd RictyDiminished-for-Powerline/powerline-fontpatched/
	sudo mkdir /usr/share/fonts
	sudo mv *.ttf /usr/share/fonts/powerline/
	fc-cache

### Multimedia
+ ClipGrab
+ Discord
+ Peek
+ plank
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