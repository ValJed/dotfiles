{ lib, fetchFromGitHub, rustPlatform }:
rustPlatform.buildRustPackage rec {
  pname = "task";
  version = "main";

  src = fetchFromGitHub {
    owner = "ValJed";
    repo = pname;
    rev = version;
    # hash = "sha256-+s5RBC3XSgb8omTbUNLywZnP6jSxZBKSS1BmXOjRF8M=";
    hash = lib.fakeHash
  };

  # cargoHash = "sha256-jtBw4ahSl88L0iuCXxQgZVm1EcboWRJMNtjxLVTtzts=";

  meta = {
    description = "Task manager";
    homepage = "https://github.com/ValJed/task";
    license = lib.licenses.unlicense;
    maintainers = [ ];
  };
}
