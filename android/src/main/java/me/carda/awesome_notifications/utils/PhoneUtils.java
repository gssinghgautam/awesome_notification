package me.carda.awesome_notifications.utils;

import android.content.Context;
import android.content.res.Resources;
import android.hardware.display.DisplayManager;
import android.os.Build;
import android.os.PowerManager;
import android.provider.Settings;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;

public class PhoneUtils {

    private static final DisplayMetrics displayMetrics = new DisplayMetrics();

    /**
     * return screen width in pixel
     */
    public static int getScreenWidth(Context context) {
        return getDisplayMetrics(context).widthPixels;
    }

    /**
     * return screen height in pixel
     */
    public static int getScreenHeight(Context context) {
        return getDisplayMetrics(context).heightPixels;
    }


    public static float getDensity(Context context) {
        return getDisplayMetrics(context).density;
    }


    private static Display getDisplay(Context context) {
        return ((WindowManager) context.getSystemService(
                Context.WINDOW_SERVICE)).getDefaultDisplay();
    }

    private static DisplayMetrics getDisplayMetrics(Context context) {
        getDisplay(context).getMetrics(displayMetrics);
        return displayMetrics;
    }

}
