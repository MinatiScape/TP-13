package com.android.systemui.flags;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.android.systemui.flags.Flag;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class FloatFlag implements Flag<Float> {

    /* renamed from: default  reason: not valid java name */
    private final float f2default;
    private final int id;
    private final int resourceOverride;
    @NotNull
    public static final Companion Companion = new Companion(null);
    @NotNull
    public static final Parcelable.Creator<FloatFlag> CREATOR = new Parcelable.Creator<FloatFlag>() { // from class: com.android.systemui.flags.FloatFlag$Companion$CREATOR$1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public FloatFlag createFromParcel(@NotNull Parcel parcel) {
            Intrinsics.checkNotNullParameter(parcel, "parcel");
            return new FloatFlag(parcel, (DefaultConstructorMarker) null);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public FloatFlag[] newArray(int i) {
            return new FloatFlag[i];
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

    public FloatFlag(int i) {
        this(i, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 0, 6, null);
    }

    public FloatFlag(int i, float f) {
        this(i, f, 0, 4, null);
    }

    public FloatFlag(int i, float f, int i2) {
        this.id = i;
        this.f2default = f;
        this.resourceOverride = i2;
    }

    public /* synthetic */ FloatFlag(Parcel parcel, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcel);
    }

    public static /* synthetic */ FloatFlag copy$default(FloatFlag floatFlag, int i, float f, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = floatFlag.getId();
        }
        if ((i3 & 2) != 0) {
            f = floatFlag.getDefault().floatValue();
        }
        if ((i3 & 4) != 0) {
            i2 = floatFlag.getResourceOverride();
        }
        return floatFlag.copy(i, f, i2);
    }

    public final int component1() {
        return getId();
    }

    public final float component2() {
        return getDefault().floatValue();
    }

    public final int component3() {
        return getResourceOverride();
    }

    @NotNull
    public final FloatFlag copy(int i, float f, int i2) {
        return new FloatFlag(i, f, i2);
    }

    @Override // com.android.systemui.flags.Flag, android.os.Parcelable
    public int describeContents() {
        return Flag.DefaultImpls.describeContents(this);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FloatFlag)) {
            return false;
        }
        FloatFlag floatFlag = (FloatFlag) obj;
        return getId() == floatFlag.getId() && Intrinsics.areEqual(getDefault(), floatFlag.getDefault()) && getResourceOverride() == floatFlag.getResourceOverride();
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
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("FloatFlag(id=");
        m.append(getId());
        m.append(", default=");
        m.append(getDefault().floatValue());
        m.append(", resourceOverride=");
        m.append(getResourceOverride());
        m.append(')');
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int i) {
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        parcel.writeInt(getId());
        parcel.writeFloat(getDefault().floatValue());
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.android.systemui.flags.Flag
    @NotNull
    public Float getDefault() {
        return Float.valueOf(this.f2default);
    }

    public /* synthetic */ FloatFlag(int i, float f, int i2, int i3, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, (i3 & 2) != 0 ? HingeAngleProviderKt.FULLY_CLOSED_DEGREES : f, (i3 & 4) != 0 ? -1 : i2);
    }

    private FloatFlag(Parcel parcel) {
        this(parcel.readInt(), parcel.readFloat(), 0, 4, null);
    }
}
