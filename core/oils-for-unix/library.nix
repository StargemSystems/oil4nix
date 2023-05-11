{inputs, cell}: 
let
  inherit (inputs) nixpkgs std;
  l = nixpkgs.lib // builtins;
in {
  
  writeOSH = nixpkgs.writers.makeScriptWriter {
    interpreter = p.oils + "/bin/osh";
  };
  writeYSH = nixpkgs.writers.makeScriptWriter {
    interpreter = p.oils + "/bin/ysh";
  };

  writeOSHBin = name:
    p.writeOSH "/bin/${name}";
  writeYSHBin = name:
    p.writeYSH "/bin/${name}";
  
}
