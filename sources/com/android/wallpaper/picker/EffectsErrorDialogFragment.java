package com.android.wallpaper.picker;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.AnimatedVectorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.appcompat.view.ContextThemeWrapper;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.strictmode.FragmentStrictMode;
import com.android.systemui.shared.R;
import com.android.wallpaper.picker.MyPhotosStarter;
/* loaded from: classes.dex */
public class EffectsErrorDialogFragment extends DialogFragment implements MyPhotosStarter.PermissionChangedListener {
    public static final /* synthetic */ int $r8$clinit = 0;
    public int mBodyResId;
    public AnimatedVectorDrawable mErrorAnimatedDrawable;
    public int mTitleResId;

    @Override // com.android.wallpaper.picker.MyPhotosStarter.PermissionChangedListener
    public final void onPermissionsDenied(boolean z) {
    }

    @Override // com.android.wallpaper.picker.MyPhotosStarter.PermissionChangedListener
    public final void onPermissionsGranted() {
    }

    public EffectsErrorDialogFragment() {
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
        View inflate = View.inflate(new ContextThemeWrapper(getActivity(), (int) R.style.LightDialogTheme), R.layout.dialog_effect_error, null);
        View inflate2 = View.inflate(context, R.layout.dialog_effect_error_title, null);
        ((TextView) inflate2.findViewById(R.id.dialog_effect_error_title)).setText(this.mTitleResId);
        ((TextView) inflate.findViewById(R.id.dialog_effect_error_body)).setText(this.mBodyResId);
        AlertDialog create = new AlertDialog.Builder(context, R.style.LightDialogTheme).setCustomTitle(inflate2).setView(inflate).create();
        ((Button) inflate.findViewById(R.id.effect_error_cancel_button)).setOnClickListener(new View.OnClickListener() { // from class: com.android.wallpaper.picker.EffectsErrorDialogFragment$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                EffectsErrorDialogFragment effectsErrorDialogFragment = EffectsErrorDialogFragment.this;
                int i = EffectsErrorDialogFragment.$r8$clinit;
                effectsErrorDialogFragment.dismissInternal(false, false);
            }
        });
        ((Button) inflate.findViewById(R.id.effect_error_my_photos_button)).setOnClickListener(new View.OnClickListener() { // from class: com.android.wallpaper.picker.EffectsErrorDialogFragment$$ExternalSyntheticLambda1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                EffectsErrorDialogFragment effectsErrorDialogFragment = EffectsErrorDialogFragment.this;
                int i = EffectsErrorDialogFragment.$r8$clinit;
                effectsErrorDialogFragment.getClass();
                Intent intent = new Intent("android.intent.action.PICK");
                intent.setType("image/*");
                effectsErrorDialogFragment.getActivity().startActivityForResult(intent, 0);
                effectsErrorDialogFragment.dismissInternal(false, false);
            }
        });
        Drawable drawable = ((ImageView) inflate.findViewById(R.id.error_bunny_illustration)).getDrawable();
        if (drawable instanceof AnimatedVectorDrawable) {
            this.mErrorAnimatedDrawable = (AnimatedVectorDrawable) drawable;
        }
        return create;
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.Fragment
    public final void onStart() {
        super.onStart();
        this.mErrorAnimatedDrawable.start();
    }
}
