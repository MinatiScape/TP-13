package com.android.wallpaper.picker;

import android.view.View;
import android.widget.Button;
import com.android.systemui.shared.R;
import java.util.concurrent.ExecutorService;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewFragment$$ExternalSyntheticLambda1 implements View.OnClickListener {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ PreviewFragment f$0;

    public /* synthetic */ PreviewFragment$$ExternalSyntheticLambda1(PreviewFragment previewFragment, int i) {
        this.$r8$classId = i;
        this.f$0 = previewFragment;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        int i;
        String str;
        switch (this.$r8$classId) {
            case 0:
                PreviewFragment previewFragment = this.f$0;
                boolean z = previewFragment.mFullScreenAnimation.mWorkspaceVisibility;
                Button button = (Button) view;
                if (z) {
                    i = R.string.show_ui_preview_text;
                } else {
                    i = R.string.hide_ui_preview_text;
                }
                button.setText(i);
                previewFragment.mFullScreenAnimation.setWorkspaceVisibility(!z);
                if (z) {
                    str = previewFragment.getString(R.string.hint_hide_ui_preview);
                } else {
                    str = previewFragment.getString(R.string.hint_show_ui_preview);
                }
                view.announceForAccessibility(str);
                return;
            default:
                ImagePreviewFragment imagePreviewFragment = (ImagePreviewFragment) this.f$0;
                ExecutorService executorService = ImagePreviewFragment.sExecutor;
                imagePreviewFragment.onSetWallpaperClicked(imagePreviewFragment.mWallpaper);
                return;
        }
    }
}
