{ writeShellApplication, openshift }:
let
  scripts = {
    oc-login = {
      description = "Login to Openshift";
      runtimeInputs = [ openshift ];
      command = ''
      oc login --token="$APPUIO_TOKEN" \
               --server=https://api.cloudscale-lpg-2.appuio.cloud:6443
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
