# Disable greeting
set fish_greeting 

# fish title
function fish_title
    echo (basename (pwd))" - "(status current-command)
end

export PATH="$HOME/.local/bin:$PATH"
