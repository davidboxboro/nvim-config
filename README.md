# nvim-config
Config directory (~/.config/nvim) for Neovim

# How to use 
1. Install ``nvim`` v0.8+.
2. Install ``packer.nvim`` and ``vim-plug'' (package managers).
3. Clone repo into ``~/.config/nvim``.
4. Run ``:PackerSync`` inside nvim to install nvim packages. 
5. Run ``:Mason`` inside nvim to install any missing language servers. I recommend installing ``python-lsp-server`` for Python. ``pyright`` is more popular but sometimes cannot find paths.
6. If you are using ``python-lsp-server``, in ``~/.config/pycodestyle`` you can do some customization:
```
[pycodestyle]
max-line-length = 130
[flake8]
max-complexity = 100
```
