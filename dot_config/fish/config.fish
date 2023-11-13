set -g fish_ambiguous_width 1
set -g fish_term24bit 1 # true color
set -g ENHANCD_DISABLE_DOT 1
set -g ENHANCD_DISABLE_HOME 1
set -x EDITOR nvim
set -g SHELL (which fish)
set -x PKG_CONFIG_PATH /home/linuxbrew/.linuxbrew/lib/pkgconfig

type rtx > /dev/null 2>&1 && rtx activate fish | source

fish_vi_key_bindings

abbr -a ls exa --icons
abbr -a ll exa -l --icons
abbr -a la exa -la --icons
abbr -a lt exa --tree --icons
abbr -a lta exa --tree -a --icons
abbr -a cat bat
abbr -a vim nvim

set timg_option ''
if [ $TERM = 'wezterm' ]
    set timg_option "-pi"
end

abbr -a icat timg -g100x100 $timg_potion

# color theme
type scheme > /dev/null 2>&1 && scheme set tomorrow-night-bright

starship init fish | source

function fish_greeting
    type macchina > /dev/null 2>&1 && macchina
end

function ils
  if count $argv > /dev/null
    timg -g100x100 --grid=5 --frames=1 --title $timg_option $argv
  else
    timg -g100x100 --grid=5 --frames=1 --title $timg_option *
  end
end

function ranger
    test -z $RANGER_LEVEL && command ranger $argv || exit
end
