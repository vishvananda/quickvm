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
