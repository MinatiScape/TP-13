package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.support.v4.app.FragmentTabHost$SavedState$$ExternalSyntheticOutline0;
import androidx.recyclerview.R$attr$$ExternalSyntheticOutline0;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import com.bumptech.glide.util.Util;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.NavigableMap;
import java.util.TreeMap;
/* loaded from: classes.dex */
public class SizeConfigStrategy implements LruPoolStrategy {
    public static final Bitmap.Config[] ARGB_8888_IN_CONFIGS;
    public static final Bitmap.Config[] RGBA_F16_IN_CONFIGS;
    public static final Bitmap.Config[] RGB_565_IN_CONFIGS = {Bitmap.Config.RGB_565};
    public static final Bitmap.Config[] ARGB_4444_IN_CONFIGS = {Bitmap.Config.ARGB_4444};
    public static final Bitmap.Config[] ALPHA_8_IN_CONFIGS = {Bitmap.Config.ALPHA_8};
    public final KeyPool keyPool = new KeyPool();
    public final GroupedLinkedMap<Key, Bitmap> groupedMap = new GroupedLinkedMap<>();
    public final Map<Bitmap.Config, NavigableMap<Integer, Integer>> sortedSizes = new HashMap();

    /* renamed from: com.bumptech.glide.load.engine.bitmap_recycle.SizeConfigStrategy$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public static /* synthetic */ class AnonymousClass1 {
        public static final /* synthetic */ int[] $SwitchMap$android$graphics$Bitmap$Config;

        static {
            int[] iArr = new int[Bitmap.Config.values().length];
            $SwitchMap$android$graphics$Bitmap$Config = iArr;
            try {
                iArr[Bitmap.Config.ARGB_8888.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$android$graphics$Bitmap$Config[Bitmap.Config.RGB_565.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$android$graphics$Bitmap$Config[Bitmap.Config.ARGB_4444.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$android$graphics$Bitmap$Config[Bitmap.Config.ALPHA_8.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    /* loaded from: classes.dex */
    public static class KeyPool extends BaseKeyPool<Key> {
        @Override // com.bumptech.glide.load.engine.bitmap_recycle.BaseKeyPool
        public Key create() {
            return new Key(this);
        }

        public Key get(int size, Bitmap.Config config) {
            Key key = get();
            key.size = size;
            key.config = config;
            return key;
        }
    }

    static {
        Bitmap.Config[] configArr = (Bitmap.Config[]) Arrays.copyOf(new Bitmap.Config[]{Bitmap.Config.ARGB_8888, null}, 3);
        configArr[configArr.length - 1] = Bitmap.Config.RGBA_F16;
        ARGB_8888_IN_CONFIGS = configArr;
        RGBA_F16_IN_CONFIGS = configArr;
    }

    public static String getBitmapString(int size, Bitmap.Config config) {
        String valueOf = String.valueOf(config);
        StringBuilder sb = new StringBuilder(valueOf.length() + 15);
        sb.append("[");
        sb.append(size);
        sb.append("](");
        sb.append(valueOf);
        sb.append(")");
        return sb.toString();
    }

    public final void decrementBitmapOfSize(Integer size, Bitmap removed) {
        NavigableMap<Integer, Integer> sizesForConfig = getSizesForConfig(removed.getConfig());
        Integer num = (Integer) sizesForConfig.get(size);
        if (num == null) {
            String valueOf = String.valueOf(size);
            String logBitmap = logBitmap(removed);
            String valueOf2 = String.valueOf(this);
            throw new NullPointerException(FragmentTabHost$SavedState$$ExternalSyntheticOutline0.m(R$attr$$ExternalSyntheticOutline0.m(valueOf2.length() + XMPPathFactory$$ExternalSyntheticOutline0.m(logBitmap, valueOf.length() + 56), "Tried to decrement empty size, size: ", valueOf, ", removed: ", logBitmap), ", this: ", valueOf2));
        } else if (num.intValue() == 1) {
            sizesForConfig.remove(size);
        } else {
            sizesForConfig.put(size, Integer.valueOf(num.intValue() - 1));
        }
    }

    public Bitmap get(int width, int height, Bitmap.Config config) {
        Bitmap.Config[] configArr;
        int bitmapByteSize = Util.getBitmapByteSize(width, height, config);
        Key key = this.keyPool.get();
        key.size = bitmapByteSize;
        key.config = config;
        int i = 0;
        if (Bitmap.Config.RGBA_F16.equals(config)) {
            configArr = RGBA_F16_IN_CONFIGS;
        } else {
            int i2 = AnonymousClass1.$SwitchMap$android$graphics$Bitmap$Config[config.ordinal()];
            if (i2 == 1) {
                configArr = ARGB_8888_IN_CONFIGS;
            } else if (i2 == 2) {
                configArr = RGB_565_IN_CONFIGS;
            } else if (i2 != 3) {
                configArr = i2 != 4 ? new Bitmap.Config[]{config} : ALPHA_8_IN_CONFIGS;
            } else {
                configArr = ARGB_4444_IN_CONFIGS;
            }
        }
        int length = configArr.length;
        while (true) {
            if (i >= length) {
                break;
            }
            Bitmap.Config config2 = configArr[i];
            Integer ceilingKey = getSizesForConfig(config2).ceilingKey(Integer.valueOf(bitmapByteSize));
            if (ceilingKey == null || ceilingKey.intValue() > bitmapByteSize * 8) {
                i++;
            } else if (ceilingKey.intValue() != bitmapByteSize || (config2 != null ? !config2.equals(config) : config != null)) {
                this.keyPool.offer(key);
                key = this.keyPool.get(ceilingKey.intValue(), config2);
            }
        }
        Bitmap bitmap = this.groupedMap.get(key);
        if (bitmap != null) {
            decrementBitmapOfSize(Integer.valueOf(key.size), bitmap);
            bitmap.reconfigure(width, height, config);
        }
        return bitmap;
    }

    public final NavigableMap<Integer, Integer> getSizesForConfig(Bitmap.Config config) {
        NavigableMap<Integer, Integer> navigableMap = this.sortedSizes.get(config);
        if (navigableMap != null) {
            return navigableMap;
        }
        TreeMap treeMap = new TreeMap();
        this.sortedSizes.put(config, treeMap);
        return treeMap;
    }

    public String logBitmap(Bitmap bitmap) {
        return getBitmapString(Util.getBitmapByteSize(bitmap), bitmap.getConfig());
    }

    public void put(Bitmap bitmap) {
        Key key = this.keyPool.get(Util.getBitmapByteSize(bitmap), bitmap.getConfig());
        this.groupedMap.put(key, bitmap);
        NavigableMap<Integer, Integer> sizesForConfig = getSizesForConfig(bitmap.getConfig());
        Integer num = (Integer) sizesForConfig.get(Integer.valueOf(key.size));
        Integer valueOf = Integer.valueOf(key.size);
        int i = 1;
        if (num != null) {
            i = 1 + num.intValue();
        }
        sizesForConfig.put(valueOf, Integer.valueOf(i));
    }

    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("SizeConfigStrategy{groupedMap=");
        m.append(this.groupedMap);
        m.append(", sortedSizes=(");
        for (Map.Entry<Bitmap.Config, NavigableMap<Integer, Integer>> entry : this.sortedSizes.entrySet()) {
            m.append(entry.getKey());
            m.append('[');
            m.append(entry.getValue());
            m.append("], ");
        }
        if (!this.sortedSizes.isEmpty()) {
            m.replace(m.length() - 2, m.length(), "");
        }
        m.append(")}");
        return m.toString();
    }

    /* loaded from: classes.dex */
    public static final class Key implements Poolable {
        public Bitmap.Config config;
        public final KeyPool pool;
        public int size;

        public Key(KeyPool pool) {
            this.pool = pool;
        }

        public boolean equals(Object o) {
            if (!(o instanceof Key)) {
                return false;
            }
            Key key = (Key) o;
            return this.size == key.size && Util.bothNullOrEqual(this.config, key.config);
        }

        public int hashCode() {
            int i = this.size * 31;
            Bitmap.Config config = this.config;
            return i + (config != null ? config.hashCode() : 0);
        }

        @Override // com.bumptech.glide.load.engine.bitmap_recycle.Poolable
        public void offer() {
            this.pool.offer(this);
        }

        public String toString() {
            return SizeConfigStrategy.getBitmapString(this.size, this.config);
        }

        public Key(KeyPool pool, int size, Bitmap.Config config) {
            this.pool = pool;
            this.size = size;
            this.config = config;
        }
    }
}
