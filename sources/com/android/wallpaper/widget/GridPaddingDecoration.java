package com.android.wallpaper.widget;

import android.graphics.Rect;
import android.view.View;
import androidx.recyclerview.widget.RecyclerView;
/* loaded from: classes.dex */
public final class GridPaddingDecoration extends RecyclerView.ItemDecoration {
    public final int mPaddingBottom;
    public final int mPaddingHorizontal;

    public GridPaddingDecoration(int i, int i2) {
        this.mPaddingHorizontal = i;
        this.mPaddingBottom = i2;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.ItemDecoration
    public final void getItemOffsets(Rect rect, View view, RecyclerView recyclerView) {
        if (recyclerView.getChildAdapterPosition(view) >= 0) {
            int i = this.mPaddingHorizontal;
            rect.left = i;
            rect.right = i;
            rect.bottom = this.mPaddingBottom;
        }
    }
}
