{ stdenv, fetchFromGitHub,
  coreutils,
  gcc,
  #ldc ? null, dcompiler ? ldc,
  dmd ? null, dcompiler ? dmd,
  rund,
}:

stdenv.mkDerivation rec {
  pname = "mar";
  version = "0.0";
  name = "${pname}-${version}";
  src = fetchFromGitHub {
    owner = "dragon-lang";
    repo = pname;
    rev = "f4302b6b0a349b040913e2a6e53aa1d3a03d41eb";
    sha256 = "1bpgas4kj9ydqcgfk295hfvfmlrf97qmahdpl6mg8b8xlkbfsxq3";
  };
  buildInputs = [ coreutils dcompiler ];
  doCheck = true;
  buildPhase = ''
    envpath=$(type -P env)
    echo envpath is $envpath
    sed -i -e "s+/usr/bin/env+$envpath+g" src/mar/process.d
    #cat src/mar/process.d
  '';
  checkPhase = ''
    # TODO: go.d should be runnable from other directories
    pushd test
    ${rund}/bin/rund go.d
    popd
  '';
  installPhase = ''
    mkdir -p $out/dlibs/mar
    cp -r src/mar druntime/object.d $out/dlibs/mar
  '';
  meta = {
    description = "Fill in later";
  };
}
