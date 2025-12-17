{ pkgs, inputs, ... }:
{
  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  
  hjem.users.ignis = {
     xdg.config.files."~/.config/noctalia/settings.json".text = ''
       "location": {
         "name": "Belgrade",
       }
    '';
   };
}
