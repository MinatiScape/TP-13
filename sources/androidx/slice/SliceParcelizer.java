package androidx.slice;

import androidx.core.R$attr;
import androidx.versionedparcelable.VersionedParcel;
import androidx.versionedparcelable.VersionedParcelable;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Objects;
/* loaded from: classes.dex */
public final class SliceParcelizer {
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v7, types: [java.lang.Object[], java.lang.Object] */
    public static Slice read(VersionedParcel versionedParcel) {
        Slice slice = new Slice();
        VersionedParcelable versionedParcelable = slice.mSpec;
        if (versionedParcel.readField(1)) {
            versionedParcelable = versionedParcel.readVersionedParcelable();
        }
        slice.mSpec = (SliceSpec) versionedParcelable;
        slice.mItems = (SliceItem[]) versionedParcel.readArray(slice.mItems, 2);
        slice.mHints = (String[]) versionedParcel.readArray(slice.mHints, 3);
        slice.mUri = versionedParcel.readString(slice.mUri, 4);
        for (int length = slice.mItems.length - 1; length >= 0; length--) {
            SliceItem[] sliceItemArr = slice.mItems;
            SliceItem sliceItem = sliceItemArr[length];
            if (sliceItem.mObj == null) {
                if (R$attr.contains(sliceItemArr, sliceItem)) {
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

    public static void write(Slice slice, VersionedParcel versionedParcel) {
        versionedParcel.getClass();
        slice.getClass();
        SliceSpec sliceSpec = slice.mSpec;
        if (sliceSpec != null) {
            versionedParcel.setOutputField(1);
            versionedParcel.writeVersionedParcelable(sliceSpec);
        }
        if (!Arrays.equals(Slice.NO_ITEMS, slice.mItems)) {
            versionedParcel.writeArray(slice.mItems, 2);
        }
        if (!Arrays.equals(Slice.NO_HINTS, slice.mHints)) {
            versionedParcel.writeArray(slice.mHints, 3);
        }
        String str = slice.mUri;
        if (str != null) {
            versionedParcel.writeString(str, 4);
        }
    }
}
