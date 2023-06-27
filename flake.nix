{
  description = "My personal nix flake templates";

  outputs = { self, ... }: {
    templates = {
      with-scripts = {
        description = "Development environment with scripts";
        path = ./with-scripts;
      };
    };

  };
}
