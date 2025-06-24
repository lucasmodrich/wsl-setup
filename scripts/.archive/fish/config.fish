set -gx HOSTNAME (hostname)

fish_add_path (go env GOPATH)/bin

if status is-interactive
    # Setup WARPification of the shell
    printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'
end

starship init fish | source