package androidx.fragment.app.strictmode;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.fragment.app.Fragment;
/* loaded from: classes.dex */
public final class SetRetainInstanceUsageViolation extends RetainInstanceUsageViolation {
    @Override // java.lang.Throwable
    public final String getMessage() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Attempting to set retain instance for fragment ");
        m.append(this.mFragment);
        return m.toString();
    }

    public SetRetainInstanceUsageViolation(Fragment fragment) {
        super(fragment);
    }
}
