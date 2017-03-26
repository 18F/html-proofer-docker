#!/bin/sh
set -e

# Prepend "htmlproofer" if the first argument is not an executable
if ! type -- "$1" &> /dev/null; then
	set -- htmlproofer "$@"
fi

exec "$@"
