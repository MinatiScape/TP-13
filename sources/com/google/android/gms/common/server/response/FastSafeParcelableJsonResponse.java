package com.google.android.gms.common.server.response;

import com.google.android.gms.common.server.response.FastJsonResponse;
import com.google.android.gms.internal.zzbkz;
/* loaded from: classes.dex */
public abstract class FastSafeParcelableJsonResponse extends FastJsonResponse implements zzbkz {
    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!getClass().isInstance(obj)) {
            return false;
        }
        FastJsonResponse fastJsonResponse = (FastJsonResponse) obj;
        for (FastJsonResponse.Field<?, ?> field : getFieldMappings().values()) {
            if (isFieldSet(field)) {
                if (!fastJsonResponse.isFieldSet(field) || !getFieldValue(field).equals(fastJsonResponse.getFieldValue(field))) {
                    return false;
                }
            } else if (fastJsonResponse.isFieldSet(field)) {
                return false;
            }
        }
        return true;
    }

    @Override // com.google.android.gms.common.server.response.FastJsonResponse
    public Object getValueObject() {
        return null;
    }

    @Override // com.google.android.gms.common.server.response.FastJsonResponse
    public boolean isPrimitiveFieldSet() {
        return false;
    }

    public final int hashCode() {
        int i = 0;
        for (FastJsonResponse.Field<?, ?> field : getFieldMappings().values()) {
            if (isFieldSet(field)) {
                i = getFieldValue(field).hashCode() + (i * 31);
            }
        }
        return i;
    }
}
