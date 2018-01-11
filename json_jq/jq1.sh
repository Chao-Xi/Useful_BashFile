#!/bin/bash

#chapter one getting start
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.'
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[0]'
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[0] | {message: .commit.message, name: .commit.committer.name}'
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[] | {message: .commit.message, name: .commit.committer.name}'
