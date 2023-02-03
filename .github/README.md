<h2 align="center"> ━━━━━━  ❖  ━━━━━━ </h2>

<!-- BADGES -->
<div align="center">
   <p></p>
   <a href="https://github.com/janleigh/dotfiles/stargazers">
      <img src="https://img.shields.io/github/stars/janleigh/dotfiles?color=C9CBFF&labelColor=1C2325&style=for-the-badge">
   </a>
   <a href="https://github.com/janleigh/dotfiles/issues">
      <img src="https://img.shields.io/github/issues/janleigh/dotfiles?color=ffb29b&labelColor=1C2325&style=for-the-badge">
   </a>
   <a href="../LICENSE.md">
      <img src="https://img.shields.io/github/license/janleigh/dotfiles?color=FCA2AA&labelColor=1C2325&style=for-the-badge">
   </a>
   <br>
</div>
<div align="center">
   <p></p>
   <a href="https://discord.gg/2RfJb3CVfb">
      <img alt="Support Server" src="https://discord.com/api/guilds/853812920919261235/embed.png?style=banner2">
   </a>
   <br>
</div>

<p/>

<h2></h2>

<!-- NOTICE -->
## :warning: <samp>README</samp>

   This repository is no longer actively maintained as I no longer use Linux for daily use. Use at your own risk.

