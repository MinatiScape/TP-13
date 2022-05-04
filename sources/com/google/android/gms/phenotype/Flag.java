package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import androidx.appcompat.R$dimen;
import androidx.fragment.R$id$$ExternalSyntheticOutline0;
import androidx.slice.view.R$layout;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import com.google.android.gms.internal.zzbkv;
import java.util.Arrays;
/* loaded from: classes.dex */
public class Flag extends zzbkv implements Comparable<Flag> {
    public static final Parcelable.Creator<Flag> CREATOR = new zzk();
    public final int flagStorageType;
    public final int flagValueType;
    public final String name;
    public final long zza;
    public final boolean zzb;
    public final double zzc;
    public final String zzd;
    public final byte[] zze;

    public Flag(String str, long j, boolean z, double d, String str2, byte[] bArr, int i, int i2) {
        this.name = str;
        this.zza = j;
        this.zzb = z;
        this.zzc = d;
        this.zzd = str2;
        this.zze = bArr;
        this.flagValueType = i;
        this.flagStorageType = i2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0066, code lost:
        if (r7 == r8) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x009b, code lost:
        if (r7 != false) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00a8, code lost:
        if (r7 == 0) goto L49;
     */
    @Override // java.lang.Comparable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int compareTo(com.google.android.gms.phenotype.Flag r8) {
        /*
            r7 = this;
            com.google.android.gms.phenotype.Flag r8 = (com.google.android.gms.phenotype.Flag) r8
            java.lang.String r0 = r7.name
            java.lang.String r1 = r8.name
            int r0 = r0.compareTo(r1)
            r1 = 1
            if (r0 == 0) goto Lf
            goto Lad
        Lf:
            int r0 = r7.flagValueType
            int r2 = r8.flagValueType
            r3 = -1
            r4 = 0
            if (r0 >= r2) goto L19
            r2 = r3
            goto L1e
        L19:
            if (r0 != r2) goto L1d
            r2 = r4
            goto L1e
        L1d:
            r2 = r1
        L1e:
            if (r2 == 0) goto L23
        L20:
            r0 = r2
            goto Lad
        L23:
            if (r0 == r1) goto L9e
            r2 = 2
            if (r0 == r2) goto L94
            r2 = 3
            if (r0 == r2) goto L8b
            r2 = 4
            if (r0 == r2) goto L79
            r2 = 5
            if (r0 != r2) goto L69
            byte[] r0 = r7.zze
            byte[] r2 = r8.zze
            if (r0 != r2) goto L39
            goto Laa
        L39:
            if (r0 != 0) goto L3d
            goto La6
        L3d:
            if (r2 != 0) goto L41
            goto Lac
        L41:
            r0 = r4
        L42:
            byte[] r2 = r7.zze
            int r2 = r2.length
            byte[] r5 = r8.zze
            int r5 = r5.length
            int r2 = java.lang.Math.min(r2, r5)
            if (r0 >= r2) goto L5d
            byte[] r2 = r7.zze
            r2 = r2[r0]
            byte[] r5 = r8.zze
            r5 = r5[r0]
            int r2 = r2 - r5
            if (r2 == 0) goto L5a
            goto L20
        L5a:
            int r0 = r0 + 1
            goto L42
        L5d:
            byte[] r7 = r7.zze
            int r7 = r7.length
            byte[] r8 = r8.zze
            int r8 = r8.length
            if (r7 >= r8) goto L66
            goto La6
        L66:
            if (r7 != r8) goto Lac
            goto Laa
        L69:
            java.lang.AssertionError r8 = new java.lang.AssertionError
            int r7 = r7.flagValueType
            r0 = 31
            java.lang.String r1 = "Invalid enum value: "
            java.lang.String r7 = androidx.fragment.R$id$$ExternalSyntheticOutline0.m(r0, r1, r7)
            r8.<init>(r7)
            throw r8
        L79:
            java.lang.String r7 = r7.zzd
            java.lang.String r8 = r8.zzd
            if (r7 != r8) goto L80
            goto Laa
        L80:
            if (r7 != 0) goto L83
            goto La6
        L83:
            if (r8 != 0) goto L86
            goto Lac
        L86:
            int r0 = r7.compareTo(r8)
            goto Lad
        L8b:
            double r0 = r7.zzc
            double r7 = r8.zzc
            int r0 = java.lang.Double.compare(r0, r7)
            goto Lad
        L94:
            boolean r7 = r7.zzb
            boolean r8 = r8.zzb
            if (r7 != r8) goto L9b
            goto Laa
        L9b:
            if (r7 == 0) goto La6
            goto Lac
        L9e:
            long r5 = r7.zza
            long r7 = r8.zza
            int r7 = (r5 > r7 ? 1 : (r5 == r7 ? 0 : -1))
            if (r7 >= 0) goto La8
        La6:
            r0 = r3
            goto Lad
        La8:
            if (r7 != 0) goto Lac
        Laa:
            r0 = r4
            goto Lad
        Lac:
            r0 = r1
        Lad:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.phenotype.Flag.compareTo(java.lang.Object):int");
    }

    public boolean equals(Object obj) {
        int i;
        if (obj instanceof Flag) {
            Flag flag = (Flag) obj;
            if (R$dimen.zza(this.name, flag.name) && (i = this.flagValueType) == flag.flagValueType && this.flagStorageType == flag.flagStorageType) {
                if (i != 1) {
                    if (i == 2) {
                        return this.zzb == flag.zzb;
                    }
                    if (i == 3) {
                        return this.zzc == flag.zzc;
                    }
                    if (i == 4) {
                        return R$dimen.zza(this.zzd, flag.zzd);
                    }
                    if (i == 5) {
                        return Arrays.equals(this.zze, flag.zze);
                    }
                    throw new AssertionError(R$id$$ExternalSyntheticOutline0.m(31, "Invalid enum value: ", this.flagValueType));
                } else if (this.zza == flag.zza) {
                    return true;
                }
            }
        }
        return false;
    }

    public String toString() {
        return toString(new StringBuilder());
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        R$layout.zza(parcel, 2, this.name, false);
        long j = this.zza;
        R$layout.zzb(parcel, 3, 8);
        parcel.writeLong(j);
        boolean z = this.zzb;
        R$layout.zzb(parcel, 4, 4);
        parcel.writeInt(z ? 1 : 0);
        double d = this.zzc;
        R$layout.zzb(parcel, 5, 8);
        parcel.writeDouble(d);
        R$layout.zza(parcel, 6, this.zzd, false);
        R$layout.zza(parcel, 7, this.zze, false);
        int i2 = this.flagValueType;
        R$layout.zzb(parcel, 8, 4);
        parcel.writeInt(i2);
        int i3 = this.flagStorageType;
        R$layout.zzb(parcel, 9, 4);
        parcel.writeInt(i3);
        R$layout.zzc(parcel, zzb);
    }

    public String toString(StringBuilder sb) {
        sb.append("Flag(");
        sb.append(this.name);
        sb.append(", ");
        int i = this.flagValueType;
        if (i == 1) {
            sb.append(this.zza);
        } else if (i == 2) {
            sb.append(this.zzb);
        } else if (i == 3) {
            sb.append(this.zzc);
        } else if (i == 4) {
            sb.append("'");
            sb.append(this.zzd);
            sb.append("'");
        } else if (i != 5) {
            String str = this.name;
            int i2 = this.flagValueType;
            StringBuilder sb2 = new StringBuilder(XMPPathFactory$$ExternalSyntheticOutline0.m(str, 27));
            sb2.append("Invalid type: ");
            sb2.append(str);
            sb2.append(", ");
            sb2.append(i2);
            throw new AssertionError(sb2.toString());
        } else if (this.zze == null) {
            sb.append("null");
        } else {
            sb.append("'");
            sb.append(Base64.encodeToString(this.zze, 3));
            sb.append("'");
        }
        sb.append(", ");
        sb.append(this.flagValueType);
        sb.append(", ");
        sb.append(this.flagStorageType);
        sb.append(")");
        return sb.toString();
    }
}
