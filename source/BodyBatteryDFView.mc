import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.SensorHistory;
import Toybox.WatchUi;

class BodyBatteryDFView extends WatchUi.SimpleDataField {
    private var hasBodyBattery as Boolean;
    private var strNotSupported as String?;

    function initialize() {
        SimpleDataField.initialize();
        label = WatchUi.loadResource(Rez.Strings.fieldLabel) as String;
        hasBodyBattery = Toybox has :SensorHistory && Toybox.SensorHistory has :getBodyBatteryHistory;
        if (!hasBodyBattery) {
            strNotSupported = WatchUi.loadResource(Rez.Strings.fieldNotSupported) as String;
        }
    }

    function compute(info as Activity.Info) as Numeric or Duration or String or Null {
        var result;
        if (hasBodyBattery) {
            var iterator = Toybox.SensorHistory.getBodyBatteryHistory({:period => 1, :order => SensorHistory.ORDER_NEWEST_FIRST});
            var sample = iterator.next();
            if (sample != null && (sample as SensorSample).data != null) {
                result = ((sample as SensorSample).data as Number).toNumber();
            } else {
                result = "--";
            }
        } else {
            result = strNotSupported;
        }
        return result;
    }

}
