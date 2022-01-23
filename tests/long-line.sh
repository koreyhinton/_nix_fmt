#!/bin/bash
# make sure fmt -s works even on long lines

# Copyright 2022 Korey Hinton

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# ---

# Copyright (C) 2002-2022 Free Software Foundation, Inc.

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

#. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
#print_ver_ fmt

basename=`basename "$(pwd)"`
if [[ "$basename" = "tests" ]]; then
    :
else
    exit 1
fi


printf '%2030s\n' ' '|sed 's/../ y/g' > in || exit 1 # framework_failure_

cat <<\EOF > exp || exit 1 # framework_failure_
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
 y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y y
EOF


# fmt -s in > out || fail=1
txt="$(cat in)"
echo "console.log(_nix_fmt('-s', \`${txt}\`));" >js
cat ../_nix_fmt.js js | nodejs > out || exit 1

# compare exp out || fail=1
fail=$(diff exp out | wc -l)

exit $fail
