package com.google.android.gms.gcm;

import android.os.Parcel;
import android.util.Log;
import com.google.android.gms.common.internal.ReflectedParcelable;
/* loaded from: classes.dex */
public class Task implements ReflectedParcelable {
    public final String zza;
    public final String zzb;
    public final boolean zzc;
    public final boolean zzd;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.zza);
        parcel.writeString(this.zzb);
        parcel.writeInt(this.zzc ? 1 : 0);
        parcel.writeInt(this.zzd ? 1 : 0);
    }

    @Deprecated
    public Task(Parcel parcel) {
        boolean z;
        Log.e(com.android.systemui.shared.recents.model.Task.TAG, "Constructing a Task object using a parcel.");
        this.zza = parcel.readString();
        this.zzb = parcel.readString();
        boolean z2 = false;
        if (parcel.readInt() == 1) {
            z = true;
        } else {
            z = false;
        }
        this.zzc = z;
        this.zzd = parcel.readInt() == 1 ? true : z2;
    }
}
