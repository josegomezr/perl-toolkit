#!/bin/sh -l

mkdir -p $GITHUB_WORKSPACE/.perl-gha/

cp /usr/share/gh-actions/perl-problem-matcher.json $GITHUB_WORKSPACE/.perl-gha/perl-problem-matcher.json

echo "::add-matcher::$GITHUB_WORKSPACE/.perl-gha/perl-problem-matcher.json"
echo 'Problem Matcher installed'

exec $@