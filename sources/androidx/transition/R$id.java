package androidx.transition;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.text.TextUtils;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.WallpaperCategory;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public class R$id {
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

    public static synchronized void merge(List<Category> list, List<Category> list2) {
        synchronized (R$id.class) {
            ArrayList arrayList = new ArrayList();
            for (Category category : list2) {
                if (category instanceof WallpaperCategory) {
                    Iterator<Category> it = list.iterator();
                    boolean z = true;
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        Category next = it.next();
                        if ((next instanceof WallpaperCategory) && TextUtils.equals(next.mCollectionId, category.mCollectionId)) {
                            ((WallpaperCategory) next).mWallpapers.addAll(((WallpaperCategory) category).mWallpapers);
                            z = false;
                            break;
                        }
                    }
                    if (z) {
                        arrayList.add(category);
                    }
                }
            }
            list.addAll(arrayList);
        }
    }

    public static void playTogether(AnimatorSet animatorSet, List<Animator> list) {
        int size = list.size();
        long j = 0;
        for (int i = 0; i < size; i++) {
            Animator animator = list.get(i);
            j = Math.max(j, animator.getDuration() + animator.getStartDelay());
        }
        ValueAnimator ofInt = ValueAnimator.ofInt(0, 0);
        ofInt.setDuration(j);
        list.add(0, ofInt);
        animatorSet.playTogether(list);
    }
}
