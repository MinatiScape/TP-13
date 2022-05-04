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
public final class DoubleFlag implements Flag<Double> {

    /* renamed from: default  reason: not valid java name */
    private final double f1default;
    private final int id;
    private final int resourceOverride;
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

    /* loaded from: classes.dex */
    public static final class Companion {
        private Companion() {
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public DoubleFlag(int i) {
        this(i, 0.0d, 0, 6, null);
    }

    public DoubleFlag(int i, double d) {
        this(i, d, 0, 4, null);
    }

    public DoubleFlag(int i, double d, int i2) {
        this.id = i;
        this.f1default = d;
        this.resourceOverride = i2;
    }

    public /* synthetic */ DoubleFlag(Parcel parcel, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcel);
    }

    public static /* synthetic */ DoubleFlag copy$default(DoubleFlag doubleFlag, int i, double d, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = doubleFlag.getId();
        }
        if ((i3 & 2) != 0) {
            d = doubleFlag.getDefault().doubleValue();
        }
        if ((i3 & 4) != 0) {
            i2 = doubleFlag.getResourceOverride();
        }
        return doubleFlag.copy(i, d, i2);
    }

    public final int component1() {
        return getId();
    }

    public final double component2() {
        return getDefault().doubleValue();
    }

    public final int component3() {
        return getResourceOverride();
    }

    @NotNull
    public final DoubleFlag copy(int i, double d, int i2) {
        return new DoubleFlag(i, d, i2);
    }

    @Override // com.android.systemui.flags.Flag, android.os.Parcelable
    public int describeContents() {
        return Flag.DefaultImpls.describeContents(this);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof DoubleFlag)) {
            return false;
        }
        DoubleFlag doubleFlag = (DoubleFlag) obj;
        return getId() == doubleFlag.getId() && Intrinsics.areEqual(getDefault(), doubleFlag.getDefault()) && getResourceOverride() == doubleFlag.getResourceOverride();
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
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("DoubleFlag(id=");
        m.append(getId());
        m.append(", default=");
        m.append(getDefault().doubleValue());
        m.append(", resourceOverride=");
        m.append(getResourceOverride());
        m.append(')');
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int i) {
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        parcel.writeInt(getId());
        parcel.writeDouble(getDefault().doubleValue());
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.android.systemui.flags.Flag
    @NotNull
    public Double getDefault() {
        return Double.valueOf(this.f1default);
    }

    public /* synthetic */ DoubleFlag(int i, double d, int i2, int i3, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, (i3 & 2) != 0 ? 0.0d : d, (i3 & 4) != 0 ? -1 : i2);
    }

    private DoubleFlag(Parcel parcel) {
        this(parcel.readInt(), parcel.readDouble(), 0, 4, null);
    }
}
