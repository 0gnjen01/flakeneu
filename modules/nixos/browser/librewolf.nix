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
      package = pkgs.librewolf;
      wrapperConfig = {
        pipewireSupport = true;
      };
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        Preferences = {
          "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
          "cookiebanners.service.mode" = 2; # Block cookie banners
          "privacy.donottrackheader.enabled" = true;
          "privacy.fingerprintingProtection" = true;
          "privacy.resistFingerprinting" = true;
          "privacy.trackingprotection.emailtracking.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
        };
        SearchEngines = {
          Default = "SearXNG";
          Add = [
            {
              Name = "SearXNG";
              URLTemplate = "http://192.168.1.6:8888//search?q={searchTerms}";
              Method = "GET";
              IconURL = "https://search.1gnis.me/favicon.png";
              Alias = "@se";
            }
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
              Name = "Dictcc";
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
          # Bitwarden
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };
    environment.etc."firefox/policies/policies.json".target = "librewolf/policies/policies.json";
  };
}
