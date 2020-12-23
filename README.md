# wireguard-desktop

Starting your Wireguard VPN from the desktop via desktop icon. 

Bonus: the icon turns red, when the connection is active. It turns gray, when the connection is down.

## How does it work

The script uses wg-quick to initialize the VPN connection. If sudo rights are needed (normally they do), a zenity dialog opens to ask for the sudo password. When the connection is initialized a sed command changes the icon in the desktop file.

## Disclaimer

The script does NOT check if the connection is usable. It only sees that the connection is initiated. This is intended behavior! 

The reason for this is simple. Wireguard is a stateless VPN, it simply encrypts your IP packages and sends them to the receiving peer. In the case of network issues, the user should only be informed by the change of the icon that all of his packages are sent to the receiver (depends on the configuration of course).   

# Deployment

## Dependencies

This shell script(s) depend on:
* wireguard (of course)
* zenity

## Installing
Clone the repo to a folder of your choice. 

``` 
git clone https://github.com/chewyf5/wireguard-desktop.git 
```

Install it by the common Linux three-liner. 

``` 
cd wireguard-desktop
./configure
make 
sudo make install
```

## Uninstall

Simply call the created Makefile with the target uninstall.

```
sudo make uninstall
```

## Clean up 

To clean up the Makefile as well as the debug and/or the build folder simply call the clean target.

```
make clean
```

# Development

In the unlikly event of further development, clone the repo as normal. Use the following commands to create a debug folder with a working debug copy inside the wireguard-desktop folder.:

``` 
cd wireguard-desktop
./configure
make debug
```

To find all the relevant and created files, call the tree command:

```
tree debug
```

## A word on the code

The script heavily depends on correct path names. That's the reason why I choose good old make files for deployment. Inside the code I use the following variables for the corresponding path names:

* ``` ___LIB_PATH___ ``` is the path to lib files. In this case supporting scripts for the <span>wireguard-desktop.sh</span>
* ``` ___ICON_PATH___ ``` is the path to the icons
* ```  ___DESKTOP_FILE_PATH___ ``` is the path to the desktop icon.

The mentioned variables above were exchanged during the make run to the real paths. By using the make target/goal "debug" every path is set to the debug folder. In case of the make target "build" every path is set to its desired install location. This location can be controlled by the ./configure script:

```
./configure --prefix=/usr/local
```

In this case the desired location for the script and its dependencies is /usr/local. 

# Credits

* The guys from linuxserver.io - this work is based on one of there blog articels: [Connect an Ubuntu client to OPNsense WireGuard tunnel with a GUI toggle in Gnome](https://blog.linuxserver.io/2019/11/24/connect-an-ubuntu-client-to-opnsense-wireguard-tunnel-with-a-gui-toggle-in-gnome/)

* The [ubuntu users forum](https://forum.ubuntuusers.de/) where I found a some question-answer-sections about the manipulation of desktop files and using the icons as status indicators.

* [Satta](https://github.com/satta), who told me a lot about the importance of using prefixes in make files.

* Thanks to the author of [makefiletutorial.com](https://makefiletutorial.com/) where I learnd how to write make files. 

* Jason A. Donenfeld - the creator of Wireguard - "Man, you build the VPN I have ever dreamed of"
