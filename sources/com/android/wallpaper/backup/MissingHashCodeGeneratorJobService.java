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

    public Thread getWorkerThread() {
        return this.mWorkerThread;
    }

    @Override // android.app.job.JobService
    public boolean onStartJob(final JobParameters jobParameters) {
        final Context applicationContext = getApplicationContext();
        final WallpaperManager wallpaperManager = (WallpaperManager) applicationContext.getSystemService("wallpaper");
        Thread thread = new Thread(new Runnable() { // from class: com.android.wallpaper.backup.MissingHashCodeGeneratorJobService.1
            /* JADX WARN: Code restructure failed: missing block: B:36:0x009e, code lost:
                if (r4 == null) goto L38;
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
            public void run() {
                /*
                    r11 = this;
                    java.lang.String r0 = "IO exception when closing input stream for lock screen wallpaper."
                    com.android.wallpaper.module.Injector r1 = com.android.wallpaper.module.InjectorProvider.getInjector()
                    android.content.Context r2 = r2
                    com.android.wallpaper.compat.WallpaperManagerCompatV16 r2 = r1.getWallpaperManagerCompat(r2)
                    android.content.Context r3 = r2
                    com.android.wallpaper.module.WallpaperPreferences r1 = r1.getPreferences(r3)
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
                    if (r3 != 0) goto L54
                    long r9 = r1.getHomeWallpaperHashCode()
                    int r3 = (r9 > r6 ? 1 : (r9 == r6 ? 0 : -1))
                    if (r3 != 0) goto L54
                    android.app.WallpaperManager r3 = r3
                    r3.forgetLoadedWallpaper()
                    android.graphics.drawable.Drawable r3 = r2.getDrawable()
                    if (r3 != 0) goto L47
                    android.content.Context r0 = r2
                    java.lang.String r1 = "WallpaperManager#getDrawable returned null and there's no live wallpaper set"
                    com.android.wallpaper.util.DiskBasedLogger.e(r8, r1, r0)
                    com.android.wallpaper.backup.MissingHashCodeGeneratorJobService r0 = com.android.wallpaper.backup.MissingHashCodeGeneratorJobService.this
                    android.app.job.JobParameters r11 = r4
                    r0.jobFinished(r11, r5)
                    return
                L47:
                    android.graphics.drawable.BitmapDrawable r3 = (android.graphics.drawable.BitmapDrawable) r3
                    android.graphics.Bitmap r3 = r3.getBitmap()
                    long r9 = androidx.cardview.R$color.generateHashCode(r3)
                    r1.setHomeWallpaperHashCode(r9)
                L54:
                    long r9 = r1.getLockWallpaperHashCode()
                    int r3 = (r9 > r6 ? 1 : (r9 == r6 ? 0 : -1))
                    if (r3 != 0) goto Lc4
                    r3 = 2
                    android.os.ParcelFileDescriptor r2 = r2.getWallpaperFile(r3)
                    if (r2 == 0) goto L64
                    goto L65
                L64:
                    r4 = r5
                L65:
                    r3 = 0
                    if (r4 != 0) goto L79
                    long r6 = r1.getHomeWallpaperHashCode()
                    r1.setLockWallpaperHashCode(r6)
                    com.android.wallpaper.backup.MissingHashCodeGeneratorJobService r0 = com.android.wallpaper.backup.MissingHashCodeGeneratorJobService.this
                    r0.mWorkerThread = r3
                    android.app.job.JobParameters r11 = r4
                    r0.jobFinished(r11, r5)
                    return
                L79:
                    java.io.FileInputStream r4 = new java.io.FileInputStream     // Catch: java.lang.Throwable -> L94 java.io.IOException -> L96
                    java.io.FileDescriptor r6 = r2.getFileDescriptor()     // Catch: java.lang.Throwable -> L94 java.io.IOException -> L96
                    r4.<init>(r6)     // Catch: java.lang.Throwable -> L94 java.io.IOException -> L96
                    android.graphics.Bitmap r6 = android.graphics.BitmapFactory.decodeStream(r4)     // Catch: java.io.IOException -> L91 java.lang.Throwable -> Lb7
                    r2.close()     // Catch: java.io.IOException -> L8f java.lang.Throwable -> Lb7
                L89:
                    r4.close()     // Catch: java.io.IOException -> L8d
                    goto La4
                L8d:
                    r2 = move-exception
                    goto La1
                L8f:
                    r2 = move-exception
                    goto L99
                L91:
                    r2 = move-exception
                    r6 = r3
                    goto L99
                L94:
                    r11 = move-exception
                    goto Lb9
                L96:
                    r2 = move-exception
                    r4 = r3
                    r6 = r4
                L99:
                    java.lang.String r7 = "IO exception when closing the file descriptor."
                    android.util.Log.e(r8, r7, r2)     // Catch: java.lang.Throwable -> Lb7
                    if (r4 == 0) goto La4
                    goto L89
                La1:
                    android.util.Log.e(r8, r0, r2)
                La4:
                    if (r6 == 0) goto Lad
                    long r6 = androidx.cardview.R$color.generateHashCode(r6)
                    r1.setLockWallpaperHashCode(r6)
                Lad:
                    com.android.wallpaper.backup.MissingHashCodeGeneratorJobService r0 = com.android.wallpaper.backup.MissingHashCodeGeneratorJobService.this
                    r0.mWorkerThread = r3
                    android.app.job.JobParameters r11 = r4
                    r0.jobFinished(r11, r5)
                    goto Lc4
                Lb7:
                    r11 = move-exception
                    r3 = r4
                Lb9:
                    if (r3 == 0) goto Lc3
                    r3.close()     // Catch: java.io.IOException -> Lbf
                    goto Lc3
                Lbf:
                    r1 = move-exception
                    android.util.Log.e(r8, r0, r1)
                Lc3:
                    throw r11
                Lc4:
                    return
                */
                throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.backup.MissingHashCodeGeneratorJobService.AnonymousClass1.run():void");
            }
        });
        this.mWorkerThread = thread;
        thread.start();
        return true;
    }

    @Override // android.app.job.JobService
    public boolean onStopJob(JobParameters jobParameters) {
        return false;
    }
}
