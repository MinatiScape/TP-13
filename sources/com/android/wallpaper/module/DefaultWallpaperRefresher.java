package com.android.wallpaper.module;

import android.annotation.SuppressLint;
import android.app.WallpaperManager;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import androidx.cardview.R$style;
import com.android.wallpaper.compat.WallpaperManagerCompat;
import com.android.wallpaper.model.WallpaperMetadata;
import com.android.wallpaper.module.WallpaperRefresher;
import com.google.android.gms.common.util.zzh;
import java.util.List;
@SuppressLint({"ServiceCast"})
/* loaded from: classes.dex */
public final class DefaultWallpaperRefresher implements WallpaperRefresher {
    public final Context mAppContext;
    public final WallpaperManager mWallpaperManager;
    public final WallpaperPreferences mWallpaperPreferences;
    public final zzh mWallpaperStatusChecker;

    /* loaded from: classes.dex */
    public class GetWallpaperMetadataAsyncTask extends AsyncTask<Void, Void, List<WallpaperMetadata>> {
        public long mCurrentHomeWallpaperHashCode;
        public long mCurrentLockWallpaperHashCode;
        public final WallpaperRefresher.RefreshListener mListener;
        public String mSystemWallpaperPackageName;
        public final WallpaperManagerCompat mWallpaperManagerCompat;

        @SuppressLint({"ServiceCast"})
        public GetWallpaperMetadataAsyncTask(WallpaperRefresher.RefreshListener refreshListener) {
            this.mListener = refreshListener;
            this.mWallpaperManagerCompat = R$style.getInjector().getWallpaperManagerCompat(DefaultWallpaperRefresher.this.mAppContext);
        }

        /* JADX WARN: Code restructure failed: missing block: B:15:0x0067, code lost:
            if (r7 == r18.mCurrentHomeWallpaperHashCode) goto L16;
         */
        /* JADX WARN: Code restructure failed: missing block: B:16:0x0069, code lost:
            r2 = true;
         */
        /* JADX WARN: Code restructure failed: missing block: B:17:0x006b, code lost:
            r2 = false;
         */
        /* JADX WARN: Code restructure failed: missing block: B:29:0x00ac, code lost:
            if (r2 != false) goto L30;
         */
        /* JADX WARN: Code restructure failed: missing block: B:41:0x017e, code lost:
            if (r18.this$0.mWallpaperPreferences.getLockWallpaperId() == r18.mWallpaperManagerCompat.getWallpaperId(2)) goto L69;
         */
        /* JADX WARN: Code restructure failed: missing block: B:68:0x01e9, code lost:
            if (r9 == r18.mCurrentLockWallpaperHashCode) goto L69;
         */
        /* JADX WARN: Code restructure failed: missing block: B:69:0x01eb, code lost:
            r2 = true;
         */
        /* JADX WARN: Code restructure failed: missing block: B:70:0x01ed, code lost:
            r2 = false;
         */
        /* JADX WARN: Code restructure failed: missing block: B:7:0x0033, code lost:
            if (r18.this$0.mWallpaperPreferences.getHomeWallpaperManagerId() == r18.mWallpaperManagerCompat.getWallpaperId(1)) goto L16;
         */
        /* JADX WARN: Code restructure failed: missing block: B:80:0x020d, code lost:
            if (r2 != false) goto L81;
         */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r11v13 */
        /* JADX WARN: Type inference failed for: r11v16 */
        /* JADX WARN: Type inference failed for: r11v17 */
        /* JADX WARN: Type inference failed for: r11v4 */
        /* JADX WARN: Type inference failed for: r11v6 */
        @Override // android.os.AsyncTask
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final java.util.List<com.android.wallpaper.model.WallpaperMetadata> doInBackground(java.lang.Void[] r19) {
            /*
                Method dump skipped, instructions count: 695
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.module.DefaultWallpaperRefresher.GetWallpaperMetadataAsyncTask.doInBackground(java.lang.Object[]):java.lang.Object");
        }

        @Override // android.os.AsyncTask
        public final void onPostExecute(List<WallpaperMetadata> list) {
            WallpaperMetadata wallpaperMetadata;
            List<WallpaperMetadata> list2 = list;
            if (list2.size() > 2) {
                Log.e("DefaultWPRefresher", "Got more than 2 WallpaperMetadata objects - only home and (optionally) lock are permitted.");
                return;
            }
            WallpaperRefresher.RefreshListener refreshListener = this.mListener;
            WallpaperMetadata wallpaperMetadata2 = list2.get(0);
            if (list2.size() > 1) {
                wallpaperMetadata = list2.get(1);
            } else {
                wallpaperMetadata = null;
            }
            refreshListener.onRefreshed(wallpaperMetadata2, wallpaperMetadata, DefaultWallpaperRefresher.this.mWallpaperPreferences.getWallpaperPresentationMode());
        }
    }

    public DefaultWallpaperRefresher(Context context) {
        Context applicationContext = context.getApplicationContext();
        this.mAppContext = applicationContext;
        Injector injector = R$style.getInjector();
        this.mWallpaperPreferences = injector.getPreferences(applicationContext);
        this.mWallpaperStatusChecker = injector.getWallpaperStatusChecker();
        this.mWallpaperManager = (WallpaperManager) context.getSystemService("wallpaper");
    }
}
