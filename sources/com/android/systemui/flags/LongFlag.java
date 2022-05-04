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
public final class LongFlag implements ParcelableFlag<Long> {

    /* renamed from: default  reason: not valid java name */
    private final long f4default;
    private final int id;
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

    public LongFlag(int i) {
        this(i, 0L, 2, null);
    }

    public LongFlag(int i, long j) {
        this.id = i;
        this.f4default = j;
    }

    public /* synthetic */ LongFlag(Parcel parcel, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcel);
    }

    public static /* synthetic */ LongFlag copy$default(LongFlag longFlag, int i, long j, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = longFlag.getId();
        }
        if ((i2 & 2) != 0) {
            j = longFlag.getDefault().longValue();
        }
        return longFlag.copy(i, j);
    }

    public final int component1() {
        return getId();
    }

    public final long component2() {
        return getDefault().longValue();
    }

    @NotNull
    public final LongFlag copy(int i, long j) {
        return new LongFlag(i, j);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LongFlag)) {
            return false;
        }
        LongFlag longFlag = (LongFlag) obj;
        return getId() == longFlag.getId() && getDefault().longValue() == longFlag.getDefault().longValue();
    }

    public int hashCode() {
        return getDefault().hashCode() + (Integer.hashCode(getId()) * 31);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.android.systemui.flags.ParcelableFlag
    @NotNull
    public Long getDefault() {
        return Long.valueOf(this.f4default);
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("LongFlag(id=");
        m.append(getId());
        m.append(", default=");
        m.append(getDefault().longValue());
        m.append(')');
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int i) {
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        parcel.writeInt(getId());
        parcel.writeLong(getDefault().longValue());
    }

    @Override // com.android.systemui.flags.ParcelableFlag, android.os.Parcelable
    public int describeContents() {
        return ParcelableFlag.DefaultImpls.describeContents(this);
    }

    public /* synthetic */ LongFlag(int i, long j, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, (i2 & 2) != 0 ? 0L : j);
    }

    private LongFlag(Parcel parcel) {
        this(parcel.readInt(), parcel.readLong());
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
