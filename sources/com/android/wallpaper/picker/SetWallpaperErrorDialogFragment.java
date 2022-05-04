package com.android.wallpaper.picker;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import com.android.systemui.shared.R;
/* loaded from: classes.dex */
public class SetWallpaperErrorDialogFragment extends DialogFragment {

    /* loaded from: classes.dex */
    public interface Listener {
        void onClickTryAgain(int i);
    }

    @Override // androidx.fragment.app.DialogFragment
    public final Dialog onCreateDialog(Bundle bundle) {
        super.onCreateDialog(bundle);
        int i = this.mArguments.getInt("message");
        final int i2 = this.mArguments.getInt("destination");
        return new AlertDialog.Builder(getActivity(), R.style.LightDialogTheme).setMessage(i).setPositiveButton(R.string.try_again, new DialogInterface.OnClickListener() { // from class: com.android.wallpaper.picker.SetWallpaperErrorDialogFragment.1
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i3) {
                Fragment targetFragment = SetWallpaperErrorDialogFragment.this.getTargetFragment(true);
                FragmentActivity activity = SetWallpaperErrorDialogFragment.this.getActivity();
                if (targetFragment == null) {
                    targetFragment = activity;
                }
                Listener listener = (Listener) targetFragment;
                if (listener != null) {
                    listener.onClickTryAgain(i2);
                }
            }
        }).setNegativeButton(17039360, (DialogInterface.OnClickListener) null).create();
    }
}
