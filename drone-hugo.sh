#!/bin/sh
HUGO_ARGS=${PLUGIN_HUGO_ARGS:-"--minify"}

/bin/hugo ${HUGO_ARGS}
