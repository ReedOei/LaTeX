#!/usr/bin/env bash

set -ex

TEXMFHOME="$(kpsewhich -var-value=TEXMFHOME)"
SAGE_ROOT="$(dirname "$(which sage)")"

cp -R "$SAGE_ROOT/local/share/texmf/tex" "$TEXMFHOME/"

