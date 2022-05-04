package androidx.core.graphics.drawable;

import android.graphics.drawable.Drawable;
/* loaded from: classes.dex */
public final class DrawableCompat {
    /* JADX WARN: Multi-variable type inference failed */
    public static <T extends Drawable> T unwrap(Drawable drawable) {
        return drawable instanceof WrappedDrawable ? (T) ((WrappedDrawable) drawable).getWrappedDrawable() : drawable;
    }
}
