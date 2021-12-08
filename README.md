<h2 align="center"> ━━━━━━  ❖  ━━━━━━ </h2>

<!-- INFO -->
<div align="center">
    <code>bin</code> for scripts,
    <code>cfg</code> for configs,
    <code>etc</code> for other stuff
    <p></p>
    <a href="https://github.com/TheRealKizu/dotfiles/stargazers">
        <img src="https://img.shields.io/github/stars/TheRealKizu/dotfiles?color=%238dc776&labelColor=%23101415&style=flat-square">
    </a>
    <a href="https://github.com/TheRealKizu/dotfiles/network/members/">
        <img src="https://img.shields.io/github/forks/TheRealKizu/dotfiles?color=%2384a0c6&labelColor=%23101415&style=flat-square">
    </a>
    <img src="https://img.shields.io/github/repo-size/TheRealKizu/dotfiles?color=%23e7ac7e&labelColor=%23101415&style=flat-square">
    <a href="https://discord.gg/2RfJb3CVfb">
      <img src="https://img.shields.io/discord/853812920919261235?color=bb8fe5&labelColor=101415&style=flat-square"/>
   </a>
</div>

<p/>

<div align="center">
   <img src="https://cdn.xndr.tech/u/fTp7xuu.png">
   <img src="https://cdn.xndr.tech/u/Mvv46gp.png">
   <img src="https://cdn.xndr.tech/u/UNfAjBB.png">
</div>

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

   |                               Keybind                                |         Description         |
   | -------------------------------------------------------------------- | --------------------------- |
   | <kbd>Super</kbd> + <kbd>C</kbd>                                      | Kill focused window         |                                                              |                                                                      |                             |
   | <kbd>Super</kbd> + <kbd>Space</kbd>                                  | Float the focused window    |
   | <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>T</kbd>                     | Tile the floating window    |
   |                                                                      |                             |
   | <kbd>Super</kbd> + <kbd>F</kbd>                                      | Focus next window           |
   | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd>                   | Focus previous window       |
   | <kbd>Super</kbd> + <kbd>1-6</kbd>                                    | Move to workspace #         |
   | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1-6</kbd>                 | Move window to workspace #  |
   |                                                                      |                             |
   | <kbd>Super</kbd> + <kbd>A</kbd>                                      | Open application menu       |
   | <kbd>Super</kbd> + <kbd>D</kbd>                                      | Open dashboard              |
   | <kbd>Super</kbd> + <kbd>P</kbd>                                      | Open powermenu              |
   |                                                                      |                             |
   | <kbd>Alt</kbd> + <kbd>F</kbd>                                        | Toggle polybar panel        |
   | <kbd>Super</kbd> + <kbd>L</kbd>                                      | Toggle screen lock          |
   |                                                                      |                             | 
   | <kbd>Super</kbd> + <kbd>Enter</kbd>                                  | Open an terminal instance   |
   | <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Alt</kbd> + <kbd>R</kbd>  | Restart bspwm               |

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
   * maim, jq, xclip, imagemagick and viewnior
   * i3lock-color

### ❖ Notes

   ~~If I forgot something, please let me know.~~ 

   * Run `:PackerSync` upon starting neovim.
   * Install this [icon](https://github.com/zayronxio/Zafiro-icons/) and [gtk](https://github.com/TheRealKizu/gtk3) theme.
   * Modify `eww.yuck` for your resolution (default one is for 1366x768)

### ❖ System Info

   Have fun reading this neofetch.

   <img align="center" src="https://cdn.xndr.tech/u/DUiqR78.png">
