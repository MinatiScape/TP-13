package com.google.android.gms.common;

import android.os.RemoteException;
import android.util.Log;
import androidx.preference.R$string;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzab;
import com.google.android.gms.dynamic.IObjectWrapper;
import com.google.android.gms.dynamic.zzn;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
/* loaded from: classes.dex */
public abstract class zzf extends zzab {
    public int zza;

    public zzf(byte[] bArr) {
        R$string.zzb(bArr.length == 25);
        this.zza = Arrays.hashCode(bArr);
    }

    public static byte[] zza(String str) {
        try {
            return str.getBytes("ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            throw new AssertionError(e);
        }
    }

    public boolean equals(Object obj) {
        IObjectWrapper zzb;
        if (obj != null && (obj instanceof zzaa)) {
            try {
                zzaa zzaaVar = (zzaa) obj;
                if (zzaaVar.zzc() == this.zza && (zzb = zzaaVar.zzb()) != null) {
                    return Arrays.equals(zza(), (byte[]) zzn.zza(zzb));
                }
                return false;
            } catch (RemoteException e) {
                Log.e("GoogleCertificates", "Failed to get Google certificates from remote", e);
            }
        }
        return false;
    }

    public int hashCode() {
        return this.zza;
    }

    public abstract byte[] zza();

    @Override // com.google.android.gms.common.internal.zzaa
    public final IObjectWrapper zzb() {
        return new zzn(zza());
    }

    @Override // com.google.android.gms.common.internal.zzaa
    public final int zzc() {
        return this.zza;
    }
}
