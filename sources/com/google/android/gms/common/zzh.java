package com.google.android.gms.common;

import java.lang.ref.WeakReference;
/* compiled from: GoogleCertificates.java */
/* loaded from: classes.dex */
public abstract class zzh extends zzf {
    public static final WeakReference<byte[]> zzb = new WeakReference<>(null);
    public WeakReference<byte[]> zza = zzb;

    @Override // com.google.android.gms.common.zzf
    public final byte[] zza() {
        byte[] bArr;
        synchronized (this) {
            bArr = this.zza.get();
            if (bArr == null) {
                bArr = zzd();
                this.zza = new WeakReference<>(bArr);
            }
        }
        return bArr;
    }

    public abstract byte[] zzd();

    public zzh(byte[] bArr) {
        super(bArr);
    }
}
