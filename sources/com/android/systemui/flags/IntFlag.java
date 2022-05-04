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
public final class IntFlag implements ParcelableFlag<Integer> {

    /* renamed from: default  reason: not valid java name */
    private final int f3default;
    private final int id;
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

    public IntFlag(int i) {
        this(i, 0, 2, null);
    }

    public IntFlag(int i, int i2) {
        this.id = i;
        this.f3default = i2;
    }

    public /* synthetic */ IntFlag(Parcel parcel, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcel);
    }

    public static /* synthetic */ IntFlag copy$default(IntFlag intFlag, int i, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = intFlag.getId();
        }
        if ((i3 & 2) != 0) {
            i2 = intFlag.getDefault().intValue();
        }
        return intFlag.copy(i, i2);
    }

    public final int component1() {
        return getId();
    }

    public final int component2() {
        return getDefault().intValue();
    }

    @NotNull
    public final IntFlag copy(int i, int i2) {
        return new IntFlag(i, i2);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof IntFlag)) {
            return false;
        }
        IntFlag intFlag = (IntFlag) obj;
        return getId() == intFlag.getId() && getDefault().intValue() == intFlag.getDefault().intValue();
    }

    public int hashCode() {
        return getDefault().hashCode() + (Integer.hashCode(getId()) * 31);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.android.systemui.flags.ParcelableFlag
    @NotNull
    public Integer getDefault() {
        return Integer.valueOf(this.f3default);
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("IntFlag(id=");
        m.append(getId());
        m.append(", default=");
        m.append(getDefault().intValue());
        m.append(')');
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int i) {
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        parcel.writeInt(getId());
        parcel.writeInt(getDefault().intValue());
    }

    @Override // com.android.systemui.flags.ParcelableFlag, android.os.Parcelable
    public int describeContents() {
        return ParcelableFlag.DefaultImpls.describeContents(this);
    }

    public /* synthetic */ IntFlag(int i, int i2, int i3, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, (i3 & 2) != 0 ? 0 : i2);
    }

    private IntFlag(Parcel parcel) {
        this(parcel.readInt(), parcel.readInt());
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
