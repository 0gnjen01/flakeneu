{inputs, ...}: {
  hjem = {
    extraModules = [
      inputs.hjem-rum.hjemModules.default
    ];
    users.ignis = {
      user = "ignis";
      directory = "/home/ignis";
    };
    clobberByDefault = true;
  };
}
