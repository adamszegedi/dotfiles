podman run --replace \
    --name=nvim \
    --userns=keep-id \
    --security-opt label=disable \
    -it \
    -v $(pwd):/workdir/ \
    -v /home/aszegedi/.config/nvim:/home/aszegedi/.config/nvim \
    -v /home/aszegedi/.local/share/nvim:/home/aszegedi/.local/share/nvim \
    -v /home/aszegedi/.local/state/nvim:/home/aszegedi/.local/state/nvim \
    nvim:latest
