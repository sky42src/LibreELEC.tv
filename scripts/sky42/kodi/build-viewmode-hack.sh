#!/bin/bash

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2024-present Peter Tuschy (sky42@mailbox.org)

# bash version 4 or later
[ ${BASH_VERSION%%.*} -ge 4 ] || exit 1
# bash version 4.2 or later
printf '%(%s)T' -1 >/dev/null 2>&1 || exit 1

export LANG=en_US.UTF-8

need_cmd() { hash "$1" 2>/dev/null; if [ $? -ne 0 ]; then echo "ERROR: script ${0##*/} needs command $1"; exit 1; fi; }
for i in readlink git ; do need_cmd $i ; done

SCRIPT=$(readlink -f $0)
WHERE=${SCRIPT%/*}
FHS=${WHERE%/scripts/sky42/kodi}

if [ $# -gt 0 ]; then
  B42="$@"
else
  B42="x 4 5"
fi

set -x

cd "${FHS}" || exit $?

cp scripts/sky42/kodi/kodi-100.42-viewmodes-240813.patch packages/mediacenter/kodi/patches/ || exit $?
sed -i -E 's|(BUILDER_VERSION="[0-9]{6})"$|\1z"|' distributions/LibreELEC/version || exit $?

# b42 is my build wrapper script (in this case for Generic-BT2020, RPi4, RPi5 as they are my main devices)
for i in  $B42 ; do b42 $i || exit $? ; done

git reset --hard
git clean -fd
