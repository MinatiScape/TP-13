package com.bumptech.glide.load.engine.bitmap_recycle;

import android.annotation.SuppressLint;
import android.graphics.Bitmap;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import com.bumptech.glide.util.Util;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public final class LruBitmapPool implements BitmapPool {
    public static final Bitmap.Config DEFAULT_CONFIG = Bitmap.Config.ARGB_8888;
    public final Set<Bitmap.Config> allowedConfigs;
    public long currentSize;
    public int evictions;
    public int hits;
    public final long initialMaxSize;
    public long maxSize;
    public int misses;
    public int puts;
    public final LruPoolStrategy strategy;
    public final NullBitmapTracker tracker = new NullBitmapTracker();

    /* loaded from: classes.dex */
    public static final class NullBitmapTracker {
    }

    public final synchronized Bitmap getDirtyOrNull(int i, int i2, Bitmap.Config config) {
        Bitmap.Config config2;
        Bitmap bitmap;
        try {
            if (config != Bitmap.Config.HARDWARE) {
                LruPoolStrategy lruPoolStrategy = this.strategy;
                if (config != null) {
                    config2 = config;
                } else {
                    config2 = DEFAULT_CONFIG;
                }
                bitmap = ((SizeConfigStrategy) lruPoolStrategy).get(i, i2, config2);
                if (bitmap == null) {
                    if (Log.isLoggable("LruBitmapPool", 3)) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Missing bitmap=");
                        ((SizeConfigStrategy) this.strategy).getClass();
                        sb.append(SizeConfigStrategy.getBitmapString(Util.getBitmapByteSize(i, i2, config), config));
                        Log.d("LruBitmapPool", sb.toString());
                    }
                    this.misses++;
                } else {
                    this.hits++;
                    long j = this.currentSize;
                    ((SizeConfigStrategy) this.strategy).getClass();
                    this.currentSize = j - Util.getBitmapByteSize(bitmap);
                    this.tracker.getClass();
                    bitmap.setHasAlpha(true);
                    bitmap.setPremultiplied(true);
                }
                if (Log.isLoggable("LruBitmapPool", 2)) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Get bitmap=");
                    ((SizeConfigStrategy) this.strategy).getClass();
                    sb2.append(SizeConfigStrategy.getBitmapString(Util.getBitmapByteSize(i, i2, config), config));
                    Log.v("LruBitmapPool", sb2.toString());
                }
                if (Log.isLoggable("LruBitmapPool", 2)) {
                    dumpUnchecked();
                }
            } else {
                throw new IllegalArgumentException("Cannot create a mutable Bitmap with config: " + config + ". Consider setting Downsampler#ALLOW_HARDWARE_CONFIG to false in your RequestOptions and/or in GlideBuilder.setDefaultRequestOptions");
            }
        } catch (Throwable th) {
            throw th;
        }
        return bitmap;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public final synchronized void put(Bitmap bitmap) {
        try {
            if (bitmap == null) {
                throw new NullPointerException("Bitmap must not be null");
            } else if (!bitmap.isRecycled()) {
                if (bitmap.isMutable()) {
                    ((SizeConfigStrategy) this.strategy).getClass();
                    if (Util.getBitmapByteSize(bitmap) <= this.maxSize && this.allowedConfigs.contains(bitmap.getConfig())) {
                        ((SizeConfigStrategy) this.strategy).getClass();
                        int bitmapByteSize = Util.getBitmapByteSize(bitmap);
                        ((SizeConfigStrategy) this.strategy).put(bitmap);
                        this.tracker.getClass();
                        this.puts++;
                        this.currentSize += bitmapByteSize;
                        if (Log.isLoggable("LruBitmapPool", 2)) {
                            Log.v("LruBitmapPool", "Put bitmap in pool=" + ((SizeConfigStrategy) this.strategy).logBitmap(bitmap));
                        }
                        if (Log.isLoggable("LruBitmapPool", 2)) {
                            dumpUnchecked();
                        }
                        trimToSize(this.maxSize);
                        return;
                    }
                }
                if (Log.isLoggable("LruBitmapPool", 2)) {
                    Log.v("LruBitmapPool", "Reject bitmap from pool, bitmap: " + ((SizeConfigStrategy) this.strategy).logBitmap(bitmap) + ", is mutable: " + bitmap.isMutable() + ", is allowed config: " + this.allowedConfigs.contains(bitmap.getConfig()));
                }
                bitmap.recycle();
            } else {
                throw new IllegalStateException("Cannot pool recycled bitmap");
            }
        } catch (Throwable th) {
            throw th;
        }
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public final synchronized void setSizeMultiplier(float f) {
        long round = Math.round(((float) this.initialMaxSize) * f);
        this.maxSize = round;
        trimToSize(round);
    }

    public final synchronized void trimToSize(long j) {
        while (this.currentSize > j) {
            SizeConfigStrategy sizeConfigStrategy = (SizeConfigStrategy) this.strategy;
            Bitmap removeLast = sizeConfigStrategy.groupedMap.removeLast();
            if (removeLast != null) {
                sizeConfigStrategy.decrementBitmapOfSize(Integer.valueOf(Util.getBitmapByteSize(removeLast)), removeLast);
            }
            if (removeLast == null) {
                if (Log.isLoggable("LruBitmapPool", 5)) {
                    Log.w("LruBitmapPool", "Size mismatch, resetting");
                    dumpUnchecked();
                }
                this.currentSize = 0L;
                return;
            }
            this.tracker.getClass();
            long j2 = this.currentSize;
            ((SizeConfigStrategy) this.strategy).getClass();
            this.currentSize = j2 - Util.getBitmapByteSize(removeLast);
            this.evictions++;
            if (Log.isLoggable("LruBitmapPool", 3)) {
                Log.d("LruBitmapPool", "Evicting bitmap=" + ((SizeConfigStrategy) this.strategy).logBitmap(removeLast));
            }
            if (Log.isLoggable("LruBitmapPool", 2)) {
                dumpUnchecked();
            }
            removeLast.recycle();
        }
    }

    public LruBitmapPool(long j) {
        SizeConfigStrategy sizeConfigStrategy = new SizeConfigStrategy();
        HashSet hashSet = new HashSet(Arrays.asList(Bitmap.Config.values()));
        hashSet.add(null);
        hashSet.remove(Bitmap.Config.HARDWARE);
        Set<Bitmap.Config> unmodifiableSet = Collections.unmodifiableSet(hashSet);
        this.initialMaxSize = j;
        this.maxSize = j;
        this.strategy = sizeConfigStrategy;
        this.allowedConfigs = unmodifiableSet;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public final void clearMemory() {
        if (Log.isLoggable("LruBitmapPool", 3)) {
            Log.d("LruBitmapPool", "clearMemory");
        }
        trimToSize(0L);
    }

    public final void dumpUnchecked() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Hits=");
        m.append(this.hits);
        m.append(", misses=");
        m.append(this.misses);
        m.append(", puts=");
        m.append(this.puts);
        m.append(", evictions=");
        m.append(this.evictions);
        m.append(", currentSize=");
        m.append(this.currentSize);
        m.append(", maxSize=");
        m.append(this.maxSize);
        m.append("\nStrategy=");
        m.append(this.strategy);
        Log.v("LruBitmapPool", m.toString());
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    @SuppressLint({"InlinedApi"})
    public final void trimMemory(int i) {
        if (Log.isLoggable("LruBitmapPool", 3)) {
            Log.d("LruBitmapPool", "trimMemory, level=" + i);
        }
        if (i >= 40 || i >= 20) {
            clearMemory();
        } else if (i >= 20 || i == 15) {
            trimToSize(this.maxSize / 2);
        }
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public final Bitmap get(int i, int i2, Bitmap.Config config) {
        Bitmap dirtyOrNull = getDirtyOrNull(i, i2, config);
        if (dirtyOrNull != null) {
            dirtyOrNull.eraseColor(0);
            return dirtyOrNull;
        }
        if (config == null) {
            config = DEFAULT_CONFIG;
        }
        return Bitmap.createBitmap(i, i2, config);
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public final Bitmap getDirty(int i, int i2, Bitmap.Config config) {
        Bitmap dirtyOrNull = getDirtyOrNull(i, i2, config);
        if (dirtyOrNull != null) {
            return dirtyOrNull;
        }
        if (config == null) {
            config = DEFAULT_CONFIG;
        }
        return Bitmap.createBitmap(i, i2, config);
    }
}
