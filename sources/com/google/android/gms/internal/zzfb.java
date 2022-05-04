package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
/* compiled from: Codecs.java */
/* loaded from: classes.dex */
public final class zzfb {
    public static final /* synthetic */ int $r8$clinit = 0;

    public zzfb() {
        throw null;
    }

    static {
        zzfb.class.getClassLoader();
    }

    public static <T extends Parcelable> T zza(Parcel parcel, Parcelable.Creator<T> creator) {
        if (parcel.readInt() == 0) {
            return null;
        }
        return creator.createFromParcel(parcel);
    }
}
