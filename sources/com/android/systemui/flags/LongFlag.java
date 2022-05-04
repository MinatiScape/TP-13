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
public final class LongFlag implements Flag<Long> {

    /* renamed from: default  reason: not valid java name */
    private final long f4default;
    private final int id;
    private final int resourceOverride;
    @NotNull
    public static final Companion Companion = new Companion(null);
    @NotNull
    public static final Parcelable.Creator<LongFlag> CREATOR = new Parcelable.Creator<LongFlag>() { // from class: com.android.systemui.flags.LongFlag$Companion$CREATOR$1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public LongFlag createFromParcel(@NotNull Parcel parcel) {
            Intrinsics.checkNotNullParameter(parcel, "parcel");
            return new LongFlag(parcel, (DefaultConstructorMarker) null);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public LongFlag[] newArray(int i) {
            return new LongFlag[i];
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

    public LongFlag(int i) {
        this(i, 0L, 0, 6, null);
    }

    public LongFlag(int i, long j) {
        this(i, j, 0, 4, null);
    }

    public LongFlag(int i, long j, int i2) {
        this.id = i;
        this.f4default = j;
        this.resourceOverride = i2;
    }

    public /* synthetic */ LongFlag(Parcel parcel, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcel);
    }

    public static /* synthetic */ LongFlag copy$default(LongFlag longFlag, int i, long j, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = longFlag.getId();
        }
        if ((i3 & 2) != 0) {
            j = longFlag.getDefault().longValue();
        }
        if ((i3 & 4) != 0) {
            i2 = longFlag.getResourceOverride();
        }
        return longFlag.copy(i, j, i2);
    }

    public final int component1() {
        return getId();
    }

    public final long component2() {
        return getDefault().longValue();
    }

    public final int component3() {
        return getResourceOverride();
    }

    @NotNull
    public final LongFlag copy(int i, long j, int i2) {
        return new LongFlag(i, j, i2);
    }

    @Override // com.android.systemui.flags.Flag, android.os.Parcelable
    public int describeContents() {
        return Flag.DefaultImpls.describeContents(this);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LongFlag)) {
            return false;
        }
        LongFlag longFlag = (LongFlag) obj;
        return getId() == longFlag.getId() && getDefault().longValue() == longFlag.getDefault().longValue() && getResourceOverride() == longFlag.getResourceOverride();
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
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("LongFlag(id=");
        m.append(getId());
        m.append(", default=");
        m.append(getDefault().longValue());
        m.append(", resourceOverride=");
        m.append(getResourceOverride());
        m.append(')');
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int i) {
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        parcel.writeInt(getId());
        parcel.writeLong(getDefault().longValue());
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.android.systemui.flags.Flag
    @NotNull
    public Long getDefault() {
        return Long.valueOf(this.f4default);
    }

    public /* synthetic */ LongFlag(int i, long j, int i2, int i3, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, (i3 & 2) != 0 ? 0L : j, (i3 & 4) != 0 ? -1 : i2);
    }

    private LongFlag(Parcel parcel) {
        this(parcel.readInt(), parcel.readLong(), 0, 4, null);
    }
}
