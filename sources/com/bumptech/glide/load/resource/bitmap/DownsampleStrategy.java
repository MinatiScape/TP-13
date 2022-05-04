package com.bumptech.glide.load.resource.bitmap;

import com.bumptech.glide.load.Option;
/* loaded from: classes.dex */
public abstract class DownsampleStrategy {
    public static final CenterOutside CENTER_OUTSIDE;
    public static final CenterOutside DEFAULT;
    public static final Option<DownsampleStrategy> OPTION;
    public static final FitCenter FIT_CENTER = new FitCenter();
    public static final CenterInside CENTER_INSIDE = new CenterInside();
    public static final None NONE = new None();
    public static final boolean IS_BITMAP_FACTORY_SCALING_SUPPORTED = true;

    /* loaded from: classes.dex */
    public static class CenterInside extends DownsampleStrategy {
        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public final float getScaleFactor(int i, int i2, int i3, int i4) {
            return Math.min(1.0f, DownsampleStrategy.FIT_CENTER.getScaleFactor(i, i2, i3, i4));
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public final SampleSizeRounding getSampleSizeRounding(int i, int i2, int i3, int i4) {
            if (getScaleFactor(i, i2, i3, i4) == 1.0f) {
                return SampleSizeRounding.QUALITY;
            }
            return DownsampleStrategy.FIT_CENTER.getSampleSizeRounding(i, i2, i3, i4);
        }
    }

    /* loaded from: classes.dex */
    public static class FitCenter extends DownsampleStrategy {
        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public final SampleSizeRounding getSampleSizeRounding(int i, int i2, int i3, int i4) {
            if (DownsampleStrategy.IS_BITMAP_FACTORY_SCALING_SUPPORTED) {
                return SampleSizeRounding.QUALITY;
            }
            return SampleSizeRounding.MEMORY;
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public final float getScaleFactor(int i, int i2, int i3, int i4) {
            if (DownsampleStrategy.IS_BITMAP_FACTORY_SCALING_SUPPORTED) {
                return Math.min(i3 / i, i4 / i2);
            }
            int max = Math.max(i2 / i4, i / i3);
            if (max == 0) {
                return 1.0f;
            }
            return 1.0f / Integer.highestOneBit(max);
        }
    }

    /* loaded from: classes.dex */
    public enum SampleSizeRounding {
        MEMORY,
        QUALITY
    }

    public abstract SampleSizeRounding getSampleSizeRounding(int i, int i2, int i3, int i4);

    public abstract float getScaleFactor(int i, int i2, int i3, int i4);

    static {
        CenterOutside centerOutside = new CenterOutside();
        CENTER_OUTSIDE = centerOutside;
        DEFAULT = centerOutside;
        OPTION = Option.memory("com.bumptech.glide.load.resource.bitmap.Downsampler.DownsampleStrategy", centerOutside);
    }

    /* loaded from: classes.dex */
    public static class CenterOutside extends DownsampleStrategy {
        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public final float getScaleFactor(int i, int i2, int i3, int i4) {
            return Math.max(i3 / i, i4 / i2);
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public final SampleSizeRounding getSampleSizeRounding(int i, int i2, int i3, int i4) {
            return SampleSizeRounding.QUALITY;
        }
    }

    /* loaded from: classes.dex */
    public static class None extends DownsampleStrategy {
        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public final float getScaleFactor(int i, int i2, int i3, int i4) {
            return 1.0f;
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public final SampleSizeRounding getSampleSizeRounding(int i, int i2, int i3, int i4) {
            return SampleSizeRounding.QUALITY;
        }
    }
}
