-- Swayimg Lua configuration
-- Converted from old config format

-- ============================================================================
-- Gallery appearance settings
-- ============================================================================

swayimg.gallery.set_window_color(0x00000000)

swayimg.gallery.set_padding_size(4)

swayimg.gallery.set_border_size(2)
swayimg.gallery.set_border_color(0xffffffff) -- White border

swayimg.gallery.set_aspect("fit")
swayimg.gallery.set_thumb_size(256)

swayimg.gallery.enable_preload(true)

swayimg.gallery.set_selected_color(0x00000000)
swayimg.gallery.set_unselected_color(0x00000000)

-- ============================================================================
-- Gallery mode key bindings
-- ============================================================================

-- Copy image path to clipboard
swayimg.gallery.on_key("Ctrl+c", function()
	local image = swayimg.gallery.get_image()
	os.execute(string.format("wl-copy '%s' && notify-send 'Copied image path' -i '%s'", image.path, image.path))
end)

-- Add image to Favorites
swayimg.gallery.on_key("Ctrl+f", function()
	local image = swayimg.gallery.get_image()
	os.execute(
		string.format(
			"cp '%s' ~/Pictures/Favorites/ && notify-send 'Added image to Favorites' -i '%s'",
			image.path,
			image.path
		)
	)
end)

-- ============================================================================
-- Viewer appearance settings
-- ============================================================================

swayimg.viewer.set_window_background(0x00000000)

-- ============================================================================
-- Viewer mode key bindings
-- ============================================================================

-- Copy image path to clipboard
swayimg.viewer.on_key("Ctrl+c", function()
	local image = swayimg.viewer.get_image()
	os.execute(string.format("wl-copy '%s' && notify-send 'Copied image path' -i '%s'", image.path, image.path))
end)

-- Set wallpaper with swww and update colors with pywal
swayimg.viewer.on_key("Ctrl+w", function()
	local image = swayimg.viewer.get_image()
	os.execute(
		string.format(
			"swww img '%s' --transition-type wipe --transition-duration 1 & wal -i '%s' && source ~/.cache/wal/colors.sh && hyprctl keyword general:col.active_border 'rgba(${color1:1}ff)'",
			image.path,
			image.path
		)
	)
end)

-- Add image to Favorites
swayimg.viewer.on_key("Ctrl+f", function()
	local image = swayimg.viewer.get_image()
	os.execute(
		string.format(
			"cp '%s' ~/Pictures/Favorites/ && notify-send 'Added image to Favorites' -i '%s'",
			image.path,
			image.path
		)
	)
end)

-- Delete image
swayimg.viewer.on_key("Delete", function()
	local image = swayimg.viewer.get_image()
	os.execute(string.format("rm '%s' && notify-send 'Image deleted' -i '%s'", image.path, image.path))
end)
