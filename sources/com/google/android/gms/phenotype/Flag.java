package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import androidx.appcompat.R$layout;
import androidx.cardview.R$style$$ExternalSyntheticOutline0;
import androidx.core.R$id;
import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
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

    public final String toString() {
        return toString(new StringBuilder());
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0066, code lost:
        if (r6 == r7) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x009b, code lost:
        if (r6 != false) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00a8, code lost:
        if (r6 == 0) goto L49;
     */
    @Override // java.lang.Comparable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int compareTo(com.google.android.gms.phenotype.Flag r7) {
        /*
            r6 = this;
            com.google.android.gms.phenotype.Flag r7 = (com.google.android.gms.phenotype.Flag) r7
            java.lang.String r0 = r6.name
            java.lang.String r1 = r7.name
            int r0 = r0.compareTo(r1)
            r1 = 0
            r2 = -1
            r3 = 1
            if (r0 == 0) goto L11
            goto Lad
        L11:
            int r0 = r6.flagValueType
            int r4 = r7.flagValueType
            if (r0 >= r4) goto L19
            r4 = r2
            goto L1e
        L19:
            if (r0 != r4) goto L1d
            r4 = r1
            goto L1e
        L1d:
            r4 = r3
        L1e:
            if (r4 == 0) goto L23
        L20:
            r0 = r4
            goto Lad
        L23:
            if (r0 == r3) goto L9e
            r4 = 2
            if (r0 == r4) goto L94
            r4 = 3
            if (r0 == r4) goto L8b
            r4 = 4
            if (r0 == r4) goto L79
            r4 = 5
            if (r0 != r4) goto L69
            byte[] r0 = r6.zze
            byte[] r4 = r7.zze
            if (r0 != r4) goto L39
            goto Laa
        L39:
            if (r0 != 0) goto L3d
            goto La6
        L3d:
            if (r4 != 0) goto L41
            goto Lac
        L41:
            r0 = r1
        L42:
            byte[] r4 = r6.zze
            int r4 = r4.length
            byte[] r5 = r7.zze
            int r5 = r5.length
            int r4 = java.lang.Math.min(r4, r5)
            if (r0 >= r4) goto L5d
            byte[] r4 = r6.zze
            r4 = r4[r0]
            byte[] r5 = r7.zze
            r5 = r5[r0]
            int r4 = r4 - r5
            if (r4 == 0) goto L5a
            goto L20
        L5a:
            int r0 = r0 + 1
            goto L42
        L5d:
            byte[] r6 = r6.zze
            int r6 = r6.length
            byte[] r7 = r7.zze
            int r7 = r7.length
            if (r6 >= r7) goto L66
            goto La6
        L66:
            if (r6 != r7) goto Lac
            goto Laa
        L69:
            java.lang.AssertionError r7 = new java.lang.AssertionError
            int r6 = r6.flagValueType
            r0 = 31
            java.lang.String r1 = "Invalid enum value: "
            java.lang.String r6 = androidx.cardview.R$style$$ExternalSyntheticOutline0.m(r0, r1, r6)
            r7.<init>(r6)
            throw r7
        L79:
            java.lang.String r6 = r6.zzd
            java.lang.String r7 = r7.zzd
            if (r6 != r7) goto L80
            goto Laa
        L80:
            if (r6 != 0) goto L83
            goto La6
        L83:
            if (r7 != 0) goto L86
            goto Lac
        L86:
            int r0 = r6.compareTo(r7)
            goto Lad
        L8b:
            double r0 = r6.zzc
            double r6 = r7.zzc
            int r0 = java.lang.Double.compare(r0, r6)
            goto Lad
        L94:
            boolean r6 = r6.zzb
            boolean r7 = r7.zzb
            if (r6 != r7) goto L9b
            goto Laa
        L9b:
            if (r6 == 0) goto La6
            goto Lac
        L9e:
            long r4 = r6.zza
            long r6 = r7.zza
            int r6 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1))
            if (r6 >= 0) goto La8
        La6:
            r0 = r2
            goto Lad
        La8:
            if (r6 != 0) goto Lac
        Laa:
            r0 = r1
            goto Lad
        Lac:
            r0 = r3
        Lad:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.phenotype.Flag.compareTo(java.lang.Object):int");
    }

    public final boolean equals(Object obj) {
        int i;
        if (obj instanceof Flag) {
            Flag flag = (Flag) obj;
            if (R$layout.zza(this.name, flag.name) && (i = this.flagValueType) == flag.flagValueType && this.flagStorageType == flag.flagStorageType) {
                if (i != 1) {
                    if (i != 2) {
                        if (i != 3) {
                            if (i == 4) {
                                return R$layout.zza(this.zzd, flag.zzd);
                            }
                            if (i == 5) {
                                return Arrays.equals(this.zze, flag.zze);
                            }
                            throw new AssertionError(R$style$$ExternalSyntheticOutline0.m(31, "Invalid enum value: ", this.flagValueType));
                        } else if (this.zzc == flag.zzc) {
                            return true;
                        } else {
                            return false;
                        }
                    } else if (this.zzb == flag.zzb) {
                        return true;
                    } else {
                        return false;
                    }
                } else if (this.zza == flag.zza) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        R$id.zza(parcel, 2, this.name);
        long j = this.zza;
        R$id.zzb(parcel, 3, 8);
        parcel.writeLong(j);
        boolean z = this.zzb;
        R$id.zzb(parcel, 4, 4);
        parcel.writeInt(z ? 1 : 0);
        double d = this.zzc;
        R$id.zzb(parcel, 5, 8);
        parcel.writeDouble(d);
        R$id.zza(parcel, 6, this.zzd);
        R$id.zza(parcel, 7, this.zze);
        int i2 = this.flagValueType;
        R$id.zzb(parcel, 8, 4);
        parcel.writeInt(i2);
        int i3 = this.flagStorageType;
        R$id.zzb(parcel, 9, 4);
        parcel.writeInt(i3);
        R$id.zzc(parcel, zzb);
    }

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

    public final String toString(StringBuilder sb) {
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
            StringBuilder sb2 = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(str, 27));
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
