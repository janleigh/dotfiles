<h2 align="center"> ━━━━━━  ❖  ━━━━━━ </h2>

<!-- BADGES -->
<div align="center">
   <p></p>
   <a href="https://github.com/janleigh/dotfiles/stargazers">
      <img src="https://img.shields.io/github/stars/janleigh/dotfiles?color=%238dc776&labelColor=%23101415&style=for-the-badge">
   </a>
   <a href="https://github.com/janleigh/dotfiles/network/members/">
      <img src="https://img.shields.io/github/forks/janleigh/dotfiles?color=%2384a0c6&labelColor=%23101415&style=for-the-badge">
   </a>
   <img src="https://img.shields.io/github/repo-size/janleigh/dotfiles?color=%23f65b5b&labelColor=%23101415&style=for-the-badge">
   <a href="https://discord.gg/2RfJb3CVfb">
      <img src="https://img.shields.io/discord/853812920919261235?color=bb8fe5&labelColor=101415&style=for-the-badge"/>
   </a>
</div>

<p/>

---

<!-- INFORMATION -->
### ❖ Information <img alt="" align="right" src="https://badges.pufler.dev/visits/janleigh/dotfiles?style=for-the-badge&color=91e6b1&logoColor=white&labelColor=101415"/>

   <img src=".github/assets/rice.png" alt="Repo Preview" align="right" width="400px">

   Thanks for dropping by! This is my personal repository of my dotfiles.

   The [setup section](#-setup) will guide you through a step-by-step installation process.

   Here are more information about my setup:

   - **WM:** [bspwm](https://github.com/baskerville/bspwm)
   - **OS:** [EndeavourOS](https://endeavouros.com/)
   - **Terminal:** [alacritty](https://github.com/alacritty/alacritty)
   - **Shell:** [zsh](https://www.zsh.org/)
   - **Panel:** [polybar](https://github.com/polybar/polybar/)
   - **Compositor:** [picom](https://github.com/yshui/picom)
   - **Editor:** [neovim](https://github.com/neovim/neovim/)
   - **Browser:** [firefox](https://www.mozilla.org/en-US/firefox/)
   - **File Manager:** [thunar](https://github.com/xfce-mirror/thunar)
   - **Application Launcher:** [rofi](https://github.com/davatorium/rofi)

---

<!-- SETUP -->
### ❖ Setup

   > This is step-by-step how to install these dotfiles. Just [R.T.F.M](https://en.wikipedia.org/wiki/RTFM).

   > First of all, this repository contains submodules. Ensure they are updated before installing.
   ```sh
    $ git clone --recurse-submodules https://github.com/janleigh/dotfiles.git
    $ cd dotfiles && git submodule update --remote --merge
   ```

### ❖ Installation (Manual)

   > After cloning the repository, install the necessary dependencies to replicate by setup.

   <details open>
   <summary><strong>Arch Linux (and Arch-based distributions)</strong></summary>

   > Assuming your **AUR Helper** is [paru](https://github.com/Morganamilo/paru).

   ```sh
    $ paru -S bspwm sxhkd rofi polybar neovim alacritty viewnior \
    picom brightnessctl playerctl feh maim jq xclip imagemagick  \
    dunst bsp-layout i3lock-color
   ```

   </details>

   <br>

   > Then after the dependencies are installed, copy the files to it's respective folders.

   <details open>
   <summary><strong>Config and Binaries</strong></summary>

   ```sh
    $ mkdir -p $HOME/.config/ && cp -r ./cfg/* $HOME/.config/
    $ mkdir -p $HOME/.local/bin/ && cp -r ./bin/* $HOME/.local/bin/
   ```

   </details>

   <details open>
   <summary><strong>Fonts</strong></summary>

   ```sh
    $ cp -r ./etc/fonts/* $HOME/.local/share/fonts
   ```

   </details>

   <details>
   <summary><strong>Others</strong></summary>

   ```sh
    # Copy wallpaper.
    $ mkdir -p $HOME/Pictures/walls/personal && cp -r ./etc/walls/personal/personal-5.jpg $HOME/Pictures/walls/personal
   ```

   </details>

   <br>

   > Once finished copying the files, you might want to finalize the changes to your system.

   ```sh
    # Rebuilds the font cache
    $ fc-cache -v
   ```

   <br>

   > Lastly, log out from your current desktop session and log in into bspwm.

### ❖ Installation (Custom Installer)

   > The repository contains an experimental installer. You can use it by doing:
   ```sh
    $ ./setup.sh
   ```

---

### ❖ Miscellaneous

   - **Elkowar's Wacky Widgets <kbd>Suggested</kbd>**   
      > If you're **NOT** using a monitor with a 1366x768 resolution, you might want to change the `x` and `y` values of the widgets on the config.

   - **GTK Theme <kbd>Suggested</kbd>**
      > You can find the custom GTK theme [here](https://github.com/janleigh/gtk3). You can then apply it by changing the `gtk-theme-name` to `kizus_phocus` on your GTK3 config.

   - **Icon Theme <kbd>Suggested</kbd>**
      > You can install [this](https://github.com/zayronxio/Zafiro-icons/) icon theme that suits the GTK theme.

   - **Firefox Custom CSS <kbd>Suggested</kbd>**
      <details>
      <summary><strong>See</strong></summary>

      > You can install the custom Firefox CSS by first enabling `toolkit.legacyUserProfileCustomizations.stylesheets` in `about:config` and move the contents of [`etc/firefox-css`](etc/firefox-css) to `$HOME/.mozilla/firefox/*.default-release/chrome`.

      </details>

   - **Replacement Commands <kbd>Suggested</kbd>**
      <details>
      <summary><strong>See</strong></summary>

      > Assuming you're also using my [zsh](https://www.zsh.org/), you might also want to install some additional dependencies to make some commands work.

      - `ls` ➜ [`exa`](https://github.com/ogham/exa)
      - `cat` ➜ [`bat`](https://github.com/sharkdp/bat)
      - `df` ➜ [`duf`](https://github.com/muesli/duf)

      </details>

### ❖ Acknowledgements

   - **Inspiration**
      - [owl4ce](https://github.com/owl4ce) for the README style.
      - [Mangeshrex](https://github.com/Mangeshrex) for the colors of the colorscheme.
      - [JavaCafe01](https://github.com/JavaCafe01) for some colors used in the bar.
      - [ner0z](https://github.com/ner0z) for the dashboard inspiration.

   - **Contributors**
      - [flyingcakes85](https://github.com/flyingcakes85) for the **OLD** 1920x1080 eww config. 

         <a href="https://github.com/janleigh/dotfiles/graphs/contributors">
            <img src="https://contrib.rocks/image?repo=janleigh/dotfiles" />
         </a>
