# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

Configured to work for meeeee! 🚀✨

### Try this repo out with:

```shell
# Backup all the stuff
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Install it:
git clone https://github.com/BusterWarn/config_files ~/.config/nvim

# Remove git folder
rm -rf ~/.config/nvim/.git
```


Or on **Windows**:

```shell
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.Backup

# Install it:
git clone https://github.com/BusterWarn/config_files $env:LOCALAPPDATA\nvim

# Remove git folder
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
```
### nvim-treesitter problems:

Sometimes `nvim-treesitter` tries to compile with some old gcc version with `C99`. A simple solution is to start neovim with path to your gcc compiler:

```shell
CC=/path/to/bin/gcc nvim
```

For more info: https://github.com/nvim-treesitter/nvim-treesitter/issues/2383
