{...}: {
  programs.nvf = {
    vim.utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        bigfile.enable = true;
        indent.enable = true;
        quickfile.enable = true;
        rename.enable = true;
        explorer = {
          enable = true;
        };
        picker = {
          enable = true;
        };
        notifier.enable = true;
      };
    };
  };
}
