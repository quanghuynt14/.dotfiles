# `cf auth login` only offers OAuth, which needs a browser on the same machine.
# A headless box authenticates through CLOUDFLARE_API_TOKEN instead. The token
# lives under ~/.local, not ~/.config: ~/.config is a symlink into this repo,
# and a secret there is one stray `!` line away from being committed.
set -l dir $HOME/.local/share/cloudflare
if test -r $dir/api-token
    set --export CLOUDFLARE_API_TOKEN (string trim < $dir/api-token)
end
# An account-owned token fails /user/tokens/verify, so cf reports it invalid
# unless it knows which account the token belongs to.
if test -r $dir/account-id
    set --export CLOUDFLARE_ACCOUNT_ID (string trim < $dir/account-id)
end
