if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting 
end

#NNN
export NNN_FIFO="/tmp/nnn.fifo nnn"
export NNN_PREVIEW="/tmp/nnn-preview-tui-fifopid."
export NNN_OPENER="xdg-open"
export NNN_OPENER_DETACH=1
export EDITOR="vim"
export NNN_EDITOR="/usr/bin/vim"
export NNN_VISUAL="vim"
export NNN_COLORS="5632"
export NNN_FCOLORS="0B0405020006060009060B01"
#export NNN_FCOLORS="0000E6310000000000000000"
export NNN_BMS='m:/mnt;g:/mnt/Kingston/gallery-dl/instagram;d:~/Downloads;p:~/Pictures;t:~/Documents;f:~/Desktop'
export NNN_PLUG='a:addtoplaylist;j:autojump;p:preview-tui;i:imgview;l:launch;r:renamer;w:wallpaper;o:organize;x:xdgdefault'

#Googler
#for Google Videos (any source)
alias v='googler -V --url-handler mpv $argv'
#for site-specific videos (e.g. YouTube)
alias yv='googler -w youtube.com --url-handler mpv $argv'

#Ddgr
export BROWSER="w3m"

#Qt5ct
export QT_QPA_PLATFORMTHEME="qt5ct"

#fzf
export FZF_DEFAULT_OPTS='
--color fg:#e0def4,bg:#232136,hl:#3e8fb0,fg+:#232136,bg+:#3e8fb0,hl+:#3e8fb0
--color pointer:#232136,info:#e0def4,spinner:#e0def4,header:#e0def4,prompt:#c4a7e7,marker:#c4a7e7,border:#393552,gutter:#c4a7e7
'

#Bat
export BAT_THEME="Rose-Pine-Moon"

#Mangal
export MANGAL_FORMATS_USE="cbz"
export MANGAL_DOWNLOADER_CREATE_VOLUME_DIR="true"

#Alias
#alias nnn="nnn -r -e -x -D -C" 
#alias nnn="nnn -r -e -x -C"
alias nnn="nnn -r -e -x"
alias icat="kitty +kitten icat"
alias stig="stig tui hide topbar"
alias w3m="w3m -o inline_img_protocol=4"
alias eza="eza --icons --group-directories-first -s=type"
alias ls="eza"
alias ncdu="ncdu --color dark"
#alias cat="bat --paging=never"
alias muc="muc --file ~/.local/share/fish/fish_history --count 10 --pretty --shell="fish""
alias tap="tap -db --color fg=e0def4,bg=232136,hl=c4a7e7,prompt=3e8fb0,header=ea9a97,header+=eb6f92,progress=f6c177,info=3e8fb0,err=eb6f92"
#alias ytfzf="ytfzf -T mpv"

#Icons_in_terminal
source ~/.local/share/icons-in-terminal/icons.fish

#Firefox
export MOZ_X11_EGL="1"

#Ranger
#export RANGER_LOAD_DEFAULT_RC=false

#Kunst
# The size of the album art to be displayed
export KUNST_SIZE="270x270"
export KUNST_MUSIC_DIR="/mnt/Kingston/Music"

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

#fff
# w3m-img offsets.
export FFF_W3M_XOFFSET=27
export FFF_W3M_YOFFSET=13

# File Opener
export FFF_OPENER="xdg-open"

# (Ignores FFF_COL1)
export FFF_LS_COLORS=1

# Directory color [0-9]
export FFF_COL1=5

# Status background color [0-9]
export FFF_COL2=6

# Selection color [0-9] (copied/moved files)
export FFF_COL3=3

# Cursor color [0-9]
export FFF_COL4=1

# Status foreground color [0-9]
export FFF_COL5=0

# Shfm
#export SHFM_OPENER="$HOME/.config/shfm/SHFM_OPENER"

# Pip packages path
#export PATH="$HOME/.local/bin:$PATH"

# Cargo Rust path
export PATH="$HOME/.cargo/bin:$PATH"

# fish
#set -gx BROWSER firefox
set -U fish_color_command 81a1c1
set -U fish_color_match --background=blue
set -U fish_color_user green

# Starship (https://github.com/starship/starship)
starship init fish | source

