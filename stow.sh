#!/usr/bin/env bash
set -e

# Stow bash files into ~
stow -t "$HOME" bash

# Stow everything else into ~/.config
for dir in */; do
  [[ "$dir" == "bash/" ]] && continue
  stow -t "$HOME/.config" "$dir"
done

