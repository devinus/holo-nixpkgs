{ nixpkgs ? <nixpkgs>
, system ? builtins.currentSystem
}:

{
  iso = (import "${nixpkgs}/nixos/lib/eval-config.nix" {
      inherit system;
      modules = [
        "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"

        # The base module contains stuff we want on both the install iso
        # and the installed systems
        ./modules/base.nix

        # The custom config for our install iso
        ({ pkgs, ... }: {
          isoImage.isoBaseName = "holoportos";

          # The NIXOS_CONFIG variable will be used by nixos-install on the so
          # as the configuration of the system to install. This configuration
          # will first import the actual configuration.nix that was generated
          # with nixos-generated-config on the target fs mount on /mnt.
          # Additionally, all our custom modules will be imported so our
          # configuration is applied.
          environment.variables.NIXOS_CONFIG =
            toString (pkgs.writeText "holoport-configuration.nix" ''
              {
                imports = [ "/mnt/etc/nixos/configuration.nix" ]
                  ++ (import "${pkgs.holoportModules}/modules/module-list.nix");
              }
            '');
        })
      ];
    }).config.system.build.isoImage;
}
