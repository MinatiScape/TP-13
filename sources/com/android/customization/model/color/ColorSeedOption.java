package com.android.customization.model.color;

import android.content.res.Resources;
import android.graphics.PorterDuff;
import android.view.View;
import android.widget.ImageView;
import com.android.systemui.monet.Style;
import com.android.systemui.shared.R;
import java.util.Map;
/* loaded from: classes.dex */
public final class ColorSeedOption extends ColorOption {
    public final PreviewInfo mPreviewInfo;
    public final String mSource;

    public ColorSeedOption(String str, Map<String, String> map, boolean z, String str2, Style style, int i, PreviewInfo previewInfo) {
        super(str, map, z, style, i);
        this.mSource = str2;
        this.mPreviewInfo = previewInfo;
    }

    @Override // com.android.customization.model.CustomizationOption
    public final int getLayoutResId() {
        return R.layout.color_option;
    }

    /* loaded from: classes.dex */
    public static class PreviewInfo {
        public int[] darkColors;
        public int[] lightColors;

        public PreviewInfo(int[] iArr, int[] iArr2) {
            this.lightColors = iArr;
            this.darkColors = iArr2;
        }
    }

    @Override // com.android.customization.model.CustomizationOption
    public final void bindThumbnailTile(View view) {
        boolean z;
        int[] iArr;
        int i;
        Resources resources = view.getContext().getResources();
        PreviewInfo previewInfo = this.mPreviewInfo;
        previewInfo.getClass();
        int i2 = 0;
        if ((resources.getConfiguration().uiMode & 48) == 32) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            iArr = previewInfo.darkColors;
        } else {
            iArr = previewInfo.lightColors;
        }
        if (view.isActivated()) {
            i = resources.getDimensionPixelSize(R.dimen.color_seed_option_tile_padding_selected);
        } else {
            i = resources.getDimensionPixelSize(R.dimen.color_seed_option_tile_padding);
        }
        while (true) {
            int[] iArr2 = this.mPreviewColorIds;
            if (i2 < iArr2.length) {
                ImageView imageView = (ImageView) view.findViewById(iArr2[i2]);
                imageView.getDrawable().setColorFilter(iArr[i2], PorterDuff.Mode.SRC);
                imageView.setPadding(i, i, i, i);
                i2++;
            } else {
                view.setContentDescription(view.getContext().getString(R.string.wallpaper_color_title));
                return;
            }
        }
    }

    @Override // com.android.customization.model.color.ColorOption
    public final String getSource() {
        return this.mSource;
    }
}
