# docker image for etsy-hound

Super small [alpine-linux](http://alpinelinux.org/) based docker image for etsy's code search tool called [hound](https://github.com/etsy/hound)

## Configuration

run `gen-conf.py` and provide your github username and access token to populate the config file with the urls of your repos.
Access tokens can be generated in your [github profile settings](https://github.com/settings/tokens).
Note that the script requires python `requests`, you can install it via `pip install --user requests` locally or with the package manager of your choice.

## TODO

- data-only container for configuration
