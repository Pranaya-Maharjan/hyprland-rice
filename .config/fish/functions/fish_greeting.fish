function fish_greeting
    echo -ne '\x1b[38;5;15m'  # Set colour to primary
    echo '     ____  ____   ___  _   _  ____ __    __ '
    echo '    / ___||  _ \ / _ \| \ | |/ ___|\ \  / / '
    echo '    \__  \| |_) | | | |  \| | |  _  \ \/ /  '
    echo '     __)  |  __/| |_| | |\  | |_| |  |  |   '
    echo '    |____/|_|    \___/|_| \_|\____/  |__|   '
    set_color normal
    echo
    command -v fastfetch &> /dev/null && fastfetch --key-padding-left 5
end
