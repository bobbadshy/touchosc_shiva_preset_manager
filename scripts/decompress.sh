#!/bin/bash

# Uncompresses the .tosc file into .xml

s="shiva_preset_manager.tosc"
t="xml_export/shiva_preset_manager.xml"

echo "Decompressing $s to $t ..
also formats the .xml a bit better to allow for better showing a git diff on it"

# pigz -c -d < "$s" | sed -r 's#(<[a-z]+>)<#\1\n<#g' - > "$t"
pigz -c -d < "$s" > "$t"
