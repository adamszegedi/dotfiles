podman run -p 3000:3000 \
    --replace \
    --name=ocv \
    --userns=keep-id \
    --security-opt label=disable \
    --rm \
    -it \
    -v /home/aszegedi/Projects/onlinecv-next/:/app/ \
    -v /home/aszegedi/.config/nvim:/home/aszegedi/.config/nvim \
    -v /home/aszegedi/.local/share/nvim:/home/aszegedi/.local/share/nvim \
    -v /home/aszegedi/.local/state/nvim:/home/aszegedi/.local/state/nvim \
    cv:latest 
