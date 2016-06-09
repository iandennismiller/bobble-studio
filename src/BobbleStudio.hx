/*
Bobble Studio
2016-06-08
Ian Dennis Miller

Who knows when I originally wrote this stuff...
*/

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
    public var mic:Microphone;
    private static var bobble_body:Bitmap;
    private static var bobble_head:Bitmap;

    public function new() {
        super();

        // set up the microphone
        // Security.showSettings(SecurityPanel.MICROPHONE);
        mic = Microphone.getMicrophone();
        mic.setLoopBack(true);
        if (mic != null) {
            mic.setUseEchoSuppression(true);
        }

        // add the head to the scene
        bobble_head = new BMP(new P1_head());
        bobble_head.x = 145;
        bobble_head.y = 32;
        flash.Lib.current.addChild( bobble_head );

        // add the body to the scene
        bobble_body = new BMP(new P1_body());
        bobble_body.y = 180;
        flash.Lib.current.addChild( bobble_body );

        // bm.addEventListener(MouseEvent.CLICK, traceCoordinates);

        // attach the audio activity handler, which is activated every 50ms
        var myTimer:Timer = new Timer(50, 0);
        myTimer.addEventListener("timer", audio_level_handler);
        myTimer.start();
    }

    public function audio_level_handler(event:TimerEvent) {
        //trace(mic.activityLevel);

        // medium activity
        if (mic.activityLevel > 20 && mic.activityLevel <= 70) {
            bobble_head.y = 25 - Std.random(3);
            bobble_head.rotation = 1 - Std.random(2);
        }
        // very loud
        else if (mic.activityLevel > 70) {
            bobble_head.y = 25 - Std.random(5);
            bobble_head.rotation = 3 - Std.random(6);
        }
        // resting state
        else {
            bobble_head.y = 30;
            bobble_head.rotation = 0;
        }
    }
}

class BobbleStudio {
    static function main() {
        var background = new BMP(new Scene1());
        flash.Lib.current.addChild( background );
        var h = new BobbleHead();
    }
}
