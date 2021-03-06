{ config, pkgs, ... }:

{
  imports = [
    ../.
    ../automount.nix
  ];

  boot.extraModulePackages = with config.boot.kernelPackages; [
    sun50i-a64-gpadc-iio
  ];

  boot.kernelModules = [ "sun50i-a64-gpadc-iio" ];

  # TODO: remove once Linux 5.1.4 becomes stable
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [
    "console=ttyS0,115200n8"
    "console=tty0"
  ];

  boot.loader.generic-extlinux-compatible = {
    enable = true;
    dtbDir = pkgs.holoport-nano-dtb;
  };

  boot.loader.grub.enable = false;

  hardware.deviceTree.package = pkgs.holoport-nano-dtb;

  services.hpos-led-manager.devicePath = "/dev/ttyS2";
}
