alias c="cargo"
alias e="nvim"
alias g="git"
alias gc='git checkout'
alias ga='git add -p'
alias gst='git status'
alias vimdiff='nvim -d'
alias ct="cargo t"
alias l="ls"
alias ll='ls -l'
alias lll='ls -la'
alias cfd='/usr/local/bin/tmux-sessionizer'
alias subl='open -a "Sublime Text"'
alias diff='difft'

fish_add_path -a "/Users/$USER/.pyenv/shims"
fish_add_path -a "~/.cargo/bin"
fish_add_path -a "~/.local/bin/"
fish_add_path -a "~/.docker/bin/"
fish_add_path -a /opt/homebrew/bin
fish_add_path -a /opt/homebrew/sbin
fish_add_path -a "/Applications/kitty.app/Contents/MacOS"
fish_add_path -a "/Users/ivin/Library/Application Support/Coursier/bin"
fish_add_path -a "/Users/ivin/.fzf/bin"
fish_add_path -a "/Users/ivin/.local/share/kickstart/lazy/fzf/bin"

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m' # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m' # begin bold
setenv LESS_TERMCAP_me \e'[0m' # end mode
setenv LESS_TERMCAP_se \e'[0m' # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m' # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m' # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'


function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience
