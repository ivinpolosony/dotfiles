# all fonts 
brew search '/font-.*-nerd-font/' | awk "{ print $1 }" | xargs -n 1 -P 0 brew install