package me.carda.awesome_notifications.utils;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.os.Build;
import android.util.Log;

import java.io.File;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.concurrent.Future;
import java.util.regex.Pattern;

import io.flutter.view.FlutterMain;
import me.carda.awesome_notifications.R;

import static me.carda.awesome_notifications.Definitions.MEDIA_VALID_ASSET;
import static me.carda.awesome_notifications.Definitions.MEDIA_VALID_FILE;
import static me.carda.awesome_notifications.Definitions.MEDIA_VALID_NETWORK;
import static me.carda.awesome_notifications.Definitions.MEDIA_VALID_RESOURCE;

import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestBuilder;
import com.bumptech.glide.RequestManager;
import com.bumptech.glide.load.resource.bitmap.CenterCrop;
import com.bumptech.glide.request.FutureTarget;
import com.bumptech.glide.request.RequestOptions;

public class BitmapUtils extends MediaUtils {

    public static Bitmap getBitmapFromSource(Context context, String bitmapPath, boolean roundedBitmap, boolean transform) {

        Bitmap returnedBitmap = null;
        switch (getMediaSourceType(bitmapPath)) {

            case Resource:
                returnedBitmap = getBitmapFromResource(context, bitmapPath);
                break;

            case File:
                returnedBitmap = getBitmapFromFile(bitmapPath);
                break;

            case Asset:
                returnedBitmap = getBitmapFromAsset(context, bitmapPath);
                break;

            case Network:
                returnedBitmap = getBitmapFromUrl(context, cleanMediaPath(bitmapPath), transform);
                break;

            case Unknown:
                break;
        }

        if (returnedBitmap != null && roundedBitmap) {
            returnedBitmap = roundBitmap(returnedBitmap);
        }

        return returnedBitmap;
    }

    public static String cleanMediaPath(String mediaPath) {
        if (mediaPath != null) {
            Pattern pattern = Pattern.compile("^https?:\\/\\/", Pattern.CASE_INSENSITIVE);
            Pattern pattern2 = Pattern.compile("^(asset:\\/\\/)(.*)", Pattern.CASE_INSENSITIVE);
            Pattern pattern3 = Pattern.compile("^(file:\\/\\/)(.*)", Pattern.CASE_INSENSITIVE);
            Pattern pattern4 = Pattern.compile("^(resource:\\/\\/)(.*)", Pattern.CASE_INSENSITIVE);

            if (pattern.matcher(mediaPath).find()) {
                return mediaPath;
            }

            if (pattern2.matcher(mediaPath).find()) {
                return pattern2.matcher(mediaPath).replaceAll("$2");
            }

            if (pattern3.matcher(mediaPath).find()) {
                return pattern3.matcher(mediaPath).replaceAll("/$2");
            }

            if (pattern4.matcher(mediaPath).find()) {
                return pattern4.matcher(mediaPath).replaceAll("$2");
            }
        }
        return null;
    }

