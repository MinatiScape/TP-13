package androidx.slice;

import androidx.versionedparcelable.VersionedParcel;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Objects;
/* loaded from: classes.dex */
public final class SliceParcelizer {
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v7, types: [java.lang.Object[], java.lang.Object] */
    public static Slice read(VersionedParcel parcel) {
        Slice slice = new Slice();
        slice.mSpec = (SliceSpec) parcel.readVersionedParcelable(slice.mSpec, 1);
        slice.mItems = (SliceItem[]) parcel.readArray(slice.mItems, 2);
        slice.mHints = (String[]) parcel.readArray(slice.mHints, 3);
        slice.mUri = parcel.readString(slice.mUri, 4);
        for (int length = slice.mItems.length - 1; length >= 0; length--) {
            SliceItem[] sliceItemArr = slice.mItems;
            if (sliceItemArr[length].mObj == null) {
                SliceItem sliceItem = sliceItemArr[length];
                if (ArrayUtils.contains(sliceItemArr, sliceItem)) {
                    int length2 = sliceItemArr.length;
                    int i = 0;
                    while (true) {
                        if (i >= length2) {
                            break;
                        } else if (!Objects.equals(sliceItemArr[i], sliceItem)) {
                            i++;
                        } else if (length2 == 1) {
                            sliceItemArr = null;
                        } else {
                            ?? r3 = (Object[]) Array.newInstance(SliceItem.class, length2 - 1);
                            System.arraycopy(sliceItemArr, 0, r3, 0, i);
                            System.arraycopy(sliceItemArr, i + 1, r3, i, (length2 - i) - 1);
                            sliceItemArr = r3;
                        }
                    }
                }
                SliceItem[] sliceItemArr2 = sliceItemArr;
                slice.mItems = sliceItemArr2;
                if (sliceItemArr2 == null) {
                    slice.mItems = new SliceItem[0];
                }
            }
        }
        return slice;
    }

    public static void write(Slice obj, VersionedParcel parcel) {
        Objects.requireNonNull(parcel);
        Objects.requireNonNull(obj);
        SliceSpec sliceSpec = obj.mSpec;
        if (sliceSpec != null) {
            parcel.setOutputField(1);
            parcel.writeVersionedParcelable(sliceSpec);
        }
        if (!Arrays.equals(Slice.NO_ITEMS, obj.mItems)) {
            parcel.writeArray(obj.mItems, 2);
        }
        if (!Arrays.equals(Slice.NO_HINTS, obj.mHints)) {
            parcel.writeArray(obj.mHints, 3);
        }
        String str = obj.mUri;
        if (str != null) {
            parcel.setOutputField(4);
            parcel.writeString(str);
        }
    }
}
