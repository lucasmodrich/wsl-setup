# Add your SSH key(s) to a universal variable
set -Ua SSH_KEYS_TO_AUTOLOAD ~/.ssh/id_ed25519

# Only run in interactive login shells
if status is-login; and status is-interactive
    keychain --nogui --eval $SSH_KEYS_TO_AUTOLOAD | source
end