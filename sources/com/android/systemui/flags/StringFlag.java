package com.android.systemui.flags;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.android.systemui.flags.ParcelableFlag;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Flag.kt */
/* loaded from: classes.dex */
public final class StringFlag implements ParcelableFlag<String> {
    @NotNull

    /* renamed from: default  reason: not valid java name */
    private final String f5default;
    private final int id;
    @NotNull
    public static final Companion Companion = new Companion(null);
    @NotNull
    public static final Parcelable.Creator<StringFlag> CREATOR = new Parcelable.Creator<StringFlag>() { // from class: com.android.systemui.flags.StringFlag$Companion$CREATOR$1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public StringFlag createFromParcel(@NotNull Parcel parcel) {
            Intrinsics.checkNotNullParameter(parcel, "parcel");
            return new StringFlag(parcel, (DefaultConstructorMarker) null);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public StringFlag[] newArray(int i) {
            return new StringFlag[i];
        }
    };

    public StringFlag(int i) {
        this(i, null, 2, null);
    }

    public StringFlag(int i, @NotNull String str) {
        Intrinsics.checkNotNullParameter(str, "default");
        this.id = i;
        this.f5default = str;
    }

    public /* synthetic */ StringFlag(Parcel parcel, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcel);
    }

    public static /* synthetic */ StringFlag copy$default(StringFlag stringFlag, int i, String str, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = stringFlag.getId();
        }
        if ((i2 & 2) != 0) {
            str = stringFlag.getDefault();
        }
        return stringFlag.copy(i, str);
    }

    public final int component1() {
        return getId();
    }

    @NotNull
    public final String component2() {
        return getDefault();
    }

    @NotNull
    public final StringFlag copy(int i, @NotNull String str) {
        Intrinsics.checkNotNullParameter(str, "default");
        return new StringFlag(i, str);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof StringFlag)) {
            return false;
        }
        StringFlag stringFlag = (StringFlag) obj;
        return getId() == stringFlag.getId() && Intrinsics.areEqual(getDefault(), stringFlag.getDefault());
    }

    public int hashCode() {
        return getDefault().hashCode() + (Integer.hashCode(getId()) * 31);
    }

    @Override // com.android.systemui.flags.ParcelableFlag
    @NotNull
    public String getDefault() {
        return this.f5default;
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("StringFlag(id=");
        m.append(getId());
        m.append(", default=");
        m.append(getDefault());
        m.append(')');
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int i) {
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        parcel.writeInt(getId());
        parcel.writeString(getDefault());
    }

    @Override // com.android.systemui.flags.ParcelableFlag, android.os.Parcelable
    public int describeContents() {
        return ParcelableFlag.DefaultImpls.describeContents(this);
    }

    public /* synthetic */ StringFlag(int i, String str, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, (i2 & 2) != 0 ? "" : str);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private StringFlag(android.os.Parcel r2) {
        /*
            r1 = this;
            int r0 = r2.readInt()
            java.lang.String r2 = r2.readString()
            if (r2 != 0) goto Lc
            java.lang.String r2 = ""
        Lc:
            r1.<init>(r0, r2)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.systemui.flags.StringFlag.<init>(android.os.Parcel):void");
    }

    /* compiled from: Flag.kt */
    /* loaded from: classes.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    @Override // com.android.systemui.flags.Flag
    public int getId() {
        return this.id;
    }
}
