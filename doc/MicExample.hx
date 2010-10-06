// http://www.adobe.com/livedocs/flash/9.0/ActionScriptLangRefV3/flash/media/Microphone.html

class MicrophoneExample extends Sprite {
    public var mic:Microphone;

    public function new() {
        super();
        trace("starting");
        mic = Microphone.getMicrophone();
        //Security.showSettings(SecurityPanel.MICROPHONE);
        //mic.setLoopBack(true);
   
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
