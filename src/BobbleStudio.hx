import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.ActivityEvent;
import flash.events.StatusEvent;
import flash.media.Microphone;
import flash.system.Security;
import flash.system.SecurityPanel;

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
        trace("started");
    }

    private function activityHandler(event:ActivityEvent) {
        trace("activityHandler: " + event);
    }

    private function statusHandler(event:StatusEvent) {
        trace("statusHandler: " + event);
    }
}

// http://www.adobe.com/livedocs/flash/9.0/ActionScriptLangRefV3/flash/display/DisplayObject.html#mouseX

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

        square = new Sprite();
        square.graphics.beginFill(0xFF0000);
        square.graphics.drawRect(0, 0, 200, 200);
        flash.Lib.current.addChild(square);

        square.addEventListener(MouseEvent.CLICK, traceCoordinates);

        trace("there");
    }
}
