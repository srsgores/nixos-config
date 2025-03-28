{config, lib, pkgs, modulesPath, ...}:

{
	imports = [(modulesPath + "/installer/scan/not-detected.nix")];

	boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
	boot.initrd.kernelModules = [];
	boot.kernelModules = ["kvm-amd"];
	boot.extraModulePackages = [];

	fileSystems."/" = {
		device = "/dev/disk/by-label/nixos";
		fsType = "ext4";
	};

	fileSystems."/boot" = {
		device = "/dev/disk/by-label/boot";
		fsType = "vfat";
	};

	swapDevices = [
		{device = "/dev/disk/by-label/swap";}
	];
}