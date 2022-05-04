package com.google.android.gms.internal;

import android.database.ContentObserver;
/* compiled from: Gservices.java */
/* loaded from: classes.dex */
public final class zzfic extends ContentObserver {
    public zzfic() {
        super(null);
    }

    @Override // android.database.ContentObserver
    public final void onChange(boolean z) {
        zzfib.zze.set(true);
    }
}
