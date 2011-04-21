import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.PixelSnapping;

import flash.events.TimerEvent;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.ActivityEvent;
import flash.events.StatusEvent;

import flash.media.Microphone;
import flash.system.Security;
import flash.system.SecurityPanel;
import flash.utils.Timer;
import Std;
    
// http://www.adobe.com/livedocs/flash/9.0/ActionScriptLangRefV3/flash/display/DisplayObject.html#mouseX
// http://lists.motion-twin.com/pipermail/haxe/2007-June/009507.html

class BMPdata extends BitmapData { 
    public function new() { super(0,0); }
}

class BMP extends Bitmap {
    public function new(bitmap_data) { 
        super(bitmap_data, flash.display.PixelSnapping.AUTO, true); 
    }
}

class P1_head extends BMPdata { }
class P1_body extends BMPdata { }
class Scene1 extends BMPdata { }

class BobbleHead extends MovieClip {
    private static var bobble_body:Bitmap;
    private static var bobble_head:Bitmap;
    public var mic:Microphone;

    public function new() {
        super();
        mic = Microphone.getMicrophone();
        //Security.showSettings(SecurityPanel.MICROPHONE);
        mic.setLoopBack(true);
        
        if (mic != null) {            
            mic.setUseEchoSuppression(true);
        }
        
        bobble_body = new BMP(new P1_body());
        bobble_head = new BMP(new P1_head());

        bobble_body.y = 180;
        bobble_head.x = 145;
        bobble_head.y = 32;
        flash.Lib.current.addChild( bobble_body );
        flash.Lib.current.addChild( bobble_head );
        
        //bm.addEventListener(MouseEvent.CLICK, traceCoordinates);
        
        var myTimer:Timer = new Timer(50, 0);
        myTimer.addEventListener("timer", timerHandler2);
        myTimer.start();
    }

    public function timerHandler2(event:TimerEvent) {
        if (mic.activityLevel > 20 && mic.activityLevel <= 70) {
            bobble_head.y = 25 - Std.random(3);
            bobble_head.rotation = 1 - Std.random(2);
        }
        else if (mic.activityLevel > 70) {
            bobble_head.y = 25 - Std.random(5);
            bobble_head.rotation = 3 - Std.random(6);
        }
        else {
            bobble_head.y = 30;
            bobble_head.rotation = 0;
        }
        //trace(mic.activityLevel);
    }

}

class BobbleStudio {
    static function main() {
        var background = new BMP(new Scene1());
        flash.Lib.current.addChild( background );
        var h = new BobbleHead();
    }
}
