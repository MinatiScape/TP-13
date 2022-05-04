package com.google.android.material.badge;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Locale;
/* loaded from: classes.dex */
public final class BadgeState$State implements Parcelable {
    public static final Parcelable.Creator<BadgeState$State> CREATOR = new Parcelable.Creator<BadgeState$State>() { // from class: com.google.android.material.badge.BadgeState$State.1
        @Override // android.os.Parcelable.Creator
        public final BadgeState$State createFromParcel(Parcel parcel) {
            return new BadgeState$State(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final BadgeState$State[] newArray(int i) {
            return new BadgeState$State[i];
        }
    };
    public Integer additionalHorizontalOffset;
    public Integer additionalVerticalOffset;
    public int alpha;
    public Integer backgroundColor;
    public Integer badgeGravity;
    public int badgeResId;
    public Integer badgeTextColor;
    public String contentDescriptionNumberless;
    public int contentDescriptionQuantityStrings;
    public Integer horizontalOffsetWithText;
    public Integer horizontalOffsetWithoutText;
    public Boolean isVisible;
    public int maxCharacterCount;
    public int number;
    public Locale numberLocale;
    public Integer verticalOffsetWithText;
    public Integer verticalOffsetWithoutText;

    public BadgeState$State() {
        throw null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.badgeResId);
        parcel.writeSerializable(this.backgroundColor);
        parcel.writeSerializable(this.badgeTextColor);
        parcel.writeInt(this.alpha);
        parcel.writeInt(this.number);
        parcel.writeInt(this.maxCharacterCount);
        String str = this.contentDescriptionNumberless;
        if (str == null) {
            str = null;
        }
        parcel.writeString(str);
        parcel.writeInt(this.contentDescriptionQuantityStrings);
        parcel.writeSerializable(this.badgeGravity);
        parcel.writeSerializable(this.horizontalOffsetWithoutText);
        parcel.writeSerializable(this.verticalOffsetWithoutText);
        parcel.writeSerializable(this.horizontalOffsetWithText);
        parcel.writeSerializable(this.verticalOffsetWithText);
        parcel.writeSerializable(this.additionalHorizontalOffset);
        parcel.writeSerializable(this.additionalVerticalOffset);
        parcel.writeSerializable(this.isVisible);
        parcel.writeSerializable(this.numberLocale);
    }

    public BadgeState$State(Parcel parcel) {
        this.alpha = 255;
        this.number = -2;
        this.maxCharacterCount = -2;
        this.isVisible = Boolean.TRUE;
        this.badgeResId = parcel.readInt();
        this.backgroundColor = (Integer) parcel.readSerializable();
        this.badgeTextColor = (Integer) parcel.readSerializable();
        this.alpha = parcel.readInt();
        this.number = parcel.readInt();
        this.maxCharacterCount = parcel.readInt();
        this.contentDescriptionNumberless = parcel.readString();
        this.contentDescriptionQuantityStrings = parcel.readInt();
        this.badgeGravity = (Integer) parcel.readSerializable();
        this.horizontalOffsetWithoutText = (Integer) parcel.readSerializable();
        this.verticalOffsetWithoutText = (Integer) parcel.readSerializable();
        this.horizontalOffsetWithText = (Integer) parcel.readSerializable();
        this.verticalOffsetWithText = (Integer) parcel.readSerializable();
        this.additionalHorizontalOffset = (Integer) parcel.readSerializable();
        this.additionalVerticalOffset = (Integer) parcel.readSerializable();
        this.isVisible = (Boolean) parcel.readSerializable();
        this.numberLocale = (Locale) parcel.readSerializable();
    }
}
