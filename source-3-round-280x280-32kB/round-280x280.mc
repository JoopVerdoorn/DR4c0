using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

//! inherit from the view that contains the commonlogic
class DeviceView extends PowerView {
	var myTime;
	var strTime;

	//! it's good practice to always have an initialize, make sure to call your parent class here!
    function initialize() {
        PowerView.initialize();
    }

	function onUpdate(dc) {
		//! call the parent function in order to execute the logic of the parent
		PowerView.onUpdate(dc);

		//! Draw separator lines
        dc.setColor(mColourLine, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(2);

		//! Draw separator lines
        dc.setColor(mColourLine, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(2);

        dc.drawLine(0, 140,  280, 140);
        dc.drawLine(140, 34,  140, 250);

        //! Bottom horizontal divider
        dc.drawLine(50, 250, 240, 250);

        //! Top horizontal divider
        dc.drawLine(39, 34, 242, 34);	

		//! Display metrics
        dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);

		//! Show number of laps or clock with current time in top
		myTime = Toybox.System.getClockTime(); 
	    strTime = myTime.hour.format("%02d") + ":" + myTime.min.format("%02d");	
		dc.drawText(140, -2, Graphics.FONT_MEDIUM, strTime, Graphics.TEXT_JUSTIFY_CENTER);

		for (var i = 1; i < 5; ++i) {
	    	if ( i == 1 ) {			//!upper row, left
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"072,099,084,015,109,085,048");
	       	} else if ( i == 2 ) {	//!upper row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"202,099,215,147,109,195,048");
	       	} else if ( i == 3 ) {  //!lower row, left
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"072,177,084,015,170,085,232");
	       	} else if ( i == 4 ) {	//!lower row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"202,177,215,147,187,195,232");
	       	}    	       	 	
		}
		
		//! Bottom battery indicator
	 	var stats = Sys.getSystemStats();
		var pwr = stats.battery;
		var mBattcolor = (pwr > 15) ? mColourFont : Graphics.COLOR_RED;
		dc.setColor(mBattcolor, Graphics.COLOR_TRANSPARENT);
		dc.fillRectangle(107, 255, 63, 18);
		dc.fillRectangle(170, 260, 4, 8);

		dc.setColor(mColourBackGround, Graphics.COLOR_TRANSPARENT);
		var Startstatuspwrbr = 110 + Math.round(pwr*0.58)  ;
		var Endstatuspwrbr = 58 - Math.round(pwr*0.58) ;
		dc.fillRectangle(Startstatuspwrbr, 257, Endstatuspwrbr, 14);		
	   
	}

}