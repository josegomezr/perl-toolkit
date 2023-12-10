# Built in OBS in: https://build.opensuse.org/package/show/home:josegomezr:perl-toolkit/tester-perl
# available for pulling at: registry.opensuse.org/home/josegomezr/perl-toolkit/containers-tw/tester-perl:latest

#!BuildTag: tester-perl
#!UseOBSRepositories

# base-perl here refers to ../base-perl/Dockerfile.
# this requirement is automatically fulfilled by the Build Service.
#
# To build locally pass the following build-arg to your "$container-runtinme$ build"
#
# --build-arg IMAGE_BASE=registry.opensuse.org/home/josegomezr/perl-toolkit/containers-tw/base-perl:latest
#
# or whatever you've passed to "$container-runtinme$ build . -t %image-name%" on ../base-perl.
# --build-arg IMAGE_BASE=%image-name%

ARG IMAGE_BASE=base-perl:latest
FROM $IMAGE_BASE
ARG RELEASE="<RELEASE>"

# Heavily inspired in: https://hub.docker.com/r/perldocker/perl-tester/
# although not all dependencies listed there are available in d-l-perl repo.

# just a clever self-baked trick to check if runnning outside OBS.
# When not running in OBS, add d-l-perl repo

RUN bash -c "test '$RELEASE' != '<''RELEASE''>'" \
    || ( \
        zypper -qn ar --enable https://download.opensuse.org/repositories/devel:/languages:/perl/openSUSE_Tumbleweed/devel:languages:perl.repo \
        && zypper -qn ar --enable https://download.opensuse.org/repositories/home:/josegomezr:/perl-toolkit/openSUSE_Tumbleweed/home:josegomezr:perl-toolkit.repo \
        && zypper -qn --gpg-auto-import-keys ref \
    )

RUN zypper -qn in -y --capability \
   'perl(Devel::Cover)' \
   'perl(Devel::Cover::Report::Codecov)' \
   'perl(Devel::Cover::Report::Coveralls)' \
   'perl(File::Temp)' \
   'perl(List::MoreUtils)' \
   'perl(Module::Build)' \
   'perl(Perl::Critic)' \
   'perl(Perl::Critic::Community)' \
   'perl(Pod::Coverage::TrustPod)' \
   'perl(Pod::Readme)' \
   'perl(TAP::Formatter::GitHubActions)' \
   'perl(Test2::Bundle::Extended)' \
   'perl(Test2::Plugin::NoWarnings)' \
   'perl(Test2::Suite)' \
   'perl(Test2::Tools::Explain)' \
   'perl(Test::Builder)' \
   'perl(Test::Code::TidyAll)' \
   'perl(Test::CPAN::Meta)' \
   'perl(Test::Deep)' \
   'perl(Test::Differences)' \
   'perl(Test::EOL)' \
   'perl(Test::Fatal)' \
   'perl(Test::MinimumVersion)' \
   'perl(Test::MockModule)' \
   'perl(Test::Most)' \
   'perl(Test::More)' \
   'perl(Test::Needs)' \
   'perl(Test::Pod)' \
   'perl(Test::Pod::Coverage)' \
   'perl(Test::Portability::Files)' \
   'perl(Test::RequiresInternet)' \
   'perl(Test::Spelling)' \
   'perl(Test::Synopsis)' \
   'perl(Test::Version)' \
   'perl(Test::Warnings)' \
   'perl(Dist::Zilla)'

COPY artifacts/entrypoint.sh /entrypoint.sh
COPY artifacts/perl-problem-matcher.json /usr/share/gh-actions/perl-problem-matcher.json

ENTRYPOINT ["/entrypoint.sh"]