    public static int getResId(String variableName, Class<?> c) {

        try {
            Field idField = c.getDeclaredField(variableName);
            return idField.getInt(idField);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public static int getDrawableResourceId(Context context, String bitmapReference) {
        bitmapReference = BitmapUtils.cleanMediaPath(bitmapReference);
        String[] reference = bitmapReference.split("\\/");
        try {
            int resId;

            String type = reference[0];
            String label = reference[1];

            // Resources protected from obfuscation
            // https://developer.android.com/studio/build/shrink-code#strict-reference-checks
            String name = String.format("res_%1s", label);
            resId = context.getResources().getIdentifier(name, type, context.getPackageName());

            if (resId == 0) {
                resId = context.getResources().getIdentifier(label, type, context.getPackageName());
            }

            return resId;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public static Bitmap roundBitmap(Bitmap bitmap) {
        Bitmap output = Bitmap.createBitmap(bitmap.getWidth(),
                bitmap.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(output);

        final int color = 0xff424242;
        final Paint paint = new Paint();
        final Rect rect = new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());

        paint.setAntiAlias(true);
        canvas.drawARGB(0, 0, 0, 0);
        paint.setColor(color);
        // canvas.drawRoundRect(rectF, roundPx, roundPx, paint);
        canvas.drawCircle(bitmap.getWidth() / 2, bitmap.getHeight() / 2,
                bitmap.getWidth() / 2, paint);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
        canvas.drawBitmap(bitmap, rect, rect, paint);
        //Bitmap _bmp = Bitmap.createScaledBitmap(output, 60, 60, false);
        //return _bmp;
        return output;
    }

    public static Bitmap getBitmapFromResource(Context context, String bitmapReference) {
        int resourceId = getDrawableResourceId(context, bitmapReference);
        if (resourceId <= 0) return null;
        return BitmapFactory.decodeResource(context.getResources(), resourceId);
    }

    public static Bitmap getBitmapFromAsset(Context context, String bitmapPath) {
        bitmapPath = BitmapUtils.cleanMediaPath(bitmapPath);

        if (bitmapPath == null) return null;

        //String appDir = context.getApplicationInfo().dataDir;
        //String filePathName = appDir +"/app_flutter/"+ bitmapPath;

        Bitmap bitmap = null;
        InputStream inputStream = null;
        try {

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                inputStream = context.getAssets().open("flutter_assets/" + bitmapPath);
            } else {
                String assetLookupKey = FlutterMain.getLookupKeyForAsset(bitmapPath);
                AssetManager assetManager = context.getAssets();
                AssetFileDescriptor assetFileDescriptor = assetManager.openFd(assetLookupKey);
                inputStream = assetFileDescriptor.createInputStream();
            }

            bitmap = BitmapFactory.decodeStream(inputStream);
            return bitmap;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private static Bitmap getBitmapFromFile(String bitmapPath) {
        bitmapPath = BitmapUtils.cleanMediaPath(bitmapPath);
        Bitmap bitmap = null;

        try {
            File imageFile = new File(bitmapPath);
            bitmap = BitmapFactory.decodeFile(imageFile.getAbsolutePath());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bitmap;
    }

    private static Bitmap getBitmapFromUrl(Context context, String bitmapUri, boolean transform) {
        bitmapUri = BitmapUtils.cleanMediaPath(bitmapUri);
//        Bitmap bitmap = null;
//        InputStream inputStream = null;
//        BufferedInputStream bufferedInputStream = null;
//
//        if (StringUtils.isNullOrEmpty(bitmapUri))
//            return null;
//
//        try {
//            URLConnection conn = new URL(bitmapUri).openConnection();
//            conn.connect();
//            inputStream = conn.getInputStream();
//            bufferedInputStream = new BufferedInputStream(inputStream, 8192);
//            bitmap = BitmapFactory.decodeStream(bufferedInputStream);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (bufferedInputStream != null) {
//                try {
//                    bufferedInputStream.close();
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//            if (inputStream != null) {
//                try {
//                    inputStream.close();
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//
//        return bitmap;


        try {
            RequestManager manager = Glide.with(context);
            int width = PhoneUtils.getScreenWidth(context);
            int height = (int) context.getResources().getDimension(R.dimen.dp_200);
            if (transform) {
                RequestOptions requestOptions = RequestOptions.bitmapTransform(new CenterCrop());
                manager.setDefaultRequestOptions(requestOptions);
            }
            RequestBuilder<Bitmap> builder = manager.asBitmap().load(bitmapUri);
            FutureTarget<Bitmap> bitmapFutureTarget;
            if (transform) {
                bitmapFutureTarget = builder.submit(width, height);
            } else {
                bitmapFutureTarget = builder.submit();
            }
            return bitmapFutureTarget.get();
        } catch (Exception e) {
            Log.d("getBitmapFromUrl", e.toString());
            return null;
        }
    }

    public static Bitmap getResizedBitmap(Bitmap bm, int newWidth, int newHeight) {
        int width = bm.getWidth();
        int height = bm.getHeight();
        float scaleWidth = ((float) newWidth) / width;
        float scaleHeight = ((float) newHeight) / height;
        // CREATE A MATRIX FOR THE MANIPULATION
        Matrix matrix = new Matrix();
        // RESIZE THE BIT MAP
        matrix.postScale(scaleWidth, scaleHeight);

        // "RECREATE" THE NEW BITMAP
        Bitmap resizedBitmap = Bitmap.createBitmap(
                bm, 0, 0, width, height, matrix, false);
        bm.recycle();
        return resizedBitmap;
    }

    public static Boolean isValidBitmap(Context context, String mediaPath) {

        if (mediaPath != null) {

            if (MediaUtils.matchMediaType(MEDIA_VALID_NETWORK, mediaPath, false)) {
                return true;
            }

            if (MediaUtils.matchMediaType(MEDIA_VALID_FILE, mediaPath)) {
                // TODO MISSING IMPLEMENTATION
                return true;
            }

            if (MediaUtils.matchMediaType(MEDIA_VALID_RESOURCE, mediaPath)) {
                return isValidDrawableResource(context, mediaPath);
            }

            if (MediaUtils.matchMediaType(MEDIA_VALID_ASSET, mediaPath)) {
                return true;
            }

        }
        return false;
    }

    private static Boolean isValidDrawableResource(Context context, String name) {
        if (name != null) {
            int resourceId = getDrawableResourceId(context, name);
            return resourceId > 0;
        }
        return false;
    }
}
