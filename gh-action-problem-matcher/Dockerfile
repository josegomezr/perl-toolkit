# Built in OBS in: https://build.opensuse.org/package/show/home:josegomezr:perl-toolkit/gha-perl-problem-matcher
# available for pulling at: registry.opensuse.org/home/josegomezr/perl-toolkit/containers-tw/gha-perl-problem-matcher:latest
#!BuildTag: gha-perl-problem-matcher
#!UseOBSRepositories
FROM opensuse/bci/bci-micro:latest

COPY --chmod=755 ./entrypoint.sh /entrypoint.sh
COPY ./perl-problem-matcher.json /usr/share/gh-actions/perl-problem-matcher.json

ENTRYPOINT ["/entrypoint.sh"]
