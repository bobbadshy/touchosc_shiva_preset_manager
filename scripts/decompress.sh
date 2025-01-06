#!/bin/bash

# Uncompresses the .tosc file into .xml

s="shiva_preset_manager.tosc"
t="xml_export/shiva_preset_manager.xml"

echo "Decompressing $s to $t .."

pigz -c -d < "$s" > "$t"
