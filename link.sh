#/usr/bin/env bash

dst=${1:-/usr/local/bin}
abspath="$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")"
src=`dirname $abspath`

for i in `ls $src/*vm`; do
  i=`basename $i`
  if [ -e $dst/$i ]; then
    rm $dst/$i
  fi
  ln -s $src/$i $dst/$i
done

if [[ -e /Applications/VMware\ Fusion.app/Contents/Library/vmrun  && ! -e $dst/vmrun ]]; then
  ln -s /Applications/VMware\ Fusion.app/Contents/Library/vmrun $dst/vmrun
fi
