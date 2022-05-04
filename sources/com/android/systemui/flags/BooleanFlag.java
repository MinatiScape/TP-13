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
public final class BooleanFlag implements ParcelableFlag<Boolean> {

    /* renamed from: default  reason: not valid java name */
    private final boolean f0default;
    private final int id;
    @NotNull
    public static final Companion Companion = new Companion(null);
    @NotNull
    public static final Parcelable.Creator<BooleanFlag> CREATOR = new Parcelable.Creator<BooleanFlag>() { // from class: com.android.systemui.flags.BooleanFlag$Companion$CREATOR$1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public BooleanFlag createFromParcel(@NotNull Parcel parcel) {
            Intrinsics.checkNotNullParameter(parcel, "parcel");
            return new BooleanFlag(parcel, (DefaultConstructorMarker) null);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public BooleanFlag[] newArray(int i) {
            return new BooleanFlag[i];
        }
    };

    public BooleanFlag(int i) {
        this(i, false, 2, null);
    }

    public BooleanFlag(int i, boolean z) {
        this.id = i;
        this.f0default = z;
    }

    public /* synthetic */ BooleanFlag(Parcel parcel, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcel);
    }

    public static /* synthetic */ BooleanFlag copy$default(BooleanFlag booleanFlag, int i, boolean z, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = booleanFlag.getId();
        }
        if ((i2 & 2) != 0) {
            z = booleanFlag.getDefault().booleanValue();
        }
        return booleanFlag.copy(i, z);
    }

    public final int component1() {
        return getId();
    }

    public final boolean component2() {
        return getDefault().booleanValue();
    }

    @NotNull
    public final BooleanFlag copy(int i, boolean z) {
        return new BooleanFlag(i, z);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BooleanFlag)) {
            return false;
        }
        BooleanFlag booleanFlag = (BooleanFlag) obj;
        return getId() == booleanFlag.getId() && getDefault().booleanValue() == booleanFlag.getDefault().booleanValue();
    }

    public int hashCode() {
        return getDefault().hashCode() + (Integer.hashCode(getId()) * 31);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.android.systemui.flags.ParcelableFlag
    @NotNull
    public Boolean getDefault() {
        return Boolean.valueOf(this.f0default);
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("BooleanFlag(id=");
        m.append(getId());
        m.append(", default=");
        m.append(getDefault().booleanValue());
        m.append(')');
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int i) {
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        parcel.writeInt(getId());
        parcel.writeBoolean(getDefault().booleanValue());
    }

    @Override // com.android.systemui.flags.ParcelableFlag, android.os.Parcelable
    public int describeContents() {
        return ParcelableFlag.DefaultImpls.describeContents(this);
    }

    public /* synthetic */ BooleanFlag(int i, boolean z, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, (i2 & 2) != 0 ? false : z);
    }

    private BooleanFlag(Parcel parcel) {
        this(parcel.readInt(), parcel.readBoolean());
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
