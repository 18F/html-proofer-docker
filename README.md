# HTML Proofer, Dockerized [![Build Status](https://travis-ci.org/18F/html-proofer-docker.svg?branch=master)](https://travis-ci.org/18F/html-proofer-docker)

HTML validation, made easy. This repository is the [HTML Proofer](https://github.com/gjtorikian/html-proofer) Ruby gem wrapped up in a Docker container, so you don't have to fuss with installing things like [Ruby](https://www.ruby-lang.org/) or [Nokogiri](http://www.nokogiri.org/).

## Usage

Requires [Docker](https://www.docker.com/).

```bash
docker run 18fgsa/html-proofer
```

This will print out the usage instructions. Arguments for [the `htmlproofer` CLI](https://github.com/gjtorikian/html-proofer#using-on-the-command-line) can then be appended to the command. Note that **it's not (yet) recommended this be used against live sites** due to [this issue](https://github.com/gjtorikian/html-proofer/issues/334).

### Single file

You will need to [mount the file as a data volume](https://docs.docker.com/engine/userguide/containers/dockervolumes/#mount-a-host-file-as-a-data-volume) so it's available in the container, like so:

```bash
docker run -v /absolute/path/to/file.html:/file.html 18fgsa/html-proofer /file.html
```

### Directory of files

e.g. those created by a static site builder like [Jekyll](http://jekyllrb.com/) or [Hugo](https://gohugo.io/). You will need to [mount the directory as a data volume](https://docs.docker.com/engine/userguide/containers/dockervolumes/#mount-a-host-directory-as-a-data-volume) so it's available in the container, like so:

```bash
docker run -v /absolute/path/to/dir/:/site 18fgsa/html-proofer /site
```

### GitLab CI

You can use this image in GitLab CI, just configure job in `.gitlab-ci.yml` like this:

```yaml
test:
  image: 18fgsa/html-proofer:gitlabci
  script:
    - htmlproofer _site --empty-alt-ignore
```
