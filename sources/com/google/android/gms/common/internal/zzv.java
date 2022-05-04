package com.google.android.gms.common.internal;

import android.util.SparseIntArray;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.GoogleApiAvailabilityLight;
/* compiled from: GoogleApiAvailabilityCache.java */
/* loaded from: classes.dex */
public final class zzv {
    public final SparseIntArray zza = new SparseIntArray();
    public GoogleApiAvailabilityLight zzb;

    public zzv() {
        GoogleApiAvailability googleApiAvailability = GoogleApiAvailability.zzb;
        this.zzb = googleApiAvailability;
    }
}
