package com.android.systemui.flags;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Flag.kt */
/* loaded from: classes.dex */
public final class ResourceFloatFlag implements ResourceFlag<Integer> {
    private final int id;
    private final int resourceId;

    public static /* synthetic */ ResourceFloatFlag copy$default(ResourceFloatFlag resourceFloatFlag, int i, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = resourceFloatFlag.getId();
        }
        if ((i3 & 2) != 0) {
            i2 = resourceFloatFlag.getResourceId();
        }
        return resourceFloatFlag.copy(i, i2);
    }

    public final int component1() {
        return getId();
    }

    public final int component2() {
        return getResourceId();
    }

    @NotNull
    public final ResourceFloatFlag copy(int i, int i2) {
        return new ResourceFloatFlag(i, i2);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ResourceFloatFlag)) {
            return false;
        }
        ResourceFloatFlag resourceFloatFlag = (ResourceFloatFlag) obj;
        return getId() == resourceFloatFlag.getId() && getResourceId() == resourceFloatFlag.getResourceId();
    }

    public int hashCode() {
        return Integer.hashCode(getResourceId()) + (Integer.hashCode(getId()) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("ResourceFloatFlag(id=");
        m.append(getId());
        m.append(", resourceId=");
        m.append(getResourceId());
        m.append(')');
        return m.toString();
    }

    public ResourceFloatFlag(int i, int i2) {
        this.id = i;
        this.resourceId = i2;
    }

    @Override // com.android.systemui.flags.Flag
    public int getId() {
        return this.id;
    }

    @Override // com.android.systemui.flags.ResourceFlag
    public int getResourceId() {
        return this.resourceId;
    }
}
