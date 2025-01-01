#!/bin/bash

# Check if the script is being run from within the .config/nvim directory
if [ ! -f "init.lua" ] && [ ! -f "init.vim" ]; then
  echo "Please run this script from within the .config/nvim/ directory."
  exit 1
fi

# Start with an informative header
echo "========================="
echo " Neovim Configuration Export"
echo "========================="

# Traverse all files, excluding the "plugin" directory
find . -type d -name "plugin" -prune -o -type f \( -name "*.lua" -o -name "*.vim" -o -name "*.json" -o -name "*.yaml" -o -name "*.sh" \) -print | while read -r file; do
  echo "-------------------------"
  echo "File: $file"
  echo "-------------------------"
  cat "$file"
  echo
done

echo "========================="
echo "End of Configuration Export"
echo "========================="
