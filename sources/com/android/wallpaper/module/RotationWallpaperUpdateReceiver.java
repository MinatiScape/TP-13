package com.android.wallpaper.module;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.cardview.R$style;
import com.android.wallpaper.util.DiskBasedLogger;
import com.android.wallpaper.util.FileMover;
import com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences;
import java.io.File;
import java.util.List;
/* loaded from: classes.dex */
public class RotationWallpaperUpdateReceiver extends BroadcastReceiver {
    public static final /* synthetic */ int $r8$clinit = 0;

    @Override // android.content.BroadcastReceiver
    public final void onReceive(final Context context, Intent intent) {
        if (intent.getAction() == null || (!intent.getAction().equals("android.intent.action.MY_PACKAGE_REPLACED") && !intent.getAction().equals("android.intent.action.BOOT_COMPLETED"))) {
            DiskBasedLogger.e("RotationWallpaperUpdateReceiver", "Unexpected action or Android version!", context);
            throw new IllegalStateException("Unexpected broadcast action or unsupported Android version");
        }
        final BroadcastReceiver.PendingResult goAsync = goAsync();
        new Thread(new Runnable() { // from class: com.android.wallpaper.module.RotationWallpaperUpdateReceiver$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                RotationWallpaperUpdateReceiver rotationWallpaperUpdateReceiver = RotationWallpaperUpdateReceiver.this;
                Context context2 = context;
                BroadcastReceiver.PendingResult pendingResult = goAsync;
                int i = RotationWallpaperUpdateReceiver.$r8$clinit;
                rotationWallpaperUpdateReceiver.getClass();
                Context applicationContext = context2.getApplicationContext();
                Context createDeviceProtectedStorageContext = applicationContext.createDeviceProtectedStorageContext();
                if (context2.getFileStreamPath("rotating_wallpaper.jpg").exists()) {
                    try {
                        FileMover.moveFileBetweenContexts(applicationContext, createDeviceProtectedStorageContext);
                    } catch (Exception e) {
                        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Failed to move rotating wallpaper file to device protected storage: ");
                        m.append(e.getMessage());
                        DiskBasedLogger.e("RotationWallpaperUpdateReceiver", m.toString(), applicationContext);
                    }
                }
                File fileStreamPath = createDeviceProtectedStorageContext.getFileStreamPath("rotating_wallpaper.jpg");
                if (fileStreamPath.exists()) {
                    try {
                        Injector injector = R$style.getInjector();
                        GoogleWallpaperPreferences preferences = injector.getPreferences(applicationContext);
                        if (preferences.getWallpaperPresentationMode() == 2) {
                            Bitmap decodeFile = BitmapFactory.decodeFile(fileStreamPath.getAbsolutePath());
                            WallpaperPersister wallpaperPersister = injector.getWallpaperPersister(applicationContext);
                            List<String> homeWallpaperAttributions = preferences.getHomeWallpaperAttributions();
                            int homeWallpaperActionLabelRes = preferences.getHomeWallpaperActionLabelRes();
                            int homeWallpaperActionIconRes = preferences.getHomeWallpaperActionIconRes();
                            String homeWallpaperActionUrl = preferences.getHomeWallpaperActionUrl();
                            String homeWallpaperCollectionId = preferences.getHomeWallpaperCollectionId();
                            DefaultWallpaperPersister defaultWallpaperPersister = (DefaultWallpaperPersister) wallpaperPersister;
                            int cropAndSetWallpaperBitmapInRotationStatic = defaultWallpaperPersister.cropAndSetWallpaperBitmapInRotationStatic(decodeFile, homeWallpaperAttributions, homeWallpaperActionUrl, homeWallpaperCollectionId);
                            if (cropAndSetWallpaperBitmapInRotationStatic != 0) {
                                defaultWallpaperPersister.saveStaticWallpaperMetadata(homeWallpaperAttributions, homeWallpaperActionUrl, homeWallpaperActionLabelRes, homeWallpaperActionIconRes, homeWallpaperCollectionId, cropAndSetWallpaperBitmapInRotationStatic);
                            }
                            fileStreamPath.delete();
                        }
                    } catch (Exception unused) {
                        DiskBasedLogger.e("RotationWallpaperUpdateReceiver", "Unable to set static wallpaper", applicationContext);
                    }
                }
                pendingResult.finish();
            }
        }).start();
    }
}
