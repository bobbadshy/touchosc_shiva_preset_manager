#!/bin/bash

# Compresses the .xml file back into a .tosc file

s="xml_export/shiva_preset_manager.xml"
t="shiva_preset_manager_new.tosc"

echo "Compressing $s to $t .."

pigz -c -z < "$s" > "$t"
