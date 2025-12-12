! [[ $(uname -r) =~ WSL2 ]] && return

export GITHUB_TOKEN=$(gh.exe auth token)
