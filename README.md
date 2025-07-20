# Ubuntu Setup Script

this script nukes a fresh ubuntu box into my custom setup

## what it does

* updates apt and installs essential packages: ranger, btop, kew, git, curl, unzip, node-typescript, make, gnome-shell-extension-prefs, tmux, flatpak
* enables flathub repo for flatpak
* clones and installs pop-shell from pop-os for a better gnome shell experience
* installs neovim via snap (latest stable)
* installs kitty terminal from official installer
* clones my dotfiles configs for nvim, ranger, btop, kitty
* clones and overwrites my `.bashrc`
* clones and sets up my `.tmux.conf`
* sets kew music directory to `~/Music` via `kew path` command  
* creates `~/Coding` dir and clones my scripts repo into `~/Coding/scripts`  
* makes every `.sh` in scripts executable  

## gnome extensions

add the following additional gnome extensions:  
* [just perfection](https://extensions.gnome.org/extension/3843/just-perfection/) - in settings, set it to super minimal  
* [overview background](https://extensions.gnome.org/extension/5856/overview-background/)  
* [start overlay in application view](https://extensions.gnome.org/extension/5040/start-overlay-in-application-view/)  

## settings
In the multitasking tab, enable "Fixed number of Workspaces" and set it to 4  
Set multimonitor to "Workspaces on all displays" and include apps from current workspace and monitor only  
Obviously set the appearance to dark mode  
Now, go to the keyboard tab and navigate to keyboard shortcuts  
Lauching the web browser should be set to `Super + f`  
Move window one workspace to the left should be `KP /` and to the right should be `KP *`  
Move window one monitor to the left/right should be `Super + Shift + Left` and `Super + Shift + Right`  
Switching to workspaces 1, 2, 3, and 4 should be `KP 1`, `KP 2`, `KP 3`, and `KP 4` respectively  
Volume down should be set to `KP 7` and volume up to `KP 9`  
I have restore keyboard shortcuts disabled for fear of losing them  
The shortcut to hide a window should be `Super + ,` and maximizing a window should be disabled (but toggle maximization state should be `Super + m`)  
For custom shortcuts: `Super + d` runs `discord` and `Super + t` runs `kitty tmux`  

## how to use

add the gnome extensions and settings, then:  
just run the script on a fresh Ubuntu install, watch it do its thing

```bash
bash setup.sh
```
