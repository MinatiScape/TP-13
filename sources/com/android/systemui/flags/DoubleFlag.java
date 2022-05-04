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
public final class DoubleFlag implements ParcelableFlag<Double> {

    /* renamed from: default  reason: not valid java name */
    private final double f1default;
    private final int id;
    @NotNull
    public static final Companion Companion = new Companion(null);
    @NotNull
    public static final Parcelable.Creator<DoubleFlag> CREATOR = new Parcelable.Creator<DoubleFlag>() { // from class: com.android.systemui.flags.DoubleFlag$Companion$CREATOR$1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public DoubleFlag createFromParcel(@NotNull Parcel parcel) {
            Intrinsics.checkNotNullParameter(parcel, "parcel");
            return new DoubleFlag(parcel, (DefaultConstructorMarker) null);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public DoubleFlag[] newArray(int i) {
            return new DoubleFlag[i];
        }
    };

    public DoubleFlag(int i) {
        this(i, 0.0d, 2, null);
    }

    public DoubleFlag(int i, double d) {
        this.id = i;
        this.f1default = d;
    }

    public /* synthetic */ DoubleFlag(Parcel parcel, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcel);
    }

    public static /* synthetic */ DoubleFlag copy$default(DoubleFlag doubleFlag, int i, double d, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = doubleFlag.getId();
        }
        if ((i2 & 2) != 0) {
            d = doubleFlag.getDefault().doubleValue();
        }
        return doubleFlag.copy(i, d);
    }

    public final int component1() {
        return getId();
    }

    public final double component2() {
        return getDefault().doubleValue();
    }

    @NotNull
    public final DoubleFlag copy(int i, double d) {
        return new DoubleFlag(i, d);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof DoubleFlag)) {
            return false;
        }
        DoubleFlag doubleFlag = (DoubleFlag) obj;
        return getId() == doubleFlag.getId() && Intrinsics.areEqual(getDefault(), doubleFlag.getDefault());
    }

    public int hashCode() {
        return getDefault().hashCode() + (Integer.hashCode(getId()) * 31);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.android.systemui.flags.ParcelableFlag
    @NotNull
    public Double getDefault() {
        return Double.valueOf(this.f1default);
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("DoubleFlag(id=");
        m.append(getId());
        m.append(", default=");
        m.append(getDefault().doubleValue());
        m.append(')');
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int i) {
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        parcel.writeInt(getId());
        parcel.writeDouble(getDefault().doubleValue());
    }

    @Override // com.android.systemui.flags.ParcelableFlag, android.os.Parcelable
    public int describeContents() {
        return ParcelableFlag.DefaultImpls.describeContents(this);
    }

    public /* synthetic */ DoubleFlag(int i, double d, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, (i2 & 2) != 0 ? 0.0d : d);
    }

    private DoubleFlag(Parcel parcel) {
        this(parcel.readInt(), parcel.readDouble());
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
