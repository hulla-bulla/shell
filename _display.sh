#!/bin/bash

# Function to print a Unicode line
function print_unicode_line () {
    # Example usage
    #print_unicode_line "═"  # Prints a line with the console width
    #print_unicode_line "─" 50  # Prints a line with 50 characters

    local char="$1"
    local width="${2:-}"

    # If width is not specified, use the console width
    if [ -z "$width" ]; then
        width=$(tput cols)
    fi

    # Print the line
    for ((i = 0; i < width; i++)); do
        echo -n "$char"
    done
    echo  # Newline
}

alias print_separator='print_unicode_line "—"'
alias print_sep="print_separator"

