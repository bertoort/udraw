#!/bin/sh

cat <<DOG
===================
udraw Installation
===================

Searching for useful perl executables...
DOG

pathdirs=`echo $PATH | tr : " "`
for p in $pathdirs; do
	set $p/perl $p/perl5*
	while [ ! -z "$1" ]; do
		if [ -x "$1" ]; then
			perls="$perls $1"
		fi
		shift
	done
done
for perl in $perls; do
	if $perl -MText::Wrap -e0 >/dev/null 2>&1; then
		goodperls="$goodperls $perl"
	fi
done
echo $goodperls 
set $goodperls
if [ -z "$1" ]; then
	echo Ack!  You do not have Perl 5 installed correctly!
	echo Get thee to CPAN!
	exit 1
fi

usethisperl=$1
echo Using $1 
echo ""

echo udraw will be installed in /usr/local/bin unless
printf "you enter a different location: "
read prefix

PREFIX=${prefix:-/usr/local/bin}

$usethisperl -p install.pl udraw > $PREFIX/udraw
chmod a+x $PREFIX/udraw 

echo Done!
