package com.google.android.gms.common.server.response;

import android.os.Parcel;
import android.util.Base64;
import androidx.core.R$id;
import com.google.android.gms.common.internal.zzam;
import com.google.android.gms.common.util.zzn;
import com.google.android.gms.internal.zzbkv;
import com.google.android.gms.internal.zzbly;
import com.google.android.gms.internal.zzbma;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class FastJsonResponse {

    /* loaded from: classes.dex */
    public static class Field<I, O> extends zzbkv {
        public static final FieldCreator CREATOR = new FieldCreator();
        public final Class<? extends FastJsonResponse> mConcreteType;
        public final String mConcreteTypeName;
        public final String mOutputFieldName;
        public final int mSafeParcelableFieldId;
        public final int mTypeIn;
        public final boolean mTypeInArray;
        public final int mTypeOut;
        public final boolean mTypeOutArray;
        public final int zza;
        public FieldMappingDictionary zzb;
        public zzbma zzc;

        public final String toString() {
            zzam zzamVar = new zzam(this, 0);
            zzamVar.zza("versionCode", Integer.valueOf(this.zza));
            zzamVar.zza("typeIn", Integer.valueOf(this.mTypeIn));
            zzamVar.zza("typeInArray", Boolean.valueOf(this.mTypeInArray));
            zzamVar.zza("typeOut", Integer.valueOf(this.mTypeOut));
            zzamVar.zza("typeOutArray", Boolean.valueOf(this.mTypeOutArray));
            zzamVar.zza("outputFieldName", this.mOutputFieldName);
            zzamVar.zza("safeParcelFieldId", Integer.valueOf(this.mSafeParcelableFieldId));
            String str = this.mConcreteTypeName;
            if (str == null) {
                str = null;
            }
            zzamVar.zza("concreteTypeName", str);
            Class<? extends FastJsonResponse> cls = this.mConcreteType;
            if (cls != null) {
                zzamVar.zza("concreteType.class", cls.getCanonicalName());
            }
            if (this.zzc != null) {
                zzamVar.zza("converterName", zzbma.class.getCanonicalName());
            }
            return zzamVar.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            int zzb = R$id.zzb(parcel, 20293);
            int i2 = this.zza;
            R$id.zzb(parcel, 1, 4);
            parcel.writeInt(i2);
            int i3 = this.mTypeIn;
            R$id.zzb(parcel, 2, 4);
            parcel.writeInt(i3);
            boolean z = this.mTypeInArray;
            R$id.zzb(parcel, 3, 4);
            parcel.writeInt(z ? 1 : 0);
            int i4 = this.mTypeOut;
            R$id.zzb(parcel, 4, 4);
            parcel.writeInt(i4);
            boolean z2 = this.mTypeOutArray;
            R$id.zzb(parcel, 5, 4);
            parcel.writeInt(z2 ? 1 : 0);
            R$id.zza(parcel, 6, this.mOutputFieldName);
            int i5 = this.mSafeParcelableFieldId;
            R$id.zzb(parcel, 7, 4);
            parcel.writeInt(i5);
            String str = this.mConcreteTypeName;
            zzbly zzblyVar = null;
            if (str == null) {
                str = null;
            }
            R$id.zza(parcel, 8, str);
            zzbma zzbmaVar = this.zzc;
            if (zzbmaVar != null) {
                zzblyVar = new zzbly(zzbmaVar);
            }
            R$id.zza(parcel, 9, zzblyVar, i);
            R$id.zzc(parcel, zzb);
        }

        public Field(int i, int i2, boolean z, int i3, boolean z2, String str, int i4, String str2, zzbly zzblyVar) {
            this.zza = i;
            this.mTypeIn = i2;
            this.mTypeInArray = z;
            this.mTypeOut = i3;
            this.mTypeOutArray = z2;
            this.mOutputFieldName = str;
            this.mSafeParcelableFieldId = i4;
            if (str2 == null) {
                this.mConcreteType = null;
                this.mConcreteTypeName = null;
            } else {
                this.mConcreteType = zzl.class;
                this.mConcreteTypeName = str2;
            }
            if (zzblyVar == null) {
                this.zzc = null;
                return;
            }
            zzbma zzbmaVar = zzblyVar.zzb;
            if (zzbmaVar != null) {
                this.zzc = zzbmaVar;
                return;
            }
            throw new IllegalStateException("There was no converter wrapped in this ConverterWrapper.");
        }
    }

    public abstract Map<String, Field<?, ?>> getFieldMappings();

    public abstract Object getValueObject();

    public abstract boolean isPrimitiveFieldSet();

    public static Object getOriginalValue(Field field, Object obj) {
        zzbma zzbmaVar = field.zzc;
        if (zzbmaVar == null) {
            return obj;
        }
        String str = zzbmaVar.zzc.get(((Integer) obj).intValue());
        if (str != null || !zzbmaVar.zzb.containsKey("gms_unknown")) {
            return str;
        }
        return "gms_unknown";
    }

    public static void zza(StringBuilder sb, Field field, Object obj) {
        int i = field.mTypeIn;
        if (i == 11) {
            sb.append(field.mConcreteType.cast(obj).toString());
        } else if (i == 7) {
            sb.append("\"");
            sb.append(zzn.zzb((String) obj));
            sb.append("\"");
        } else {
            sb.append(obj);
        }
    }

    public final Object getFieldValue(Field field) {
        boolean z;
        String str = field.mOutputFieldName;
        if (field.mConcreteType == null) {
            return getValueObject();
        }
        if (getValueObject() == null) {
            z = true;
        } else {
            z = false;
        }
        Object[] objArr = {field.mOutputFieldName};
        if (z) {
            try {
                char upperCase = Character.toUpperCase(str.charAt(0));
                String substring = str.substring(1);
                StringBuilder sb = new StringBuilder(String.valueOf(substring).length() + 4);
                sb.append("get");
                sb.append(upperCase);
                sb.append(substring);
                return getClass().getMethod(sb.toString(), new Class[0]).invoke(this, new Object[0]);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            throw new IllegalStateException(String.format("Concrete field shouldn't be value object: %s", objArr));
        }
    }

    public final boolean isFieldSet(Field field) {
        if (field.mTypeOut != 11) {
            return isPrimitiveFieldSet();
        }
        if (field.mTypeOutArray) {
            throw new UnsupportedOperationException("Concrete type arrays not supported");
        }
        throw new UnsupportedOperationException("Concrete types not supported");
    }

    public String toString() {
        Map<String, Field<?, ?>> fieldMappings = getFieldMappings();
        StringBuilder sb = new StringBuilder(100);
        for (String str : fieldMappings.keySet()) {
            Field<?, ?> field = fieldMappings.get(str);
            if (isFieldSet(field)) {
                Object originalValue = getOriginalValue(field, getFieldValue(field));
                if (sb.length() == 0) {
                    sb.append("{");
                } else {
                    sb.append(",");
                }
                sb.append("\"");
                sb.append(str);
                sb.append("\":");
                if (originalValue != null) {
                    switch (field.mTypeOut) {
                        case 8:
                            sb.append("\"");
                            sb.append(Base64.encodeToString((byte[]) originalValue, 0));
                            sb.append("\"");
                            continue;
                        case 9:
                            sb.append("\"");
                            sb.append(Base64.encodeToString((byte[]) originalValue, 10));
                            sb.append("\"");
                            continue;
                        case 10:
                            androidx.appcompat.R$id.zza(sb, (HashMap) originalValue);
                            continue;
                        default:
                            if (!field.mTypeInArray) {
                                zza(sb, field, originalValue);
                                break;
                            } else {
                                ArrayList arrayList = (ArrayList) originalValue;
                                sb.append("[");
                                int size = arrayList.size();
                                for (int i = 0; i < size; i++) {
                                    if (i > 0) {
                                        sb.append(",");
                                    }
                                    Object obj = arrayList.get(i);
                                    if (obj != null) {
                                        zza(sb, field, obj);
                                    }
                                }
                                sb.append("]");
                                continue;
                            }
                    }
                } else {
                    sb.append("null");
                }
            }
        }
        if (sb.length() > 0) {
            sb.append("}");
        } else {
            sb.append("{}");
        }
        return sb.toString();
    }
}
