package kotlinx.coroutines;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: JobSupport.kt */
/* loaded from: classes.dex */
public final class Empty implements Incomplete {
    public final boolean isActive;

    @Override // kotlinx.coroutines.Incomplete
    @Nullable
    public final NodeList getList() {
        return null;
    }

    @NotNull
    public final String toString() {
        String str;
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Empty{");
        if (this.isActive) {
            str = "Active";
        } else {
            str = "New";
        }
        m.append(str);
        m.append('}');
        return m.toString();
    }

    public Empty(boolean z) {
        this.isActive = z;
    }

    @Override // kotlinx.coroutines.Incomplete
    public final boolean isActive() {
        return this.isActive;
    }
}
