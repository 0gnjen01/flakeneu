{
  config,
  lib,
  pkgs,
  ...
}: {
  options.librewolf = {
    enable = lib.mkEnableOption "enables librewolf";
  };
  config = lib.mkIf config.librewolf.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.librewolf-bin;
      policies = {
        SearchEngines = {
          Default = "DuckDuckGo";
          Add = [
            {
              Name = "Nix Packages";
              URLTemplate = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
              Method = "GET";
              IconURL = "https://search.nixos.org/favicon.png";
              Alias = "@np";
            }

            {
              Name = "Nix Options";
              URLTemplate = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
              IconURL = "https://nixos.org/favicon.ico";
              Method = "GET";
              Alias = "@no";
            }

            {
              Name = "Dict cc";
              URLTemplate = "https://www.dict.cc/?s={searchTerms}";
              IconURL = "https://dict.cc/favicon.ico";
              Method = "GET";
              Alias = "@dd";
            }
          ];
        };
        ExtensionSettings = {
          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
          # I still don't care about cookies
          "idcac-pub@guus.ninja" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
            installation_mode = "force_installed";
          };
          # ProtonPass
          "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };
  };
}
