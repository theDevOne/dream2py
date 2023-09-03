# Build Pillow from source, without a wheel, and rather
# minimal features - only zlib and libjpeg as dependencies.
{
  config,
  lib,
  dream2nix,
  ...
}: let
  l = lib // builtins;
in {
  imports = [
    dream2nix.modules.dream2nix.pip
  ];

  deps = {nixpkgs, ...}: {
    python = nixpkgs.python310;
  };
  
  name = "py";

  pip = {
    pypiSnapshotDate = "2023-04-02";
    requirementsFiles = [
      "./requirements.txt"
    ];
  };

}