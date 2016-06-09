# bobble-studio

FLASH=/Users/idm/Applications/Flash\ Player.app/Contents/MacOS/Flash\ Player
SWF=/Users/idm/Code/notequal/bobble_studio/var/bs.swf

all: swf haxe

swf:
	swfmill simple src/library.xml var/library.swf

haxe:
	cd src && haxe compile.hxml
	cp src/test.html var/index.html

open:
	# $(FLASH) $(SWF)
	open var/index.html

requirements:
	sudo -u admin brew install swfmill
	sudo -u admin brew install haxe

.PHONY: all swf haxe open requirements
