<h2 align="center"> ━━━━━━  ❖  ━━━━━━ </h2>

<div align="center">
    <code>bin</code> for scripts,
    <code>cfg</code> for configs,
    <code>etc</code> for other stuff
</div>

<p/>

![img](https://media.discordapp.net/attachments/635625917623828520/849960859627421726/Jun03-18-40.png?width=780&height=439)

<h2 align="center"> ━━━━━━  ❖  ━━━━━━ </h2>

<!--
    Got lazy using tags lol.
 -->

### ❖ Dependencies

   This are all optional but you can install if you want to replicate my desktop or something.

   * bspwm
   * sxhkd
   * rofi
   * polybar
   * neovim-nightly
   * alacritty
   * dunst
   * picom
   * brightnessctl
   * playerctl
   * dunst
   * hsetroot
   * maim
   * viewnior
   * jq
   * xclip
        
### ❖ Installation

   First, clone the repo.
   ```bash
    $ git clone --recurse-submodules https://github.com/TheRealKizu/dotfiles.git
   ```

   Then, update the submodules.
   ```bash
    $ cd dotfiles && git submodule update --remote --merge
   ```

   Finally, run the setup script.
   ```bash
    $ ./setup.sh
   ```

### ❖ Keybinds

   I only listed the important shortcuts. There's still more but have fun discovering it.

   ```
   * Super + C                ~> Kill focused window
   * Super + Space            ~> Float the focused window
   * Super + Alt + T          ~> Tile the floating focused window

   * Super + F             
     Super + Shift + F        ~> Focus next/previous window

   * Super + Left             ~> Move window leftwards 
   * Super + Right            ~> Move window rightwards
   * Super + Up               ~> Move window upwards
   * Super + Down             ~> Move window downwards

   * Super + {1-8}            ~> Move to workspace #
   * Super + Shift + {1-8}    ~> Move window to workspace #

   * XF86AudioRaiseVolume     ~> Raise volume by 5%
   * XF86AudioLowerVolume     ~> Lower volume by 5%
   * XF86MonBrightnessUp      ~> Raise brightness by 5%
   * XF86MonBrightnessDown    ~> Lower brightness by 5%

   * Super + D                ~> Open application menu

   * Super + P                ~> Open dashboard
   * Super + Shift + P        ~> Close dashboard

   * Super + Shift + Alt + R  ~> Restart bspwm
   ```

### ❖ Notes

   * Install NeoVim plugins
   * Install [GTK and Icon theme](https://github.com/sainnhe/gruvbox-material-gtk)

### ❖ System Info
   
   Have fun reading this neofetch.
   
   ![img](https://img.kizu.cf/u/zQpOoZi.png)
