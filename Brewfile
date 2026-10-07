# Taps
tap "mongodb/brew"
tap "quanghuynt14/tap"

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
brew "bun"
brew "mkcert"
brew "typescript-language-server"
brew "bullmq-dash"

# Databases (macOS only). Same call as colima: these build on Linux, but every
# distro ships them with a service manager already wired up — install them from
# the distro there instead of from Homebrew. The GUI clients below pair with
# these: mongodb-compass with mongodb-community, redis-insight with redis.
if OS.mac?
  brew "mongodb-community@8.0"
  # Keg-only, so brew does not link it by default and psql/pg_dump stay off
  # PATH. Link it: this is the only Postgres here, nothing to collide with.
  brew "postgresql@18", link: true
  brew "redis"
end

# iOS tooling (macOS only)
if OS.mac?
  brew "cocoapods"
end

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
  cask "google-chrome"
  cask "raycast"
  cask "slack"
  cask "visual-studio-code"
  cask "figma"
  cask "stats"
  cask "mongodb-compass"
  cask "redis-insight"
  cask "ngrok"
  cask "tailscale-app"
  cask "termius"
end
