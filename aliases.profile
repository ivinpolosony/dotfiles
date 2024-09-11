alias k=kubectl
alias cdf="cd ~ && cd \$(find * -type d | fzf)"
alias k9s='k9s --context $(kubectl config get-contexts  --no-headers=true  --output=name | fzf)'
alias fd="cd \$(ls -d */ | fzf)"
alias ls="gls"
alias ug="ugrep -Q"
