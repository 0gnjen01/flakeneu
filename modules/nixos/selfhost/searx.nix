{
  config,
  lib,
  ...
}: {
  options.searx = {
    enable = lib.mkEnableOption "enables searx";
  };
  config = lib.mkIf config.searx.enable {
    networking.firewall.allowedTCPPorts = [8888];

    services.searx = {
      enable = true;
      redisCreateLocally = true;
      domain = "http://nixos:8888/";

      settings = {
        use_default_settings = true;

        default_doi_resolver = "sci-hub.se";

        general = {
          instance_name = "1gnis's instance";
          git_url = "https://github.com/0gnjen01";
        };
        ui = {
          query_in_title = true;
          center_alignment = true;
          default_locale = "en";
          hotkeys = "vim";
        };
        server = {
          bind_address = "0.0.0.0";
          port = 8888;
          public_instance = false;
          limiter = false;
          base_url = "http://nixos:8888/";
          secret_key = config.sops.secrets.searx.path;
          pass_searxng_org = true;
          method = "GET";
        };
        enabled_plugins = [
          "Basic Calculator"
          "Hash plugin"
          "Tor check plugin"
          "Open Access DOI rewrite"
          "Hostnames plugin"
          "Unit converter plugin"
          "Tracker URL remover"
        ];
        search = {
          safe_search = 0;
          default_lang = "en-US";
          autocomplete = "google";
        };
        hostnames = {
          remove = [
            "(.*\.)?softonic.com$"
            "(.*\.)?nixos.wiki$"
          ];
        };
        high_priority = [
          "(.*\.)?wikipedia.com$"
          "(.*\.)?reddit.com$"
          "(.*\.)?github.com$"
          "(.*\.)?nixos.com$"
          "(.*\.)?archlinux.org$"
        ];
        outgoing = {
          request_timeout = 2.0;
          max_request_timeout = 3.0;
          pool_connections = 20;
          pool_maxsize = 5;
          enable_http2 = true;
        };
        engines = lib.mapAttrsToList (name: value: {inherit name;} // value) {
          "duckduckgo".disabled = true;
          "google".disabled = false;
          "startpage".disabled = true;
          "brave".disabled = false;
          "bing".disabled = true;
          "mojeek".disabled = true;
          "mwmbl".disabled = true;
          "mwmbl".weight = 0.4;
          "qwant".disabled = true;
          "crowdview".disabled = true;
          "crowdview".weight = 0.5;
          "curlie".disabled = true;
          "ddg definitions".disabled = true;
          "ddg definitions".weight = 2;
          "wikibooks".disabled = false;
          "wikidata".disabled = false;
          "wikiquote".disabled = true;
          "wikisource".disabled = true;
          "wikispecies".disabled = false;
          "wikispecies".weight = 0.5;
          "wikiversity".disabled = false;
          "wikiversity".weight = 0.5;
          "wikivoyage".disabled = false;
          "wikivoyage".weight = 0.5;
          "currency".disabled = true;
          "dictzone".disabled = true;
          "lingva".disabled = true;
          "bing images".disabled = true;
          "brave.images".disabled = false;
          "duckduckgo images".disabled = true;
          "google images".disabled = false;
          "qwant images".disabled = true;
          "1x".disabled = true;
          "artic".disabled = true;
          "deviantart".disabled = true;
          "flickr".disabled = true;
          "imgur".disabled = true;
          "library of congress".disabled = false;
          "material icons".disabled = true;
          "material icons".weight = 0.2;
          "openverse".disabled = true;
          "pinterest".disabled = true;
          "svgrepo".disabled = true;
          "unsplash".disabled = false;
          "wallhaven".disabled = true;
          "wikicommons.images".disabled = false;
          "yacy images".disabled = true;
          "bing videos".disabled = true;
          "brave.videos".disabled = true;
          "duckduckgo videos".disabled = true;
          "google videos".disabled = true;
          "qwant videos".disabled = true;
          "dailymotion".disabled = true;
          "google play movies".disabled = true;
          "invidious".disabled = true;
          "odysee".disabled = true;
          "peertube".disabled = true;
          "piped".disabled = true;
          "rumble".disabled = true;
          "sepiasearch".disabled = true;
          "vimeo".disabled = true;
          "youtube".disabled = false;
          "brave.news".disabled = true;
          "google news".disabled = true;
        };
      };
    };
    sops.secrets.searx = {};
  };
}
