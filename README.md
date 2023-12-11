perl-toolkit
============

My personal toolkit for perl + CI/CD.

Almost everything here is built on the [Open Build Service][obs] in Project: [`home:josegomezr:perl-toolkit`][obs-proj].

Everything it built on top of `opensuse/tumbleweed`

TOC
===

* [Container Images](#container-images)
* [Workflows](#workflows)
    * [github workflows perl tidyall yml  tidyall workflow](#githubworkflowsperl-tidyallyml-tidyall-workflow)
        * [Usage](#usage)
    * [github workflows perl prove yml  prove workflow](#githubworkflowsperl-proveyml-prove-workflow)
        * [Usage](#usage_1)
    * [github workflows perl critic yml  perlcritic workflow](#githubworkflowsperl-criticyml-perlcritic-workflow)
        * [Usage](#usage_2)


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

#### Usage

```yaml
# in: .github/workflows/%your-workflow%.yml
#
# [... snip ...]
jobs:
  prove:
    uses: josegomezr/perl-toolkit/.github/workflows/perl-tidyall.yml@v1
    name: "TidyAll"
# [... snip ...]
```

### [.github/workflows/perl-prove.yml][wf-prove.yml]: `prove` workflow 
- **Inputs:**
    * `working-directory`: Current working directory. Defaults to `.`.

    * `prove-args`: Args for `prove` invocation. Defaults to `-lm`.

    * `prepend-perl5lib-env`: Extra load paths to add for `prove` invocation.

    * `prove-executable`: Name/location of the `prove` command, useful for
      projects where `prove` calls are wrapped into other script (like a `make`
      command).

#### Usage

```yaml
# in: .github/workflows/%your-workflow%.yml
#
# [... snip ...]
jobs:
  prove:
    uses: josegomezr/perl-toolkit/.github/workflows/perl-prove.yml@v1
    name: "Prove"
# [... snip ...]
```

### [.github/workflows/perl-critic.yml][wf-perlcritic.yml]: `perlcritic` workflow 
- **Inputs:**
    * `working-directory`: Current working directory. Defaults to `.`.

    * `perl-critic-args`: Args for `perlcritic` invocation. Defaults to `--quiet .`.

    * `prepend-perl5lib-env`: Extra load paths to add for `perlcritic`
      invocation.

    * `perlcritic-executable`: Name/location of the `perlcritic` command, useful
      for projects where `perlcritic` calls are wrapped into other script
      (like a `make` command).

#### Usage

```yaml
# in: .github/workflows/%your-workflow%.yml
#
# [... snip ...]
jobs:
  prove:
    uses: josegomezr/perl-toolkit/.github/workflows/perl-critic.yml@v1
    name: "Perlcritic"
# [... snip ...]
```

[obs]: https://openbuildservice.org/
[obs-proj]: https://build.opensuse.org/package/show/home:josegomezr:perl-toolkit/base-perl
[wf-tidyall.yml]: .github/workflows/perl-tidyall.yml
[wf-prove.yml]: .github/workflows/perl-prove.yml
[wf-perlcritic.yml]: .github/workflows/perl-critic.yml
