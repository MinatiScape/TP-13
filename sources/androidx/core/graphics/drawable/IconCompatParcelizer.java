package androidx.core.graphics.drawable;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.os.Parcelable;
import androidx.versionedparcelable.VersionedParcel;
import java.nio.charset.Charset;
/* loaded from: classes.dex */
public class IconCompatParcelizer {
    public static IconCompat read(VersionedParcel versionedParcel) {
        IconCompat iconCompat = new IconCompat();
        iconCompat.mType = versionedParcel.readInt(iconCompat.mType, 1);
        byte[] bArr = iconCompat.mData;
        if (versionedParcel.readField(2)) {
            bArr = versionedParcel.readByteArray();
        }
        iconCompat.mData = bArr;
        Parcelable parcelable = iconCompat.mParcelable;
        if (versionedParcel.readField(3)) {
            parcelable = versionedParcel.readParcelable();
        }
        iconCompat.mParcelable = parcelable;
        iconCompat.mInt1 = versionedParcel.readInt(iconCompat.mInt1, 4);
        iconCompat.mInt2 = versionedParcel.readInt(iconCompat.mInt2, 5);
        Parcelable parcelable2 = iconCompat.mTintList;
        if (versionedParcel.readField(6)) {
            parcelable2 = versionedParcel.readParcelable();
        }
        iconCompat.mTintList = (ColorStateList) parcelable2;
        iconCompat.mTintModeStr = versionedParcel.readString(iconCompat.mTintModeStr, 7);
        iconCompat.mString1 = versionedParcel.readString(iconCompat.mString1, 8);
        iconCompat.mTintMode = PorterDuff.Mode.valueOf(iconCompat.mTintModeStr);
        switch (iconCompat.mType) {
            case -1:
                Parcelable parcelable3 = iconCompat.mParcelable;
                if (parcelable3 != null) {
                    iconCompat.mObj1 = parcelable3;
                    break;
                } else {
                    throw new IllegalArgumentException("Invalid icon");
                }
            case 1:
            case 5:
                Parcelable parcelable4 = iconCompat.mParcelable;
                if (parcelable4 == null) {
                    byte[] bArr2 = iconCompat.mData;
                    iconCompat.mObj1 = bArr2;
                    iconCompat.mType = 3;
                    iconCompat.mInt1 = 0;
                    iconCompat.mInt2 = bArr2.length;
                    break;
                } else {
                    iconCompat.mObj1 = parcelable4;
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

    public static void write(IconCompat iconCompat, VersionedParcel versionedParcel) {
        versionedParcel.getClass();
        iconCompat.mTintModeStr = iconCompat.mTintMode.name();
        switch (iconCompat.mType) {
            case -1:
                iconCompat.mParcelable = (Parcelable) iconCompat.mObj1;
                break;
            case 1:
            case 5:
                iconCompat.mParcelable = (Parcelable) iconCompat.mObj1;
                break;
            case 2:
                iconCompat.mData = ((String) iconCompat.mObj1).getBytes(Charset.forName("UTF-16"));
                break;
            case 3:
                iconCompat.mData = (byte[]) iconCompat.mObj1;
                break;
            case 4:
            case 6:
                iconCompat.mData = iconCompat.mObj1.toString().getBytes(Charset.forName("UTF-16"));
                break;
        }
        int i = iconCompat.mType;
        if (-1 != i) {
            versionedParcel.setOutputField(1);
            versionedParcel.writeInt(i);
        }
        byte[] bArr = iconCompat.mData;
        if (bArr != null) {
            versionedParcel.setOutputField(2);
            versionedParcel.writeByteArray(bArr);
        }
        Parcelable parcelable = iconCompat.mParcelable;
        if (parcelable != null) {
            versionedParcel.setOutputField(3);
            versionedParcel.writeParcelable(parcelable);
        }
        int i2 = iconCompat.mInt1;
        if (i2 != 0) {
            versionedParcel.setOutputField(4);
            versionedParcel.writeInt(i2);
        }
        int i3 = iconCompat.mInt2;
        if (i3 != 0) {
            versionedParcel.setOutputField(5);
            versionedParcel.writeInt(i3);
        }
        ColorStateList colorStateList = iconCompat.mTintList;
        if (colorStateList != null) {
            versionedParcel.setOutputField(6);
            versionedParcel.writeParcelable(colorStateList);
        }
        String str = iconCompat.mTintModeStr;
        if (str != null) {
            versionedParcel.writeString(str, 7);
        }
        String str2 = iconCompat.mString1;
        if (str2 != null) {
            versionedParcel.writeString(str2, 8);
        }
    }
}
