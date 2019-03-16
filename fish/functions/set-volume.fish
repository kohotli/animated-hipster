function set-volume
	pactl set-sink-volume @DEFAULT_SINK@ $argv\%
end
