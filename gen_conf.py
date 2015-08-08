#!/usr/bin/env python
''' This script generates a config for etsy/hound
    and populates it with the given users github repo urls

'''


import json
import argparse
import requests
from requests.auth import HTTPBasicAuth
import logging
LOG = logging.getLogger(__name__)

CONFIG = {
    'max-concurrent-indexers': 2,
    'dbpath': '/var/hound/data',
    'repos': {}
    }


def main(args):
    ''' main function

    '''
    repos = get_repos(args.username, args.access_token)
    if repos:
        for repo in repos:
            if args.public and repo['private']:
                pass
            else:
                CONFIG['repos'][repo['name']] = {
                    'url': repo['clone_url']
                }
        with open(args.output, 'w') as configfile:
            json_string = json.dumps(CONFIG, sort_keys=True, indent=4)
            configfile.write(json_string)


def get_repos(username, token):
    ''' Return a dict containing a users repo informations
        otherwise None is returned

    '''
    response = requests.get('https://api.github.com/user/repos',
                            auth=HTTPBasicAuth(username, token))
    if response.status_code == 200:
        return response.json()
    else:
        LOG.warn('Authentification failed, status code: {}'
                 .format(response.status_code))
        return None


def get_args():
    ''' Returns the parsed CLI arguments

    '''
    parser = argparse.ArgumentParser(
        description='Fetch github repos and create config.json for Hound.'
    )
    parser.add_argument('username', help='github user name')
    parser.add_argument('access_token', help='github access token')
    parser.add_argument('-o', '--output', help='output filepath',
                        default='hound_conf.json')
    parser.add_argument('-p', '--public', help='Use only public repos',
                        action='store_true')
    return parser.parse_args()


if __name__ == '__main__':
    main(get_args())
