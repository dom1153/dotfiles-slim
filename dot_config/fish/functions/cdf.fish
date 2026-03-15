function cdf -d "cd to a path given a filename with subdirectories"
	if test -z $argv[1]
		echo "usage: cdf <filepath>"
		echo "  e.g. cdf ~/personal-files/.vimrc"
	else
		cd (dirname $argv[1])
	end
end
