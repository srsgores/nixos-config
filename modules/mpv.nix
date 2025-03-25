{config, pkgs, ...}:

{
	programs.mpv = {
		enable = true;
		config = {
			profile = "gpu-hq";
			vo = "gpu";
			hwdec = "auto";
			keep-open = "yes";
			save-position-on-quit = "yes";
		};
	};

	# Copy all your MPV config files
	xdg.configFile = {
		"mpv/mpv.conf".source = ../dotfiles/mpv/mpv.conf;
		"mpv/input.conf".source = ../dotfiles/mpv/input.conf;
		"mpv/configs/mpv_osd.conf".source = ../dotfiles/mpv/configs/mpv_osd.conf;
		"mpv/configs/mpv_shaders.conf".source = ../dotfiles/mpv/configs/mpv_shaders.conf;
		"mpv/configs/mpv_amd_or_intel_gpu.conf".source = ../dotfiles/mpv/configs/mpv_amd_or_intel_gpu.conf;
		"mpv/configs/mpv_file_extensions.conf".source = ../dotfiles/mpv/configs/mpv_file_extensions.conf;
		"mpv/configs/mpv_nvidia_gpu.conf".source = ../dotfiles/mpv/configs/mpv_nvidia_gpu.conf;
		"mpv/configs/mpv_subtitles.conf".source = ../dotfiles/mpv/configs/mpv_subtitles.conf;
		"mpv/configs/mpv_terminal.conf".source = ../dotfiles/mpv/configs/mpv_terminal.conf;
		"mpv/fonts".source = ../dotfiles/mpv/fonts;
		"mpv/scripts".source = ../dotfiles/mpv/scripts;
		"mpv/shaders".source = ../dotfiles/mpv/shaders;
		"mpv/script-opts".source = ../dotfiles/mpv/script-opts;
	};
}