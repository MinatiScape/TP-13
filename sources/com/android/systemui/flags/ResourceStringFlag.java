package com.android.systemui.flags;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Flag.kt */
/* loaded from: classes.dex */
public final class ResourceStringFlag implements ResourceFlag<String> {
    private final int id;
    private final int resourceId;

    public static /* synthetic */ ResourceStringFlag copy$default(ResourceStringFlag resourceStringFlag, int i, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = resourceStringFlag.getId();
        }
        if ((i3 & 2) != 0) {
            i2 = resourceStringFlag.getResourceId();
        }
        return resourceStringFlag.copy(i, i2);
    }

    public final int component1() {
        return getId();
    }

    public final int component2() {
        return getResourceId();
    }

    @NotNull
    public final ResourceStringFlag copy(int i, int i2) {
        return new ResourceStringFlag(i, i2);
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ResourceStringFlag)) {
            return false;
        }
        ResourceStringFlag resourceStringFlag = (ResourceStringFlag) obj;
        return getId() == resourceStringFlag.getId() && getResourceId() == resourceStringFlag.getResourceId();
    }

    public int hashCode() {
        return Integer.hashCode(getResourceId()) + (Integer.hashCode(getId()) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("ResourceStringFlag(id=");
        m.append(getId());
        m.append(", resourceId=");
        m.append(getResourceId());
        m.append(')');
        return m.toString();
    }

    public ResourceStringFlag(int i, int i2) {
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
