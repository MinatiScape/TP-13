package com.android.wallpaper.widget;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.RecyclerViewAccessibilityDelegate;
/* loaded from: classes.dex */
public final class WallpaperPickerRecyclerViewAccessibilityDelegate extends RecyclerViewAccessibilityDelegate {
    public final BottomSheetHost mBottomSheetHost;
    public final int mColumns;
    public final RecyclerView mGridRecyclerView;

    /* loaded from: classes.dex */
    public interface BottomSheetHost {
        void expandBottomSheet();

        int getBottomSheetState();

        default boolean isExpanded() {
            if (getBottomSheetState() == 3) {
                return true;
            }
            return false;
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerViewAccessibilityDelegate, androidx.core.view.AccessibilityDelegateCompat
    public final boolean performAccessibilityAction(View view, int i, Bundle bundle) {
        BottomSheetHost bottomSheetHost;
        if (i == 4096 && (bottomSheetHost = this.mBottomSheetHost) != null && !bottomSheetHost.isExpanded()) {
            this.mBottomSheetHost.expandBottomSheet();
        }
        return super.performAccessibilityAction(view, i, bundle);
    }

    public WallpaperPickerRecyclerViewAccessibilityDelegate(RecyclerView recyclerView, BottomSheetHost bottomSheetHost, int i) {
        super(recyclerView);
        this.mGridRecyclerView = recyclerView;
        this.mBottomSheetHost = bottomSheetHost;
        this.mColumns = i;
    }

    @Override // androidx.core.view.AccessibilityDelegateCompat
    public final boolean onRequestSendAccessibilityEvent(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
        if (accessibilityEvent.getEventType() == 32768) {
            int childLayoutPosition = this.mGridRecyclerView.getChildLayoutPosition(view);
            BottomSheetHost bottomSheetHost = this.mBottomSheetHost;
            if (bottomSheetHost != null && !bottomSheetHost.isExpanded() && childLayoutPosition >= this.mColumns) {
                this.mBottomSheetHost.expandBottomSheet();
            }
        }
        return super.onRequestSendAccessibilityEvent(viewGroup, view, accessibilityEvent);
    }
}
