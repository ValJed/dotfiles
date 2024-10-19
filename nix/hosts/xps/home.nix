
{ inputs, ... }: {

  imports = [inputs.self.outputs.homeManagerModules.default];
}
