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
public final class BooleanFlag implements Flag<Boolean> {

    /* renamed from: default  reason: not valid java name */
    private final boolean f0default;
    private final int id;
    private final int resourceOverride;
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

    /* loaded from: classes.dex */
    public static final class Companion {
        private Companion() {
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public BooleanFlag(int i) {
        this(i, false, 0, 6, null);
    }

    public BooleanFlag(int i, boolean z) {
        this(i, z, 0, 4, null);
    }

    public BooleanFlag(int i, boolean z, int i2) {
        this.id = i;
        this.f0default = z;
        this.resourceOverride = i2;
    }

    public /* synthetic */ BooleanFlag(Parcel parcel, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcel);
    }

    public static /* synthetic */ BooleanFlag copy$default(BooleanFlag booleanFlag, int i, boolean z, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = booleanFlag.getId();
        }
        if ((i3 & 2) != 0) {
            z = booleanFlag.getDefault().booleanValue();
        }
        if ((i3 & 4) != 0) {
            i2 = booleanFlag.getResourceOverride();
        }
        return booleanFlag.copy(i, z, i2);
    }

    public final int component1() {
        return getId();
    }

    public final boolean component2() {
        return getDefault().booleanValue();
    }

    public final int component3() {
        return getResourceOverride();
    }

    @NotNull
    public final BooleanFlag copy(int i, boolean z, int i2) {
        return new BooleanFlag(i, z, i2);
    }

    @Override // com.android.systemui.flags.Flag, android.os.Parcelable
    public int describeContents() {
        return Flag.DefaultImpls.describeContents(this);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BooleanFlag)) {
            return false;
        }
        BooleanFlag booleanFlag = (BooleanFlag) obj;
        return getId() == booleanFlag.getId() && getDefault().booleanValue() == booleanFlag.getDefault().booleanValue() && getResourceOverride() == booleanFlag.getResourceOverride();
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
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("BooleanFlag(id=");
        m.append(getId());
        m.append(", default=");
        m.append(getDefault().booleanValue());
        m.append(", resourceOverride=");
        m.append(getResourceOverride());
        m.append(')');
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int i) {
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        parcel.writeInt(getId());
        parcel.writeBoolean(getDefault().booleanValue());
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.android.systemui.flags.Flag
    @NotNull
    public Boolean getDefault() {
        return Boolean.valueOf(this.f0default);
    }

    public /* synthetic */ BooleanFlag(int i, boolean z, int i2, int i3, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, (i3 & 2) != 0 ? false : z, (i3 & 4) != 0 ? -1 : i2);
    }

    private BooleanFlag(Parcel parcel) {
        this(parcel.readInt(), parcel.readBoolean(), 0, 4, null);
    }
}
