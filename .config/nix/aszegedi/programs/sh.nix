{
    bash = {

        enable = true;

        initExtra = ''
        set -o vi
        
        if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
           exec Hyprland 
        fi
        '';

        sessionVariables = {
            EDITOR="/home/aszegedi/.nix-profile/bin/nvim";
            GPG_TTY="$(tty)";
            MOZ_ENABLE_WAYLAND=1;
        };

        shellAliases = {
            #File Management
            space="sudo btrfs fi show";
            ls="eza --icons -ahlg --color=always --group-directories-first"; # my preferred listing
            la="eza --icons -ahg --color=always --group-directories-first";  # all files and dirs
            ll="eza --icons -lhg --color=always --group-directories-first";  # long format
            lt="eza --icons -ahTg --color=always --group-directories-first"; # tree listing

            #Terminal
            c="clear"; 

            # Sync to Drive
            sync-to-drive="cd ~ && rclone sync -P Documents gdrive:magan/arch/Documents && rclone sync -P ~/Pictures gdrive:magan/arch/Pictures";

            ff="fastfetch";

            #Cat
            cat="bat";

            #nix
            nd="sudo nix-env --delete-generations -p /nix/var/nix/profiles/system 5d";
            nl="sudo nix-env --list-generations -p /nix/var/nix/profiles/system";

            ## Colorize the grep command output for ease of use (good for log files)##
            grep="grep --color=auto";

            # Generate sha1 digest
            sha1="openssl sha1";

            #5: Create parent directories on demand
            mkdir="mkdir -pv";

            #Show open ports
            ports="sudo ss -tulpn";

            # Add safety nets 
            # do not delete / or prompt if deleting more than 3 files at a time #
            rm="rm -I --preserve-root";

            # confirmation #
            mv="mv -i";
            cp="cp -i";
            ln="ln -i";
             
            # Parenting changing perms on / #
            chown="chown --preserve-root";
            chmod="chmod --preserve-root";
            chgrp="chgrp --preserve-root";

            #Get system memory, cpu usage, and gpu memory info quickly
            ## pass options to free ##
            meminfo="free -m -l -t";
             
            ## get top process eating memory
            psmem="ps auxf | sort -nr -k 4";
            psmem10="ps auxf | sort -nr -k 4 | head -10";
             
            ## get top process eating cpu ##
            pscpu="ps auxf | sort -nr -k 3";
            pscpu10="ps auxf | sort -nr -k 3 | head -10";

            #Get my ipv6-address
            get-ipv6="ip -6 addr show dev enp5s0 scope global | sed -e's/^.*inet6 \([^ ]*\)\/.*$/\1/;t;d'";

            ## Get server cpu info ##
            cpuinfo="lscpu";
             
            ## get GPU ram on desktop / laptop##
            gpumeminfo="grep -i --color memory /var/log/Xorg.0.log";

            #Resume wget by default
            ## this one saved by butt so many times ##
            wget="wget -c";

            #weather
            wttr="curl wttr.in/47.4143259,19.2005805";

        };

    };
}
