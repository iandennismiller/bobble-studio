import os
from fabric.api import env, run, local

def millswf():
    """
    build library.swf with swfmill
    """
    cmd = "swfmill simple src/library.xml var/library.swf"
    local(cmd, capture=False)

def haxe():
    """
    compile swf with haxe
    """
    cmd = "cd src; haxe compile.hxml"
    local(cmd, capture=False)

def swf():
    """
    build a complete swf using swfmill and haxe, and run it
    """
    millswf()
    haxe()

#def play_swf():
#    """
#    use the debug player to execute test.swf
#    """
#    cmd = "/Users/idm/Applications/Flash\ Player.app/Contents/MacOS/Flash\ Player /Users/idm/Code/notequal/zoodown/var/sfx/test.swf"
#    os.system(cmd)

