package com.android.systemui.flags;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Flag.kt */
/* loaded from: classes.dex */
public final class SysPropBooleanFlag implements SysPropFlag<Boolean> {

    /* renamed from: default  reason: not valid java name */
    private final boolean f6default;
    private final int id;
    @NotNull
    private final String name;

    public SysPropBooleanFlag(int i, @NotNull String name, boolean z) {
        Intrinsics.checkNotNullParameter(name, "name");
        this.id = i;
        this.name = name;
        this.f6default = z;
    }

    public static /* synthetic */ SysPropBooleanFlag copy$default(SysPropBooleanFlag sysPropBooleanFlag, int i, String str, boolean z, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = sysPropBooleanFlag.getId();
        }
        if ((i2 & 2) != 0) {
            str = sysPropBooleanFlag.getName();
        }
        if ((i2 & 4) != 0) {
            z = sysPropBooleanFlag.getDefault().booleanValue();
        }
        return sysPropBooleanFlag.copy(i, str, z);
    }

    public final int component1() {
        return getId();
    }

    @NotNull
    public final String component2() {
        return getName();
    }

    public final boolean component3() {
        return getDefault().booleanValue();
    }

    @NotNull
    public final SysPropBooleanFlag copy(int i, @NotNull String name, boolean z) {
        Intrinsics.checkNotNullParameter(name, "name");
        return new SysPropBooleanFlag(i, name, z);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SysPropBooleanFlag)) {
            return false;
        }
        SysPropBooleanFlag sysPropBooleanFlag = (SysPropBooleanFlag) obj;
        return getId() == sysPropBooleanFlag.getId() && Intrinsics.areEqual(getName(), sysPropBooleanFlag.getName()) && getDefault().booleanValue() == sysPropBooleanFlag.getDefault().booleanValue();
    }

    public int hashCode() {
        int hashCode = getName().hashCode();
        return getDefault().hashCode() + ((hashCode + (Integer.hashCode(getId()) * 31)) * 31);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.android.systemui.flags.SysPropFlag
    @NotNull
    public Boolean getDefault() {
        return Boolean.valueOf(this.f6default);
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("SysPropBooleanFlag(id=");
        m.append(getId());
        m.append(", name=");
        m.append(getName());
        m.append(", default=");
        m.append(getDefault().booleanValue());
        m.append(')');
        return m.toString();
    }

    public /* synthetic */ SysPropBooleanFlag(int i, String str, boolean z, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, str, (i2 & 4) != 0 ? false : z);
    }

    @Override // com.android.systemui.flags.Flag
    public int getId() {
        return this.id;
    }

    @Override // com.android.systemui.flags.SysPropFlag
    @NotNull
    public String getName() {
        return this.name;
    }
}
