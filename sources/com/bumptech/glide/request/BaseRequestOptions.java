package com.bumptech.glide.request;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import androidx.collection.ArrayMap;
import androidx.collection.ContainerHelpers;
import com.android.systemui.shared.system.QuickStepContract;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.Option;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.load.resource.bitmap.BitmapTransformation;
import com.bumptech.glide.load.resource.bitmap.CenterCrop;
import com.bumptech.glide.load.resource.bitmap.DownsampleStrategy;
import com.bumptech.glide.load.resource.bitmap.DrawableTransformation;
import com.bumptech.glide.load.resource.gif.GifDrawable;
import com.bumptech.glide.load.resource.gif.GifDrawableTransformation;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.signature.EmptySignature;
import com.bumptech.glide.signature.ObjectKey;
import com.bumptech.glide.util.CachedHashCodeArrayMap;
import com.bumptech.glide.util.Util;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class BaseRequestOptions<T extends BaseRequestOptions<T>> implements Cloneable {
    public int errorId;
    public Drawable errorPlaceholder;
    public Drawable fallbackDrawable;
    public int fallbackId;
    public int fields;
    public boolean isAutoCloneEnabled;
    public boolean isLocked;
    public boolean isTransformationRequired;
    public boolean onlyRetrieveFromCache;
    public Drawable placeholderDrawable;
    public int placeholderId;
    public Resources.Theme theme;
    public boolean useAnimationPool;
    public boolean useUnlimitedSourceGeneratorsPool;
    public float sizeMultiplier = 1.0f;
    public DiskCacheStrategy diskCacheStrategy = DiskCacheStrategy.AUTOMATIC;
    public Priority priority = Priority.NORMAL;
    public boolean isCacheable = true;
    public int overrideHeight = -1;
    public int overrideWidth = -1;
    public Key signature = EmptySignature.EMPTY_KEY;
    public boolean isTransformationAllowed = true;
    public Options options = new Options();
    public CachedHashCodeArrayMap transformations = new CachedHashCodeArrayMap();
    public Class<?> resourceClass = Object.class;
    public boolean isScaleOnlyOrNoTransform = true;

    public static boolean isSet(int i, int i2) {
        return (i & i2) != 0;
    }

    public final BaseRequestOptions transform(CenterCrop centerCrop) {
        DownsampleStrategy.CenterOutside centerOutside = DownsampleStrategy.CENTER_OUTSIDE;
        if (this.isAutoCloneEnabled) {
            return clone().transform(centerCrop);
        }
        set(DownsampleStrategy.OPTION, centerOutside);
        return transform(centerCrop, true);
    }

    /* renamed from: apply */
    public T mo32apply(BaseRequestOptions<?> baseRequestOptions) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().mo32apply(baseRequestOptions);
        }
        if (isSet(baseRequestOptions.fields, 2)) {
            this.sizeMultiplier = baseRequestOptions.sizeMultiplier;
        }
        if (isSet(baseRequestOptions.fields, QuickStepContract.SYSUI_STATE_IME_SHOWING)) {
            this.useUnlimitedSourceGeneratorsPool = baseRequestOptions.useUnlimitedSourceGeneratorsPool;
        }
        if (isSet(baseRequestOptions.fields, QuickStepContract.SYSUI_STATE_IME_SWITCHER_SHOWING)) {
            this.useAnimationPool = baseRequestOptions.useAnimationPool;
        }
        if (isSet(baseRequestOptions.fields, 4)) {
            this.diskCacheStrategy = baseRequestOptions.diskCacheStrategy;
        }
        if (isSet(baseRequestOptions.fields, 8)) {
            this.priority = baseRequestOptions.priority;
        }
        if (isSet(baseRequestOptions.fields, 16)) {
            this.errorPlaceholder = baseRequestOptions.errorPlaceholder;
            this.errorId = 0;
            this.fields &= -33;
        }
        if (isSet(baseRequestOptions.fields, 32)) {
            this.errorId = baseRequestOptions.errorId;
            this.errorPlaceholder = null;
            this.fields &= -17;
        }
        if (isSet(baseRequestOptions.fields, 64)) {
            this.placeholderDrawable = baseRequestOptions.placeholderDrawable;
            this.placeholderId = 0;
            this.fields &= -129;
        }
        if (isSet(baseRequestOptions.fields, 128)) {
            this.placeholderId = baseRequestOptions.placeholderId;
            this.placeholderDrawable = null;
            this.fields &= -65;
        }
        if (isSet(baseRequestOptions.fields, 256)) {
            this.isCacheable = baseRequestOptions.isCacheable;
        }
        if (isSet(baseRequestOptions.fields, QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED)) {
            this.overrideWidth = baseRequestOptions.overrideWidth;
            this.overrideHeight = baseRequestOptions.overrideHeight;
        }
        if (isSet(baseRequestOptions.fields, QuickStepContract.SYSUI_STATE_SEARCH_DISABLED)) {
            this.signature = baseRequestOptions.signature;
        }
        if (isSet(baseRequestOptions.fields, QuickStepContract.SYSUI_STATE_TRACING_ENABLED)) {
            this.resourceClass = baseRequestOptions.resourceClass;
        }
        if (isSet(baseRequestOptions.fields, QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED)) {
            this.fallbackDrawable = baseRequestOptions.fallbackDrawable;
            this.fallbackId = 0;
            this.fields &= -16385;
        }
        if (isSet(baseRequestOptions.fields, QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED)) {
            this.fallbackId = baseRequestOptions.fallbackId;
            this.fallbackDrawable = null;
            this.fields &= -8193;
        }
        if (isSet(baseRequestOptions.fields, QuickStepContract.SYSUI_STATE_DIALOG_SHOWING)) {
            this.theme = baseRequestOptions.theme;
        }
        if (isSet(baseRequestOptions.fields, QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE)) {
            this.isTransformationAllowed = baseRequestOptions.isTransformationAllowed;
        }
        if (isSet(baseRequestOptions.fields, QuickStepContract.SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY)) {
            this.isTransformationRequired = baseRequestOptions.isTransformationRequired;
        }
        if (isSet(baseRequestOptions.fields, QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED)) {
            this.transformations.putAll((Map) baseRequestOptions.transformations);
            this.isScaleOnlyOrNoTransform = baseRequestOptions.isScaleOnlyOrNoTransform;
        }
        if (isSet(baseRequestOptions.fields, QuickStepContract.SYSUI_STATE_MAGNIFICATION_OVERLAP)) {
            this.onlyRetrieveFromCache = baseRequestOptions.onlyRetrieveFromCache;
        }
        if (!this.isTransformationAllowed) {
            this.transformations.clear();
            this.isTransformationRequired = false;
            this.fields = this.fields & (-2049) & (-131073);
            this.isScaleOnlyOrNoTransform = true;
        }
        this.fields |= baseRequestOptions.fields;
        this.options.values.putAll((ArrayMap) baseRequestOptions.options.values);
        selfOrThrowIfLocked();
        return this;
    }

    public final void autoClone() {
        if (!this.isLocked || this.isAutoCloneEnabled) {
            this.isAutoCloneEnabled = true;
            this.isLocked = true;
            return;
        }
        throw new IllegalStateException("You cannot auto lock an already locked options object, try clone() first");
    }

    public T clone() {
        try {
            T t = (T) super.clone();
            Options options = new Options();
            t.options = options;
            options.values.putAll((ArrayMap) this.options.values);
            CachedHashCodeArrayMap cachedHashCodeArrayMap = new CachedHashCodeArrayMap();
            t.transformations = cachedHashCodeArrayMap;
            cachedHashCodeArrayMap.putAll((Map) this.transformations);
            t.isLocked = false;
            t.isAutoCloneEnabled = false;
            return t;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }

    public final T decode(Class<?> cls) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().decode(cls);
        }
        this.resourceClass = cls;
        this.fields |= QuickStepContract.SYSUI_STATE_TRACING_ENABLED;
        selfOrThrowIfLocked();
        return this;
    }

    public final T diskCacheStrategy(DiskCacheStrategy diskCacheStrategy) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().diskCacheStrategy(diskCacheStrategy);
        }
        this.diskCacheStrategy = diskCacheStrategy;
        this.fields |= 4;
        selfOrThrowIfLocked();
        return this;
    }

    public final T dontTransform() {
        if (this.isAutoCloneEnabled) {
            return (T) clone().dontTransform();
        }
        this.transformations.clear();
        this.isTransformationRequired = false;
        this.isTransformationAllowed = false;
        this.fields = (this.fields & (-2049) & (-131073)) | QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE;
        this.isScaleOnlyOrNoTransform = true;
        selfOrThrowIfLocked();
        return this;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof BaseRequestOptions) {
            BaseRequestOptions baseRequestOptions = (BaseRequestOptions) obj;
            if (Float.compare(baseRequestOptions.sizeMultiplier, this.sizeMultiplier) == 0 && this.errorId == baseRequestOptions.errorId && Util.bothNullOrEqual(this.errorPlaceholder, baseRequestOptions.errorPlaceholder) && this.placeholderId == baseRequestOptions.placeholderId && Util.bothNullOrEqual(this.placeholderDrawable, baseRequestOptions.placeholderDrawable) && this.fallbackId == baseRequestOptions.fallbackId && Util.bothNullOrEqual(this.fallbackDrawable, baseRequestOptions.fallbackDrawable) && this.isCacheable == baseRequestOptions.isCacheable && this.overrideHeight == baseRequestOptions.overrideHeight && this.overrideWidth == baseRequestOptions.overrideWidth && this.isTransformationRequired == baseRequestOptions.isTransformationRequired && this.isTransformationAllowed == baseRequestOptions.isTransformationAllowed && this.useUnlimitedSourceGeneratorsPool == baseRequestOptions.useUnlimitedSourceGeneratorsPool && this.onlyRetrieveFromCache == baseRequestOptions.onlyRetrieveFromCache && this.diskCacheStrategy.equals(baseRequestOptions.diskCacheStrategy) && this.priority == baseRequestOptions.priority && this.options.equals(baseRequestOptions.options) && this.transformations.equals(baseRequestOptions.transformations) && this.resourceClass.equals(baseRequestOptions.resourceClass) && Util.bothNullOrEqual(this.signature, baseRequestOptions.signature) && Util.bothNullOrEqual(this.theme, baseRequestOptions.theme)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        float f = this.sizeMultiplier;
        char[] cArr = Util.HEX_CHAR_ARRAY;
        return Util.hashCode(this.theme, Util.hashCode(this.signature, Util.hashCode(this.resourceClass, Util.hashCode(this.transformations, Util.hashCode(this.options, Util.hashCode(this.priority, Util.hashCode(this.diskCacheStrategy, (((((((((((((Util.hashCode(this.fallbackDrawable, (Util.hashCode(this.placeholderDrawable, (Util.hashCode(this.errorPlaceholder, ((Float.floatToIntBits(f) + 527) * 31) + this.errorId) * 31) + this.placeholderId) * 31) + this.fallbackId) * 31) + (this.isCacheable ? 1 : 0)) * 31) + this.overrideHeight) * 31) + this.overrideWidth) * 31) + (this.isTransformationRequired ? 1 : 0)) * 31) + (this.isTransformationAllowed ? 1 : 0)) * 31) + (this.useUnlimitedSourceGeneratorsPool ? 1 : 0)) * 31) + (this.onlyRetrieveFromCache ? 1 : 0))))))));
    }

    public final BaseRequestOptions optionalTransform(DownsampleStrategy downsampleStrategy, BitmapTransformation bitmapTransformation) {
        if (this.isAutoCloneEnabled) {
            return clone().optionalTransform(downsampleStrategy, bitmapTransformation);
        }
        set(DownsampleStrategy.OPTION, downsampleStrategy);
        return transform(bitmapTransformation, false);
    }

    public final T override(int i, int i2) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().override(i, i2);
        }
        this.overrideWidth = i;
        this.overrideHeight = i2;
        this.fields |= QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED;
        selfOrThrowIfLocked();
        return this;
    }

    public final BaseRequestOptions placeholder(ColorDrawable colorDrawable) {
        if (this.isAutoCloneEnabled) {
            return clone().placeholder(colorDrawable);
        }
        this.placeholderDrawable = colorDrawable;
        this.placeholderId = 0;
        this.fields = (this.fields | 64) & (-129);
        selfOrThrowIfLocked();
        return this;
    }

    public final BaseRequestOptions priority() {
        Priority priority = Priority.LOW;
        if (this.isAutoCloneEnabled) {
            return clone().priority();
        }
        this.priority = priority;
        this.fields |= 8;
        selfOrThrowIfLocked();
        return this;
    }

    public final void selfOrThrowIfLocked() {
        if (this.isLocked) {
            throw new IllegalStateException("You cannot modify locked T, consider clone()");
        }
    }

    public final <Y> T set(Option<Y> option, Y y) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().set(option, y);
        }
        ContainerHelpers.checkNotNull(option);
        ContainerHelpers.checkNotNull(y);
        this.options.values.put(option, y);
        selfOrThrowIfLocked();
        return this;
    }

    public final BaseRequestOptions signature(ObjectKey objectKey) {
        if (this.isAutoCloneEnabled) {
            return clone().signature(objectKey);
        }
        this.signature = objectKey;
        this.fields |= QuickStepContract.SYSUI_STATE_SEARCH_DISABLED;
        selfOrThrowIfLocked();
        return this;
    }

    public final T skipMemoryCache(boolean z) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().skipMemoryCache(true);
        }
        this.isCacheable = !z;
        this.fields |= 256;
        selfOrThrowIfLocked();
        return this;
    }

    public final BaseRequestOptions useAnimationPool() {
        if (this.isAutoCloneEnabled) {
            return clone().useAnimationPool();
        }
        this.useAnimationPool = true;
        this.fields |= QuickStepContract.SYSUI_STATE_IME_SWITCHER_SHOWING;
        selfOrThrowIfLocked();
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final T transform(Transformation<Bitmap> transformation, boolean z) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().transform(transformation, z);
        }
        DrawableTransformation drawableTransformation = new DrawableTransformation(transformation, z);
        transform(Bitmap.class, transformation, z);
        transform(Drawable.class, drawableTransformation, z);
        transform(BitmapDrawable.class, drawableTransformation, z);
        transform(GifDrawable.class, new GifDrawableTransformation(transformation), z);
        selfOrThrowIfLocked();
        return this;
    }

    public final <Y> T transform(Class<Y> cls, Transformation<Y> transformation, boolean z) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().transform(cls, transformation, z);
        }
        ContainerHelpers.checkNotNull(transformation);
        this.transformations.put(cls, transformation);
        int i = this.fields | QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED;
        this.isTransformationAllowed = true;
        int i2 = i | QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE;
        this.fields = i2;
        this.isScaleOnlyOrNoTransform = false;
        if (z) {
            this.fields = i2 | QuickStepContract.SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY;
            this.isTransformationRequired = true;
        }
        selfOrThrowIfLocked();
        return this;
    }
}
