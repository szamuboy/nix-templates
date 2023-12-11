{
  description = "My personal nix flake templates";

  outputs = { self, ... }: {
    templates = {
      with-scripts = {
        description = "Development environment with scripts";
        path = ./with-scripts;
      };
      with-appuio-scripts = {
        description = "Development environment with scripts prepared for the APPuio environment";
        path = ./with-scripts-appuio;
      };
    };

  };
}
