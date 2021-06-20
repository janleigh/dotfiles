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

   |          Keybind          |         Description         |
   | ------------------------- | --------------------------- |
   | `Super + C`               | Kill focused window         |   
   | `Super + Space`           | Float the focused window    |
   | `Super + Alt + T`         | Tile the floating window    |
   |                           |                             |
   | `Super + F`               | Focus next window           |
   | `Super + Shift + F`       | Focus previous window       |
   |                           |                             |
   | `Super + {1-8}`           | Move to workspace #         |
   | `Super + Shift + {1-8}`   | Move window to workspace #  |
   |                           |                             |
   | `Super + D`               | Open rofi menu              |
   | `Super + P`               | Open eww dashboard          |
   | `Super + Shift + P`       | Close eww dashboard         |
   |                           |                             | 
   | `Super + Enter`           | Open an terminal instance   |
   | `Super + Shift + Alt + R` | Restart bspwm               |

### ❖ Dependencies

   This are all optional but you can install if you want to replicate my desktop or something.

   * bspwm, sxhkd and bsp-layout
   * rofi
   * polybar
   * neovim-nightly
   * alacritty
   * dunst
   * picom
   * brightnessctl and playerctl
   * maim, jq, xclip and viewnior
 
### ❖ Notes

   * Install NeoVim plugins
   * Install [GTK and Icon theme](https://github.com/sainnhe/gruvbox-material-gtk)

### ❖ System Info
   
   Have fun reading this neofetch.
   
   ![img](https://kizu.shx.gg/hrvGSg.png)
