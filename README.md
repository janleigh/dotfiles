<h2 align="center"> ━━━━━━  ❖  ━━━━━━ </h2>

<!-- BADGES -->
<div align="center">
    <p></p>
    <a href="https://github.com/TheRealKizu/dotfiles/stargazers">
        <img src="https://img.shields.io/github/stars/TheRealKizu/dotfiles?color=%238dc776&labelColor=%23101415&style=for-the-badge">
    </a>
    <a href="https://github.com/TheRealKizu/dotfiles/network/members/">
        <img src="https://img.shields.io/github/forks/TheRealKizu/dotfiles?color=%2384a0c6&labelColor=%23101415&style=for-the-badge">
    </a>
    <img src="https://img.shields.io/github/repo-size/TheRealKizu/dotfiles?color=%23f65b5b&labelColor=%23101415&style=for-the-badge">
    <a href="https://discord.gg/2RfJb3CVfb">
      <img src="https://img.shields.io/discord/853812920919261235?color=bb8fe5&labelColor=101415&style=for-the-badge"/>
   </a>
</div>

<p/>

---

<!-- INFORMATION -->
### ❖ Information

   <img src="https://cdn.xndr.tech/u/XDOyrKx.png" alt="minimal" align="right" width="400px">

   Thanks for dropping by! This is my personal repository of my dotfiles.

   The [setup section](#-setup) will guide you through a step-by-step installation process.

   Here are more information about my setup:

   - **WM:** bspwm
   - **OS:** EndeavourOS
   - **Terminal:** alacritty
   - **Shell:** zsh with oh-my-zsh framework
   - **Panel:** polybar
   - **Compositor:** picom
   - **Editor:** neovim
   - **Browser:** firefox
   - **File Manager:** thunar
   - **Application Launcher:** rofi

---

<!-- SETUP -->
### ❖ Setup

   > This is step-by-step how to install these dotfiles. Just [R.T.F.M](https://en.wikipedia.org/wiki/RTFM).

   > First of all, this repository contains submodules, ensure they are updated before installing.
   ```sh
    $ git clone --recurse-submodules https://github.com/TheRealKizu/dotfiles.git
    $ cd dotfiles && git submodule update --remote --merge
   ```

### ❖ Installation (Manual)

   > Customize the dependencies you want to install down below. This is all from the current setup I'm using.

   <details open>
   <summary><strong>Arch Linux (and all based distributions)</strong></summary>

   > Ensure your **AUR Helper** is [paru](https://github.com/Morganamilo/paru).

   ```sh
    $ paru -S bspwm sxhkd rofi polybar neovim alacritty \
    dunst picom brightnessctl playerctl dunst feh maim viewnior \
    jq xclip imagemagick bsp-layout i3lock-color spotify
   ```

   </details>

   <br>

   > Once the dependencies are installed, copy the files to it's respective folders.

   ```sh
    $ cp -r ./cfg/* $HOME/.config/
    $ cp -r ./bin/* $HOME/.local/bin/
    $ cp -r ./etc/fonts/* $HOME/.local/share/fonts
    $ cp -r ./etc/wallpapers/tiled.png $HOME/Pictures/walls
   ```

   <br>

   > Once finished copying the files, you might want to finalize the changes to your system.

   ```sh
    # Rebuilds the font cache
    $ fc-cache -v
   ```

### ❖ Installation (Custom Installer)

   > The repository contains an experimental installer. You can use it by doing:
   ```bash
    $ ./setup.sh
   ```

---

### ❖ Miscellaneous

   - **Elkowar's Wacky Widgets <kbd>Suggested</kbd>**   
      > If you're **NOT** on a monitor with a 1366x768 resolution, you might want to change the `x` and `y` values of the widgets on the [config](cfg/eww/eww.yuck).

   - **GTK Theme <kbd>Suggested</kbd>**
      > You can find the custom GTK theme [here](https://github.com/TheRealKizu/gtk3). You can then apply it by changing the `gtk-theme-name` to `kizus_phocus` on your GTK3 config.

   - **Icon Theme <kbd>Suggested</kbd>**
      > You can install [this](https://github.com/zayronxio/Zafiro-icons/) icon theme that suits the GTK theme.

### ❖ Acknowledgements

   - **Inspiration**
      - [owl4ce](https://github.com/owl4ce)
      - [Axarva](https://github.com/Axarva)
      - [elenapan](https://github.com/elenapan)
      - [JavaCafe01](https://github.com/JavaCafe01)
      - [Mangeshrex](https://github.com/Mangeshrex)

   - **Contributors**
      - [flyingcakes85](https://github.com/flyingcakes85) for the **OLD** 1920x1080 eww config. 

         <a href="https://github.com/TheRealKizu/dotfiles/graphs/contributors">
            <img src="https://contrib.rocks/image?repo=TheRealKizu/dotfiles" />
         </a>

         Made with [contributors-img](https://contrib.rocks).
