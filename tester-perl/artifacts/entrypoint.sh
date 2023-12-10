#!/bin/sh -l

PERLTESTER_WORKSPACE="${GITHUB_WORKSPACE}/.perl-tester"

mkdir -p $PERLTESTER_WORKSPACE/

cp /usr/share/gh-actions/perl-problem-matcher.json "${PERLTESTER_WORKSPACE}/perl-problem-matcher.json"

echo "::add-matcher::${PERLTESTER_WORKSPACE}/perl-problem-matcher.json"
echo 'Problem Matcher installed'

export CPAN_LOCAL_LIB="${PERLTESTER_WORKSPACE}/.perl-tester"
eval $(perl -Mlocal::lib=$CPAN_LOCAL_LIB)

touch "$GITHUB_WORKSPACE/${GITHUB_JOB}_${GITHUB_ACTION}"

if [[ ! -z "$INPUT_ARGS" ]]; then
	eval "$INPUT_ARGS"
	exit $?
fi
