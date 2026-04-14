# Disable greeting
set fish_greeting 

# fish title
function fish_title
    echo (basename (pwd))" - "(status current-command)
end


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opencode
fish_add_path /home/huy/.opencode/bin
