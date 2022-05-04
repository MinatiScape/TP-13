package com.google.android.gms.common.internal;

import android.os.Parcel;
import android.os.Parcelable;
/* compiled from: BinderWrapper.java */
/* loaded from: classes.dex */
public final class zzd implements Parcelable.Creator<BinderWrapper> {
    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ BinderWrapper createFromParcel(Parcel parcel) {
        return new BinderWrapper(parcel);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ BinderWrapper[] newArray(int i) {
        return new BinderWrapper[i];
    }
}
