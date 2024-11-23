# LibreELEC

LibreELEC is a 'Just enough OS' Linux distribution for the award-winning [Kodi](https://kodi.tv) software on popular mediacentre hardware. Further information on the project can be found on the [LibreELEC website](https://libreelec.tv).

**Features added in this Community Build**

- no GUI tools for the encryptiom, lvm2 or mdraid
- kernel config for dm-crypt to use cryptsetup (compatible with luks, veracrypt, truecrypt, bitlcoker)
- kernel config for more crypto modules and options
- kernel config for ext4 filesystem encryption
- kernel config for lvm2 and snapshots (no cache, no thin)
- kernel config for software raid with lvm2 and standalone with mdraid
- cryptsetup-2.6.1, lvm2-2.03.16, fscryptctl-1.1.0, mdadm-4.2
- lvm2 tools (config is under /storage/.config/lvm)
- mdraid to control linux software raid
- cryptsetup to manage encrypted block devices with luks, veracrypt and some more
- fscryptctl to manage ext4 encryption
- systemd with /etc/crypttab support
- Generic: added intel-gpu-max-10-bit.sh helper
- curl: enable protocol support for scp, sftp, smb, smbs
- /flash 1024MB

**Issues & Support**

If you have any problems please install [nightly LibreELEC](https://test.libreelec.tv/12.0/) and test again. If the problem is the same it is most likely not my build. If you have trouble with features added by me please ask in the forum thread [LE 12.0 added lvm2, luks (dm-crypt, veracrypt), mdraid, ext4 encryption](https://forum.libreelec.tv/thread/27952-le-12-0-added-lvm2-luks-dm-crypt-veracrypt-mdraid-ext4-encryption/).

**Donations**

Contributions towards current project funding goals can be made via [OpenCollective](https://opencollective.com/libreelec/donate).

**License**

LibreELEC original code is released under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html).

**Copyright**

As LibreELEC includes code from many upstream projects it has many copyright owners; notably [OpenELEC](https://openelec.tv) which we forked from after disagreeing with project direction and management, and [OpenBricks/GeeXboX](https://github.com/OpenBricks/openbricks/blob/master/AUTHORS) the uncredited source of the original 2009 build system. LibreELEC makes no claim of copyright on any upstream code. However all original LibreELEC authored code is copyright LibreELEC.tv. Patches to upstream code have the same license as the upstream project unless specified otherwise. For a complete copyright list please checkout the source code to examine license headers. Unless expressly stated otherwise all code submitted to the LibreELEC project (in any form) is licensed under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html) and copyright is donated to the project. This approach gives the project freedom to maintain the code without the overhead of preserving contact with every submitter, e.g. GPLv3. You are free to retain copyright by adding your copyright header to each submitted code page. If you submit code that is not your own work it is your responsibility to place a header stating the copyright.
