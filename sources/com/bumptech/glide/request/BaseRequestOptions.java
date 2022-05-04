package com.bumptech.glide.request;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.android.systemui.shared.system.QuickStepContract;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.Option;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.load.resource.bitmap.DownsampleStrategy;
import com.bumptech.glide.load.resource.bitmap.DrawableTransformation;
import com.bumptech.glide.load.resource.gif.GifDrawable;
import com.bumptech.glide.load.resource.gif.GifDrawableTransformation;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.signature.EmptySignature;
import com.bumptech.glide.util.CachedHashCodeArrayMap;
import com.bumptech.glide.util.Util;
import java.util.Map;
import java.util.Objects;
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
    public Map<Class<?>, Transformation<?>> transformations = new CachedHashCodeArrayMap();
    public Class<?> resourceClass = Object.class;
    public boolean isScaleOnlyOrNoTransform = true;

    public static boolean isSet(int fields, int flag) {
        return (fields & flag) != 0;
    }

    public T apply(BaseRequestOptions<?> o) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().apply(o);
        }
        if (isSet(o.fields, 2)) {
            this.sizeMultiplier = o.sizeMultiplier;
        }
        if (isSet(o.fields, QuickStepContract.SYSUI_STATE_IME_SHOWING)) {
            this.useUnlimitedSourceGeneratorsPool = o.useUnlimitedSourceGeneratorsPool;
        }
        if (isSet(o.fields, QuickStepContract.SYSUI_STATE_IME_SWITCHER_SHOWING)) {
            this.useAnimationPool = o.useAnimationPool;
        }
        if (isSet(o.fields, 4)) {
            this.diskCacheStrategy = o.diskCacheStrategy;
        }
        if (isSet(o.fields, 8)) {
            this.priority = o.priority;
        }
        if (isSet(o.fields, 16)) {
            this.errorPlaceholder = o.errorPlaceholder;
            this.errorId = 0;
            this.fields &= -33;
        }
        if (isSet(o.fields, 32)) {
            this.errorId = o.errorId;
            this.errorPlaceholder = null;
            this.fields &= -17;
        }
        if (isSet(o.fields, 64)) {
            this.placeholderDrawable = o.placeholderDrawable;
            this.placeholderId = 0;
            this.fields &= -129;
        }
        if (isSet(o.fields, 128)) {
            this.placeholderId = o.placeholderId;
            this.placeholderDrawable = null;
            this.fields &= -65;
        }
        if (isSet(o.fields, 256)) {
            this.isCacheable = o.isCacheable;
        }
        if (isSet(o.fields, QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED)) {
            this.overrideWidth = o.overrideWidth;
            this.overrideHeight = o.overrideHeight;
        }
        if (isSet(o.fields, QuickStepContract.SYSUI_STATE_SEARCH_DISABLED)) {
            this.signature = o.signature;
        }
        if (isSet(o.fields, QuickStepContract.SYSUI_STATE_TRACING_ENABLED)) {
            this.resourceClass = o.resourceClass;
        }
        if (isSet(o.fields, QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED)) {
            this.fallbackDrawable = o.fallbackDrawable;
            this.fallbackId = 0;
            this.fields &= -16385;
        }
        if (isSet(o.fields, QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED)) {
            this.fallbackId = o.fallbackId;
            this.fallbackDrawable = null;
            this.fields &= -8193;
        }
        if (isSet(o.fields, QuickStepContract.SYSUI_STATE_GLOBAL_ACTIONS_SHOWING)) {
            this.theme = o.theme;
        }
        if (isSet(o.fields, QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE)) {
            this.isTransformationAllowed = o.isTransformationAllowed;
        }
        if (isSet(o.fields, QuickStepContract.SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY)) {
            this.isTransformationRequired = o.isTransformationRequired;
        }
        if (isSet(o.fields, QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED)) {
            this.transformations.putAll(o.transformations);
            this.isScaleOnlyOrNoTransform = o.isScaleOnlyOrNoTransform;
        }
        if (isSet(o.fields, QuickStepContract.SYSUI_STATE_MAGNIFICATION_OVERLAP)) {
            this.onlyRetrieveFromCache = o.onlyRetrieveFromCache;
        }
        if (!this.isTransformationAllowed) {
            this.transformations.clear();
            int i = this.fields & (-2049);
            this.fields = i;
            this.isTransformationRequired = false;
            this.fields = i & (-131073);
            this.isScaleOnlyOrNoTransform = true;
        }
        this.fields |= o.fields;
        this.options.putAll(o.options);
        selfOrThrowIfLocked();
        return this;
    }

    public T autoClone() {
        if (!this.isLocked || this.isAutoCloneEnabled) {
            this.isAutoCloneEnabled = true;
            this.isLocked = true;
            return this;
        }
        throw new IllegalStateException("You cannot auto lock an already locked options object, try clone() first");
    }

    public T decode(Class<?> resourceClass) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().decode(resourceClass);
        }
        Objects.requireNonNull(resourceClass, "Argument must not be null");
        this.resourceClass = resourceClass;
        this.fields |= QuickStepContract.SYSUI_STATE_TRACING_ENABLED;
        selfOrThrowIfLocked();
        return this;
    }

    public T diskCacheStrategy(DiskCacheStrategy strategy) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().diskCacheStrategy(strategy);
        }
        Objects.requireNonNull(strategy, "Argument must not be null");
        this.diskCacheStrategy = strategy;
        this.fields |= 4;
        selfOrThrowIfLocked();
        return this;
    }

    public T dontTransform() {
        if (this.isAutoCloneEnabled) {
            return (T) clone().dontTransform();
        }
        this.transformations.clear();
        int i = this.fields & (-2049);
        this.fields = i;
        this.isTransformationRequired = false;
        int i2 = i & (-131073);
        this.fields = i2;
        this.isTransformationAllowed = false;
        this.fields = i2 | QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE;
        this.isScaleOnlyOrNoTransform = true;
        selfOrThrowIfLocked();
        return this;
    }

    public boolean equals(Object o) {
        if (!(o instanceof BaseRequestOptions)) {
            return false;
        }
        BaseRequestOptions baseRequestOptions = (BaseRequestOptions) o;
        return Float.compare(baseRequestOptions.sizeMultiplier, this.sizeMultiplier) == 0 && this.errorId == baseRequestOptions.errorId && Util.bothNullOrEqual(this.errorPlaceholder, baseRequestOptions.errorPlaceholder) && this.placeholderId == baseRequestOptions.placeholderId && Util.bothNullOrEqual(this.placeholderDrawable, baseRequestOptions.placeholderDrawable) && this.fallbackId == baseRequestOptions.fallbackId && Util.bothNullOrEqual(this.fallbackDrawable, baseRequestOptions.fallbackDrawable) && this.isCacheable == baseRequestOptions.isCacheable && this.overrideHeight == baseRequestOptions.overrideHeight && this.overrideWidth == baseRequestOptions.overrideWidth && this.isTransformationRequired == baseRequestOptions.isTransformationRequired && this.isTransformationAllowed == baseRequestOptions.isTransformationAllowed && this.useUnlimitedSourceGeneratorsPool == baseRequestOptions.useUnlimitedSourceGeneratorsPool && this.onlyRetrieveFromCache == baseRequestOptions.onlyRetrieveFromCache && this.diskCacheStrategy.equals(baseRequestOptions.diskCacheStrategy) && this.priority == baseRequestOptions.priority && this.options.equals(baseRequestOptions.options) && this.transformations.equals(baseRequestOptions.transformations) && this.resourceClass.equals(baseRequestOptions.resourceClass) && Util.bothNullOrEqual(this.signature, baseRequestOptions.signature) && Util.bothNullOrEqual(this.theme, baseRequestOptions.theme);
    }

    public int hashCode() {
        float f = this.sizeMultiplier;
        char[] cArr = Util.HEX_CHAR_ARRAY;
        return Util.hashCode(this.theme, Util.hashCode(this.signature, Util.hashCode(this.resourceClass, Util.hashCode(this.transformations, Util.hashCode(this.options, Util.hashCode(this.priority, Util.hashCode(this.diskCacheStrategy, (((((((((((((Util.hashCode(this.fallbackDrawable, (Util.hashCode(this.placeholderDrawable, (Util.hashCode(this.errorPlaceholder, ((Float.floatToIntBits(f) + 527) * 31) + this.errorId) * 31) + this.placeholderId) * 31) + this.fallbackId) * 31) + (this.isCacheable ? 1 : 0)) * 31) + this.overrideHeight) * 31) + this.overrideWidth) * 31) + (this.isTransformationRequired ? 1 : 0)) * 31) + (this.isTransformationAllowed ? 1 : 0)) * 31) + (this.useUnlimitedSourceGeneratorsPool ? 1 : 0)) * 31) + (this.onlyRetrieveFromCache ? 1 : 0))))))));
    }

    public final T optionalTransform(DownsampleStrategy downsampleStrategy, Transformation<Bitmap> transformation) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().optionalTransform(downsampleStrategy, transformation);
        }
        Option option = DownsampleStrategy.OPTION;
        Objects.requireNonNull(downsampleStrategy, "Argument must not be null");
        set(option, downsampleStrategy);
        return transform(transformation, false);
    }

    public T override(int width, int height) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().override(width, height);
        }
        this.overrideWidth = width;
        this.overrideHeight = height;
        this.fields |= QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED;
        selfOrThrowIfLocked();
        return this;
    }

    public T placeholder(Drawable drawable) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().placeholder(drawable);
        }
        this.placeholderDrawable = drawable;
        int i = this.fields | 64;
        this.fields = i;
        this.placeholderId = 0;
        this.fields = i & (-129);
        selfOrThrowIfLocked();
        return this;
    }

    public T priority(Priority priority) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().priority(priority);
        }
        Objects.requireNonNull(priority, "Argument must not be null");
        this.priority = priority;
        this.fields |= 8;
        selfOrThrowIfLocked();
        return this;
    }

    public final T selfOrThrowIfLocked() {
        if (!this.isLocked) {
            return this;
        }
        throw new IllegalStateException("You cannot modify locked T, consider clone()");
    }

    public <Y> T set(Option<Y> option, Y value) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().set(option, value);
        }
        Objects.requireNonNull(option, "Argument must not be null");
        Objects.requireNonNull(value, "Argument must not be null");
        this.options.values.put(option, value);
        selfOrThrowIfLocked();
        return this;
    }

    public T signature(Key signature) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().signature(signature);
        }
        Objects.requireNonNull(signature, "Argument must not be null");
        this.signature = signature;
        this.fields |= QuickStepContract.SYSUI_STATE_SEARCH_DISABLED;
        selfOrThrowIfLocked();
        return this;
    }

    public T skipMemoryCache(boolean skip) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().skipMemoryCache(true);
        }
        this.isCacheable = !skip;
        this.fields |= 256;
        selfOrThrowIfLocked();
        return this;
    }

    public final T transform(DownsampleStrategy downsampleStrategy, Transformation<Bitmap> transformation) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().transform(downsampleStrategy, transformation);
        }
        Option option = DownsampleStrategy.OPTION;
        Objects.requireNonNull(downsampleStrategy, "Argument must not be null");
        set(option, downsampleStrategy);
        return transform(transformation, true);
    }

    public T useAnimationPool(boolean flag) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().useAnimationPool(flag);
        }
        this.useAnimationPool = flag;
        this.fields |= QuickStepContract.SYSUI_STATE_IME_SWITCHER_SHOWING;
        selfOrThrowIfLocked();
        return this;
    }

    public T clone() {
        try {
            T t = (T) super.clone();
            Options options = new Options();
            t.options = options;
            options.putAll(this.options);
            CachedHashCodeArrayMap cachedHashCodeArrayMap = new CachedHashCodeArrayMap();
            t.transformations = cachedHashCodeArrayMap;
            cachedHashCodeArrayMap.putAll(this.transformations);
            t.isLocked = false;
            t.isAutoCloneEnabled = false;
            return t;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T transform(Transformation<Bitmap> transformation, boolean isRequired) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().transform(transformation, isRequired);
        }
        DrawableTransformation drawableTransformation = new DrawableTransformation(transformation, isRequired);
        transform(Bitmap.class, transformation, isRequired);
        transform(Drawable.class, drawableTransformation, isRequired);
        transform(BitmapDrawable.class, drawableTransformation, isRequired);
        transform(GifDrawable.class, new GifDrawableTransformation(transformation), isRequired);
        selfOrThrowIfLocked();
        return this;
    }

    public <Y> T transform(Class<Y> resourceClass, Transformation<Y> transformation, boolean isRequired) {
        if (this.isAutoCloneEnabled) {
            return (T) clone().transform(resourceClass, transformation, isRequired);
        }
        Objects.requireNonNull(resourceClass, "Argument must not be null");
        Objects.requireNonNull(transformation, "Argument must not be null");
        this.transformations.put(resourceClass, transformation);
        int i = this.fields | QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED;
        this.fields = i;
        this.isTransformationAllowed = true;
        int i2 = i | QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE;
        this.fields = i2;
        this.isScaleOnlyOrNoTransform = false;
        if (isRequired) {
            this.fields = i2 | QuickStepContract.SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY;
            this.isTransformationRequired = true;
        }
        selfOrThrowIfLocked();
        return this;
    }
}
