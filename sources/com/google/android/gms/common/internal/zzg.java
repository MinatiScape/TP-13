package com.google.android.gms.common.internal;

import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.Intent;
import android.util.Log;
/* compiled from: DialogRedirect.java */
/* loaded from: classes.dex */
public abstract class zzg implements DialogInterface.OnClickListener {
    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i) {
        try {
            zzh zzhVar = (zzh) this;
            Intent intent = zzhVar.zza;
            if (intent != null) {
                zzhVar.zzb.startActivityForResult(intent, zzhVar.zzc);
            }
        } catch (ActivityNotFoundException e) {
            Log.e("DialogRedirect", "Failed to start resolution intent", e);
        } finally {
            dialogInterface.dismiss();
        }
    }
}
