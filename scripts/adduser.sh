#!/bin/bash

file="/etc/sudoers"
new_user="$1"

if grep -q "^$new_user\s" "$file"; then
    echo "User $new_user already exists in $file. No action required."
else
    sudo sed -i '/^soaipt\s/s/$/\n'"$new_user"'    ALL=(ALL)       ALL/' "$file"
    sudo useradd "$new_user"
    sudo passwd "$new_user"
fi