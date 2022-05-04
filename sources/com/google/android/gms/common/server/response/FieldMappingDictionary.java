package com.google.android.gms.common.server.response;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.gms.common.server.response.FastJsonResponse;
import com.google.android.gms.internal.zzbkv;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public class FieldMappingDictionary extends zzbkv {
    public static final Parcelable.Creator<FieldMappingDictionary> CREATOR = new zzj();
    public final int zza;
    public final HashMap<String, Map<String, FastJsonResponse.Field<?, ?>>> zzb;
    public final String zzd;

    /* loaded from: classes.dex */
    public static class Entry extends zzbkv {
        public static final Parcelable.Creator<Entry> CREATOR = new zzk();
        public final String zza;
        public final ArrayList<FieldMapPair> zzb;
        public final int zzc;

        public Entry(int i, String str, ArrayList<FieldMapPair> arrayList) {
            this.zzc = i;
            this.zza = str;
            this.zzb = arrayList;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            int zzb = R$id.zzb(parcel, 20293);
            int i2 = this.zzc;
            R$id.zzb(parcel, 1, 4);
            parcel.writeInt(i2);
            R$id.zza(parcel, 2, this.zza);
            R$id.zzc(parcel, 3, this.zzb);
            R$id.zzc(parcel, zzb);
        }

        public Entry(String str, Map<String, FastJsonResponse.Field<?, ?>> map) {
            ArrayList<FieldMapPair> arrayList;
            this.zzc = 1;
            this.zza = str;
            if (map == null) {
                arrayList = null;
            } else {
                arrayList = new ArrayList<>();
                for (String str2 : map.keySet()) {
                    arrayList.add(new FieldMapPair(str2, map.get(str2)));
                }
            }
            this.zzb = arrayList;
        }
    }

    /* loaded from: classes.dex */
    public static class FieldMapPair extends zzbkv {
        public static final Parcelable.Creator<FieldMapPair> CREATOR = new zzi();
        public final String zza;
        public final FastJsonResponse.Field<?, ?> zzb;
        public final int zzc;

        public FieldMapPair(int i, String str, FastJsonResponse.Field<?, ?> field) {
            this.zzc = i;
            this.zza = str;
            this.zzb = field;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            int zzb = R$id.zzb(parcel, 20293);
            int i2 = this.zzc;
            R$id.zzb(parcel, 1, 4);
            parcel.writeInt(i2);
            R$id.zza(parcel, 2, this.zza);
            R$id.zza(parcel, 3, this.zzb, i);
            R$id.zzc(parcel, zzb);
        }

        public FieldMapPair(String str, FastJsonResponse.Field<?, ?> field) {
            this.zzc = 1;
            this.zza = str;
            this.zzb = field;
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        for (String str : this.zzb.keySet()) {
            sb.append(str);
            sb.append(":\n");
            Map<String, FastJsonResponse.Field<?, ?>> map = this.zzb.get(str);
            for (String str2 : map.keySet()) {
                sb.append("  ");
                sb.append(str2);
                sb.append(": ");
                sb.append(map.get(str2));
            }
        }
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zza;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        ArrayList arrayList = new ArrayList();
        for (String str : this.zzb.keySet()) {
            arrayList.add(new Entry(str, this.zzb.get(str)));
        }
        R$id.zzc(parcel, 2, arrayList);
        R$id.zza(parcel, 3, this.zzd);
        R$id.zzc(parcel, zzb);
    }

    public FieldMappingDictionary(int i, ArrayList<Entry> arrayList, String str) {
        this.zza = i;
        HashMap<String, Map<String, FastJsonResponse.Field<?, ?>>> hashMap = new HashMap<>();
        int size = arrayList.size();
        for (int i2 = 0; i2 < size; i2++) {
            Entry entry = arrayList.get(i2);
            String str2 = entry.zza;
            HashMap hashMap2 = new HashMap();
            int size2 = entry.zzb.size();
            for (int i3 = 0; i3 < size2; i3++) {
                FieldMapPair fieldMapPair = entry.zzb.get(i3);
                hashMap2.put(fieldMapPair.zza, fieldMapPair.zzb);
            }
            hashMap.put(str2, hashMap2);
        }
        this.zzb = hashMap;
        LaunchUtils.zza(str);
        this.zzd = str;
        for (String str3 : hashMap.keySet()) {
            Map<String, FastJsonResponse.Field<?, ?>> map = this.zzb.get(str3);
            for (String str4 : map.keySet()) {
                map.get(str4).zzb = this;
            }
        }
    }
}
