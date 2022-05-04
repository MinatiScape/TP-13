package com.google.android.gms.common;

import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzab;
import com.google.android.gms.dynamic.IObjectWrapper;
import com.google.android.gms.dynamic.zzn;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
/* compiled from: GoogleCertificates.java */
/* loaded from: classes.dex */
public abstract class zzf extends zzab {
    public int zza;

    public final boolean equals(Object obj) {
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

    public abstract byte[] zza();

    public static byte[] zza(String str) {
        try {
            return str.getBytes("ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            throw new AssertionError(e);
        }
    }

    public zzf(byte[] bArr) {
        boolean z;
        if (bArr.length == 25) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            this.zza = Arrays.hashCode(bArr);
            return;
        }
        throw new IllegalArgumentException();
    }

    @Override // com.google.android.gms.common.internal.zzaa
    public final IObjectWrapper zzb() {
        return zzn.zza(zza());
    }

    public final int hashCode() {
        return this.zza;
    }

    @Override // com.google.android.gms.common.internal.zzaa
    public final int zzc() {
        return this.zza;
    }
}
