perl-toolkit
============

My personal toolkit for perl + CI/CD.

Almost everything here is built on the [Open Build Service][obs] in Project: [`home:josegomezr:perl-toolkit`][obs-proj].


Container Images
----------------

- [base-perl/Dockerfile](./base-perl/Dockerfile): A base image with
  the bare-minimum perl requirements.
- [tester-perl/Dockerfile](./base-perl/Dockerfile): An image with
  the a big test toolkit to speedup CI/CD pipelines.

Workflows
---------

### [.github/workflows/perl-tidyall.yml][wf-tidyall.yml]: `tidyall` workflow 
- **Inputs:**
    * `working-directory`: Current working directory. Defaults to `.`.

    * `tidyall-args`: Args for `tidyall` invocation. Defaults to
      `--check --all`.

    * `prepend-perl5lib-env`: Extra load paths to add for `tidyall` invocation.

    * `tidyall-executable`: Name/location of the `tidyall` command, useful for
      projects where `tidyall` calls are wrapped into other script (like a
      `make` command).

### [.github/workflows/perl-prove.yml][wf-prove.yml]: `prove` workflow 
- **Inputs:**
    * `working-directory`: Current working directory. Defaults to `.`.

    * `prove-args`: Args for `prove` invocation. Defaults to `-lm`.

    * `prepend-perl5lib-env`: Extra load paths to add for `prove` invocation.

    * `prove-executable`: Name/location of the `prove` command, useful for
      projects where `prove` calls are wrapped into other script (like a `make`
      command).

### [.github/workflows/perl-critic.yml][wf-perlcritic.yml]: `perlcritic` workflow 
- **Inputs:**
    * `working-directory`: Current working directory. Defaults to `.`.

    * `perl-critic-args`: Args for `perlcritic` invocation. Defaults to `--quiet .`.

    * `prepend-perl5lib-env`: Extra load paths to add for `perlcritic`
      invocation.

    * `perlcritic-executable`: Name/location of the `perlcritic` command, useful
      for projects where `perlcritic` calls are wrapped into other script
      (like a `make` command).

### [./gh-action-problem-matcher][wf-gh-action-problem-matcher]: Perl problem matcher

[obs]: https://openbuildservice.org/
[obs-proj]: https://build.opensuse.org/package/show/home:josegomezr:perl-toolkit/base-perl
[wf-tidyall.yml]: .github/workflows/perl-tidyall.yml
[wf-prove.yml]: .github/workflows/perl-prove.yml
[wf-perlcritic.yml]: .github/workflows/perl-critic.yml
[wf-gh-action-problem-matcher]: ./gh-action-problem-matcher
