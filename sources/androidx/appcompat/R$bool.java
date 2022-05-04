package androidx.appcompat;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.text.TextUtils;
import android.view.View;
import androidx.core.graphics.ColorUtils;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.WallpaperCategory;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.DataCacheWriter;
import com.bumptech.glide.load.engine.cache.DiskCache;
import com.google.android.material.resources.MaterialAttributes;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public class R$bool implements DiskCache {
    /* JADX WARN: Finally extract failed */
    public static int getColorAttr(Context context, int i) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(new int[]{i});
        try {
            ColorStateList colorStateList = obtainStyledAttributes.getColorStateList(0);
            obtainStyledAttributes.recycle();
            return colorStateList.getDefaultColor();
        } catch (Throwable th) {
            obtainStyledAttributes.recycle();
            throw th;
        }
    }

    @Override // com.bumptech.glide.load.engine.cache.DiskCache
    public void clear() {
    }

    @Override // com.bumptech.glide.load.engine.cache.DiskCache
    public File get(Key key) {
        return null;
    }

    @Override // com.bumptech.glide.load.engine.cache.DiskCache
    public void put(Key key, DataCacheWriter dataCacheWriter) {
    }

    public static synchronized void merge(List list, ArrayList arrayList) {
        synchronized (R$bool.class) {
            ArrayList arrayList2 = new ArrayList();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Category category = (Category) it.next();
                if (category instanceof WallpaperCategory) {
                    Iterator it2 = list.iterator();
                    boolean z = true;
                    while (true) {
                        if (!it2.hasNext()) {
                            break;
                        }
                        Category category2 = (Category) it2.next();
                        if ((category2 instanceof WallpaperCategory) && TextUtils.equals(category2.mCollectionId, category.mCollectionId)) {
                            ((WallpaperCategory) category2).mWallpapers.addAll(((WallpaperCategory) category).mWallpapers);
                            z = false;
                            break;
                        }
                    }
                    if (z) {
                        arrayList2.add(category);
                    }
                }
            }
            list.addAll(arrayList2);
        }
    }

    public static int getColor(View view, int i) {
        return MaterialAttributes.resolveOrThrow(view.getContext(), i, view.getClass().getCanonicalName());
    }

    public static int layer(int i, int i2, float f) {
        return ColorUtils.compositeColors(ColorUtils.setAlphaComponent(i2, Math.round(Color.alpha(i2) * f)), i);
    }
}
