# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal macOS dotfiles repository that uses **Dotbot** for installation and configuration management. The repository is structured modularly, with each directory containing configuration files for a specific tool or application.

## Installation

The primary installation command is:

```bash
./install
```

This script:
1. Syncs and updates the Dotbot submodule
2. Runs Dotbot with `install.conf.yaml` as the configuration manifest
3. Symlinks config files to the home directory
4. Installs Homebrew packages via `macos/Brewfile`
5. Installs ZSH plugins and sets ZSH as the default shell

## Architecture

### Dotbot Integration (`install.conf.yaml`)

The Dotbot configuration defines three phases:

1. **Clean**: Removes broken symlinks from `~`
2. **Link**: Creates symlinks from `~` to files in this repository
3. **Shell**: Runs commands for Homebrew installation, ZSH setup, and plugin installation

### Directory Structure

- **`git/`**: Git configuration (`.gitconfig`, `.gitignore_global`)
- **`zsh/`**: ZSH shell configuration and custom Oh-My-Zsh plugins
  - `zshrc`: Main ZSH configuration (sources Oh-My-Zsh)
  - `aliases.zsh`: Shell aliases
  - `exports.zsh`: Environment variable exports
  - `extra.zsh`: Additional customizations
  - `plugins/`: Contains cloned ZSH plugins (zsh-completions, zsh-autosuggestions, zsh-syntax-highlighting)

- **`vim/`**: Vim configuration (`vimrc`)

- **`karabiner/`**: Karabiner Elements key remapping configuration
  - Uses **Goku** (yqrashawn/goku) to convert EDN config to Karabiner JSON
  - `karabiner.edn`: Goku configuration file
  - Hammerspoon watches this file and auto-runs `goku` on changes

- **`hammerspoon/`**: macOS automation via Hammerspoon (Lua)
  - `init.lua`: Main Hammerspoon configuration
  - `Spoons/`: Installed Hammerspoon Spoons (extensions)
  - Auto-reloads config and recompiles Karabiner when `karabiner.edn` changes

- **`macos/`**: macOS-specific setup
  - `Brewfile`: Homebrew package definitions (CLI tools, apps, casks, fonts)

### Environment Variables

The repository assumes a specific installation path set in `zsh/zshrc`:
```bash
export DOTFILES=$HOME/workspace/github/dotfiles
```

## Making Changes

### To add new symlinks:
Add entries to the `link` section in `install.conf.yaml`:
```yaml
- link:
    ~/.new_config: path/to/new_config
```

### To install new Homebrew packages:
Add to `macos/Brewfile`:
- `brew 'package-name'` for CLI tools
- `cask 'app-name'` for GUI applications
- `tap 'user/repo'` for third-party taps

Then run: `brew bundle --file=macos/Brewfile`

### To modify ZSH configuration:
- Edit files in `zsh/` directory
- Reload with: `source ~/.zshrc` or use the `reload` alias

### To modify Karabiner keybindings:
- Edit `karabiner/karabiner.edn`
- Hammerspoon will auto-run `goku` to recompile the config
- Karabiner Elements will auto-reload the compiled JSON

### To modify Hammerspoon automation:
- Edit `hammerspoon/init.lua`
- Config auto-reloads via `ReloadConfiguration` Spoon

## Tools Integration

### ZSH Plugins (managed by Oh-My-Zsh)
- **zsh-autosuggestions**: Autosuggestions based on command history
- **zsh-syntax-highlighting**: Syntax highlighting for commands
- **zsh-completions**: Additional command completions

### Version Managers
- **pyenv**: Python version management (configured in `zsh/zshrc`)
- **chruby**: Ruby version management (configured in `zsh/zshrc`)

### CLI Tools (installed via Homebrew)
- **fzf**: Fuzzy finder (integrated with ZSH)
- **zoxide**: Smart directory navigation (cd replacement)
- **atuin**: Shell history enhancement
- **bat**: Enhanced cat with syntax highlighting
- **fd**: Faster find alternative
- **delta**: Enhanced git diff viewer
- **gh**: GitHub CLI
