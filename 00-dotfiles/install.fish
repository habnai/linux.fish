#!/usr/bin/env fish
set -Ux EDITOR vim
set -Ux VISUAL $EDITOR
set -Ux WEDITOR code

set -Ux DOTFILES ~/.dotfiles
set -Ux PROJECTS ~/Developer
set -U fish_user_paths $fish_user_paths $DOTFILES/bin $HOME/.bin $HOME/.local/bin
ln -sf $DOTFILES/00-dotfiles/config.fish ~/.config/fish/config.fish
fish_add_path -a $DOTFILES/bin $HOME/.local/bin

for f in $DOTFILES/*/functions
	set -Up fish_function_path $f
end

if command -qs fdfind
	ln -sf (which fdfind) ~/.local/bin/fd
end

for f in $DOTFILES/*/conf.d/*.fish
	ln -sf $f ~/.config/fish/conf.d/(basename $f)
end

if test -f ~/.localrc.fish
	ln -sf ~/.localrc.fish ~/.config/fish/conf.d/localrc.fish
end
