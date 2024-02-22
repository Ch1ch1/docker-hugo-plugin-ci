#!/bin/sh
HUGO_ARGS=${PLUGIN_HUGO_ARGS:-"--minify"}

/usr/bin/hugo ${HUGO_ARGS}
