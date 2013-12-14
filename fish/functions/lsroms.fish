function lsroms
	switch $argv
	case n64
		set filetype z64
		set folder N64
	case nds
		set filetype nds
		set folder NDS
	case *
		set filetype false
	end

	if test $filetype != false
		ls /home/emily/ROMs/$folder  | grep $filetype  | cut -d '.' -f1
	else
		echo Error: Invalid or unsupported platform
	end
end
