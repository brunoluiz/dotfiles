<h1 align="center">
  `dotfiles`
</h1>

<p align="center">
  Bruno's secret terminal sauces 💾
</p>

Setting up new laptops or even sharing configurations with colleagues can be a bit of a pain. This repository
contains most of the files and scripts that I use for my workstation. Before diving into it, you might need to 
understand the following:

1. [What is `stow` and how to use it](https://alex.pearwin.com/2016/02/managing-dotfiles-with-stow/)
2. [What is a `Brewfile` and how to use it](https://thoughtbot.com/blog/brewfile-a-gemfile-but-for-homebrew)

## Install

Run `make install` to install basically tooling required. Once that is done, do `make stow`.

Once `stow` finishes, some applications might need their own installation routines:

- `tmux`: use prefix + I to install plugins
- `vim`: use :PlugInstall to install plugins

## Profiles

Because these files are symbolic linked, you can change between profiles by checking out to a different branch.
An example would be a branch called `work` or a branch that contains specific `vim`/`zsh` configurations for a 
certain project.

To make the profile changes easier, run `dotfiles <branch>`.
