package androidx.core.content.res;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.TypedValue;
/* loaded from: classes.dex */
public class TypedArrayUtils {
    public static int getAttr(Context context, int attr, int fallbackAttr) {
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(attr, typedValue, true);
        return typedValue.resourceId != 0 ? attr : fallbackAttr;
    }

    public static boolean getBoolean(TypedArray a, int index, int fallbackIndex, boolean defaultValue) {
        return a.getBoolean(index, a.getBoolean(fallbackIndex, defaultValue));
    }

    public static int getResourceId(TypedArray a, int index, int fallbackIndex, int defaultValue) {
        return a.getResourceId(index, a.getResourceId(fallbackIndex, defaultValue));
    }

    public static String getString(TypedArray a, int index, int fallbackIndex) {
        String string = a.getString(index);
        return string == null ? a.getString(fallbackIndex) : string;
    }

    public static CharSequence[] getTextArray(TypedArray a, int index, int fallbackIndex) {
        CharSequence[] textArray = a.getTextArray(index);
        return textArray == null ? a.getTextArray(fallbackIndex) : textArray;
    }
}
