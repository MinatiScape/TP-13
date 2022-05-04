package com.bumptech.glide.load.resource.bitmap;

import com.bumptech.glide.load.Option;
/* loaded from: classes.dex */
public abstract class DownsampleStrategy {
    public static final DownsampleStrategy CENTER_OUTSIDE;
    public static final DownsampleStrategy DEFAULT;
    public static final Option<DownsampleStrategy> OPTION;
    public static final DownsampleStrategy FIT_CENTER = new FitCenter();
    public static final DownsampleStrategy CENTER_INSIDE = new CenterInside();
    public static final DownsampleStrategy NONE = new None();

    /* loaded from: classes.dex */
    public static class CenterInside extends DownsampleStrategy {
        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public int getSampleSizeRounding$enumunboxing$(int sourceWidth, int sourceHeight, int requestedWidth, int requestedHeight) {
            return 2;
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public float getScaleFactor(int sourceWidth, int sourceHeight, int requestedWidth, int requestedHeight) {
            return Math.min(1.0f, DownsampleStrategy.FIT_CENTER.getScaleFactor(sourceWidth, sourceHeight, requestedWidth, requestedHeight));
        }
    }

    /* loaded from: classes.dex */
    public static class CenterOutside extends DownsampleStrategy {
        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public int getSampleSizeRounding$enumunboxing$(int sourceWidth, int sourceHeight, int requestedWidth, int requestedHeight) {
            return 2;
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public float getScaleFactor(int sourceWidth, int sourceHeight, int requestedWidth, int requestedHeight) {
            return Math.max(requestedWidth / sourceWidth, requestedHeight / sourceHeight);
        }
    }

    /* loaded from: classes.dex */
    public static class FitCenter extends DownsampleStrategy {
        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public int getSampleSizeRounding$enumunboxing$(int sourceWidth, int sourceHeight, int requestedWidth, int requestedHeight) {
            return 2;
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public float getScaleFactor(int sourceWidth, int sourceHeight, int requestedWidth, int requestedHeight) {
            return Math.min(requestedWidth / sourceWidth, requestedHeight / sourceHeight);
        }
    }

    /* loaded from: classes.dex */
    public static class None extends DownsampleStrategy {
        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public int getSampleSizeRounding$enumunboxing$(int sourceWidth, int sourceHeight, int requestedWidth, int requestedHeight) {
            return 2;
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
        public float getScaleFactor(int sourceWidth, int sourceHeight, int requestedWidth, int requestedHeight) {
            return 1.0f;
        }
    }

    static {
        CenterOutside centerOutside = new CenterOutside();
        CENTER_OUTSIDE = centerOutside;
        DEFAULT = centerOutside;
        OPTION = Option.memory("com.bumptech.glide.load.resource.bitmap.Downsampler.DownsampleStrategy", centerOutside);
    }

    public abstract int getSampleSizeRounding$enumunboxing$(int sourceWidth, int sourceHeight, int requestedWidth, int requestedHeight);

    public abstract float getScaleFactor(int sourceWidth, int sourceHeight, int requestedWidth, int requestedHeight);
}
