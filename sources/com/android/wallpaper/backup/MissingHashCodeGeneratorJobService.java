package com.android.wallpaper.backup;

import android.annotation.SuppressLint;
import android.app.WallpaperManager;
import android.app.job.JobParameters;
import android.app.job.JobService;
import android.content.Context;
@SuppressLint({"ServiceCast"})
/* loaded from: classes.dex */
public class MissingHashCodeGeneratorJobService extends JobService {
    public static final /* synthetic */ int $r8$clinit = 0;
    public Thread mWorkerThread;

    @Override // android.app.job.JobService
    public final boolean onStopJob(JobParameters jobParameters) {
        return false;
    }

    @Override // android.app.job.JobService
    public final boolean onStartJob(final JobParameters jobParameters) {
        final Context applicationContext = getApplicationContext();
        final WallpaperManager wallpaperManager = (WallpaperManager) applicationContext.getSystemService("wallpaper");
        Thread thread = new Thread(new Runnable() { // from class: com.android.wallpaper.backup.MissingHashCodeGeneratorJobService.1
            /* JADX WARN: Code restructure failed: missing block: B:38:0x00ad, code lost:
                if (r4 == null) goto L40;
             */
            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Type inference failed for: r4v0 */
            /* JADX WARN: Type inference failed for: r4v1 */
            /* JADX WARN: Type inference failed for: r4v2 */
            /* JADX WARN: Type inference failed for: r4v7 */
            @Override // java.lang.Runnable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final void run() {
                /*
                    r11 = this;
                    java.lang.String r0 = "IO exception when closing input stream for lock screen wallpaper."
                    com.android.wallpaper.module.Injector r1 = androidx.cardview.R$style.getInjector()
                    android.content.Context r2 = r2
                    com.android.wallpaper.compat.WallpaperManagerCompat r2 = r1.getWallpaperManagerCompat(r2)
                    android.content.Context r3 = r2
                    com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences r1 = r1.getPreferences(r3)
                    android.app.WallpaperManager r3 = r3
                    android.app.WallpaperInfo r3 = r3.getWallpaperInfo()
                    r4 = 1
                    r5 = 0
                    if (r3 == 0) goto L1e
                    r3 = r4
                    goto L1f
                L1e:
                    r3 = r5
                L1f:
                    r6 = 0
                    java.lang.String r8 = "MissingHashCodeGenerato"
                    if (r3 != 0) goto L63
                    long r9 = r1.getHomeWallpaperHashCode()
                    int r3 = (r9 > r6 ? 1 : (r9 == r6 ? 0 : -1))
                    if (r3 != 0) goto L63
                    android.app.WallpaperManager r3 = r3
                    r3.forgetLoadedWallpaper()
                    r3 = r2
                    com.android.wallpaper.compat.WallpaperManagerCompatV16 r3 = (com.android.wallpaper.compat.WallpaperManagerCompatV16) r3
                    r3.getClass()
                    android.app.WallpaperManager r9 = r3.mWallpaperManager     // Catch: java.lang.Exception -> L3f
                    android.graphics.drawable.Drawable r3 = r9.getDrawable()     // Catch: java.lang.Exception -> L3f
                    goto L45
                L3f:
                    android.app.WallpaperManager r3 = r3.mWallpaperManager
                    android.graphics.drawable.Drawable r3 = r3.getBuiltInDrawable()
                L45:
                    if (r3 != 0) goto L56
                    android.content.Context r0 = r2
                    java.lang.String r1 = "WallpaperManager#getDrawable returned null and there's no live wallpaper set"
                    com.android.wallpaper.util.DiskBasedLogger.e(r8, r1, r0)
                    com.android.wallpaper.backup.MissingHashCodeGeneratorJobService r0 = com.android.wallpaper.backup.MissingHashCodeGeneratorJobService.this
                    android.app.job.JobParameters r11 = r4
                    r0.jobFinished(r11, r5)
                    return
                L56:
                    android.graphics.drawable.BitmapDrawable r3 = (android.graphics.drawable.BitmapDrawable) r3
                    android.graphics.Bitmap r3 = r3.getBitmap()
                    long r9 = androidx.core.R$id.generateHashCode(r3)
                    r1.setHomeWallpaperHashCode(r9)
                L63:
                    long r9 = r1.getLockWallpaperHashCode()
                    int r3 = (r9 > r6 ? 1 : (r9 == r6 ? 0 : -1))
                    if (r3 != 0) goto Ld3
                    r3 = 2
                    android.os.ParcelFileDescriptor r2 = r2.getWallpaperFile(r3)
                    if (r2 == 0) goto L73
                    goto L74
                L73:
                    r4 = r5
                L74:
                    r3 = 0
                    if (r4 != 0) goto L88
                    long r6 = r1.getHomeWallpaperHashCode()
                    r1.setLockWallpaperHashCode(r6)
                    com.android.wallpaper.backup.MissingHashCodeGeneratorJobService r0 = com.android.wallpaper.backup.MissingHashCodeGeneratorJobService.this
                    r0.mWorkerThread = r3
                    android.app.job.JobParameters r11 = r4
                    r0.jobFinished(r11, r5)
                    return
                L88:
                    java.io.FileInputStream r4 = new java.io.FileInputStream     // Catch: java.lang.Throwable -> La3 java.io.IOException -> La5
                    java.io.FileDescriptor r6 = r2.getFileDescriptor()     // Catch: java.lang.Throwable -> La3 java.io.IOException -> La5
                    r4.<init>(r6)     // Catch: java.lang.Throwable -> La3 java.io.IOException -> La5
                    android.graphics.Bitmap r6 = android.graphics.BitmapFactory.decodeStream(r4)     // Catch: java.io.IOException -> La0 java.lang.Throwable -> Lc6
                    r2.close()     // Catch: java.io.IOException -> L9e java.lang.Throwable -> Lc6
                L98:
                    r4.close()     // Catch: java.io.IOException -> L9c
                    goto Lb3
                L9c:
                    r2 = move-exception
                    goto Lb0
                L9e:
                    r2 = move-exception
                    goto La8
                La0:
                    r2 = move-exception
                    r6 = r3
                    goto La8
                La3:
                    r11 = move-exception
                    goto Lc8
                La5:
                    r2 = move-exception
                    r4 = r3
                    r6 = r4
                La8:
                    java.lang.String r7 = "IO exception when closing the file descriptor."
                    android.util.Log.e(r8, r7, r2)     // Catch: java.lang.Throwable -> Lc6
                    if (r4 == 0) goto Lb3
                    goto L98
                Lb0:
                    android.util.Log.e(r8, r0, r2)
                Lb3:
                    if (r6 == 0) goto Lbc
                    long r6 = androidx.core.R$id.generateHashCode(r6)
                    r1.setLockWallpaperHashCode(r6)
                Lbc:
                    com.android.wallpaper.backup.MissingHashCodeGeneratorJobService r0 = com.android.wallpaper.backup.MissingHashCodeGeneratorJobService.this
                    r0.mWorkerThread = r3
                    android.app.job.JobParameters r11 = r4
                    r0.jobFinished(r11, r5)
                    goto Ld3
                Lc6:
                    r11 = move-exception
                    r3 = r4
                Lc8:
                    if (r3 == 0) goto Ld2
                    r3.close()     // Catch: java.io.IOException -> Lce
                    goto Ld2
                Lce:
                    r1 = move-exception
                    android.util.Log.e(r8, r0, r1)
                Ld2:
                    throw r11
                Ld3:
                    return
                */
                throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.backup.MissingHashCodeGeneratorJobService.AnonymousClass1.run():void");
            }
        });
        this.mWorkerThread = thread;
        thread.start();
        return true;
    }

    public Thread getWorkerThread() {
        return this.mWorkerThread;
    }
}
