{
  description = "My personal nix flake templates";

  outputs = { self, ... }: {
    templates = {
      basic = {
        description = "Basic development environment";
        path = ./basic;
      };
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
