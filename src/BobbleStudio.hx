import flash.display.Sprite;
import flash.events.MouseEvent;

class BobbleStudio {
    private static var square:Sprite;

    private static function traceCoordinates(event:MouseEvent) {
        trace(square.mouseX, square.mouseY);
    }
    
    static function main() {
        square = new Sprite();
        square.graphics.beginFill(0xFF0000);
        square.graphics.drawRect(0, 0, 200, 200);
        flash.Lib.current.addChild(square);

        square.addEventListener(MouseEvent.CLICK, traceCoordinates);
    }
}