com.five-doors.cordova.smartopen
========================

Opens an external app or launches the app store. Android and iOS

Sample usage :
    smartopen.open("com.imaze.bluetooth.le",
                   "imazefitness://",
                   "https://itunes.apple.com/cn/app/imaze-fitness/id797402141",
                   "Go to the market and download this app ?",
                   "Ok","Cancel");
                   
The parameters are :

androidPname Android package name ex : "com.imaze.bluetooth.le" (null or "" acceptable)
iosScheme iOS custom scheme, ex : "imazefitness://" (null or "" acceptable)
iosAppStore iOS app store url, ex : "https://itunes.apple.com/cn/app/imaze-fitness/id797402141" (null or "" acceptable)
message Label of the install message (default: "Go to the market and download this app ?")
okButton Label of the ok button (default: "Ok")
cancelButton Label of the cancel button (default: "Cancel")