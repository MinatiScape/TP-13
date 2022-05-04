package androidx.core.graphics.drawable;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.os.Parcelable;
import androidx.versionedparcelable.VersionedParcel;
import java.nio.charset.Charset;
import java.util.Objects;
/* loaded from: classes.dex */
public class IconCompatParcelizer {
    public static IconCompat read(VersionedParcel parcel) {
        IconCompat iconCompat = new IconCompat();
        iconCompat.mType = parcel.readInt(iconCompat.mType, 1);
        byte[] bArr = iconCompat.mData;
        if (parcel.readField(2)) {
            bArr = parcel.readByteArray();
        }
        iconCompat.mData = bArr;
        iconCompat.mParcelable = parcel.readParcelable(iconCompat.mParcelable, 3);
        iconCompat.mInt1 = parcel.readInt(iconCompat.mInt1, 4);
        iconCompat.mInt2 = parcel.readInt(iconCompat.mInt2, 5);
        iconCompat.mTintList = (ColorStateList) parcel.readParcelable(iconCompat.mTintList, 6);
        iconCompat.mTintModeStr = parcel.readString(iconCompat.mTintModeStr, 7);
        iconCompat.mString1 = parcel.readString(iconCompat.mString1, 8);
        iconCompat.mTintMode = PorterDuff.Mode.valueOf(iconCompat.mTintModeStr);
        switch (iconCompat.mType) {
            case -1:
                Parcelable parcelable = iconCompat.mParcelable;
                if (parcelable != null) {
                    iconCompat.mObj1 = parcelable;
                    break;
                } else {
                    throw new IllegalArgumentException("Invalid icon");
                }
            case 1:
            case 5:
                Parcelable parcelable2 = iconCompat.mParcelable;
                if (parcelable2 == null) {
                    byte[] bArr2 = iconCompat.mData;
                    iconCompat.mObj1 = bArr2;
                    iconCompat.mType = 3;
                    iconCompat.mInt1 = 0;
                    iconCompat.mInt2 = bArr2.length;
                    break;
                } else {
                    iconCompat.mObj1 = parcelable2;
                    break;
                }
            case 2:
            case 4:
            case 6:
                String str = new String(iconCompat.mData, Charset.forName("UTF-16"));
                iconCompat.mObj1 = str;
                if (iconCompat.mType == 2 && iconCompat.mString1 == null) {
                    iconCompat.mString1 = str.split(":", -1)[0];
                    break;
                }
                break;
            case 3:
                iconCompat.mObj1 = iconCompat.mData;
                break;
        }
        return iconCompat;
    }

    public static void write(IconCompat obj, VersionedParcel parcel) {
        Objects.requireNonNull(parcel);
        obj.mTintModeStr = obj.mTintMode.name();
        switch (obj.mType) {
            case -1:
                obj.mParcelable = (Parcelable) obj.mObj1;
                break;
            case 1:
            case 5:
                obj.mParcelable = (Parcelable) obj.mObj1;
                break;
            case 2:
                obj.mData = ((String) obj.mObj1).getBytes(Charset.forName("UTF-16"));
                break;
            case 3:
                obj.mData = (byte[]) obj.mObj1;
                break;
            case 4:
            case 6:
                obj.mData = obj.mObj1.toString().getBytes(Charset.forName("UTF-16"));
                break;
        }
        int i = obj.mType;
        if (-1 != i) {
            parcel.setOutputField(1);
            parcel.writeInt(i);
        }
        byte[] bArr = obj.mData;
        if (bArr != null) {
            parcel.setOutputField(2);
            parcel.writeByteArray(bArr);
        }
        Parcelable parcelable = obj.mParcelable;
        if (parcelable != null) {
            parcel.setOutputField(3);
            parcel.writeParcelable(parcelable);
        }
        int i2 = obj.mInt1;
        if (i2 != 0) {
            parcel.setOutputField(4);
            parcel.writeInt(i2);
        }
        int i3 = obj.mInt2;
        if (i3 != 0) {
            parcel.setOutputField(5);
            parcel.writeInt(i3);
        }
        ColorStateList colorStateList = obj.mTintList;
        if (colorStateList != null) {
            parcel.setOutputField(6);
            parcel.writeParcelable(colorStateList);
        }
        String str = obj.mTintModeStr;
        if (str != null) {
            parcel.setOutputField(7);
            parcel.writeString(str);
        }
        String str2 = obj.mString1;
        if (str2 != null) {
            parcel.setOutputField(8);
            parcel.writeString(str2);
        }
    }
}
