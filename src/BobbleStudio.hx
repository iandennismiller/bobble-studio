import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.ActivityEvent;
import flash.events.StatusEvent;
import flash.media.Microphone;
import flash.system.Security;
import flash.system.SecurityPanel;
import flash.utils.Timer;
import flash.events.TimerEvent;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.PixelSnapping;
    
// http://www.adobe.com/livedocs/flash/9.0/ActionScriptLangRefV3/flash/media/Microphone.html

class MicrophoneExample extends Sprite {
    public var mic:Microphone;

    public function new() {
        super();
        trace("starting");
        mic = Microphone.getMicrophone();
        //Security.showSettings(SecurityPanel.MICROPHONE);
        mic.setLoopBack(true);
   
        if (mic != null) {
            mic.setUseEchoSuppression(true);
            mic.addEventListener(ActivityEvent.ACTIVITY, activityHandler);
            mic.addEventListener(StatusEvent.STATUS, statusHandler);
        }
        
        var myTimer:Timer = new Timer(100, 0);
        myTimer.addEventListener("timer", timerHandler);
        //myTimer.start();
                    
        trace("started");
    }
    
    public function timerHandler(event:TimerEvent) {
        //trace("timerHandler: " + event);
        trace(mic.activityLevel);
    }

    private function activityHandler(event:ActivityEvent) {
        trace("activityHandler: " + event);
    }

    private function statusHandler(event:StatusEvent) {
        trace("statusHandler: " + event);
    }
}

// http://www.adobe.com/livedocs/flash/9.0/ActionScriptLangRefV3/flash/display/DisplayObject.html#mouseX
// http://lists.motion-twin.com/pipermail/haxe/2007-June/009507.html

class BMP extends BitmapData { 
    public function new() { super(0,0); }
}

class P1_head extends BMP { }
class P1_body extends BMP { }

class BobbleStudio {
    private static var square:Sprite;
    private static var m:MicrophoneExample;

    private static function traceCoordinates(event:MouseEvent) {
        trace(m.mic.activityLevel);
        //trace(square.mouseX, square.mouseY);
    }
    
    static function main() {
        trace("here");
        m = new MicrophoneExample();
        flash.Lib.current.addChild(m);

        /*square = new Sprite();
        square.graphics.beginFill(0xFF0000);
        square.graphics.drawRect(0, 0, 200, 200);
        flash.Lib.current.addChild(square);
        square.addEventListener(MouseEvent.CLICK, traceCoordinates);
        */
        
        //flash.Lib.current.attachBitmap( flash.display.BitmapData.loadBitmap( "P1_head" ), 0 );
        
        var bm = new flash.display.Bitmap( new P1_body(), flash.display.PixelSnapping.AUTO, true );
        flash.Lib.current.addChild( bm );
                
        //var b = new P1_body();
        //flash.Lib.current.attachBitmap(b);

        trace("there");
    }
}
