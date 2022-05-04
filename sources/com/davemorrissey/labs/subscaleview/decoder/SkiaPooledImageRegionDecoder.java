package com.davemorrissey.labs.subscaleview.decoder;

import android.app.ActivityManager;
import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Point;
import android.graphics.Rect;
import android.net.Uri;
import android.support.annotation.Keep;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import android.util.Log;
import androidx.recyclerview.widget.RecyclerView;
import com.davemorrissey.labs.subscaleview.SubsamplingScaleImageView;
import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
/* loaded from: classes.dex */
public class SkiaPooledImageRegionDecoder implements ImageRegionDecoder {
    public static boolean debug = false;
    public Context context;
    public Uri uri;
    public DecoderPool decoderPool = new DecoderPool(null);
    public final ReadWriteLock decoderLock = new ReentrantReadWriteLock(true);
    public long fileLength = RecyclerView.FOREVER_NS;
    public final Point imageDimensions = new Point(0, 0);
    public final AtomicBoolean lazyInited = new AtomicBoolean(false);
    public final Bitmap.Config bitmapConfig = Bitmap.Config.RGB_565;

    /* loaded from: classes.dex */
    public static class DecoderPool {
        public final Semaphore available = new Semaphore(0, true);
        public final Map<BitmapRegionDecoder, Boolean> decoders = new ConcurrentHashMap();

        public DecoderPool(AnonymousClass1 r3) {
        }

        /* JADX WARN: Code restructure failed: missing block: B:10:0x002a, code lost:
            r1.setValue(java.lang.Boolean.FALSE);
         */
        /* JADX WARN: Code restructure failed: missing block: B:11:0x002f, code lost:
            r2 = true;
         */
        /* JADX WARN: Code restructure failed: missing block: B:9:0x0028, code lost:
            if (r1.getValue().booleanValue() == false) goto L13;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public static void access$800(com.davemorrissey.labs.subscaleview.decoder.SkiaPooledImageRegionDecoder.DecoderPool r4, android.graphics.BitmapRegionDecoder r5) {
            /*
                monitor-enter(r4)
                java.util.Map<android.graphics.BitmapRegionDecoder, java.lang.Boolean> r0 = r4.decoders     // Catch: java.lang.Throwable -> L3d
                java.util.Set r0 = r0.entrySet()     // Catch: java.lang.Throwable -> L3d
                java.util.Iterator r0 = r0.iterator()     // Catch: java.lang.Throwable -> L3d
            Lb:
                boolean r1 = r0.hasNext()     // Catch: java.lang.Throwable -> L3d
                r2 = 0
                if (r1 == 0) goto L34
                java.lang.Object r1 = r0.next()     // Catch: java.lang.Throwable -> L3d
                java.util.Map$Entry r1 = (java.util.Map.Entry) r1     // Catch: java.lang.Throwable -> L3d
                java.lang.Object r3 = r1.getKey()     // Catch: java.lang.Throwable -> L3d
                if (r5 != r3) goto Lb
                java.lang.Object r5 = r1.getValue()     // Catch: java.lang.Throwable -> L3d
                java.lang.Boolean r5 = (java.lang.Boolean) r5     // Catch: java.lang.Throwable -> L3d
                boolean r5 = r5.booleanValue()     // Catch: java.lang.Throwable -> L3d
                if (r5 == 0) goto L32
                java.lang.Boolean r5 = java.lang.Boolean.FALSE     // Catch: java.lang.Throwable -> L3d
                r1.setValue(r5)     // Catch: java.lang.Throwable -> L3d
                r2 = 1
                monitor-exit(r4)
                goto L35
            L32:
                monitor-exit(r4)
                goto L35
            L34:
                monitor-exit(r4)
            L35:
                if (r2 == 0) goto L3c
                java.util.concurrent.Semaphore r4 = r4.available
                r4.release()
            L3c:
                return
            L3d:
                r5 = move-exception
                monitor-exit(r4)
                throw r5
            */
            throw new UnsupportedOperationException("Method not decompiled: com.davemorrissey.labs.subscaleview.decoder.SkiaPooledImageRegionDecoder.DecoderPool.access$800(com.davemorrissey.labs.subscaleview.decoder.SkiaPooledImageRegionDecoder$DecoderPool, android.graphics.BitmapRegionDecoder):void");
        }

