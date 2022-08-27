function mkc -d "create a new dir and cd into it"
	mkdir -p $argv[1]
		and cd $argv[1]
end

function update  "create a new dir and cd into it"
	sudo apt-get upadte $argv[1]

end

