{ pkgs, ... }:
{
     home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
     } ;  

     programs.neovim = {
        enable = true; 
        viAlias = true;
        vimAlias = true;

        withRuby = true;
        withNodeJs = true;
        withPython3 = true;

        extraPackages = with pkgs; [
          lua-language-server
          gnumake
          cargo
          gcc13
          unzip
          wget
          curl
          tree-sitter
          luajitPackages.luarocks
          python312Packages.pynvim
          python312Packages.pip
        ];
     };
}

