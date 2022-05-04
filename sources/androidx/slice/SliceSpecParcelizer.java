package androidx.slice;

import androidx.versionedparcelable.VersionedParcel;
import java.util.Objects;
/* loaded from: classes.dex */
public final class SliceSpecParcelizer {
    public static SliceSpec read(VersionedParcel parcel) {
        SliceSpec sliceSpec = new SliceSpec();
        sliceSpec.mType = parcel.readString(sliceSpec.mType, 1);
        sliceSpec.mRevision = parcel.readInt(sliceSpec.mRevision, 2);
        return sliceSpec;
    }

    public static void write(SliceSpec obj, VersionedParcel parcel) {
        Objects.requireNonNull(parcel);
        String str = obj.mType;
        parcel.setOutputField(1);
        parcel.writeString(str);
        int i = obj.mRevision;
        if (1 != i) {
            parcel.setOutputField(2);
            parcel.writeInt(i);
        }
    }
}
