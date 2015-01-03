# dotfiles

These are my personal configuration dotfiles. It depends on [dotfiles](https://github.com/jbernard/dotfiles) to syncronize the settings from this directory into to the `~`.

To check whether all files have been syncronised use;

```
dotfiles -c
```

To syncronise all files use;

```
dotfiles -s
```

## environment

## bin

## ssh

## tmuxinator

## preferences

## config

## atom

Preliminary support for atom works by manually exporting installed packages ([source](https://discuss.atom.io/t/installed-packages-list-into-single-file/12227/2)/).

To export package list use:

```
apm list --installed --bare > ~/.atom/package-list.txt
```

To install the packages use:

```    
apm install --packages-file ~/.atom/package-list.txt
```