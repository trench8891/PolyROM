#!/usr/bin/env bash

# remove dev-only files
rm -rf LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM

# create archive directory and move mod files
mkdir "PolyRomanceMod"
mv LE3/ PolyRomanceMod/

# compress files
tar -cvf PolyRomanceMod.tar PolyRomanceMod/
