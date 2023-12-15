ln -s $PWD/nvim ~/.config/nvim
ln -s $PWD/kitty ~/.config/kitty
ln -s $PWD/fish ~/.config/fish
ln -s $PWD/starship.toml ~/.config/starship.toml




folder_path="~/Library/KeyBindings"
mkdir -p $folder_path
## credit https://gist.githubusercontent.com/jwreagor/9670905/raw/1c1cd2e84daf07c9a4c8de0ff86d1baf75d858c6/EmacsKeyBinding.dict
ln -s $PWD/EmacsKeyBinding.dict $folder_path/DefaultKeyBinding.dict
