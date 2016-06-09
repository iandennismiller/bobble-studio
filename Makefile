# bobble-studio

FLASH=/Users/idm/Applications/Flash\ Player.app/Contents/MacOS/Flash\ Player
SWF=/Users/idm/Code/notequal/bobble_studio/var/bs.swf

all: swf haxe

swf:
	swfmill simple src/library.xml var/library.swf

haxe:
	cd src && haxe compile.hxml

open:
	$(FLASH) $(SWF)

requirements:
	sudo -u admin brew install swfmill

.PHONY: all swf haxe open
