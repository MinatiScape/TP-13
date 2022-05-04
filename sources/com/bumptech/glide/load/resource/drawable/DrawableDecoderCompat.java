package com.bumptech.glide.load.resource.drawable;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import androidx.appcompat.content.res.AppCompatResources;
import androidx.appcompat.view.ContextThemeWrapper;
import androidx.core.content.ContextCompat;
import androidx.core.content.res.ResourcesCompat;
/* loaded from: classes.dex */
public final class DrawableDecoderCompat {
    public static volatile boolean shouldCallAppCompatResources = true;

    public static Drawable getDrawable(Context context, Context context2, int i, Resources.Theme theme) {
        Context context3;
        try {
            if (shouldCallAppCompatResources) {
                if (theme != null) {
                    context3 = new ContextThemeWrapper(context2, theme);
                } else {
                    context3 = context2;
                }
                return AppCompatResources.getDrawable(context3, i);
            }
        } catch (Resources.NotFoundException unused) {
        } catch (IllegalStateException e) {
            if (!context.getPackageName().equals(context2.getPackageName())) {
                Object obj = ContextCompat.sLock;
                return context2.getDrawable(i);
            }
            throw e;
        } catch (NoClassDefFoundError unused2) {
            shouldCallAppCompatResources = false;
        }
        if (theme == null) {
            theme = context2.getTheme();
        }
        Resources resources = context2.getResources();
        ThreadLocal<TypedValue> threadLocal = ResourcesCompat.sTempTypedValue;
        return resources.getDrawable(i, theme);
    }
}
