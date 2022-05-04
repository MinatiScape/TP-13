package com.android.wallpaper.picker;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import androidx.appcompat.view.ContextThemeWrapper;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.strictmode.FragmentStrictMode;
import com.android.systemui.shared.R;
import com.android.wallpaper.widget.PreviewPager$$ExternalSyntheticLambda0;
import com.android.wallpaper.widget.PreviewPager$$ExternalSyntheticLambda1;
/* loaded from: classes.dex */
public class SetWallpaperDialogFragment extends DialogFragment {
    public static final /* synthetic */ int $r8$clinit = 0;
    public Listener mListener;
    public Button mSetHomeWallpaperButton;
    public Button mSetLockWallpaperButton;
    public int mTitleResId;
    public boolean mWithItemSelected;
    public boolean mHomeAvailable = true;
    public boolean mLockAvailable = true;

    /* loaded from: classes.dex */
    public interface Listener {
        default void onDialogDismissed(boolean z) {
        }

        void onSet(int i);
    }

    public final void updateButtonsVisibility() {
        int i;
        Button button = this.mSetHomeWallpaperButton;
        int i2 = 0;
        if (button != null) {
            if (this.mHomeAvailable) {
                i = 0;
            } else {
                i = 8;
            }
            button.setVisibility(i);
        }
        Button button2 = this.mSetLockWallpaperButton;
        if (button2 != null) {
            if (!this.mLockAvailable) {
                i2 = 8;
            }
            button2.setVisibility(i2);
        }
    }

    public SetWallpaperDialogFragment() {
        FragmentStrictMode.onSetRetainInstanceUsage(this);
        this.mRetainInstance = true;
        FragmentManager fragmentManager = this.mFragmentManager;
        if (fragmentManager != null) {
            fragmentManager.mNonConfig.addRetainedFragment(this);
        } else {
            this.mRetainInstanceChangedWhileDetached = true;
        }
    }

    @Override // androidx.fragment.app.DialogFragment
    public final Dialog onCreateDialog(Bundle bundle) {
        super.onCreateDialog(bundle);
        Context context = getContext();
        View inflate = View.inflate(new ContextThemeWrapper(getActivity(), (int) R.style.LightDialogTheme), R.layout.dialog_set_wallpaper, null);
        inflate.findViewById(R.id.dialog_set_wallpaper_options).setClipToOutline(true);
        View inflate2 = View.inflate(context, R.layout.dialog_set_wallpaper_title, null);
        ((TextView) inflate2.findViewById(R.id.dialog_set_wallpaper_title)).setText(this.mTitleResId);
        AlertDialog create = new AlertDialog.Builder(context, R.style.LightDialogTheme).setCustomTitle(inflate2).setView(inflate).create();
        Button button = (Button) inflate.findViewById(R.id.set_home_wallpaper_button);
        this.mSetHomeWallpaperButton = button;
        button.setOnClickListener(new View.OnClickListener() { // from class: com.android.wallpaper.picker.SetWallpaperDialogFragment$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SetWallpaperDialogFragment setWallpaperDialogFragment = SetWallpaperDialogFragment.this;
                int i = SetWallpaperDialogFragment.$r8$clinit;
                setWallpaperDialogFragment.mWithItemSelected = true;
                setWallpaperDialogFragment.mListener.onSet(0);
                setWallpaperDialogFragment.dismissInternal(false, false);
            }
        });
        Button button2 = (Button) inflate.findViewById(R.id.set_lock_wallpaper_button);
        this.mSetLockWallpaperButton = button2;
        button2.setOnClickListener(new PreviewPager$$ExternalSyntheticLambda0(this, 1));
        ((Button) inflate.findViewById(R.id.set_both_wallpaper_button)).setOnClickListener(new PreviewPager$$ExternalSyntheticLambda1(this, 1));
        updateButtonsVisibility();
        return create;
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        Listener listener = this.mListener;
        if (listener != null) {
            listener.onDialogDismissed(this.mWithItemSelected);
        }
    }
}
