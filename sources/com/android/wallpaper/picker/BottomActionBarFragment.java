package com.android.wallpaper.picker;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import com.android.systemui.shared.R;
import com.android.wallpaper.widget.BottomActionBar;
import com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda8;
import java.util.function.Consumer;
/* loaded from: classes.dex */
public class BottomActionBarFragment extends Fragment {
    public BottomActionBar mBottomActionBar;

    public boolean onBackPressed() {
        return false;
    }

    public void onBottomActionBarReady(BottomActionBar bottomActionBar) {
        this.mBottomActionBar = bottomActionBar;
        bottomActionBar.findViewById(R.id.action_back).setOnClickListener(new AppbarFragment$$ExternalSyntheticLambda0(getActivity(), 2));
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        final BottomActionBar bottomActionBar;
        FragmentActivity activity = getActivity();
        if (activity instanceof BottomActionBar.BottomActionBarHost) {
            bottomActionBar = ((BottomActionBar.BottomActionBarHost) activity).getBottomActionBar();
        } else {
            View view2 = this.mView;
            if (view2 != null) {
                bottomActionBar = (BottomActionBar) view2.findViewById(R.id.bottom_actionbar);
            } else {
                bottomActionBar = null;
            }
        }
        this.mBottomActionBar = bottomActionBar;
        if (bottomActionBar != null) {
            bottomActionBar.setVisibility(8);
            bottomActionBar.showActionsOnly(new BottomActionBar.BottomAction[0]);
            bottomActionBar.enableActions();
            bottomActionBar.mActionMap.values().forEach(BottomActionBar$$ExternalSyntheticLambda8.INSTANCE);
            bottomActionBar.findViewById(R.id.action_back).setOnClickListener(null);
            bottomActionBar.mActionMap.keySet().forEach(new Consumer() { // from class: com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda4
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    int i = BottomActionBar.$r8$clinit;
                    BottomActionBar.this.updateSelectedState((BottomActionBar.BottomAction) obj, false);
                }
            });
            bottomActionBar.mContentViewMap.clear();
            bottomActionBar.mActionSelectedListeners.clear();
            bottomActionBar.mBottomSheetView.removeAllViews();
            BottomActionBar.QueueStateBottomSheetBehavior<ViewGroup> queueStateBottomSheetBehavior = bottomActionBar.mBottomSheetBehavior;
            queueStateBottomSheetBehavior.mStateQueue.clear();
            queueStateBottomSheetBehavior.mIsQueueProcessing = false;
            bottomActionBar.mSelectedAction = null;
            onBottomActionBarReady(this.mBottomActionBar);
        }
    }
}
