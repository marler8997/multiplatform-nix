{ stdenv, fetchFromGitHub,
  coreutils,
  gcc,
  ldc ? null, dcompiler ? ldc,
  #dmd ? null, dcompiler ? dmd,
  rund,
  mar,
}:

stdenv.mkDerivation rec {
  pname = "mnix";
  version = "0.0";
  name = "${pname}-${version}";
  src = ../..;
  buildInputs = [ coreutils dcompiler mar ];
  doCheck = true;
  buildPhase = ''
    ${rund}/bin/rund -of=mnix-store --build-only -I=${mar}/dlibs/mar mnix_store.d
  '';
  checkPhase = ''
    echo nothing to check yet
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp mnix-store $out/bin
  '';
  meta = {
    description = "Fill in later";
  };
}
