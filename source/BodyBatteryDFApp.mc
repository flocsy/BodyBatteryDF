import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class BodyBatteryDFApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new BodyBatteryDFView() ] as Array<Views or InputDelegates>;
    }

}
