import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.ActivityEvent;
import flash.events.StatusEvent;
import flash.media.Microphone;
import flash.system.Security;
import flash.system.SecurityPanel;
import flash.utils.Timer;
import flash.events.TimerEvent;
import flash.events.Event;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.PixelSnapping;
import Std;
    
// http://www.adobe.com/livedocs/flash/9.0/ActionScriptLangRefV3/flash/display/DisplayObject.html#mouseX
// http://lists.motion-twin.com/pipermail/haxe/2007-June/009507.html

class BMP extends BitmapData { 
    public function new() { super(0,0); }
}

class P1_head extends BMP { }
class P1_body extends BMP { }
class Scene1 extends BMP { }

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
        
        bobble_body = new flash.display.Bitmap( new P1_body(), flash.display.PixelSnapping.AUTO, true );
        bobble_head = new flash.display.Bitmap( new P1_head(), flash.display.PixelSnapping.AUTO, true );

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
        if (mic.activityLevel > 25) {
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
        var background = new flash.display.Bitmap( new Scene1(), flash.display.PixelSnapping.AUTO, true );
        flash.Lib.current.addChild( background );
        var h = new BobbleHead();
    }
}
