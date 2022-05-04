package com.google.android.gms.common.server.response;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import android.util.SparseArray;
import androidx.cardview.R$style$$ExternalSyntheticOutline0;
import androidx.core.R$id;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.gms.common.server.response.FastJsonResponse;
import com.google.android.gms.common.util.zzn;
import com.google.android.gms.internal.zzbkw;
import com.google.android.gms.internal.zzbkx;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
/* compiled from: SafeParcelResponse.java */
/* loaded from: classes.dex */
public class zzl extends FastSafeParcelableJsonResponse {
    public static final Parcelable.Creator<zzl> CREATOR = new zzm();
    public final int zza;
    public final Parcel zzb;
    public final int zzc = 2;
    public final FieldMappingDictionary zzd;
    public final String zze;
    public int zzf;
    public int zzg;

    /* JADX WARN: Code restructure failed: missing block: B:5:0x0005, code lost:
        if (r0 != 1) goto L8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.os.Parcel zza() {
        /*
            r2 = this;
            int r0 = r2.zzf
            if (r0 == 0) goto L8
            r1 = 1
            if (r0 == r1) goto L12
            goto L1c
        L8:
            android.os.Parcel r0 = r2.zzb
            r1 = 20293(0x4f45, float:2.8437E-41)
            int r0 = androidx.core.R$id.zzb(r0, r1)
            r2.zzg = r0
        L12:
            android.os.Parcel r0 = r2.zzb
            int r1 = r2.zzg
            androidx.core.R$id.zzc(r0, r1)
            r0 = 2
            r2.zzf = r0
        L1c:
            android.os.Parcel r2 = r2.zzb
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.common.server.response.zzl.zza():android.os.Parcel");
    }

    private static void zza$1(StringBuilder sb, FastJsonResponse.Field field, Object obj) {
        if (field.mTypeInArray) {
            ArrayList arrayList = (ArrayList) obj;
            sb.append("[");
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                if (i != 0) {
                    sb.append(",");
                }
                zza(sb, field.mTypeIn, arrayList.get(i));
            }
            sb.append("]");
            return;
        }
        zza(sb, field.mTypeIn, obj);
    }

    @Override // com.google.android.gms.common.server.response.FastJsonResponse
    public final Map<String, FastJsonResponse.Field<?, ?>> getFieldMappings() {
        FieldMappingDictionary fieldMappingDictionary = this.zzd;
        if (fieldMappingDictionary == null) {
            return null;
        }
        return fieldMappingDictionary.zzb.get(this.zze);
    }

    @Override // com.google.android.gms.common.server.response.FastSafeParcelableJsonResponse, com.google.android.gms.common.server.response.FastJsonResponse
    public final Object getValueObject() {
        throw new UnsupportedOperationException("Converting to JSON does not require this method.");
    }

    @Override // com.google.android.gms.common.server.response.FastSafeParcelableJsonResponse, com.google.android.gms.common.server.response.FastJsonResponse
    public final boolean isPrimitiveFieldSet() {
        throw new UnsupportedOperationException("Converting to JSON does not require this method.");
    }

    @Override // com.google.android.gms.common.server.response.FastJsonResponse
    public final String toString() {
        LaunchUtils.zza(this.zzd, "Cannot convert to JSON on client side.");
        Parcel zza = zza();
        zza.setDataPosition(0);
        StringBuilder sb = new StringBuilder(100);
        FieldMappingDictionary fieldMappingDictionary = this.zzd;
        zza(sb, fieldMappingDictionary.zzb.get(this.zze), zza);
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        FieldMappingDictionary fieldMappingDictionary;
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zza;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        Parcel zza = zza();
        if (zza != null) {
            int zzb2 = R$id.zzb(parcel, 2);
            parcel.appendFrom(zza, 0, zza.dataSize());
            R$id.zzc(parcel, zzb2);
        }
        int i3 = this.zzc;
        if (i3 == 0) {
            fieldMappingDictionary = null;
        } else if (i3 == 1) {
            fieldMappingDictionary = this.zzd;
        } else if (i3 == 2) {
            fieldMappingDictionary = this.zzd;
        } else {
            throw new IllegalStateException(R$style$$ExternalSyntheticOutline0.m(34, "Invalid creation type: ", this.zzc));
        }
        R$id.zza(parcel, 3, fieldMappingDictionary, i);
        R$id.zzc(parcel, zzb);
    }

    public zzl(int i, Parcel parcel, FieldMappingDictionary fieldMappingDictionary) {
        this.zza = i;
        LaunchUtils.zza(parcel);
        this.zzb = parcel;
        this.zzd = fieldMappingDictionary;
        if (fieldMappingDictionary == null) {
            this.zze = null;
        } else {
            this.zze = fieldMappingDictionary.zzd;
        }
        this.zzf = 2;
    }

    public static void zza(StringBuilder sb, Map map, Parcel parcel) {
        SparseArray sparseArray = new SparseArray();
        for (Map.Entry entry : map.entrySet()) {
            sparseArray.put(((FastJsonResponse.Field) entry.getValue()).mSafeParcelableFieldId, entry);
        }
        sb.append('{');
        int zza = zzbkw.zza(parcel);
        boolean z = false;
        while (parcel.dataPosition() < zza) {
            int readInt = parcel.readInt();
            Map.Entry entry2 = (Map.Entry) sparseArray.get(65535 & readInt);
            if (entry2 != null) {
                if (z) {
                    sb.append(",");
                }
                FastJsonResponse.Field field = (FastJsonResponse.Field) entry2.getValue();
                sb.append("\"");
                sb.append((String) entry2.getKey());
                sb.append("\":");
                BigInteger bigInteger = null;
                BigInteger bigInteger2 = null;
                Parcel[] parcelArr = null;
                boolean[] zArr = null;
                BigDecimal[] bigDecimalArr = null;
                double[] dArr = null;
                float[] fArr = null;
                long[] jArr = null;
                BigInteger[] bigIntegerArr = null;
                Parcel parcel2 = null;
                String str = null;
                String str2 = null;
                if (field.zzc != null) {
                    switch (field.mTypeOut) {
                        case 0:
                            zza$1(sb, field, FastJsonResponse.getOriginalValue(field, Integer.valueOf(zzbkw.zzg(parcel, readInt))));
                            break;
                        case 1:
                            int zza2 = zzbkw.zza(parcel, readInt);
                            int dataPosition = parcel.dataPosition();
                            if (zza2 != 0) {
                                byte[] createByteArray = parcel.createByteArray();
                                parcel.setDataPosition(dataPosition + zza2);
                                bigInteger2 = new BigInteger(createByteArray);
                            }
                            zza$1(sb, field, FastJsonResponse.getOriginalValue(field, bigInteger2));
                            break;
                        case 2:
                            zza$1(sb, field, FastJsonResponse.getOriginalValue(field, Long.valueOf(zzbkw.zzi(parcel, readInt))));
                            break;
                        case 3:
                            zzbkw.zza(parcel, readInt, 4);
                            zza$1(sb, field, FastJsonResponse.getOriginalValue(field, Float.valueOf(parcel.readFloat())));
                            break;
                        case 4:
                            zzbkw.zza(parcel, readInt, 8);
                            zza$1(sb, field, FastJsonResponse.getOriginalValue(field, Double.valueOf(parcel.readDouble())));
                            break;
                        case 5:
                            zza$1(sb, field, FastJsonResponse.getOriginalValue(field, zzbkw.zzp(parcel, readInt)));
                            break;
                        case 6:
                            zza$1(sb, field, FastJsonResponse.getOriginalValue(field, Boolean.valueOf(zzbkw.zzc(parcel, readInt))));
                            break;
                        case 7:
                            zza$1(sb, field, FastJsonResponse.getOriginalValue(field, zzbkw.zzq(parcel, readInt)));
                            break;
                        case 8:
                        case 9:
                            zza$1(sb, field, FastJsonResponse.getOriginalValue(field, zzbkw.zzt(parcel, readInt)));
                            break;
                        case 10:
                            Bundle zzs = zzbkw.zzs(parcel, readInt);
                            HashMap hashMap = new HashMap();
                            for (String str3 : zzs.keySet()) {
                                hashMap.put(str3, zzs.getString(str3));
                            }
                            zza$1(sb, field, FastJsonResponse.getOriginalValue(field, hashMap));
                            break;
                        case 11:
                            throw new IllegalArgumentException("Method does not accept concrete type.");
                        default:
                            throw new IllegalArgumentException(R$style$$ExternalSyntheticOutline0.m(36, "Unknown field out type = ", field.mTypeOut));
                    }
                } else if (field.mTypeOutArray) {
                    sb.append("[");
                    switch (field.mTypeOut) {
                        case 0:
                            int[] zzw = zzbkw.zzw(parcel, readInt);
                            int length = zzw.length;
                            for (int i = 0; i < length; i++) {
                                if (i != 0) {
                                    sb.append(",");
                                }
                                sb.append(Integer.toString(zzw[i]));
                            }
                            break;
                        case 1:
                            int zza3 = zzbkw.zza(parcel, readInt);
                            int dataPosition2 = parcel.dataPosition();
                            if (zza3 != 0) {
                                int readInt2 = parcel.readInt();
                                bigIntegerArr = new BigInteger[readInt2];
                                for (int i2 = 0; i2 < readInt2; i2++) {
                                    bigIntegerArr[i2] = new BigInteger(parcel.createByteArray());
                                }
                                parcel.setDataPosition(dataPosition2 + zza3);
                            }
                            int length2 = bigIntegerArr.length;
                            for (int i3 = 0; i3 < length2; i3++) {
                                if (i3 != 0) {
                                    sb.append(",");
                                }
                                sb.append(bigIntegerArr[i3].toString());
                            }
                            break;
                        case 2:
                            int zza4 = zzbkw.zza(parcel, readInt);
                            int dataPosition3 = parcel.dataPosition();
                            if (zza4 != 0) {
                                jArr = parcel.createLongArray();
                                parcel.setDataPosition(dataPosition3 + zza4);
                            }
                            int length3 = jArr.length;
                            for (int i4 = 0; i4 < length3; i4++) {
                                if (i4 != 0) {
                                    sb.append(",");
                                }
                                sb.append(Long.toString(jArr[i4]));
                            }
                            break;
                        case 3:
                            int zza5 = zzbkw.zza(parcel, readInt);
                            int dataPosition4 = parcel.dataPosition();
                            if (zza5 != 0) {
                                fArr = parcel.createFloatArray();
                                parcel.setDataPosition(dataPosition4 + zza5);
                            }
                            int length4 = fArr.length;
                            for (int i5 = 0; i5 < length4; i5++) {
                                if (i5 != 0) {
                                    sb.append(",");
                                }
                                sb.append(Float.toString(fArr[i5]));
                            }
                            break;
                        case 4:
                            int zza6 = zzbkw.zza(parcel, readInt);
                            int dataPosition5 = parcel.dataPosition();
                            if (zza6 != 0) {
                                dArr = parcel.createDoubleArray();
                                parcel.setDataPosition(dataPosition5 + zza6);
                            }
                            int length5 = dArr.length;
                            for (int i6 = 0; i6 < length5; i6++) {
                                if (i6 != 0) {
                                    sb.append(",");
                                }
                                sb.append(Double.toString(dArr[i6]));
                            }
                            break;
                        case 5:
                            int zza7 = zzbkw.zza(parcel, readInt);
                            int dataPosition6 = parcel.dataPosition();
                            if (zza7 != 0) {
                                int readInt3 = parcel.readInt();
                                bigDecimalArr = new BigDecimal[readInt3];
                                for (int i7 = 0; i7 < readInt3; i7++) {
                                    bigDecimalArr[i7] = new BigDecimal(new BigInteger(parcel.createByteArray()), parcel.readInt());
                                }
                                parcel.setDataPosition(dataPosition6 + zza7);
                            }
                            int length6 = bigDecimalArr.length;
                            for (int i8 = 0; i8 < length6; i8++) {
                                if (i8 != 0) {
                                    sb.append(",");
                                }
                                sb.append(bigDecimalArr[i8].toString());
                            }
                            break;
                        case 6:
                            int zza8 = zzbkw.zza(parcel, readInt);
                            int dataPosition7 = parcel.dataPosition();
                            if (zza8 != 0) {
                                zArr = parcel.createBooleanArray();
                                parcel.setDataPosition(dataPosition7 + zza8);
                            }
                            int length7 = zArr.length;
                            for (int i9 = 0; i9 < length7; i9++) {
                                if (i9 != 0) {
                                    sb.append(",");
                                }
                                sb.append(Boolean.toString(zArr[i9]));
                            }
                            break;
                        case 7:
                            String[] zzaa = zzbkw.zzaa(parcel, readInt);
                            int length8 = zzaa.length;
                            for (int i10 = 0; i10 < length8; i10++) {
                                if (i10 != 0) {
                                    sb.append(",");
                                }
                                sb.append("\"");
                                sb.append(zzaa[i10]);
                                sb.append("\"");
                            }
                            break;
                        case 8:
                        case 9:
                        case 10:
                            throw new UnsupportedOperationException("List of type BASE64, BASE64_URL_SAFE, or STRING_MAP is not supported");
                        case 11:
                            int zza9 = zzbkw.zza(parcel, readInt);
                            int dataPosition8 = parcel.dataPosition();
                            if (zza9 != 0) {
                                int readInt4 = parcel.readInt();
                                Parcel[] parcelArr2 = new Parcel[readInt4];
                                for (int i11 = 0; i11 < readInt4; i11++) {
                                    int readInt5 = parcel.readInt();
                                    if (readInt5 != 0) {
                                        int dataPosition9 = parcel.dataPosition();
                                        Parcel obtain = Parcel.obtain();
                                        obtain.appendFrom(parcel, dataPosition9, readInt5);
                                        parcelArr2[i11] = obtain;
                                        parcel.setDataPosition(dataPosition9 + readInt5);
                                    } else {
                                        parcelArr2[i11] = null;
                                    }
                                }
                                parcel.setDataPosition(dataPosition8 + zza9);
                                parcelArr = parcelArr2;
                            }
                            int length9 = parcelArr.length;
                            for (int i12 = 0; i12 < length9; i12++) {
                                if (i12 > 0) {
                                    sb.append(",");
                                }
                                parcelArr[i12].setDataPosition(0);
                                LaunchUtils.zza(field.mConcreteTypeName);
                                LaunchUtils.zza(field.zzb);
                                zza(sb, field.zzb.zzb.get(field.mConcreteTypeName), parcelArr[i12]);
                            }
                            break;
                        default:
                            throw new IllegalStateException("Unknown field type out.");
                    }
                    sb.append("]");
                } else {
                    switch (field.mTypeOut) {
                        case 0:
                            sb.append(zzbkw.zzg(parcel, readInt));
                            break;
                        case 1:
                            int zza10 = zzbkw.zza(parcel, readInt);
                            int dataPosition10 = parcel.dataPosition();
                            if (zza10 != 0) {
                                byte[] createByteArray2 = parcel.createByteArray();
                                parcel.setDataPosition(dataPosition10 + zza10);
                                bigInteger = new BigInteger(createByteArray2);
                            }
                            sb.append(bigInteger);
                            break;
                        case 2:
                            sb.append(zzbkw.zzi(parcel, readInt));
                            break;
                        case 3:
                            zzbkw.zza(parcel, readInt, 4);
                            sb.append(parcel.readFloat());
                            break;
                        case 4:
                            zzbkw.zza(parcel, readInt, 8);
                            sb.append(parcel.readDouble());
                            break;
                        case 5:
                            sb.append(zzbkw.zzp(parcel, readInt));
                            break;
                        case 6:
                            sb.append(zzbkw.zzc(parcel, readInt));
                            break;
                        case 7:
                            String zzq = zzbkw.zzq(parcel, readInt);
                            sb.append("\"");
                            sb.append(zzn.zzb(zzq));
                            sb.append("\"");
                            break;
                        case 8:
                            byte[] zzt = zzbkw.zzt(parcel, readInt);
                            sb.append("\"");
                            if (zzt != null) {
                                str2 = Base64.encodeToString(zzt, 0);
                            }
                            sb.append(str2);
                            sb.append("\"");
                            break;
                        case 9:
                            byte[] zzt2 = zzbkw.zzt(parcel, readInt);
                            sb.append("\"");
                            if (zzt2 != null) {
                                str = Base64.encodeToString(zzt2, 10);
                            }
                            sb.append(str);
                            sb.append("\"");
                            break;
                        case 10:
                            Bundle zzs2 = zzbkw.zzs(parcel, readInt);
                            Set<String> keySet = zzs2.keySet();
                            keySet.size();
                            sb.append("{");
                            boolean z2 = true;
                            for (String str4 : keySet) {
                                if (!z2) {
                                    sb.append(",");
                                }
                                sb.append("\"");
                                sb.append(str4);
                                sb.append("\"");
                                sb.append(":");
                                sb.append("\"");
                                sb.append(zzn.zzb(zzs2.getString(str4)));
                                sb.append("\"");
                                z2 = false;
                            }
                            sb.append("}");
                            break;
                        case 11:
                            int zza11 = zzbkw.zza(parcel, readInt);
                            int dataPosition11 = parcel.dataPosition();
                            if (zza11 != 0) {
                                parcel2 = Parcel.obtain();
                                parcel2.appendFrom(parcel, dataPosition11, zza11);
                                parcel.setDataPosition(dataPosition11 + zza11);
                            }
                            parcel2.setDataPosition(0);
                            LaunchUtils.zza(field.mConcreteTypeName);
                            LaunchUtils.zza(field.zzb);
                            zza(sb, field.zzb.zzb.get(field.mConcreteTypeName), parcel2);
                            break;
                        default:
                            throw new IllegalStateException("Unknown field type out");
                    }
                }
                z = true;
            }
        }
        if (parcel.dataPosition() == zza) {
            sb.append('}');
            return;
        }
        throw new zzbkx(R$style$$ExternalSyntheticOutline0.m(37, "Overread allowed size end=", zza), parcel);
    }

    public static void zza(StringBuilder sb, int i, Object obj) {
        String str = null;
        switch (i) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
                sb.append(obj);
                return;
            case 7:
                sb.append("\"");
                sb.append(zzn.zzb(obj.toString()));
                sb.append("\"");
                return;
            case 8:
                sb.append("\"");
                byte[] bArr = (byte[]) obj;
                if (bArr != null) {
                    str = Base64.encodeToString(bArr, 0);
                }
                sb.append(str);
                sb.append("\"");
                return;
            case 9:
                sb.append("\"");
                byte[] bArr2 = (byte[]) obj;
                if (bArr2 != null) {
                    str = Base64.encodeToString(bArr2, 10);
                }
                sb.append(str);
                sb.append("\"");
                return;
            case 10:
                androidx.appcompat.R$id.zza(sb, (HashMap) obj);
                return;
            case 11:
                throw new IllegalArgumentException("Method does not accept concrete type.");
            default:
                throw new IllegalArgumentException(R$style$$ExternalSyntheticOutline0.m(26, "Unknown type = ", i));
        }
    }
}
