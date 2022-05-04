package com.google.android.gms.common;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import android.util.Log;
import androidx.core.R$id;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzab;
import com.google.android.gms.common.internal.zzac;
import com.google.android.gms.dynamic.IObjectWrapper;
import com.google.android.gms.dynamic.zzn;
import com.google.android.gms.internal.zzbkv;
/* compiled from: GoogleCertificatesQuery.java */
/* loaded from: classes.dex */
public final class zzl extends zzbkv {
    public static final Parcelable.Creator<zzl> CREATOR = new zzm();
    public final String zza;
    public final zzg zzb;
    public final boolean zzc;

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        R$id.zza(parcel, 1, this.zza);
        zzg zzgVar = this.zzb;
        if (zzgVar == null) {
            Log.w("GoogleCertificatesQuery", "certificate binder is null");
            zzgVar = null;
        }
        if (zzgVar != null) {
            int zzb2 = R$id.zzb(parcel, 2);
            parcel.writeStrongBinder(zzgVar);
            R$id.zzc(parcel, zzb2);
        }
        boolean z = this.zzc;
        R$id.zzb(parcel, 3, 4);
        parcel.writeInt(z ? 1 : 0);
        R$id.zzc(parcel, zzb);
    }

    public zzl(String str, IBinder iBinder, boolean z) {
        zzaa zzaaVar;
        byte[] bArr;
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
                if (zzb == null) {
                    bArr = null;
                } else {
                    bArr = (byte[]) zzn.zza(zzb);
                }
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
}
