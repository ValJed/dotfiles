
{ inputs, ... }: {

  imports = [inputs.self.outputs.homeManagerModules.default];

  home.file = {
    ".config/hypr/hyprland.conf" = {
      source = ../../hypr/laptop.conf;
    };
  };
}
