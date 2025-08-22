<h1 align="center">holyc-formatter.nvim</h1>

<p align="center">This program is released under GPL-3.0-or-later.</p>
<p align="center">A Neovim plugin for providing a formatted view of HolyC (`.HC`) and DolDoc (`.DD`) files, similar to TempleOS's native editor.</p>

## 🌟 Features

- Detects `$SP...$` and `$$SP...$$` commands (for sprites/images).
- Detects `$IB...$` and `$$IB...$$` commands (for general binary/models).
- Displays `[🖼️Image]` or `[📦Model]` virtual text indicators next to the relevant lines.
- Includes filetype detection for `.hc`, `.HC`, `.dd`, `.DD` extensions.

## 📦 Installation
>[!IMPORTANT]
>This plugin is primarily designed and optimized for my specific Neovim setup and development environments. It was built with `lazy.nvim` in mind.
>
>While you are welcome to install and use this plugin, please be aware that its design includes workarounds for my environment challenges. If you encounter issues that are too annoying for me to address, and you are unable to make a pull request, I recommend checking if any community-maintained forks of this repository exist that might be better suited for more standard environments.


Use your preferred Neovim plugin manager.

### lazy.nvim

Add the following to your `plugins/init.lua` (or equivalent) file:

```lua
{
  'adevdoingdevthings/holyc-formatter.nvim',
  event = 'BufReadPost', -- Load when a buffer is read
  ft = { 'holyc', 'doldoc' }, -- Only load for these filetypes
  config = function()
    require('holyc-formatter').setup()
  end,
}
```

After adding, run `:Lazy sync` in Neovim to install the plugin.

### Packer

Add the following to your Packer configuration (e.g., `init.lua` or `plugins.lua`):

```lua
use {
  'adevdoingdevthings/holyc-formatter.nvim',
  event = 'BufReadPost',
  ft = { 'holyc', 'doldoc' },
  config = function()
    require('holyc-formatter').setup()
  end,
}
```

Then, run `:PackerSync` in Neovim.

### Paq

Add the following to your Paq configuration:

```lua
'adevdoingdevthings/holyc-formatter.nvim',
```

Then, run `:PaqInstall` in Neovim.

### vim-plug

Add the following to your `init.vim` or `plugins.vim`:

```vim
Plug 'adevdoingdevthings/holyc-formatter.nvim'
```

Then, run `:PlugInstall` in Neovim.

### dein.vim

Add the following to your `init.vim` or `dein.toml`:

```vim
call dein#add('adevdoingdevthings/holyc-formatter.nvim')
```

Then, run `:call dein#install()` in Neovim.

### Pathogen

1.  Navigate to your bundle directory:
    ```bash
    cd ~/.config/nvim/bundle
    ```
2.  Clone the repository:
    ```bash
    git clone https://github.com/adevdoingdevthings/holyc-formatter.nvim.git
    ```

### Manual Installation

Clone the repository into your Neovim's `start` plugin directory:

```bash
git clone --depth=1 https://github.com/adevdoingdevthings/holyc-formatter.nvim.git \
  "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/plugins/start/holyc-formatter.nvim
```

## 🚀 Usage

Once installed, simply open any `.hc`, `.HC`, `.dd`, or `.DD` file. The plugin will automatically add virtual text indicators next to lines containing embedded binary data commands.

## 💡 Future Plans

More features are planned for this plugin. A primary goal is to make the plugin's formatting capabilities close to, if not on-par with, TempleOS's native DolDoc formatting (excluding direct image/model rendering within the terminal). This would allow users to view the underlying DolDoc command syntax directly within Neovim, with visual cues and structure similar to the original environment.

## ⚠️ Technical Limitations

- **Full Image/Model Rendering:** This plugin does *not* fully render images or 3D models. It provides indicators only.
- **Neovim Version:** This plugin was developed and primarily tested on Neovim `v0.12.0-dev-703+g66f02ee1fe`. Compatibility with other versions may vary, especially older stable releases, due to differences in Lua API behavior and strictness.
- **Development Environment:** The plugin was developed and tested in specific and somewhat unusual environments, which introduced unique challenges, such as an immutable default plugin directory, memory allocation failures for large file reads, me not checking if I am reading outdated documentation with deprecated features, and unexpected API behavior. Several workarounds and design choices were made to accommodate these.

## 🤝 Contributing

I am not a Vimscript developer in the slightest, nor am I good at Lua. Please feel free to open issues or pull requests if you find bugs or have improvements to my unholy slop I call `holyc-formatter.nvim`.
