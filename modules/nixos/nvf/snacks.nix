{...}: {
  programs.nvf.settings.vim = {
    utility.snacks-nvim = {
      setupOpts = {
        bigfile.enable = true;
        indent.enable = true;
        quickfile.enable = true;
        explorer.enable = true;
        picker.enable = true;
        notifier.enable = true;
        image.enable = true;
      };
    };
    keymaps = [
      {
        action = "<cmd>lua Snacks.picker.recent()<CR>";
        key = "<leader>fr";
        mode = "n";
        desc = "Recent files";
      }
      {
        action = "<cmd>lua Snacks.picker.files()<CR>";
        key = "<leader>ff";
        mode = "n";
        desc = "Find Files";
      }
      {
        action = "<cmd>lua Snacks.picker.diagnostics()<CR>";
        key = "<leader>d";
        mode = "n";
        desc = "Show diagnostics";
      }
      {
        action = "<cmd>lua Snacks.picker.grep()<CR>";
        key = "<leader>fs";
        mode = "n";
        desc = "Rip-grep";
      }
    ];
  };
}
