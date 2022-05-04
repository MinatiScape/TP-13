package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.util.TypedValue;
import androidx.appcompat.widget.AppCompatDrawableManager;
import androidx.collection.ContainerHelpers;
import androidx.collection.LongSparseArray;
import androidx.collection.LruCache;
import androidx.collection.SparseArrayCompat;
import com.android.systemui.shared.R;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class ResourceManagerInternal {
    public static ResourceManagerInternal INSTANCE;
    public final WeakHashMap<Context, LongSparseArray<WeakReference<Drawable.ConstantState>>> mDrawableCaches = new WeakHashMap<>(0);
    public boolean mHasCheckedVectorDrawableSetup;
    public ResourceManagerHooks mHooks;
    public WeakHashMap<Context, SparseArrayCompat<ColorStateList>> mTintLists;
    public TypedValue mTypedValue;
    public static final PorterDuff.Mode DEFAULT_MODE = PorterDuff.Mode.SRC_IN;
    public static final ColorFilterLruCache COLOR_FILTER_CACHE = new ColorFilterLruCache();

    /* loaded from: classes.dex */
    public static class ColorFilterLruCache extends LruCache<Integer, PorterDuffColorFilter> {
        public ColorFilterLruCache() {
            super(6);
        }
    }

    /* loaded from: classes.dex */
    public interface ResourceManagerHooks {
    }

    public final synchronized void addDrawableToCache(Context context, long j, Drawable drawable) {
        Drawable.ConstantState constantState = drawable.getConstantState();
        if (constantState != null) {
            LongSparseArray<WeakReference<Drawable.ConstantState>> longSparseArray = this.mDrawableCaches.get(context);
            if (longSparseArray == null) {
                longSparseArray = new LongSparseArray<>();
                this.mDrawableCaches.put(context, longSparseArray);
            }
            longSparseArray.put(j, new WeakReference<>(constantState));
        }
    }

    public final synchronized Drawable getCachedDrawable(Context context, long j) {
        LongSparseArray<WeakReference<Drawable.ConstantState>> longSparseArray = this.mDrawableCaches.get(context);
        if (longSparseArray == null) {
            return null;
        }
        WeakReference weakReference = (WeakReference) longSparseArray.get(j, null);
        if (weakReference != null) {
            Drawable.ConstantState constantState = (Drawable.ConstantState) weakReference.get();
            if (constantState != null) {
                return constantState.newDrawable(context.getResources());
            }
            int binarySearch = ContainerHelpers.binarySearch(longSparseArray.mKeys, longSparseArray.mSize, j);
            if (binarySearch >= 0) {
                Object[] objArr = longSparseArray.mValues;
                Object obj = objArr[binarySearch];
                Object obj2 = LongSparseArray.DELETED;
                if (obj != obj2) {
                    objArr[binarySearch] = obj2;
                    longSparseArray.mGarbage = true;
                }
            }
        }
        return null;
    }

    public final synchronized Drawable getDrawable(Context context, int i) {
        return getDrawable(context, i, false);
    }

    public final synchronized ColorStateList getTintList(Context context, int i) {
        ColorStateList colorStateList;
        SparseArrayCompat<ColorStateList> sparseArrayCompat;
        try {
            WeakHashMap<Context, SparseArrayCompat<ColorStateList>> weakHashMap = this.mTintLists;
            ColorStateList colorStateList2 = null;
            if (weakHashMap == null || (sparseArrayCompat = weakHashMap.get(context)) == null) {
                colorStateList = null;
            } else {
                colorStateList = (ColorStateList) sparseArrayCompat.get(i, null);
            }
            if (colorStateList == null) {
                ResourceManagerHooks resourceManagerHooks = this.mHooks;
                if (resourceManagerHooks != null) {
                    colorStateList2 = ((AppCompatDrawableManager.AnonymousClass1) resourceManagerHooks).getTintListForDrawableRes(context, i);
                }
                if (colorStateList2 != null) {
                    if (this.mTintLists == null) {
                        this.mTintLists = new WeakHashMap<>();
                    }
                    SparseArrayCompat<ColorStateList> sparseArrayCompat2 = this.mTintLists.get(context);
                    if (sparseArrayCompat2 == null) {
                        sparseArrayCompat2 = new SparseArrayCompat<>();
                        this.mTintLists.put(context, sparseArrayCompat2);
                    }
                    sparseArrayCompat2.append(i, colorStateList2);
                }
                colorStateList = colorStateList2;
            }
        } catch (Throwable th) {
            throw th;
        }
        return colorStateList;
    }

    public static synchronized ResourceManagerInternal get() {
        ResourceManagerInternal resourceManagerInternal;
        synchronized (ResourceManagerInternal.class) {
            if (INSTANCE == null) {
                INSTANCE = new ResourceManagerInternal();
            }
            resourceManagerInternal = INSTANCE;
        }
        return resourceManagerInternal;
    }

    public static synchronized PorterDuffColorFilter getPorterDuffColorFilter(int i, PorterDuff.Mode mode) {
        PorterDuffColorFilter porterDuffColorFilter;
        synchronized (ResourceManagerInternal.class) {
            ColorFilterLruCache colorFilterLruCache = COLOR_FILTER_CACHE;
            colorFilterLruCache.getClass();
            int i2 = (i + 31) * 31;
            porterDuffColorFilter = colorFilterLruCache.get(Integer.valueOf(mode.hashCode() + i2));
            if (porterDuffColorFilter == null) {
                porterDuffColorFilter = new PorterDuffColorFilter(i, mode);
                colorFilterLruCache.getClass();
                colorFilterLruCache.put(Integer.valueOf(mode.hashCode() + i2), porterDuffColorFilter);
            }
        }
        return porterDuffColorFilter;
    }

    public final Drawable createDrawableIfNeeded(Context context, int i) {
        if (this.mTypedValue == null) {
            this.mTypedValue = new TypedValue();
        }
        TypedValue typedValue = this.mTypedValue;
        context.getResources().getValue(i, typedValue, true);
        long j = (typedValue.assetCookie << 32) | typedValue.data;
        Drawable cachedDrawable = getCachedDrawable(context, j);
        if (cachedDrawable != null) {
            return cachedDrawable;
        }
        LayerDrawable layerDrawable = null;
        if (this.mHooks != null) {
            if (i == R.drawable.abc_cab_background_top_material) {
                layerDrawable = new LayerDrawable(new Drawable[]{getDrawable(context, R.drawable.abc_cab_background_internal_bg), getDrawable(context, R.drawable.abc_cab_background_top_mtrl_alpha)});
            } else if (i == R.drawable.abc_ratingbar_material) {
                layerDrawable = AppCompatDrawableManager.AnonymousClass1.getRatingBarLayerDrawable(this, context, R.dimen.abc_star_big);
            } else if (i == R.drawable.abc_ratingbar_indicator_material) {
                layerDrawable = AppCompatDrawableManager.AnonymousClass1.getRatingBarLayerDrawable(this, context, R.dimen.abc_star_medium);
            } else if (i == R.drawable.abc_ratingbar_small_material) {
                layerDrawable = AppCompatDrawableManager.AnonymousClass1.getRatingBarLayerDrawable(this, context, R.dimen.abc_star_small);
            }
        }
        if (layerDrawable != null) {
            layerDrawable.setChangingConfigurations(typedValue.changingConfigurations);
            addDrawableToCache(context, j, layerDrawable);
        }
        return layerDrawable;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x002b, code lost:
        if (r0 == false) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x005d, code lost:
        r0.setTintMode(r4);
     */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00db  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final synchronized android.graphics.drawable.Drawable getDrawable(android.content.Context r12, int r13, boolean r14) {
        /*
            Method dump skipped, instructions count: 247
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.appcompat.widget.ResourceManagerInternal.getDrawable(android.content.Context, int, boolean):android.graphics.drawable.Drawable");
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:33:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean tintDrawableUsingColorFilter(android.content.Context r7, int r8, android.graphics.drawable.Drawable r9) {
        /*
            r6 = this;
            androidx.appcompat.widget.ResourceManagerInternal$ResourceManagerHooks r6 = r6.mHooks
            r0 = 1
            r1 = 0
            if (r6 == 0) goto L6f
            androidx.appcompat.widget.AppCompatDrawableManager$1 r6 = (androidx.appcompat.widget.AppCompatDrawableManager.AnonymousClass1) r6
            android.graphics.PorterDuff$Mode r2 = androidx.appcompat.widget.AppCompatDrawableManager.DEFAULT_MODE
            int[] r3 = r6.COLORFILTER_TINT_COLOR_CONTROL_NORMAL
            boolean r3 = androidx.appcompat.widget.AppCompatDrawableManager.AnonymousClass1.arrayContains(r3, r8)
            r4 = 16842801(0x1010031, float:2.3693695E-38)
            r5 = -1
            if (r3 == 0) goto L1a
            r4 = 2130968790(0x7f0400d6, float:1.7546244E38)
            goto L46
        L1a:
            int[] r3 = r6.COLORFILTER_COLOR_CONTROL_ACTIVATED
            boolean r3 = androidx.appcompat.widget.AppCompatDrawableManager.AnonymousClass1.arrayContains(r3, r8)
            if (r3 == 0) goto L26
            r4 = 2130968788(0x7f0400d4, float:1.754624E38)
            goto L46
        L26:
            int[] r6 = r6.COLORFILTER_COLOR_BACKGROUND_MULTIPLY
            boolean r6 = androidx.appcompat.widget.AppCompatDrawableManager.AnonymousClass1.arrayContains(r6, r8)
            if (r6 == 0) goto L31
            android.graphics.PorterDuff$Mode r2 = android.graphics.PorterDuff.Mode.MULTIPLY
            goto L46
        L31:
            r6 = 2131231018(0x7f08012a, float:1.8078105E38)
            if (r8 != r6) goto L41
            r6 = 16842800(0x1010030, float:2.3693693E-38)
            r8 = 1109603123(0x42233333, float:40.8)
            int r8 = java.lang.Math.round(r8)
            goto L48
        L41:
            r6 = 2131230997(0x7f080115, float:1.8078063E38)
            if (r8 != r6) goto L4a
        L46:
            r6 = r4
            r8 = r5
        L48:
            r3 = r0
            goto L4d
        L4a:
            r6 = r1
            r3 = r6
            r8 = r5
        L4d:
            if (r3 == 0) goto L6b
            boolean r3 = androidx.appcompat.widget.DrawableUtils.canSafelyMutateDrawable(r9)
            if (r3 == 0) goto L59
            android.graphics.drawable.Drawable r9 = r9.mutate()
        L59:
            int r6 = androidx.appcompat.widget.ThemeUtils.getThemeAttrColor(r7, r6)
            android.graphics.PorterDuffColorFilter r6 = androidx.appcompat.widget.AppCompatDrawableManager.getPorterDuffColorFilter(r6, r2)
            r9.setColorFilter(r6)
            if (r8 == r5) goto L69
            r9.setAlpha(r8)
        L69:
            r6 = r0
            goto L6c
        L6b:
            r6 = r1
        L6c:
            if (r6 == 0) goto L6f
            goto L70
        L6f:
            r0 = r1
        L70:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.appcompat.widget.ResourceManagerInternal.tintDrawableUsingColorFilter(android.content.Context, int, android.graphics.drawable.Drawable):boolean");
    }
}
