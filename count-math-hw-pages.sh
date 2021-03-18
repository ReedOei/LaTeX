#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <search_path> [search_path_filter] [output_file]"
    exit 1
fi

search_path="$1"
search_path_filter=".*"
output_file="out.pdf"
search_files_filter="main.pdf"

if [[ -n "$2" ]]; then
    search_path_filter="$2"
fi

if [[ -n "$3" ]]; then
    output_file="$3"
fi

if [[ -n "$4" ]]; then
    search_files_filter="$4"
fi

# TODO: Should search for names other than main.pdf
files="$(find "$search_path" -name "$search_files_filter" | grep -E "$search_path_filter" | tr "\n" " ")"
echo "$files"
pdfunite $files "$output_file"