<!-- INFORMATION -->
## :herb: <samp>INFORMATION</samp> <img alt="" align="right" src="https://badges.pufler.dev/visits/janleigh/dotfiles?style=for-the-badge&color=A7D9B2&logoColor=white&labelColor=1C2325"/>

   <img src="assets/showcase.png" alt="Rice Showcase" align="right" width="400px">

   Thanks for dropping by! This is my personal repository of my dotfiles.

   The [setup section](#-setup) will guide you through a step-by-step installation process.

   Here are more information about my setup:

   - **Window Manager:** [bspwm](https://github.com/baskerville/bspwm)
   - **Terminal:** [alacritty](https://github.com/alacritty/alacritty)
   - **Shell:** [zsh](https://www.zsh.org/)
   - **Panel:** [eww](https://github.com/elkowar/eww)
   - **Compositor:** [picom](https://github.com/yshui/picom)
   - **Editor:** [neovim](https://github.com/neovim/neovim)
   - **Browser:** [firefox](https://www.mozilla.org/en-US/firefox)
   - **Notification Daemon:** [dunst](https://github.com/dunst-project/dunst)
   - **File Manager:** [thunar](https://github.com/xfce-mirror/thunar)
   - **Application Launcher:** [rofi](https://github.com/davatorium/rofi)

<!-- SETUP -->
## :wrench: <samp>SETUP</samp>

   <table align="right">
   <tr>
      <th align="center">
         <sup><sub>:warning: WARNING :warning:</sub></sup>
      </th>
   </tr>
   <tr>
      <td align="center">
         <sup>
            <sub>
               <samp>
                  THIS DOTFILES IS CONFIGURED AT 1366x768 WITH 96 DPI!<br>
                  SOME STUFF MIGHT BREAK ON LOWER OR HIGHER
                  <p align="center">
                     RESOLUTIONS BUT WILL STILL WORK!
                  </p>
               </samp>
            </sub>
         </sup>
      </td>
   </tr>
   </table>

   This is step-by-step how to install these dotfiles. Just [R.T.F.M](https://en.wikipedia.org/wiki/RTFM).

   First of all, this repository contains submodules. Ensure they are updated before installing.

   > Make sure to have [Git LFS](https://git-lfs.github.com) installed since it's being used for the wallpaper submodule.
   ```sh
    $ git clone --recurse-submodules https://github.com/janleigh/dotfiles.git
    $ cd dotfiles && git submodule update --remote --merge
   ```

   ### <samp><kbd>I.</kbd> INSTALLATION (DEPENDENCIES)<samp>
   
   <details>
   <summary><strong>Arch Linux (and other Arch-based distributions)</strong></summary>

   > Assuming your **AUR Helper** is [paru](https://github.com/Morganamilo/paru).

   ```sh
    $ paru -S --needed bspwm sxhkd rofi neovim alacritty viewnior picom-arian8j2-git brightnessctl \
              playerctl hsetroot maim jq xclip imagemagick dunst i3lock-color xdo giph \ 
              jgmenu redshift blueman bluetoothctl
   ```

   </details>

   <details>
   <summary><strong>Debian (and other Debian-based distributions) <kbd>UPDATES NEEDED</kbd></strong></summary>

   ```sh
    $ sudo apt install --no-install-recommends bspwm sxhkd rofi neovim alacritty viewnior \
                     picom brightnessctl playerctl mpd mpdris2 hsetroot maim jq xclip \
                     imagemagick xdo jgmenu
   ```

   > For `i3-lock` and `giph`, you need to build it from source.

   **``i3lock``**

   ```sh
    $ sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev \
                     libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev \
                     libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev \
                     libxkbcommon-x11-dev libjpeg-dev
   ```
   ```sh
    $ git clone https://github.com/Raymo111/i3lock-color.git
    $ cd i3lock-color
   ```
   ```sh
    $ ./build.sh
   ```
   ```sh
    $ ./install-i3lock-color.sh
   ```

   **``giph``**

   ```sh
    $ sudo apt install ffmpeg xdotools
   ```
   ```sh
    $ git clone https://github.com/phisch/giph.git
    $ cd giph
    $ sudo make install
   ```

   </details>

   <details>
   <summary><strong>Other Independent Linux Distributions</strong></summary>

   ```
   The Linux philosophy is ‘Laugh in the face of danger’.
   Oops. Wrong One. ‘Do it yourself’.

   - Linus Torvalds
   ```

   </details>

   ### <samp><kbd>II.</kbd> INSTALLATION (DOTFILES)<samp>

   Then after the dependencies are installed, copy the files to it's respective folders.

   <details>
   <summary><strong>Fonts</strong></summary>

   |    Font List     |  Use  |
   | :--------------: | :---: |
   | [`Sarasa Mono CL`](https://github.com/be5invis/Sarasa-Gothic) | Main Font |
   | [`Victor Mono`](https://github.com/rubjo/victor-mono) | Main Italic Font |
   | [`DM Sans`](https://fonts.google.com/specimen/DM+Sans) | Main UI Font |
   | [`Material Icons`](https://github.com/google/material-design-icons/) | Main Icon Font |

   > **NOTE**: Only important fonts has been listed on the table above.

   ```sh
    $ cp -r ./etc/fonts/* $HOME/.local/share/fonts
   ```

   </details>

   <!-- <details>
   <summary><strong>Wallpaper</strong></summary>

   |   File Name    |  Alias  |
   | -------------- | ------- |
   | [`comfy_waves.jpg`](https://github.com/janleigh/walls/blob/master/real/comfy_waves.jpg) | Comfy waves. |
   | [`wave.png`](https://github.com/janleigh/walls/blob/master/real/wave.png) | To be filled. |

   > **NOTE**: Only favorite wallpapers has been listed on the table above.

   ```sh
    $ mkdir -p $HOME/.config/bspwm/assets && cp -r ./etc/walls/real/wave.png $HOME/.config/bspwm/assets/wallpaper.png
   ``` -->

   </details>

   <details>
   <summary><strong>Configuration Files and Binaries</strong></summary>

   - `rsync` method <kbd>**RECOMMENDED**</kbd>

      ```sh
       $ mkdir -p $HOME/.config/ && rsync -avxHAXP cfg/ $HOME/.config
       $ mkdir -p $HOME/.local/bin/ && rsync -avxHAXP --exclude 'bin/usr/' bin/ $HOME/.local/bin/

       # To make tabbed and chwb2 to work, you must move it to /usr/local/bin.
       $ sudo rsync -avxHAXP bin/usr/ /usr/local/bin/
      ```

      > **WARNING**: Ensure the `rsync` command must be correct as above.
      > 
      > |   Options   |                      Function                         |
      > | ----------- | ----------------------------------------------------- |
      > | `-a`        | Archive mode                                          |
      > | `-v`        | Verbose mode                                          |
      > | `-x`        | Don't cross filesystem boundaries                     |
      > | `-H`        | Preserve hard links                                   |
      > | `-A`        | Preserve ACLs/permissions                             |
      > | `-X`        | Preserve extended attributes                          |
      > | `-P`        | Show progress during transfer                         |
      > | `--exclude` | Exclude files matching `PATTERN`                      |

   - `cp` method

      ```sh
       $ mkdir -p $HOME/.config/ && cp -r ./cfg/* $HOME/.config/
       $ mkdir -p $HOME/.local/bin/ && cp -r ./bin/* $HOME/.local/bin/

       # To make tabbed and chwb2 to work, you must move it to /usr/local/bin.
       $ sudo mv $HOME/.local/bin/usr/* /usr/local/bin/
      ```

   > **DIFFERENCES**  
   > - `cp` is for duplicating stuff and by default only ensures files have unique full path names.
   > - `rsync` is for synchronizing stuff and uses size and timestamp of files to decide if they should be replaced.

   > I also recommend to not delete the **dotfiles** directory after cloning to make upgrades easier.

   </details>

   ### <samp><kbd>III.</kbd> INSTALLATION (FINALIZING)<samp>

   Once finished copying the files, you might want to finalize the changes to your system.

   <details>
   <summary><strong>Regenerating font cache</strong></summary>

   > This ensures all existing caches are cleared and regenerated for all installed fonts.

   ```sh
    $ fc-cache -v
   ```

   </details>

   <details>
   <summary><strong>Finalizing installation</strong></summary>

   > Lastly, log out from your current desktop session and log in into bspwm.

   > If you're using [`~/.xinitrc`](https://wiki.archlinux.org/title/Xinit), simply add the following line at the end.

   ```sh
    exec bspwm
   ```

   </details>

## :rocket: <samp>MISCELLANEOUS</samp>

   - **GTK and Icon Theme**
      <details>
      <summary><strong>See</strong></summary>

      > You can find the custom GTK theme [here](https://github.com/janleigh/gtk3). You can then apply it by changing the value of `gtk-theme-name` to `janleigh-phocus` on your GTK3 config. 
      
      > For the icon theme, you can install [Zafiro Icons](https://github.com/zayronxio/Zafiro-icons/) icon theme since it suits the GTK theme.

      </details>

   - **Cursor Theme**
      <details>
      <summary><strong>See</strong></summary>

      > You can install [volantes-cursors](https://github.com/varlesh/volantes-cursors) or [phinger-cursors](https://github.com/phisch/phinger-cursors) cursor themes since it blends well with the overall desktop.

      </details>

   - **Firefox Custom CSS <kbd>OPTIONAL</kbd>**
      <details>
      <summary><strong>See</strong></summary>

      > You can install the custom Firefox CSS by first enabling `toolkit.legacyUserProfileCustomizations.stylesheets` in `about:config` and move the contents of [`etc/firefox-css`](etc/firefox-css) to `$HOME/.mozilla/firefox/xxxxxxxx.default-release/chrome`.

      </details>

   - **Replacement Commands <kbd>OPTIONAL</kbd>**
      <details>
      <summary><strong>See</strong></summary>

      > Assuming you're also using my [zsh](https://www.zsh.org/) config, you might also want to install some additional dependencies to make some commands work.

      - `ls` ➜ [`exa`](https://github.com/ogham/exa)
      - `cat` ➜ [`bat`](https://github.com/sharkdp/bat)
      - `df` ➜ [`duf`](https://github.com/muesli/duf)

      </details>

## :japan: <samp>GALLERY</samp>

   > **WIP.**

## :art: <samp>COLORSCHEME</samp>

   Apparently, my colorscheme doesn't have a name yet. It is based around [rxyhn](https://github.com/rxyhn)'s colorscheme. Feel free to suggest a name for it on the [discussions](https://github.com/janleigh/dotfiles/discussions) tab. Also, here's a nice preview of it.

   <p align="center">
      <img src="assets/colorscheme.png" alt="Colorscheme Showcase">
   </p>

   <details>
   <summary><strong>Xresources</strong></summary>

   ```
    ! special
    *.foreground:   #c5c8c9
    *.background:   #0B0F10

    ! black
    *.color0:       #101415
    *.color8:       #131718

    ! red
    *.color1:       #df5b61
    *.color9:       #ee6a70

    ! green
    *.color2:       #87c7a1
    *.color10:      #96d6b0

    ! yellow
    *.color3:       #de8f78
    *.color11:      #ffb29b

    ! blue
    *.color4:       #6791c9
    *.color12:      #7ba5dd

    ! magenta
    *.color5:       #bc83e3
    *.color13:      #cb92f2

    ! cyan
    *.color6:       #70b9cc
    *.color14:      #7fc8db

    ! white
    *.color7:       #c4c4c4
    *.color15:      #cccccc
   ```

   </details>

## :money_with_wings: <samp>TIP JAR</samp>

   If you enjoyed it and would like to show your appreciation, you may want to tip me here.

   It is never required but always appreciated. Thanks from the bottom of my heart!

   |  Donate With  |                      Address                       |
   | :-----------: | :------------------------------------------------: |
   |     Ko-fi     |     [Click Here](https://ko-fi.com/M4M272EAY)      |
   |    PayPal     | [Click Here](https://paypal.me/JanLeighAugustineM) |

## :tada: <samp>ACKNOWLEDGEMENTS</samp>

   - **Inspiration**
      - [`owl4ce`](https://github.com/owl4ce)
      - [`rxyhn`](https://github.com/rxyhn)
      - [`Syndrizzle`](https://github.com/Syndrizzle)

   - **Contributors**
      - [`flyingcakes85`](https://github.com/flyingcakes85)
      - [`Deathemon`](https://github.com/Deathemonic)
      - [`abissaldev`](https://github.com/abissaldev)

         <a href="https://github.com/janleigh/dotfiles/graphs/contributors">
            <img src="https://contrib.rocks/image?repo=janleigh/dotfiles"/>
         </a>

<p align="center">
   <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true"/>
</p>
