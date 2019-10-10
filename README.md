# HTML Proofer, Dockerized [![Build Status](https://travis-ci.org/18F/html-proofer-docker.svg?branch=master)](https://travis-ci.org/18F/html-proofer-docker)

HTML validation, made easy. This repository is the [HTML Proofer](https://github.com/gjtorikian/html-proofer) Ruby gem wrapped up in a Docker container, so you don't have to fuss with installing things like [Ruby](https://www.ruby-lang.org/) or [Nokogiri](http://www.nokogiri.org/).

## Usage

Requires [Docker](https://www.docker.com/).

```bash
docker run 18fgsa/html-proofer
```

This will print out the usage instructions. Arguments for [the `htmlproofer` CLI](https://github.com/gjtorikian/html-proofer#using-on-the-command-line) can then be appended to the command. Note that **it's not (yet) recommended this be used against live sites** due to [this issue](https://github.com/gjtorikian/html-proofer/issues/334).

### Directory of files

e.g. those created by a static site builder like [Jekyll](http://jekyllrb.com/) or [Hugo](https://gohugo.io/). You will need to [mount the directory as a data volume](https://docs.docker.com/storage/volumes/#start-a-container-with-a-volume) so it's available in the container, like so:

```bash
docker run -v /absolute/path/to/site/:/mounted-site 18fgsa/html-proofer /mounted-site
```

### Single file

You can also mount a single file, like so:

```bash
docker run -v /absolute/path/to/file.html:/mounted-file.html 18fgsa/html-proofer /mounted-file.html
```

### GitLab CI

You can use this image in GitLab CI, just configure job in `.gitlab-ci.yml` like this:

```yaml
test:
  image: 18fgsa/html-proofer:gitlab-ci
  script:
    - htmlproofer _site --empty-alt-ignore
```
