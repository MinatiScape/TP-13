package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import androidx.appcompat.R$styleable;
import androidx.appcompat.content.res.AppCompatResources;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class AppCompatImageHelper {
    public int mLevel = 0;
    public final ImageView mView;

    public final void applySupportImageTint() {
        if (this.mView.getDrawable() != null) {
            Rect rect = DrawableUtils.INSETS_NONE;
        }
    }

    public final void loadFromAttributes(AttributeSet attributeSet, int i) {
        int resourceId;
        Context context = this.mView.getContext();
        int[] iArr = R$styleable.AppCompatImageView;
        TintTypedArray obtainStyledAttributes = TintTypedArray.obtainStyledAttributes(context, attributeSet, iArr, i);
        ImageView imageView = this.mView;
        Context context2 = imageView.getContext();
        TypedArray typedArray = obtainStyledAttributes.mWrapped;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        ViewCompat.Api29Impl.saveAttributeDataForStyleable(imageView, context2, iArr, attributeSet, typedArray, i, 0);
        try {
            Drawable drawable = this.mView.getDrawable();
            if (!(drawable != null || (resourceId = obtainStyledAttributes.getResourceId(1, -1)) == -1 || (drawable = AppCompatResources.getDrawable(this.mView.getContext(), resourceId)) == null)) {
                this.mView.setImageDrawable(drawable);
            }
            if (drawable != null) {
                Rect rect = DrawableUtils.INSETS_NONE;
            }
            if (obtainStyledAttributes.hasValue(2)) {
                this.mView.setImageTintList(obtainStyledAttributes.getColorStateList(2));
            }
            if (obtainStyledAttributes.hasValue(3)) {
                this.mView.setImageTintMode(DrawableUtils.parseTintMode(obtainStyledAttributes.getInt(3, -1), null));
            }
        } finally {
            obtainStyledAttributes.recycle();
        }
    }

    public final void setImageResource(int i) {
        if (i != 0) {
            Drawable drawable = AppCompatResources.getDrawable(this.mView.getContext(), i);
            if (drawable != null) {
                Rect rect = DrawableUtils.INSETS_NONE;
            }
            this.mView.setImageDrawable(drawable);
        } else {
            this.mView.setImageDrawable(null);
        }
        applySupportImageTint();
    }

    public AppCompatImageHelper(ImageView imageView) {
        this.mView = imageView;
    }
}
