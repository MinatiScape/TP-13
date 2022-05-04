package androidx.core.content.res;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.TypedValue;
/* loaded from: classes.dex */
public final class TypedArrayUtils {
    public static int getAttr(Context context, int i, int i2) {
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(i, typedValue, true);
        if (typedValue.resourceId != 0) {
            return i;
        }
        return i2;
    }

    public static String getString(TypedArray typedArray, int i, int i2) {
        String string = typedArray.getString(i);
        if (string == null) {
            return typedArray.getString(i2);
        }
        return string;
    }
}
