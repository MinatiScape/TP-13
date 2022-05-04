package androidx.slice;

import android.os.Bundle;
import android.os.Parcelable;
import androidx.slice.SliceItemHolder;
import androidx.versionedparcelable.VersionedParcel;
import androidx.versionedparcelable.VersionedParcelable;
import java.util.ArrayList;
import java.util.Objects;
/* loaded from: classes.dex */
public final class SliceItemHolderParcelizer {
    private static SliceItemHolder.SliceItemPool sBuilder = new SliceItemHolder.SliceItemPool();

    public static SliceItemHolder read(VersionedParcel parcel) {
        SliceItemHolder sliceItemHolder;
        SliceItemHolder.SliceItemPool sliceItemPool = sBuilder;
        if (sliceItemPool.mCached.size() > 0) {
            ArrayList<SliceItemHolder> arrayList = sliceItemPool.mCached;
            sliceItemHolder = arrayList.remove(arrayList.size() - 1);
        } else {
            sliceItemHolder = new SliceItemHolder(sliceItemPool);
        }
        sliceItemHolder.mVersionedParcelable = parcel.readVersionedParcelable(sliceItemHolder.mVersionedParcelable, 1);
        sliceItemHolder.mParcelable = parcel.readParcelable(sliceItemHolder.mParcelable, 2);
        sliceItemHolder.mStr = parcel.readString(sliceItemHolder.mStr, 3);
        sliceItemHolder.mInt = parcel.readInt(sliceItemHolder.mInt, 4);
        long j = sliceItemHolder.mLong;
        if (parcel.readField(5)) {
            j = parcel.readLong();
        }
        sliceItemHolder.mLong = j;
        Bundle bundle = sliceItemHolder.mBundle;
        if (parcel.readField(6)) {
            bundle = parcel.readBundle();
        }
        sliceItemHolder.mBundle = bundle;
        return sliceItemHolder;
    }

    public static void write(SliceItemHolder obj, VersionedParcel parcel) {
        Objects.requireNonNull(parcel);
        VersionedParcelable versionedParcelable = obj.mVersionedParcelable;
        if (versionedParcelable != null) {
            parcel.setOutputField(1);
            parcel.writeVersionedParcelable(versionedParcelable);
        }
        Parcelable parcelable = obj.mParcelable;
        if (parcelable != null) {
            parcel.setOutputField(2);
            parcel.writeParcelable(parcelable);
        }
        String str = obj.mStr;
        if (str != null) {
            parcel.setOutputField(3);
            parcel.writeString(str);
        }
        int i = obj.mInt;
        if (i != 0) {
            parcel.setOutputField(4);
            parcel.writeInt(i);
        }
        long j = obj.mLong;
        if (0 != j) {
            parcel.setOutputField(5);
            parcel.writeLong(j);
        }
        Bundle bundle = obj.mBundle;
        if (bundle != null) {
            parcel.setOutputField(6);
            parcel.writeBundle(bundle);
        }
    }
}
