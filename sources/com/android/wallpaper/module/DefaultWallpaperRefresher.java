package com.android.wallpaper.module;

import android.annotation.SuppressLint;
import android.app.WallpaperManager;
import android.content.Context;
import android.graphics.drawable.BitmapDrawable;
import android.os.AsyncTask;
import android.util.Log;
import androidx.cardview.R$color;
import com.android.wallpaper.compat.WallpaperManagerCompatV16;
import com.android.wallpaper.model.WallpaperMetadata;
import com.android.wallpaper.module.WallpaperRefresher;
import com.google.android.material.shape.EdgeTreatment;
import java.util.List;
@SuppressLint({"ServiceCast"})
/* loaded from: classes.dex */
public class DefaultWallpaperRefresher implements WallpaperRefresher {
    public final Context mAppContext;
    public final WallpaperManager mWallpaperManager;
    public final WallpaperPreferences mWallpaperPreferences;
    public final EdgeTreatment mWallpaperStatusChecker;

    /* loaded from: classes.dex */
    public class GetWallpaperMetadataAsyncTask extends AsyncTask<Void, Void, List<WallpaperMetadata>> {
        public long mCurrentHomeWallpaperHashCode;
        public long mCurrentLockWallpaperHashCode;
        public final WallpaperRefresher.RefreshListener mListener;
        public String mSystemWallpaperPackageName;
        public final WallpaperManagerCompatV16 mWallpaperManagerCompat;

        @SuppressLint({"ServiceCast"})
        public GetWallpaperMetadataAsyncTask(WallpaperRefresher.RefreshListener refreshListener) {
            this.mListener = refreshListener;
            this.mWallpaperManagerCompat = InjectorProvider.getInjector().getWallpaperManagerCompat(DefaultWallpaperRefresher.this.mAppContext);
        }

        /* JADX WARN: Code restructure failed: missing block: B:25:0x0087, code lost:
            if (((r2.get(0) == null && r2.get(1) == null && r2.get(2) == null) ? 1 : null) != null) goto L26;
         */
        /* JADX WARN: Code restructure failed: missing block: B:40:0x012e, code lost:
            if (r20.this$0.mWallpaperPreferences.getLockWallpaperId() == r20.mWallpaperManagerCompat.getWallpaperId(2)) goto L68;
         */
        /* JADX WARN: Code restructure failed: missing block: B:67:0x0196, code lost:
            if (r9 == r20.mCurrentLockWallpaperHashCode) goto L68;
         */
        /* JADX WARN: Code restructure failed: missing block: B:68:0x0198, code lost:
            r2 = 1;
         */
        /* JADX WARN: Code restructure failed: missing block: B:69:0x019a, code lost:
            r2 = null;
         */
        /* JADX WARN: Code restructure failed: missing block: B:79:0x01ba, code lost:
            if (((r2.get(0) == null && r2.get(1) == null && r2.get(2) == null) ? 1 : null) != null) goto L80;
         */
        @Override // android.os.AsyncTask
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public java.util.List<com.android.wallpaper.model.WallpaperMetadata> doInBackground(java.lang.Void[] r21) {
            /*
                Method dump skipped, instructions count: 680
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.module.DefaultWallpaperRefresher.GetWallpaperMetadataAsyncTask.doInBackground(java.lang.Object[]):java.lang.Object");
        }

        public final long getCurrentHomeWallpaperHashCode() {
            if (this.mCurrentHomeWallpaperHashCode == 0) {
                this.mCurrentHomeWallpaperHashCode = R$color.generateHashCode(((BitmapDrawable) this.mWallpaperManagerCompat.getDrawable()).getBitmap());
                DefaultWallpaperRefresher.this.mWallpaperManager.forgetLoadedWallpaper();
            }
            return this.mCurrentHomeWallpaperHashCode;
        }

        @Override // android.os.AsyncTask
        public void onPostExecute(List<WallpaperMetadata> list) {
            List<WallpaperMetadata> list2 = list;
            if (list2.size() > 2) {
                Log.e("DefaultWPRefresher", "Got more than 2 WallpaperMetadata objects - only home and (optionally) lock are permitted.");
            } else {
                this.mListener.onRefreshed(list2.get(0), list2.size() > 1 ? list2.get(1) : null, DefaultWallpaperRefresher.this.mWallpaperPreferences.getWallpaperPresentationMode());
            }
        }
    }

    public DefaultWallpaperRefresher(Context context) {
        Context applicationContext = context.getApplicationContext();
        this.mAppContext = applicationContext;
        Injector injector = InjectorProvider.getInjector();
        this.mWallpaperPreferences = injector.getPreferences(applicationContext);
        this.mWallpaperStatusChecker = injector.getWallpaperStatusChecker();
        this.mWallpaperManager = (WallpaperManager) context.getSystemService("wallpaper");
    }

    public void refresh(WallpaperRefresher.RefreshListener refreshListener) {
        new GetWallpaperMetadataAsyncTask(refreshListener).execute(new Void[0]);
    }
}
