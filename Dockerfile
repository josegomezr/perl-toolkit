#!BuildTag: base-perl
#!UseOBSRepositories
FROM opensuse/tumbleweed

# Install perl-local-lib & cpanm
RUN zypper -n in perl-local-lib perl-App-cpanminus make gcc

# GitHub Actions do not support running docker images with a different user than root
# without a workaround that I truly don't like.
# see: https://github.com/actions/runner/issues/691

# Until that's fixed, this block is commented
# == START OF BLOCK ==
# Prepare User & Workspace
# RUN echo "da-tester ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# RUN useradd -r -d /home/da-tester -m -g users --uid=1000 da-tester
# RUN chown -R da-tester:users /home/da-tester
# WORKDIR /home/da-tester
# USER da-tester
# Configure cpanm with local::lib
# RUN perl -I ~/perl5/lib/perl5/ -Mlocal::lib | tee -a ~/.bashrc ~/.profile
# == END OF BLOCK ==
