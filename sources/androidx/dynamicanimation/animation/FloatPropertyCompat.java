package androidx.dynamicanimation.animation;

import android.util.FloatProperty;
/* loaded from: classes.dex */
public abstract class FloatPropertyCompat<T> {
    public final String mPropertyName;

    public abstract float getValue(T t);

    public abstract void setValue(T t, float f);

    public static <T> FloatPropertyCompat<T> createFloatPropertyCompat(final FloatProperty<T> floatProperty) {
        return new FloatPropertyCompat<T>(floatProperty.getName()) { // from class: androidx.dynamicanimation.animation.FloatPropertyCompat.1
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final float getValue(T t) {
                return ((Float) floatProperty.get(t)).floatValue();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final void setValue(T t, float f) {
                floatProperty.setValue(t, f);
            }
        };
    }

    public FloatPropertyCompat(String str) {
        this.mPropertyName = str;
    }
}
