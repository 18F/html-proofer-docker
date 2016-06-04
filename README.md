# HTML Proofer, Dockerized

HTML validation, made easy. This repository is the [HTML Proofer](https://github.com/gjtorikian/html-proofer) Ruby gem wrapped up in a Docker container, so you don't have to fuss with installing things like [Ruby](https://www.ruby-lang.org/) or [Nokogiri](http://www.nokogiri.org/).

## Usage

Requires [Docker](https://www.docker.com/).

```bash
# install
git clone https://github.com/18F/html-proofer-docker.git
cd html-proofer-docker
docker build -t html-proofer .

# run
docker run html-proofer
```

This will print out the usage instructions. Arguments can then be appended to the command, like so:

```bash
docker run html-proofer mysite.com --as-links
```
