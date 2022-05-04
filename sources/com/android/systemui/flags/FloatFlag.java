package com.android.systemui.flags;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.android.systemui.flags.ParcelableFlag;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Flag.kt */
/* loaded from: classes.dex */
public final class FloatFlag implements ParcelableFlag<Float> {

    /* renamed from: default  reason: not valid java name */
    private final float f2default;
    private final int id;
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

    public FloatFlag(int i) {
        this(i, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 2, null);
    }

    public FloatFlag(int i, float f) {
        this.id = i;
        this.f2default = f;
    }

    public /* synthetic */ FloatFlag(Parcel parcel, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcel);
    }

    public static /* synthetic */ FloatFlag copy$default(FloatFlag floatFlag, int i, float f, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = floatFlag.getId();
        }
        if ((i2 & 2) != 0) {
            f = floatFlag.getDefault().floatValue();
        }
        return floatFlag.copy(i, f);
    }

    public final int component1() {
        return getId();
    }

    public final float component2() {
        return getDefault().floatValue();
    }

    @NotNull
    public final FloatFlag copy(int i, float f) {
        return new FloatFlag(i, f);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FloatFlag)) {
            return false;
        }
        FloatFlag floatFlag = (FloatFlag) obj;
        return getId() == floatFlag.getId() && Intrinsics.areEqual(getDefault(), floatFlag.getDefault());
    }

    public int hashCode() {
        return getDefault().hashCode() + (Integer.hashCode(getId()) * 31);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.android.systemui.flags.ParcelableFlag
    @NotNull
    public Float getDefault() {
        return Float.valueOf(this.f2default);
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("FloatFlag(id=");
        m.append(getId());
        m.append(", default=");
        m.append(getDefault().floatValue());
        m.append(')');
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int i) {
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        parcel.writeInt(getId());
        parcel.writeFloat(getDefault().floatValue());
    }

    @Override // com.android.systemui.flags.ParcelableFlag, android.os.Parcelable
    public int describeContents() {
        return ParcelableFlag.DefaultImpls.describeContents(this);
    }

    public /* synthetic */ FloatFlag(int i, float f, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, (i2 & 2) != 0 ? HingeAngleProviderKt.FULLY_CLOSED_DEGREES : f);
    }

    private FloatFlag(Parcel parcel) {
        this(parcel.readInt(), parcel.readFloat());
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
