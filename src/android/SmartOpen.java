package com.five_doors.cordova.smartopen;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;

public class SmartOpen extends CordovaPlugin {
	
	final String GOOGLE_PLAY_URL = "https://play.google.com/store/apps/details?id=";
	
    @Override
    public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
    	
        if (action.equals("open")) {
            
            final String pname = args.getString(0);
            final String message = args.getString(3);
            final String okButton = args.getString(4);
            final String cancelButton = args.getString(5);
            
            if(isInstalled(pname)) {
            	
            	launch(pname);
            	
            } else {

                Runnable runnable = new Runnable() {
                    public void run() {

                    	AlertDialog.OnClickListener positive = new AlertDialog.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                SmartOpen.this.install(pname);
                            }
                            
                        };
                        
                    	AlertDialog.OnClickListener negative = new AlertDialog.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                dialog.dismiss();
                            }
                            
                        };
                        
                        AlertDialog.OnCancelListener cancel = new AlertDialog.OnCancelListener() {
                            public void onCancel(DialogInterface dialog)
                            {
                                dialog.dismiss();
                            }
                        };
                    	
                        AlertDialog.Builder dlg = new AlertDialog.Builder(cordova.getActivity());
                        dlg.setMessage(message);
                        dlg.setCancelable(true);
                        dlg.setPositiveButton(okButton,positive);
                        dlg.setNegativeButton(cancelButton,negative);
                        dlg.setOnCancelListener(cancel);

                        dlg.create();
                        dlg.show();
                    };
                };
                this.cordova.getActivity().runOnUiThread(runnable);
            }
            
            return true;
        }
        return false;
    }
    
    private boolean isInstalled(String pname){
        PackageManager pm = cordova.getActivity().getPackageManager();
        boolean app_installed = false;
        try {
            pm.getPackageInfo(pname, PackageManager.GET_ACTIVITIES);
            app_installed = true;
        }
        catch (PackageManager.NameNotFoundException e) {
            app_installed = false;
        }
        return app_installed ;
    }
	
	private void launch(String pname){
		Intent LaunchIntent = cordova.getActivity().getPackageManager().getLaunchIntentForPackage(pname);
		cordova.getActivity().startActivity(LaunchIntent);
	}
	
	private void install(String pname){				
		Intent intent = new Intent(Intent.ACTION_VIEW);
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		intent.setData(Uri.parse(GOOGLE_PLAY_URL+pname));
		cordova.getActivity().startActivity(intent);
	}
	
}
