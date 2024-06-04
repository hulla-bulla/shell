# general
ask_to_continue() {
    while true; do
        read -p "Do you want to continue? (y/n): " choice
        case "$choice" in
            y|Y ) echo "Continuing..."; return 0;;
            n|N ) echo "Exiting..."; return 1;;
            * ) echo "Please enter y or n.";;
        esac
    done
}

alias ask="ask_to_continue || { echo "Terminating the script."; exit 1; }"
