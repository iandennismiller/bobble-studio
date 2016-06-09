# bobble-studio

INSTALL_PATH=/Users/idm/Work/iandennismiller/blog/content/assets/bobble-studio

all: haxe
	@echo "done"

swf:
	swfmill simple src/library.xml var/library.swf

haxe: swf
	cd src && haxe compile.hxml
	rm var/library.swf
	cp src/test.html var/index.html

open:
	open var/index.html

requirements:
	sudo -u admin brew install swfmill
	sudo -u admin brew install haxe

install:
	cp var/bs.swf $(INSTALL_PATH)

.PHONY: all swf haxe open requirements install
