package com.google.android.gms.internal;

import android.database.ContentObserver;
/* compiled from: ConfigurationContentLoader.java */
/* loaded from: classes.dex */
public final class zzfir extends ContentObserver {
    public final /* synthetic */ zzfiq zza;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzfir(zzfiq zzfiqVar) {
        super(null);
        this.zza = zzfiqVar;
    }

    @Override // android.database.ContentObserver
    public final void onChange(boolean z) {
        zzfiq zzfiqVar = this.zza;
        synchronized (zzfiqVar.zze) {
            zzfiqVar.zzf = null;
        }
    }
}
