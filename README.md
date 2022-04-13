![neovim](nvim.png)

# Neovim Configuration

## Installation

```sh
cd ~
git clone git@github.com:degete/nvim-config.git ~/.nvim
ln -s ~/.nvim .config/nvim
```

### Plugins

To install the plugins, you can just open nvim or run the following command:

```sh
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```