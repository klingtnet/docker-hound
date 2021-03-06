# docker image for etsy-hound

Super small [alpine-linux](http://alpinelinux.org/) based docker image for etsy's code search tool called [hound](https://github.com/etsy/hound)

## Configuration

run `gen-conf.py` and provide your github username and access token to populate the config file with the urls of your repos.
Access tokens can be generated in your [github profile settings](https://github.com/settings/tokens).
Note that the script requires python `requests`, you can install it via `pip install --user requests` locally or with the package manager of your choice.

- the github access token only needs `repo` or `public_repo` permissions
- at the moment the token is only used by the `gen-conf.py` script to access your repo urls. Maybe hound will support it in the future to access private repos as well

![github token settings](./token_settings.png)

## Run

- `$ make && make data` to create both, the `hound` and `hound-data` container
- `./run.sh [PORT]`
- if you omit the PORT option, the container will expose on 8080
