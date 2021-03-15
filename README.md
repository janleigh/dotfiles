<h2 align="center"> ━━━━━━  ❖  ━━━━━━ </h2>

<div align="center">
    <code>bin</code> for scripts,
    <code>cfg</code> for configs,
    <code>etc</code> for other stuff
</div>

<p/>

![img](https://cdn.mythcord.cf/u/b8RyLg4.png)

<h2 align="center"> ━━━━━━  ❖  ━━━━━━ </h2>

<!--
    Got lazy using tags lol.
 -->

### ❖ Dependencies

   This are all optional but you can install if you want to replicate my desktop or something.

   * [i3-gaps](https://github.com/Airblader/i3)
   * [rofi](https://github.com/davatorium/rofi)
   * [polybar](https://github.com/polybar/polybar)
   * [neovim](https://neovim.io/) (Must be the nightly version)
   * A terminal emulator (I use alacritty)
   * picom
   * brightnessctl
   * playerctl
   * amixer
   * dunst
   * hsetroot

   If you are on Arch Linux, you can easily run this command to install all dependencies.

   ```bash
    $ yay -S i3-gaps rofi polybar neovim-nightly-bin picom brightnessctl playerctl amixer dunst hsetroot
   ``` 
        
### ❖ Cloning

   The repository contains submodules. Make sure to clone it properly.

   ```bash
    $ git clone --recurse-submodules https://github.com/TheRealKizu/dotfiles.git
    $ cd dotfiles && git submodule update --remote --merge
   ```

### ❖ Installation

   I provided an script to install my configuration. It only copies the config files to `$HOME/.config/` for now.
   
   You can run it by running `setup.sh`.

   Tools needed for the script: `yay`, `dialog`

   ```bash
    $ ./setup.sh
   ```

### ❖ Keybinds

   I only listed the important shortcuts. There's still more but have fun discovering it.

   ```
   * Super + C | Alt + F4  ~> Kill focused window
   * Super + Left          ~> Change focus to left
   * Super + Right         ~> Change focus to right
   * Super + Up            ~> Change focus to up
   * Super + Down          ~> Change focus to down

   * Super + Shift + Left  ~> Move window leftwards 
   * Super + Shift + Right ~> Move window rightwards
   * Super + Shift + Up    ~> Move window upwards
   * Super + Shift + Down  ~> Move window downwards

   * Super + {1-6}         ~> Move to workspace #
   * Super + Shift + {1-6} ~> Move window to workspace #

   * Super + Space         ~> Float the focused window
   * Super + F             ~> Toggle fullscreen

   * XF86AudioRaiseVolume  ~> Raise volume by 5%
   * XF86AudioLowerVolume  ~> Lower volume by 5%
   * XF86MonBrightnessUp   ~> Raise brightness by 5%
   * XF86MonBrightnessDown ~> Lower brightness by 5%

   * Super + Shift + R     ~> Restart i3
   ```

### ❖ System Info
   
   Have fun reading this neofetch.
   
   ![img](https://cdn.mythcord.cf/u/bBfDYEO.png)
