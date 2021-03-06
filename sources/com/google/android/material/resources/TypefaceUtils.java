package com.google.android.material.resources;

import android.content.res.Configuration;
import android.graphics.Typeface;
import androidx.core.math.MathUtils;
/* loaded from: classes.dex */
public final class TypefaceUtils {
    public static Typeface maybeCopyWithFontWeightAdjustment(Configuration configuration, Typeface typeface) {
        int i = configuration.fontWeightAdjustment;
        if (i == Integer.MAX_VALUE || i == 0) {
            return null;
        }
        return Typeface.create(typeface, MathUtils.clamp(typeface.getWeight() + configuration.fontWeightAdjustment, 1, 1000), typeface.isItalic());
    }
}
