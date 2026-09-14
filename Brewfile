# CLI tools
brew "fish"
brew "fisher"
brew "stow"
brew "starship"
brew "neovim"
brew "ripgrep"
brew "fd"
brew "gh"
brew "tmux"
brew "tree"
brew "zoxide"
brew "herdr"

# Container runtime (macOS only). No Docker Desktop: colima runs the daemon in
# a Lima VM and "docker" here is the CLI only. Testcontainers needs it. Colima
# does build on Linux, but the engine is native there — install it from the
# distro rather than nesting a VM.
if OS.mac?
  brew "colima"
  brew "docker"
  brew "docker-compose"
end

# GUI apps (macOS only)
if OS.mac?
  cask "ghostty"
  cask "raycast"
  cask "slack"
  cask "visual-studio-code"
  cask "figma"
  cask "stats"
  cask "mongodb-compass"
  cask "tailscale-app"
  cask "termius"
end
