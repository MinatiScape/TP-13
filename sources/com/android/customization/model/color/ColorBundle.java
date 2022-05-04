package com.android.customization.model.color;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView;
import com.android.systemui.monet.Style;
import com.android.systemui.shared.R;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public final class ColorBundle extends ColorOption {
    public final PreviewInfo mPreviewInfo;

    @Override // com.android.customization.model.CustomizationOption
    public final int getLayoutResId() {
        return R.layout.color_option;
    }

    @Override // com.android.customization.model.color.ColorOption
    public final String getSource() {
        return "preset";
    }

    /* loaded from: classes.dex */
    public static class PreviewInfo {
        public final List<Drawable> icons;
        public final int primaryColorDark;
        public final int primaryColorLight;
        public final int secondaryColorDark;
        public final int secondaryColorLight;

        public PreviewInfo(int i, int i2, int i3, int i4, ArrayList arrayList) {
            this.secondaryColorLight = i;
            this.secondaryColorDark = i2;
            this.primaryColorLight = i3;
            this.primaryColorDark = i4;
            this.icons = arrayList;
        }
    }

    public ColorBundle(String str, Map<String, String> map, boolean z, Style style, int i, PreviewInfo previewInfo) {
        super(str, map, z, style, i);
        this.mPreviewInfo = previewInfo;
    }

    @Override // com.android.customization.model.CustomizationOption
    public final void bindThumbnailTile(View view) {
        boolean z;
        int i;
        int i2;
        int i3;
        int i4;
        Resources resources = view.getContext().getResources();
        PreviewInfo previewInfo = this.mPreviewInfo;
        previewInfo.getClass();
        boolean z2 = true;
        int i5 = 0;
        if ((resources.getConfiguration().uiMode & 48) == 32) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            i = previewInfo.primaryColorDark;
        } else {
            i = previewInfo.primaryColorLight;
        }
        PreviewInfo previewInfo2 = this.mPreviewInfo;
        previewInfo2.getClass();
        if ((resources.getConfiguration().uiMode & 48) != 32) {
            z2 = false;
        }
        if (z2) {
            i2 = previewInfo2.secondaryColorDark;
        } else {
            i2 = previewInfo2.secondaryColorLight;
        }
        if (view.isActivated()) {
            i3 = resources.getDimensionPixelSize(R.dimen.color_seed_option_tile_padding_selected);
        } else {
            i3 = resources.getDimensionPixelSize(R.dimen.color_seed_option_tile_padding);
        }
        while (true) {
            int[] iArr = this.mPreviewColorIds;
            if (i5 >= iArr.length) {
                break;
            }
            ImageView imageView = (ImageView) view.findViewById(iArr[i5]);
            if (i5 % 2 == 0) {
                i4 = i;
            } else {
                i4 = i2;
            }
            imageView.getDrawable().setColorFilter(i4, PorterDuff.Mode.SRC);
            imageView.setPadding(i3, i3, i3, i3);
            i5++;
        }
        Context context = view.getContext();
        if (this.mContentDescription == null) {
            String string = context.getString(R.string.default_theme_title);
            if (this.mIsDefault) {
                this.mContentDescription = string;
            } else {
                this.mContentDescription = this.mTitle;
            }
        }
        view.setContentDescription(this.mContentDescription);
    }
}
