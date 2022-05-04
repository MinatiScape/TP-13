package com.google.android.gms.common.internal;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.google.android.gms.internal.zzbkv;
/* loaded from: classes.dex */
public class ClientIdentity extends zzbkv {
    public static final Parcelable.Creator<ClientIdentity> CREATOR = new zze();
    public final String packageName;
    public final int uid;

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj != null && (obj instanceof ClientIdentity)) {
            ClientIdentity clientIdentity = (ClientIdentity) obj;
            if (clientIdentity.uid == this.uid && R$id.zza(clientIdentity.packageName, this.packageName)) {
                return true;
            }
        }
        return false;
    }

    public final String toString() {
        int i = this.uid;
        String str = this.packageName;
        StringBuilder sb = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(str, 12));
        sb.append(i);
        sb.append(":");
        sb.append(str);
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.uid;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$id.zza(parcel, 2, this.packageName);
        R$id.zzc(parcel, zzb);
    }

    public ClientIdentity(int i, String str) {
        this.uid = i;
        this.packageName = str;
    }

    public final int hashCode() {
        return this.uid;
    }
}
