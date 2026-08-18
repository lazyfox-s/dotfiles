set -g fish_ambiguous_width 1
set -g fish_term24bit 1 # true color
set -g ENHANCD_DISABLE_DOT 1
set -g ENHANCD_DISABLE_HOME 1
set -x EDITOR nvim
set -g SHELL (which fish)
set -x PKG_CONFIG_PATH /home/linuxbrew/.linuxbrew/lib/pkgconfig

type mise > /dev/null 2>&1 && mise activate fish | source

fish_vi_key_bindings

alias ls 'eza --icons --git --time-style relative'
alias cat 'bat'
alias vim 'nvim'
alias grep 'rg --color=auto'
alias chezmoi-cd 'cd (chezmoi source-path)'

abbr -a ll ls -l
abbr -a la ls -la
abbr -a lt ls --tree
abbr -a lta ls --tree -a

set timg_option ''
if [ $TERM = 'wezterm' ]
    set timg_option "-pi"
end

abbr -a icat timg -g100x100 $timg_potion

# color theme
type scheme > /dev/null 2>&1 && scheme set tomorrow-night-bright

starship init fish | source

function fish_greeting
    if [ $SHLVL = '1' ]
        type macchina > /dev/null 2>&1 && macchina
    end
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

function lk
    set loc (walk --icons --fuzzy $argv); and cd $loc;
end

type -q zoxide; and zoxide init fish | source

# cdh ($dirprev) persistence
set -g __dirprev_file ~/.local/share/fish/dirprev_history

if status is-interactive; and test -f $__dirprev_file
    set -g dirprev (cat $__dirprev_file)
end

function __persist_dirprev --on-variable PWD --description 'Persist dirprev for cdh'
    status is-command-substitution; and return
    test -z "$fish_private_mode"; or return

    test -d (dirname $__dirprev_file); or mkdir -p (dirname $__dirprev_file)
    if test -n "$PWD"
        # dirprev と現在の PWD を合わせて保存（直近の作業ディレクトリも次回 cdh に含める）
        string join \n $dirprev $PWD | tail -n 25 > $__dirprev_file
    end
end
