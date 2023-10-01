{config, pkgs, ...}:
{
  programs.neovim = 
  let 
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-autopairs;
        config = toLua "require'nvim-autopairs'.setup({enable_check_bracket_line = false})";
      }
      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }
      {
        plugin = tokyonight-nvim;
        config = "colorscheme tokyonight-storm";
      }
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./lsp.lua;
      }
      {
        plugin= bufferline-nvim; 
        config = toLua "require('bufferline').setup{}";
      }
      {
        plugin = lualine-nvim;
        config = toLua "require('lualine').setup()";
      }
      

      nvim-cmp
      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets
      nvim-web-devicons
      telescope-fzf-native-nvim
      telescope-nvim
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-lua
        p.tree-sitter-c
        p.tree-sitter-cpp
        p.tree-sitter-python
        p.tree-sitter-vim
      ]))
      vim-nix
      neodev-nvim
    ];
    extraLuaConfig = ''
    ${builtins.readFile ./options.lua}
    ${builtins.readFile ./cmp.lua}
    '';
    extraPackages = with pkgs; [
      rnix-lsp
      clang-tools
      lua-language-server
    ];

  };

}
