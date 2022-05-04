package com.android.wallpaper.picker;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.text.Html;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.TextView;
import androidx.cardview.R$style;
import androidx.fragment.app.DialogFragment;
import com.android.systemui.shared.R;
import com.android.wallpaper.util.LaunchUtils;
/* loaded from: classes.dex */
public class StartRotationDialogFragment extends DialogFragment {
    public static final /* synthetic */ int $r8$clinit = 0;
    public boolean mIsWifiOnlyChecked;

    /* loaded from: classes.dex */
    public interface Listener {
        void onStartRotationDialogDismiss();
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle == null) {
            this.mIsWifiOnlyChecked = true;
        } else {
            this.mIsWifiOnlyChecked = bundle.getBoolean("key_is_wifi_only_checked");
        }
    }

    @Override // androidx.fragment.app.DialogFragment
    public final Dialog onCreateDialog(Bundle bundle) {
        View inflate = getActivity().getLayoutInflater().inflate(R.layout.dialog_start_rotation, (ViewGroup) null);
        ((TextView) inflate.findViewById(R.id.start_rotation_dialog_subhead)).setText(Html.fromHtml(getResources().getString(R.string.start_rotation_dialog_body)));
        final CheckBox checkBox = (CheckBox) inflate.findViewById(R.id.start_rotation_wifi_only_checkbox);
        LaunchUtils systemFeatureChecker = R$style.getInjector().getSystemFeatureChecker();
        Context context = getContext();
        systemFeatureChecker.getClass();
        if (context.getPackageManager().hasSystemFeature("android.hardware.telephony")) {
            checkBox.setChecked(this.mIsWifiOnlyChecked);
            checkBox.setOnClickListener(new View.OnClickListener() { // from class: com.android.wallpaper.picker.StartRotationDialogFragment$$ExternalSyntheticLambda1
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    StartRotationDialogFragment startRotationDialogFragment = StartRotationDialogFragment.this;
                    CheckBox checkBox2 = checkBox;
                    int i = StartRotationDialogFragment.$r8$clinit;
                    startRotationDialogFragment.getClass();
                    startRotationDialogFragment.mIsWifiOnlyChecked = checkBox2.isChecked();
                }
            });
        } else {
            checkBox.setVisibility(8);
        }
        return new AlertDialog.Builder(getActivity(), R.style.LightDialogTheme).setView(inflate).setNegativeButton(17039360, (DialogInterface.OnClickListener) null).setPositiveButton(17039370, new DialogInterface.OnClickListener() { // from class: com.android.wallpaper.picker.StartRotationDialogFragment$$ExternalSyntheticLambda0
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                StartRotationDialogFragment startRotationDialogFragment = StartRotationDialogFragment.this;
                int i2 = StartRotationDialogFragment.$r8$clinit;
                ((RotationStarter) startRotationDialogFragment.getTargetFragment(true)).startRotation(startRotationDialogFragment.mIsWifiOnlyChecked ? 1 : 0);
            }
        }).create();
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        ((Listener) getTargetFragment(true)).onStartRotationDialogDismiss();
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.Fragment
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("key_is_wifi_only_checked", this.mIsWifiOnlyChecked);
    }
}
