#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Change cursor theme size.
xrandr
xrdb -merge ~/.Xresources

# Fix the x-shaped cursor on root window.
# xsetroot -cursor_name left_ptr

# Set environment variables.
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix for JetBrains IDEs
export BROWSER=firefox-developer-edition
export EDITOR=nvim

# Start the window manager.
export XCURSOR_SIZE=32
export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=bspwm
exec bspwm
