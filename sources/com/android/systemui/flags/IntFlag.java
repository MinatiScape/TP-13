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
public final class IntFlag implements Flag<Integer> {

    /* renamed from: default  reason: not valid java name */
    private final int f3default;
    private final int id;
    private final int resourceOverride;
    @NotNull
    public static final Companion Companion = new Companion(null);
    @NotNull
    public static final Parcelable.Creator<IntFlag> CREATOR = new Parcelable.Creator<IntFlag>() { // from class: com.android.systemui.flags.IntFlag$Companion$CREATOR$1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public IntFlag createFromParcel(@NotNull Parcel parcel) {
            Intrinsics.checkNotNullParameter(parcel, "parcel");
            return new IntFlag(parcel, (DefaultConstructorMarker) null);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public IntFlag[] newArray(int i) {
            return new IntFlag[i];
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

    public IntFlag(int i) {
        this(i, 0, 0, 6, null);
    }

    public IntFlag(int i, int i2) {
        this(i, i2, 0, 4, null);
    }

    public IntFlag(int i, int i2, int i3) {
        this.id = i;
        this.f3default = i2;
        this.resourceOverride = i3;
    }

    public /* synthetic */ IntFlag(Parcel parcel, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcel);
    }

    public static /* synthetic */ IntFlag copy$default(IntFlag intFlag, int i, int i2, int i3, int i4, Object obj) {
        if ((i4 & 1) != 0) {
            i = intFlag.getId();
        }
        if ((i4 & 2) != 0) {
            i2 = intFlag.getDefault().intValue();
        }
        if ((i4 & 4) != 0) {
            i3 = intFlag.getResourceOverride();
        }
        return intFlag.copy(i, i2, i3);
    }

    public final int component1() {
        return getId();
    }

    public final int component2() {
        return getDefault().intValue();
    }

    public final int component3() {
        return getResourceOverride();
    }

    @NotNull
    public final IntFlag copy(int i, int i2, int i3) {
        return new IntFlag(i, i2, i3);
    }

    @Override // com.android.systemui.flags.Flag, android.os.Parcelable
    public int describeContents() {
        return Flag.DefaultImpls.describeContents(this);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof IntFlag)) {
            return false;
        }
        IntFlag intFlag = (IntFlag) obj;
        return getId() == intFlag.getId() && getDefault().intValue() == intFlag.getDefault().intValue() && getResourceOverride() == intFlag.getResourceOverride();
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
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("IntFlag(id=");
        m.append(getId());
        m.append(", default=");
        m.append(getDefault().intValue());
        m.append(", resourceOverride=");
        m.append(getResourceOverride());
        m.append(')');
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int i) {
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        parcel.writeInt(getId());
        parcel.writeInt(getDefault().intValue());
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.android.systemui.flags.Flag
    @NotNull
    public Integer getDefault() {
        return Integer.valueOf(this.f3default);
    }

    public /* synthetic */ IntFlag(int i, int i2, int i3, int i4, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, (i4 & 2) != 0 ? 0 : i2, (i4 & 4) != 0 ? -1 : i3);
    }

    private IntFlag(Parcel parcel) {
        this(parcel.readInt(), parcel.readInt(), 0, 4, null);
    }
}
