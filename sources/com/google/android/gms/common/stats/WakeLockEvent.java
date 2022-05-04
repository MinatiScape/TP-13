package com.google.android.gms.common.stats;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import androidx.slice.view.R$layout;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import java.util.List;
/* loaded from: classes.dex */
public final class WakeLockEvent extends StatsEvent {
    public static final Parcelable.Creator<WakeLockEvent> CREATOR = new zzd();
    public final int zza;
    public final long zzb;
    public int zzc;
    public final String zzd;
    public final String zze;
    public final String zzf;
    public final int zzg;
    public final List<String> zzh;
    public final String zzi;
    public final long zzj;
    public int zzk;
    public final String zzl;
    public final float zzm;
    public final long zzn;
    public long zzo = -1;

    public WakeLockEvent(int i, long j, int i2, String str, int i3, List<String> list, String str2, long j2, int i4, String str3, String str4, float f, long j3, String str5) {
        this.zza = i;
        this.zzb = j;
        this.zzc = i2;
        this.zzd = str;
        this.zze = str3;
        this.zzf = str5;
        this.zzg = i3;
        this.zzh = list;
        this.zzi = str2;
        this.zzj = j2;
        this.zzk = i4;
        this.zzl = str4;
        this.zzm = f;
        this.zzn = j3;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        int i2 = this.zza;
        R$layout.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        long j = this.zzb;
        R$layout.zzb(parcel, 2, 8);
        parcel.writeLong(j);
        R$layout.zza(parcel, 4, this.zzd, false);
        int i3 = this.zzg;
        R$layout.zzb(parcel, 5, 4);
        parcel.writeInt(i3);
        List<String> list = this.zzh;
        if (list != null) {
            int zzb2 = R$layout.zzb(parcel, 6);
            parcel.writeStringList(list);
            R$layout.zzc(parcel, zzb2);
        }
        long j2 = this.zzj;
        R$layout.zzb(parcel, 8, 8);
        parcel.writeLong(j2);
        R$layout.zza(parcel, 10, this.zze, false);
        int i4 = this.zzc;
        R$layout.zzb(parcel, 11, 4);
        parcel.writeInt(i4);
        R$layout.zza(parcel, 12, this.zzi, false);
        R$layout.zza(parcel, 13, this.zzl, false);
        int i5 = this.zzk;
        R$layout.zzb(parcel, 14, 4);
        parcel.writeInt(i5);
        float f = this.zzm;
        R$layout.zzb(parcel, 15, 4);
        parcel.writeFloat(f);
        long j3 = this.zzn;
        R$layout.zzb(parcel, 16, 8);
        parcel.writeLong(j3);
        R$layout.zza(parcel, 17, this.zzf, false);
        R$layout.zzc(parcel, zzb);
    }

    @Override // com.google.android.gms.common.stats.StatsEvent
    public final long zza() {
        return this.zzb;
    }

    @Override // com.google.android.gms.common.stats.StatsEvent
    public final int zzb() {
        return this.zzc;
    }

    @Override // com.google.android.gms.common.stats.StatsEvent
    public final long zzc() {
        return this.zzo;
    }

    @Override // com.google.android.gms.common.stats.StatsEvent
    public final String zzd() {
        String str = this.zzd;
        int i = this.zzg;
        List<String> list = this.zzh;
        String str2 = "";
        String join = list == null ? str2 : TextUtils.join(",", list);
        int i2 = this.zzk;
        String str3 = this.zze;
        if (str3 == null) {
            str3 = str2;
        }
        String str4 = this.zzl;
        if (str4 == null) {
            str4 = str2;
        }
        float f = this.zzm;
        String str5 = this.zzf;
        if (str5 != null) {
            str2 = str5;
        }
        StringBuilder sb = new StringBuilder(XMPPathFactory$$ExternalSyntheticOutline0.m(str2, XMPPathFactory$$ExternalSyntheticOutline0.m(str4, XMPPathFactory$$ExternalSyntheticOutline0.m(str3, XMPPathFactory$$ExternalSyntheticOutline0.m(join, XMPPathFactory$$ExternalSyntheticOutline0.m(str, 45))))));
        sb.append("\t");
        sb.append(str);
        sb.append("\t");
        sb.append(i);
        sb.append("\t");
        sb.append(join);
        sb.append("\t");
        sb.append(i2);
        sb.append("\t");
        sb.append(str3);
        sb.append("\t");
        sb.append(str4);
        sb.append("\t");
        sb.append(f);
        sb.append("\t");
        sb.append(str2);
        return sb.toString();
    }
}
