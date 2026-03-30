# Disable greeting
set fish_greeting 

# fish title
function fish_title
    echo (basename (pwd))" - "(status current-command)
end

# sentry
fish_add_path "/Users/quanghuy/.sentry/bin"

set -x GPG_TTY (tty)

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
