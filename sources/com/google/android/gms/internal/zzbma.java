package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.SparseArray;
import androidx.slice.view.R$layout;
import com.google.android.gms.common.server.response.FastJsonResponse;
import java.util.ArrayList;
import java.util.HashMap;
/* loaded from: classes.dex */
public final class zzbma extends zzbkv implements FastJsonResponse.FieldConverter<String, Integer> {
    public static final Parcelable.Creator<zzbma> CREATOR = new zzbmc();
    public final int zza;
    public final HashMap<String, Integer> zzb;
    public final SparseArray<String> zzc;

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

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        int i2 = this.zza;
        R$layout.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        ArrayList arrayList = new ArrayList();
        for (String str : this.zzb.keySet()) {
            arrayList.add(new zzbmb(str, this.zzb.get(str).intValue()));
        }
        R$layout.zzc(parcel, 2, arrayList, false);
        R$layout.zzc(parcel, zzb);
    }

    public zzbma() {
        this.zza = 1;
        this.zzb = new HashMap<>();
        this.zzc = new SparseArray<>();
    }
}
