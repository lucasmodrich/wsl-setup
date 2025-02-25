# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave

# Set the default editor to VS-Code
$env.config.buffer_editor = "code"

# Start ssh-agent and load its environment variables
^ssh-agent -c
| lines
| first 2
| parse "setenv {name} {value};"
| transpose -r
| into record
| load-env

# Add your SSH private key to the agent
^ssh-add ~/.ssh/id_ed25519

# Setup Keychain to manage SSH keys
keychain --eval --quiet ~/.ssh/id_ed25519
    | lines
    | where not ($it | is-empty)
    | parse "{k}={v}; export {k2};"
    | select k v
    | transpose --header-row
    | into record
    | load-env

