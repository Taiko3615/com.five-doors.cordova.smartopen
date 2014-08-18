var exec = require('cordova/exec');
var platform = require('cordova/platform');

/**
* Allows to start an external app and/or launch google play / app store
*/

module.exports = {

/**
* Checks if the app is present on the device.
* If yes, then it launches it.
* If no, then a popup will be displayed, proposing to download the app.
* If the user clicks yes, he will be redirected to the app store
*
* Note for iOS : in order to be able to launch your app, you have register a custom URL scheme
*  Check : Implementing Custom URL Schemes
*  At this address : https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/AdvancedAppTricks/AdvancedAppTricks.html
*
* @param {String} androidPname Android package name ex : "com.five_doors.zenn" (null or "" acceptable)
* @param {String} iosScheme iOS custom scheme, ex : "imazefitness://" (null or "" acceptable)
* @param {String} iosAppStore iOS app store url, ex : "https://itunes.apple.com/cn/app/imaze-fitness/id797402141" (null or "" acceptable)
* @param {String} message Label of the install message (default: "Go to the market and download this app ?")
* @param {String} okButton Label of the ok button (default: "Ok")
* @param {String} cancelButton Label of the cancel button (default: "Cancel")
*/

open: function(androidPname, iosScheme, iosAppStore, message, okButton, cancelButton) {

	var _androidPname = (androidPname || "");
	
	var _iosScheme = (iosScheme || "");
	
	var _iosAppStore = (iosAppStore || "");
	
	var _message = (message || "Go to the market and download this app ?");
	
	var _okButton = (okButton || "Ok");
	
	var _cancelButton = (cancelButton || "Cancel");
	
	exec(null, null, "SmartOpen", "open", [_androidPname, _iosScheme, _iosAppStore, _message, _okButton, _cancelButton]);
}

};