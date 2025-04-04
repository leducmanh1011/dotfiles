create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")

    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done
}

mkdir -p ~/.zsh
ln -sf ~/my-projects/dotfiles/zsh/* ~/.zsh
echo "Creating symlink to .zsh in home directory."

rm -rf ~/.config/nvim
ln -sf ~/my-projects/dotfiles/nvim ~/.config/nvim
echo "Creating symlink to .config/nvim in home directory."

rm -rf ~/.config/neofetch
ln -sf ~/my-projects/dotfiles/neofetch ~/.config/neofetch
echo "Creating symlink to .config/neofetch in home directory."

rm -rf ~/.config/alacritty
ln -sf ~/my-projects/dotfiles/alacritty ~/.config/alacritty
echo "Creating symlink to .config/sway in home directory."

rm -rf ~/.config/wallpapers
ln -sf ~/my-projects/dotfiles/wallpapers ~/.config/wallpapers
echo "Creating symlink to .config/wallpapers in home directory."

rm -rf ~/.config/sway
ln -sf ~/my-projects/dotfiles/wm/sway ~/.config/sway
echo "Creating symlink to .config/sway in home directory."

rm -rf ~/.config/rofi
ln -sf ~/my-projects/dotfiles/wm/rofi ~/.config/rofi
echo "Creating symlink to .config/rofi in home directory."

rm -rf ~/.config/waybar
ln -sf ~/my-projects/dotfiles/wm/waybar ~/.config/waybar
echo "Creating symlink to .config/waybar in home directory."

rm -rf ~/.config/swaylock
ln -sf ~/my-projects/dotfiles/wm/swaylock ~/.config/swaylock
echo "Creating symlink to .config/swaylock in home directory."

rm -rf ~/.config/mako
ln -sf ~/my-projects/dotfiles/wm/mako ~/.config/mako
echo "Creating symlink to .config/mako in home directory."

rm -rf ~/.fonts
ln -s -f ~/my-projects/dotfiles/fonts ~/.fonts
echo "Creating symlink to .fonts in home directory."

create_symlinks
