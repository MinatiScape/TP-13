package com.google.android.gms.clearcut;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.slice.view.R$layout;
import com.google.android.gms.internal.zzbkv;
import java.util.Arrays;
/* loaded from: classes.dex */
public class CollectForDebugParcelable extends zzbkv {
    public static final Parcelable.Creator<CollectForDebugParcelable> CREATOR = new zzn();
    public final long collectForDebugExpiryTimeMillis;
    public final long collectForDebugStartTimeMillis;
    public final boolean skipPersistentStorage;

    public CollectForDebugParcelable(boolean z, long j, long j2) {
        this.skipPersistentStorage = z;
        this.collectForDebugStartTimeMillis = j;
        this.collectForDebugExpiryTimeMillis = j2;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof CollectForDebugParcelable) {
            CollectForDebugParcelable collectForDebugParcelable = (CollectForDebugParcelable) obj;
            if (this.skipPersistentStorage == collectForDebugParcelable.skipPersistentStorage && this.collectForDebugStartTimeMillis == collectForDebugParcelable.collectForDebugStartTimeMillis && this.collectForDebugExpiryTimeMillis == collectForDebugParcelable.collectForDebugExpiryTimeMillis) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        return Arrays.hashCode(new Object[]{Boolean.valueOf(this.skipPersistentStorage), Long.valueOf(this.collectForDebugStartTimeMillis), Long.valueOf(this.collectForDebugExpiryTimeMillis)});
    }

    public String toString() {
        return "CollectForDebugParcelable[skipPersistentStorage: " + this.skipPersistentStorage + ",collectForDebugStartTimeMillis: " + this.collectForDebugStartTimeMillis + ",collectForDebugExpiryTimeMillis: " + this.collectForDebugExpiryTimeMillis + "]";
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        boolean z = this.skipPersistentStorage;
        R$layout.zzb(parcel, 1, 4);
        parcel.writeInt(z ? 1 : 0);
        long j = this.collectForDebugExpiryTimeMillis;
        R$layout.zzb(parcel, 2, 8);
        parcel.writeLong(j);
        long j2 = this.collectForDebugStartTimeMillis;
        R$layout.zzb(parcel, 3, 8);
        parcel.writeLong(j2);
        R$layout.zzc(parcel, zzb);
    }
}
