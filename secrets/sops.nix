{...}: {
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";

    secrets.microbin_env.sopsFile = ./microbin.env.env;

    age.keyFile = "/home/ignis/.config/sops/age/keys.txt";
  };
}
