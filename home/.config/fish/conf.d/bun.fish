# Bun itself comes from Homebrew (see Brewfile), not from bun.sh's installer.
# This stays anyway: `bun install -g` resolves its prefix from $BUN_INSTALL and
# drops binaries in $BUN_INSTALL/bin no matter which bun is running, so without
# it globally installed tools are missing from PATH.
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