        /* JADX WARN: Code restructure failed: missing block: B:9:0x0028, code lost:
            r1.setValue(java.lang.Boolean.TRUE);
            r0 = r1.getKey();
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final android.graphics.BitmapRegionDecoder acquire() {
            /*
                r3 = this;
                java.util.concurrent.Semaphore r0 = r3.available
                r0.acquireUninterruptibly()
                monitor-enter(r3)
                java.util.Map<android.graphics.BitmapRegionDecoder, java.lang.Boolean> r0 = r3.decoders     // Catch: java.lang.Throwable -> L38
                java.util.Set r0 = r0.entrySet()     // Catch: java.lang.Throwable -> L38
                java.util.Iterator r0 = r0.iterator()     // Catch: java.lang.Throwable -> L38
            L10:
                boolean r1 = r0.hasNext()     // Catch: java.lang.Throwable -> L38
                if (r1 == 0) goto L35
                java.lang.Object r1 = r0.next()     // Catch: java.lang.Throwable -> L38
                java.util.Map$Entry r1 = (java.util.Map.Entry) r1     // Catch: java.lang.Throwable -> L38
                java.lang.Object r2 = r1.getValue()     // Catch: java.lang.Throwable -> L38
                java.lang.Boolean r2 = (java.lang.Boolean) r2     // Catch: java.lang.Throwable -> L38
                boolean r2 = r2.booleanValue()     // Catch: java.lang.Throwable -> L38
                if (r2 != 0) goto L10
                java.lang.Boolean r0 = java.lang.Boolean.TRUE     // Catch: java.lang.Throwable -> L38
                r1.setValue(r0)     // Catch: java.lang.Throwable -> L38
                java.lang.Object r0 = r1.getKey()     // Catch: java.lang.Throwable -> L38
                android.graphics.BitmapRegionDecoder r0 = (android.graphics.BitmapRegionDecoder) r0     // Catch: java.lang.Throwable -> L38
                monitor-exit(r3)
                goto L37
            L35:
                r0 = 0
                monitor-exit(r3)
            L37:
                return r0
            L38:
                r0 = move-exception
                monitor-exit(r3)
                throw r0
            */
            throw new UnsupportedOperationException("Method not decompiled: com.davemorrissey.labs.subscaleview.decoder.SkiaPooledImageRegionDecoder.DecoderPool.acquire():android.graphics.BitmapRegionDecoder");
        }
    }

    @Keep
    public SkiaPooledImageRegionDecoder() {
        List<Integer> list = SubsamplingScaleImageView.VALID_ORIENTATIONS;
    }

    @Keep
    public static void setDebug(boolean z) {
        debug = z;
    }

    public final void debug(String str) {
        if (debug) {
            Log.d("SkiaPooledImageRegionDecoder", str);
        }
    }

    @Override // com.davemorrissey.labs.subscaleview.decoder.ImageRegionDecoder
    public Bitmap decodeRegion(Rect rect, int i) {
        debug("Decode region " + rect + " on thread " + Thread.currentThread().getName());
        if ((rect.width() < this.imageDimensions.x || rect.height() < this.imageDimensions.y) && this.lazyInited.compareAndSet(false, true) && this.fileLength < RecyclerView.FOREVER_NS) {
            debug("Starting lazy init of additional decoders");
            new Thread() { // from class: com.davemorrissey.labs.subscaleview.decoder.SkiaPooledImageRegionDecoder.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    int size;
                    long j;
                    boolean z;
                    while (true) {
                        SkiaPooledImageRegionDecoder skiaPooledImageRegionDecoder = SkiaPooledImageRegionDecoder.this;
                        DecoderPool decoderPool = skiaPooledImageRegionDecoder.decoderPool;
                        if (decoderPool != null) {
                            synchronized (decoderPool) {
                                size = decoderPool.decoders.size();
                            }
                            long j2 = SkiaPooledImageRegionDecoder.this.fileLength;
                            Objects.requireNonNull(skiaPooledImageRegionDecoder);
                            boolean z2 = false;
                            if (size >= 4) {
                                skiaPooledImageRegionDecoder.debug("No additional decoders allowed, reached hard limit (4)");
                            } else {
                                if (size * j2 > 20971520) {
                                    skiaPooledImageRegionDecoder.debug("No additional encoders allowed, reached hard memory limit (20Mb)");
                                } else if (size >= Runtime.getRuntime().availableProcessors()) {
                                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("No additional encoders allowed, limited by CPU cores (");
                                    m.append(Runtime.getRuntime().availableProcessors());
                                    m.append(")");
                                    skiaPooledImageRegionDecoder.debug(m.toString());
                                } else {
                                    ActivityManager activityManager = (ActivityManager) skiaPooledImageRegionDecoder.context.getSystemService("activity");
                                    if (activityManager != null) {
                                        ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
                                        activityManager.getMemoryInfo(memoryInfo);
                                        z = memoryInfo.lowMemory;
                                    } else {
                                        z = true;
                                    }
                                    if (z) {
                                        skiaPooledImageRegionDecoder.debug("No additional encoders allowed, memory is low");
                                    } else {
                                        skiaPooledImageRegionDecoder.debug("Additional decoder allowed, current count is " + size + ", estimated native memory " + (j / 1048576) + "Mb");
                                        z2 = true;
                                    }
                                }
                            }
                            if (z2) {
                                try {
                                    if (SkiaPooledImageRegionDecoder.this.decoderPool != null) {
                                        long currentTimeMillis = System.currentTimeMillis();
                                        SkiaPooledImageRegionDecoder.this.debug("Starting decoder");
                                        SkiaPooledImageRegionDecoder.this.initialiseDecoder();
                                        long currentTimeMillis2 = System.currentTimeMillis();
                                        SkiaPooledImageRegionDecoder.this.debug("Started decoder, took " + (currentTimeMillis2 - currentTimeMillis) + "ms");
                                    }
                                } catch (Exception e) {
                                    SkiaPooledImageRegionDecoder skiaPooledImageRegionDecoder2 = SkiaPooledImageRegionDecoder.this;
                                    StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Failed to start decoder: ");
                                    m2.append(e.getMessage());
                                    skiaPooledImageRegionDecoder2.debug(m2.toString());
                                }
                            } else {
                                return;
                            }
                        } else {
                            return;
                        }
                    }
                }
            }.start();
        }
        this.decoderLock.readLock().lock();
        try {
            DecoderPool decoderPool = this.decoderPool;
            if (decoderPool != null) {
                BitmapRegionDecoder acquire = decoderPool.acquire();
                if (acquire != null && !acquire.isRecycled()) {
                    BitmapFactory.Options options = new BitmapFactory.Options();
                    options.inSampleSize = i;
                    options.inPreferredConfig = this.bitmapConfig;
                    Bitmap decodeRegion = acquire.decodeRegion(rect, options);
                    if (decodeRegion != null) {
                        DecoderPool.access$800(this.decoderPool, acquire);
                        return decodeRegion;
                    }
                    throw new RuntimeException("Skia image decoder returned null bitmap - image format may not be supported");
                } else if (acquire != null) {
                    DecoderPool.access$800(this.decoderPool, acquire);
                }
            }
            throw new IllegalStateException("Cannot decode region after decoder has been recycled");
        } finally {
            this.decoderLock.readLock().unlock();
        }
    }

    @Override // com.davemorrissey.labs.subscaleview.decoder.ImageRegionDecoder
    public Point init(Context context, Uri uri) throws Exception {
        this.context = context;
        this.uri = uri;
        initialiseDecoder();
        return this.imageDimensions;
    }

    public final void initialiseDecoder() throws Exception {
        BitmapRegionDecoder bitmapRegionDecoder;
        Resources resources;
        int i;
        String uri = this.uri.toString();
        boolean startsWith = uri.startsWith("android.resource://");
        long j = RecyclerView.FOREVER_NS;
        if (startsWith) {
            String authority = this.uri.getAuthority();
            if (this.context.getPackageName().equals(authority)) {
                resources = this.context.getResources();
            } else {
                resources = this.context.getPackageManager().getResourcesForApplication(authority);
            }
            List<String> pathSegments = this.uri.getPathSegments();
            int size = pathSegments.size();
            if (size != 2 || !pathSegments.get(0).equals("drawable")) {
                if (size == 1 && TextUtils.isDigitsOnly(pathSegments.get(0))) {
                    try {
                        i = Integer.parseInt(pathSegments.get(0));
                    } catch (NumberFormatException unused) {
                    }
                }
                i = 0;
            } else {
                i = resources.getIdentifier(pathSegments.get(1), "drawable", authority);
            }
            try {
                j = this.context.getResources().openRawResourceFd(i).getLength();
            } catch (Exception unused2) {
            }
            bitmapRegionDecoder = BitmapRegionDecoder.newInstance(this.context.getResources().openRawResource(i), false);
        } else if (uri.startsWith("file:///android_asset/")) {
            String substring = uri.substring(22);
            try {
                j = this.context.getAssets().openFd(substring).getLength();
            } catch (Exception unused3) {
            }
            bitmapRegionDecoder = BitmapRegionDecoder.newInstance(this.context.getAssets().open(substring, 1), false);
        } else if (uri.startsWith("file://")) {
            bitmapRegionDecoder = BitmapRegionDecoder.newInstance(uri.substring(7), false);
            try {
                File file = new File(uri);
                if (file.exists()) {
                    j = file.length();
                }
            } catch (Exception unused4) {
            }
        } else {
            InputStream inputStream = null;
            try {
                ContentResolver contentResolver = this.context.getContentResolver();
                inputStream = contentResolver.openInputStream(this.uri);
                BitmapRegionDecoder newInstance = BitmapRegionDecoder.newInstance(inputStream, false);
                try {
                    AssetFileDescriptor openAssetFileDescriptor = contentResolver.openAssetFileDescriptor(this.uri, "r");
                    if (openAssetFileDescriptor != null) {
                        j = openAssetFileDescriptor.getLength();
                    }
                } catch (Exception unused5) {
                }
                bitmapRegionDecoder = newInstance;
            } finally {
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (Exception unused6) {
                    }
                }
            }
        }
        this.fileLength = j;
        this.imageDimensions.set(bitmapRegionDecoder.getWidth(), bitmapRegionDecoder.getHeight());
        this.decoderLock.writeLock().lock();
        try {
            DecoderPool decoderPool = this.decoderPool;
            if (decoderPool != null) {
                synchronized (decoderPool) {
                    decoderPool.decoders.put(bitmapRegionDecoder, Boolean.FALSE);
                    decoderPool.available.release();
                }
            }
        } finally {
            this.decoderLock.writeLock().unlock();
        }
    }

    @Override // com.davemorrissey.labs.subscaleview.decoder.ImageRegionDecoder
    public synchronized boolean isReady() {
        boolean z;
        boolean isEmpty;
        DecoderPool decoderPool = this.decoderPool;
        if (decoderPool != null) {
            synchronized (decoderPool) {
                isEmpty = decoderPool.decoders.isEmpty();
            }
            if (!isEmpty) {
                z = true;
            }
        }
        z = false;
        return z;
    }

    @Override // com.davemorrissey.labs.subscaleview.decoder.ImageRegionDecoder
    public synchronized void recycle() {
        this.decoderLock.writeLock().lock();
        DecoderPool decoderPool = this.decoderPool;
        if (decoderPool != null) {
            synchronized (decoderPool) {
                while (!decoderPool.decoders.isEmpty()) {
                    BitmapRegionDecoder acquire = decoderPool.acquire();
                    acquire.recycle();
                    decoderPool.decoders.remove(acquire);
                }
            }
            this.decoderPool = null;
            this.context = null;
            this.uri = null;
        }
        this.decoderLock.writeLock().unlock();
    }
}
