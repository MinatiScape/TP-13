package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.SparseArray;
import androidx.core.R$id;
import java.util.ArrayList;
import java.util.HashMap;
/* compiled from: StringToIntConverter.java */
/* loaded from: classes.dex */
public final class zzbma extends zzbkv {
    public static final Parcelable.Creator<zzbma> CREATOR = new zzbmc();
    public final int zza;
    public final HashMap<String, Integer> zzb;
    public final SparseArray<String> zzc;

    public zzbma() {
        throw null;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zza;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        ArrayList arrayList = new ArrayList();
        for (String str : this.zzb.keySet()) {
            arrayList.add(new zzbmb(str, this.zzb.get(str).intValue()));
        }
        R$id.zzc(parcel, 2, arrayList);
        R$id.zzc(parcel, zzb);
    }

    public zzbma(int i, ArrayList<zzbmb> arrayList) {
        this.zza = i;
        this.zzb = new HashMap<>();
        this.zzc = new SparseArray<>();
        int size = arrayList.size();
        int i2 = 0;
        while (i2 < size) {
            zzbmb zzbmbVar = arrayList.get(i2);
            i2++;
            zzbmb zzbmbVar2 = zzbmbVar;
            String str = zzbmbVar2.zza;
            int i3 = zzbmbVar2.zzb;
            this.zzb.put(str, Integer.valueOf(i3));
            this.zzc.put(i3, str);
        }
    }
}
