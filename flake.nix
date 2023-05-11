{
  description = "Lubricate your `nix` codebase with `oils-for-unix`.";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.std.inputs.nixpkgs.follows = "nixpkgs";
  inputs.std.url = "github:divnix/std";

  outputs = { std, ... } @ inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./core;
      cellBlocks = with std.blockTypes; [
        (installables "packages")
        (functions "modules")
        (functions "library")
      ];
    }
    {
      lib = std.harvest inputs.self [
        ["oils-for-unix" "library"]
      ];
      nixosModules = std.harvest inputs.self [
        ["oils-for-unix" "modules"]
      ];
      packages = std.harvest inputs.self [
        ["oils-for-unix" "packages"]
        ["grease" "packages"]
      ];
    };
}
