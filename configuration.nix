{config, pkgs, lib, ...}:

{
	imports = [
		./hardware-configurations/default.nix
		./modules/audio.nix
	];

	nix = {
		settings = {
			experimental-features = ["nix-command" "flakes"];
			auto-optimise-store = true;
		};
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 30d";
		};
	};

	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
		kernelParams = ["quiet" "udev.log_level=3"];
	};


	networking = {
		networkmanager.enable = true;
		firewall = {
			enable = true;
			allowedTCPPorts = [8384 22000]; # Syncthing ports
			allowedUDPPorts = [22000 21027]; # Syncthing discovery
		};
		hostName = "nixos";
	};

	time.timeZone = "America/Edmonton";
	i18n.defaultLocale = "en_CA.UTF-8";

	environment.systemPackages = with pkgs; [
		git wget curl vim htop
		wofi
		alacritty
		wpaperd
		copyq
		firefox
		syncthing
		mpv
		bitwarden
		rustdesk
		vesktop
		tdesktop # Telegram
		signal-desktop
		obsidian
		# Audio tools
		qpwgraph
		ffado-mixer
		steam
		steam-run
		wine
		winetricks
		proton-caller
		bottles
		plexamp
		plex-media-player
		rustup
		gcc
	];

	# Display Manager for Wayland/Hyprland
	services.greetd = {
		enable = true;
		settings = {
			default_session = {
				command = "${lib.makeBinPath [pkgs.greetd.tuigreet]}/tuigreet --cmd Hyprland";
				user = "greeter";
			};
		};
	};

	# Syncthing service
	services.syncthing = {
		enable = true;
		user = "seang";
		dataDir = "/home/seang/Sync";
		configDir = "/home/seang/.config/syncthing";
		openDefaultPorts = true;
	};
	
	# Plex Media Server
	services.plex = {
		enable = true;
		openFirewall = true;
	};

	# User account
	users.users.seang = {
		isNormalUser = true;
		extraGroups = ["wheel" "networkmanager" "video" "audio"];
	};

	# Fish shell
	programs.fish.enable = true;
	users.defaultUserShell = pkgs.fish;

	# System-wide environment variables
	environment.variables = {
		EDITOR = "vim";
		BROWSER = "firefox";
		TERMINAL = "alacritty";
		MOZ_ENABLE_WAYLAND = "1";
	};

	# Fonts
	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		liberation_ttf
		fira-code
		fira-code-symbols
	];

	# Enable Steam
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
	};

	system.stateVersion = "23.11";
}