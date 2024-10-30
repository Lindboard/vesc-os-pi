let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs {
    config = {};
    overlays = [];
  };
in
  (pkgs.buildFHSEnv {
    name = "vesc-os-pi-build-env";
    targetPkgs = pkgs: with pkgs; [
      bc
      cpio
      file
      libxcrypt
      perl
      rsync
      unzip
      util-linux
      wget # Not actually used, but still needs to be installed
      which
      python39Full
      lzma.dev
      xz
      zlib
      stdenv
    ];
    runScript = "bash";
  }).env
