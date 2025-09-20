# Summary

|||
| -------- | -----------------------------------------------------------|
| Title:   | Thematic Obscured Mausoleum Burial                         |
| Version: | 1.0.3                                                      |
| Game:    | Star Wars: Knights of the Old Republic II - The Sith Lords |
| Author:  | Sniggles & JCarter426                                      |

This mod fixes some bugs with and makes other adjustments to the Secret Tomb area for mechanical and lore consistency. See the attached document for a full list of changes and the rationale for each change.


# Installation

You must start a new game to experience the full effects of this mod.

1. Extract files from the downloaded archive.
2. Run INSTALL.exe.
3. Click "Install Mod" and select your game directory.


# Uninstallation

During installation, TSLPatcher generates a backup folder and a log recording which files were affected.

1. Restore dialog.tlk by copying the file from the backup folder to your game directory, replacing the existing one.
2. Restore or delete all all module files affected by this mod. For each module, copy the corresponding .mod file from the backup folder to replace the one in your game's Modules folder if a backup was created, otherwise delete the .mod file from your game's Modules folder.
3. Restore or delete all all .2da files affected by this mod. For each, copy the corresponding .2da file from the backup folder to replace the one in your game's Override folder if a backup was created, otherwise delete the .2da file from your game's Override folder.
4. Delete all other files installed by this mod from your game's Override folder.


# Compatibility

This mod makes several changes in the Secret Tomb module and may be incompatible with other mods which affect that area.

This mod edits the script `k_oei_userdef.ncs` because the party AI has some Secret Tomb-specific code living there. This mod will not be compatible with other mods which edit that script without a compatibility patch.

This mod adds the texture `pmbj02.tpc` for a light-sided Revan's robes. This has the same filename as the Star Forge Robes in KOTOR 1, so mods which edit the Star Forge Robes may be used in place of the texture provided by this mod. Copy the file to your KOTOR 2 Override folder, overwriting the file when prompted.


# Credits

|||
| -------------- | ------------------------------- |
| Design         | Sniggles                        |
| Implementation | JCarter426                      |
| KOTOR Tool     | Fred Tetra                      |
| TSLPatcher     | stoffe & Fair Strides           |
| DeNCS          | JdNoa & Dashus                  |
| ERFEdit        | stoffe & Fair Strides           |
| K-GFF          | tk102                           |
| NWNSSCOMP      | Torlack, stoffe, & tk102        |
| TalkEd         | stoffe                          |
| tga2tcp        | ndix UR                         |
| xoreos tools   | xoreos team https://xoreos.org/ |


# License

[![CC BY-NC 4.0][cc-by-nc-shield]][cc-by-nc]

This work is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License][cc-by-nc].

[![CC BY-NC 4.0][cc-by-nc-image]][cc-by-nc]

[cc-by-nc]: https://creativecommons.org/licenses/by-nc/4.0/
[cc-by-nc-image]: https://licensebuttons.net/l/by-nc/4.0/88x31.png
[cc-by-nc-shield]: https://img.shields.io/badge/License-CC%20BY--NC%204.0-lightgrey.svg
