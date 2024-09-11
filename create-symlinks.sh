ln -s $PWD/nvim $HOME/.config/nvim
ln -s $PWD/kitty $HOME/.config/kitty
ln -s $PWD/fish $HOME/.config/fish
ln -s $PWD/starship.toml $HOME/.config/starship.toml




folder_path="$HOME/Library/KeyBindings"
mkdir -p $folder_path
## credit https://gist.githubusercontent.com/jwreagor/9670905/raw/1c1cd2e84daf07c9a4c8de0ff86d1baf75d858c6/EmacsKeyBinding.dict
ln -s $PWD/EmacsKeyBinding.dict $folder_path/DefaultKeyBinding.dict

hammerspoon_path="~/.hammerspoon"
mkdir -p $hammerspoon_path
ln -s $PWD/hammer/init.lua ~/.hammerspoon/init.lua

