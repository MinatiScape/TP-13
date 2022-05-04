package com.android.systemui.flags;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.android.systemui.flags.Flag;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class StringFlag implements Flag<String> {
    @NotNull

    /* renamed from: default  reason: not valid java name */
    private final String f5default;
    private final int id;
    private final int resourceOverride;
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

    /* loaded from: classes.dex */
    public static final class Companion {
        private Companion() {
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public StringFlag(int i) {
        this(i, null, 0, 6, null);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public StringFlag(int i, @NotNull String str) {
        this(i, str, 0, 4, null);
        Intrinsics.checkNotNullParameter(str, "default");
    }

    public StringFlag(int i, @NotNull String str, int i2) {
        Intrinsics.checkNotNullParameter(str, "default");
        this.id = i;
        this.f5default = str;
        this.resourceOverride = i2;
    }

    public /* synthetic */ StringFlag(Parcel parcel, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcel);
    }

    public static /* synthetic */ StringFlag copy$default(StringFlag stringFlag, int i, String str, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = stringFlag.getId();
        }
        if ((i3 & 2) != 0) {
            str = stringFlag.getDefault();
        }
        if ((i3 & 4) != 0) {
            i2 = stringFlag.getResourceOverride();
        }
        return stringFlag.copy(i, str, i2);
    }

    public final int component1() {
        return getId();
    }

    @NotNull
    public final String component2() {
        return getDefault();
    }

    public final int component3() {
        return getResourceOverride();
    }

    @NotNull
    public final StringFlag copy(int i, @NotNull String str, int i2) {
        Intrinsics.checkNotNullParameter(str, "default");
        return new StringFlag(i, str, i2);
    }

    @Override // com.android.systemui.flags.Flag, android.os.Parcelable
    public int describeContents() {
        return Flag.DefaultImpls.describeContents(this);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof StringFlag)) {
            return false;
        }
        StringFlag stringFlag = (StringFlag) obj;
        return getId() == stringFlag.getId() && Intrinsics.areEqual(getDefault(), stringFlag.getDefault()) && getResourceOverride() == stringFlag.getResourceOverride();
    }

    @Override // com.android.systemui.flags.Flag
    public int getId() {
        return this.id;
    }

    @Override // com.android.systemui.flags.Flag
    public int getResourceOverride() {
        return this.resourceOverride;
    }

    @Override // com.android.systemui.flags.Flag
    public boolean hasResourceOverride() {
        return Flag.DefaultImpls.hasResourceOverride(this);
    }

    public int hashCode() {
        int hashCode = getDefault().hashCode();
        return Integer.hashCode(getResourceOverride()) + ((hashCode + (Integer.hashCode(getId()) * 31)) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("StringFlag(id=");
        m.append(getId());
        m.append(", default=");
        m.append(getDefault());
        m.append(", resourceOverride=");
        m.append(getResourceOverride());
        m.append(')');
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int i) {
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        parcel.writeInt(getId());
        parcel.writeString(getDefault());
    }

    @Override // com.android.systemui.flags.Flag
    @NotNull
    public String getDefault() {
        return this.f5default;
    }

    public /* synthetic */ StringFlag(int i, String str, int i2, int i3, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, (i3 & 2) != 0 ? "" : str, (i3 & 4) != 0 ? -1 : i2);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private StringFlag(android.os.Parcel r7) {
        /*
            r6 = this;
            int r1 = r7.readInt()
            java.lang.String r7 = r7.readString()
            if (r7 != 0) goto Lc
            java.lang.String r7 = ""
        Lc:
            r2 = r7
            r3 = 0
            r4 = 4
            r5 = 0
            r0 = r6
            r0.<init>(r1, r2, r3, r4, r5)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.systemui.flags.StringFlag.<init>(android.os.Parcel):void");
    }
}
