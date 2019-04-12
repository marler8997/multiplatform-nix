# based on help from:
#   http://sandervanderburg.blogspot.com/2014/07/managing-private-nix-packages-outside.html
#
{ system ? builtins.currentSystem }:
let
  nixpkgs = import <nixpkgs> { inherit system; };
  callPackage = nixpkgs.lib.callPackageWith (nixpkgs // nixpkgs.xlibs // self);
  self = {
     skeleton = callPackage ./pkgs/skeleton {
       inherit (nixpkgs) stdenv;
     };
     rund = callPackage ./pkgs/rund { };
     mar = callPackage ./pkgs/mar { };
     mnix = callPackage ./pkgs/mnix { };
  };
in self
