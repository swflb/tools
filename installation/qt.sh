#!/bin/bash
if [[ -z "${QTDIR}" ]]
then
	QTPREFIXES="/usr/lib64/qt/5.7/gcc\_64"

	for QTDIR in ${QTPREFIXES}
	do
		test -d "${QTDIR}" && break
	done
	unset QTPREFIXES

	if ! echo ${PATH} | /bin/grep -q $QTDIR/bin
	then
		PATH=$QTDIR/bin:${PATH}
	fi

	QTINC="$QTDIR/include"
	QTLIB="$QTDIR/lib"

	export QTDIR QTINC QTLIB PATH
fi
