package com.google.android.gms.common;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import android.util.Log;
import androidx.slice.view.R$layout;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzab;
import com.google.android.gms.common.internal.zzac;
import com.google.android.gms.dynamic.IObjectWrapper;
import com.google.android.gms.dynamic.zzn;
import com.google.android.gms.internal.zzbkv;
import java.util.Objects;
/* loaded from: classes.dex */
public final class zzl extends zzbkv {
    public static final Parcelable.Creator<zzl> CREATOR = new zzm();
    public final String zza;
    public final zzf zzb;
    public final boolean zzc;

    public zzl(String str, IBinder iBinder, boolean z) {
        zzaa zzaaVar;
        this.zza = str;
        zzg zzgVar = null;
        if (iBinder != null) {
            try {
                int i = zzab.$r8$clinit;
                IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.ICertData");
                if (queryLocalInterface instanceof zzaa) {
                    zzaaVar = (zzaa) queryLocalInterface;
                } else {
                    zzaaVar = new zzac(iBinder);
                }
                IObjectWrapper zzb = zzaaVar.zzb();
                byte[] bArr = zzb == null ? null : (byte[]) zzn.zza(zzb);
                if (bArr != null) {
                    zzgVar = new zzg(bArr);
                } else {
                    Log.e("GoogleCertificatesQuery", "Could not unwrap certificate");
                }
            } catch (RemoteException e) {
                Log.e("GoogleCertificatesQuery", "Could not unwrap certificate", e);
            }
        }
        this.zzb = zzgVar;
        this.zzc = z;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        R$layout.zza(parcel, 1, this.zza, false);
        zzf zzfVar = this.zzb;
        if (zzfVar == null) {
            Log.w("GoogleCertificatesQuery", "certificate binder is null");
            zzfVar = null;
        } else {
            Objects.requireNonNull(zzfVar);
        }
        R$layout.zza(parcel, 2, zzfVar);
        boolean z = this.zzc;
        R$layout.zzb(parcel, 3, 4);
        parcel.writeInt(z ? 1 : 0);
        R$layout.zzc(parcel, zzb);
    }
}
