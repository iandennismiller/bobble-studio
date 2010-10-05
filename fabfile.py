import os
from fabric.api import env, run, local

def swfmill():
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

def all():
    """
    build a complete swf using swfmill and haxe, and run it
    """
    swfmill()
    haxe()

def invoke():
    """
    use the debug player to execute test.swf
    """
    #swf_file = "/Users/idm/Code/notequal/zoodown/var/sfx/test.swf"
    swf_file = "/Users/idm/Code/notequal/bobble_studio/var/bs.swf"
    cmd = "/Users/idm/Applications/Flash\ Player.app/Contents/MacOS/Flash\ Player %s" % swf_file
    os.system(cmd)

