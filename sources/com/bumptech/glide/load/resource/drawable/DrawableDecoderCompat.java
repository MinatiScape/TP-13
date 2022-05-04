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

    public static Drawable getDrawable(Context ourContext, Context targetContext, int id, Resources.Theme theme) {
        try {
            if (shouldCallAppCompatResources) {
                return AppCompatResources.getDrawable(theme != null ? new ContextThemeWrapper(targetContext, theme) : targetContext, id);
            }
        } catch (Resources.NotFoundException unused) {
        } catch (IllegalStateException e) {
            if (!ourContext.getPackageName().equals(targetContext.getPackageName())) {
                Object obj = ContextCompat.sLock;
                return targetContext.getDrawable(id);
            }
            throw e;
        } catch (NoClassDefFoundError unused2) {
            shouldCallAppCompatResources = false;
        }
        if (theme == null) {
            theme = targetContext.getTheme();
        }
        Resources resources = targetContext.getResources();
        ThreadLocal<TypedValue> threadLocal = ResourcesCompat.sTempTypedValue;
        return resources.getDrawable(id, theme);
    }
}
