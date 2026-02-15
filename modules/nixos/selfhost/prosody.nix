{
  config,
  lib,
  ...
}: let
  sslCertDir = config.security.acme.certs."example.org".directory;
  domainName = "example.org";
in {
  options.prosody = {
    enable = lib.mkEnableOption "enables prosody";
  };
  config = lib.mkIf config.prosody.enable {
    networking.firewall = {
      allowedTCPPorts = [
        5222
        5223
        443
      ];
    };
    services = {
      prosody = {
        enable = true;
        admins = ["ignis@${domainName}"];
        allowRegistration = false;
        authentication = "internal_plain";
        s2sSecureAuth = true;
        c2sRequireEncryption = true;
        muc = [
          {
            domain = "muc.xmpp.${domainName}";
            restrictRoomCreation = false;
          }
        ];
        modules = {
          admin_adhoc = true;
          cloud_notify = false;
          pep = false;
          blocklist = false;
          bookmarks = false;
          dialback = false;
          ping = true;
          private = false;
          register = false;
          vcard_legacy = false;
        };
        xmppComplianceSuite = false;
        extraConfig = ''
          storage = "sql"
          sql = {
            driver = "SQLite3";
            database = "prosody.sqlite"; -- The database name to use. For SQLite3 this the database filename (relative to the data storage directory).
          }
        '';
      };
      nginx = {
        virtualHosts."upload.xmpp.${domainName}" = {
          forceSSL = true;
          useACMEHost = "${domainName}";
          locations."/upload/" = {
            proxyPass = "http://localhost:5050/upload/";
            extraConfig = ''
                proxy_request_buffering off;

              if ( $request_method = OPTIONS ) {
                      add_header Access-Control-Allow-Origin '*';
                      add_header Access-Control-Allow-Methods 'PUT, GET, OPTIONS, HEAD';
                      add_header Access-Control-Allow-Headers 'Authorization, Content-Type';
                      add_header Access-Control-Allow-Credentials 'true';
                      add_header Content-Length 0;
                      add_header Content-Type text/plain;
                      return 200;
              }
            '';
          };
        };
      };
      prosody-filer = {
        enable = true;
        settings = {
          secret = "plain in line password";
          storeDir = "/var/lib/prosody-filer/uploads/";

          uploadSubDir = "upload/";
        };
      };
    };
    systemd.services.prosody-filer.serviceConfig = {
      StateDirectory = "prosody-filer";
      RuntimeDirectory = "prosody-filer";
      RuntimeDirectoryMode = "0750";
    };
  };
}
