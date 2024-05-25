{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      rust-lang.rust-analyzer
      golang.go
    ];
  };

  home.packages = [
    pkgs.gcc
    pkgs.rustc
    pkgs.cargo
    pkgs.hugo
    pkgs.go
    pkgs.nodejs
    pkgs.python
  ];

}

