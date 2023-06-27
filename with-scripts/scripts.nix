{ writeShellApplication }:
let
  scripts = {
    test-script = {
      description = "This is a test script";
      runtimeInputs = [ ];
      command = ''
        echo "Test script executed"
      '';
    };
  };
  generated-scripts = builtins.map (name:
    let value = scripts.${name};
    in writeShellApplication {
      inherit name;
      runtimeInputs = value.runtimeInputs;
      text = value.command;
    }) (builtins.attrNames scripts);
  help = writeShellApplication {
    name = "help";
    runtimeInputs = [ ];
    text = ''
      echo "This projects defines the following commands:"
      echo
      ${builtins.concatStringsSep "\n"
      (builtins.map (name: ''echo "${name}" - ${scripts.${name}.description} '')
        (builtins.attrNames scripts))}
    '';
  };
in generated-scripts ++ [ help ]
