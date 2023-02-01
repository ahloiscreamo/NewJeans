#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

#NNN
export NNN_FIFO="/tmp/nnn.fifo nnn"
export NNN_PREVIEW="/tmp/nnn-preview-tui-fifopid."
export NNN_OPENER="xdg-open"
export NNN_OPENER_DETACH=1
export EDITOR="vim"
export NNN_EDITOR="/usr/bin/vim"
export NNN_VISUAL="vim"
export NNN_COLORS="4136"
#export NNN_FCOLORS="0B0B04060006060009060B06"
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_BMS='m:/mnt;g:/mnt/Kingston/gallery-dl/instagram;d:~/Downloads;p:~/Pictures;t:~/Documents;f:~/Desktop'
export NNN_PLUG='j:autojump;p:preview-tui;l:launch;r:renamer;w:wallpaper;o:organize;x:xdgdefault'

#Googler
#for Google Videos (any source)
alias v='googler -V --url-handler mpv $argv'
#for site-specific videos (e.g. YouTube)
alias yv='googler -w youtube.com --url-handler mpv $argv'

#fzf
export FZF_DEFAULT_OPTS='
--color fg:#D8DEE9,bg:#242d4f,hl:#A3BE8C,fg+:#D8DEE9,bg+:#b08ba9,hl+:#A3BE8C
--color pointer:#d9dbdf,info:#d9dbdf,spinner:#d9dbdf,header:#d9dbdf,prompt:#81A1C1,marker:#EBCB8B,border:#b38dac,gutter:#81a1c1
'

#Bat
export BAT_THEME="Nord"

#Alias
#alias nnn="nnn -r -e -x -D -C" 
alias nnn="nnn -r -e -x"
alias icat="kitty +kitten icat"
alias stig="stig tui hide topbar"

#Firefox
export MOZ_X11_EGL="1"

#Ranger
#export RANGER_LOAD_DEFAULT_RC=false

#Kunst
# The size of the album art to be displayed
export KUNST_SIZE="250x250"

#Font Preview
# Input prompt of fuzzy searcher
export FONTPREVIEW_SEARCH_PROMPT="❯ "

# Size of the font preview window
export FONTPREVIEW_SIZE=532x365

# The position where the font preview window should be displayed
export FONTPREVIEW_POSITION="+0+0"

# Font size
export FONTPREVIEW_FONT_SIZE=38

# Background color of the font preview window
export FONTPREVIEW_BG_COLOR="#ffffff"

# Foreground color of the font preview window
export FONTPREVIEW_FG_COLOR="#000000"

# Preview text that should be displayed in the font preview window
export FONTPREVIEW_PREVIEW_TEXT="ABCDEFGHIJKLM\nNOPQRSTUVWXYZ\nabcdefghijklm\nnopqrstuvwxyz\n1234567890\n!@\%(){}[]"

# Where your music is located
export KUNST_MUSIC_DIR="/gallery/Music/"

#fff
# w3m-img offsets.
export FFF_W3M_XOFFSET=27
export FFF_W3M_YOFFSET=13

# File Opener
export FFF_OPENER="xdg-open"

# (Ignores FFF_COL1)
export FFF_LS_COLORS=1

# Directory color [0-9]
export FFF_COL1=4

# Status background color [0-9]
export FFF_COL2=4

# Selection color [0-9] (copied/moved files)
export FFF_COL3=6

# Cursor color [0-9]
export FFF_COL4=3

# Status foreground color [0-9]
export FFF_COL5=0

if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi

#autostartx x
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
      exec startx
fi
