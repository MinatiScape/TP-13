package androidx.fragment.app.strictmode;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.fragment.app.Fragment;
/* loaded from: classes.dex */
public final class GetTargetFragmentUsageViolation extends TargetFragmentUsageViolation {
    @Override // java.lang.Throwable
    public final String getMessage() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Attempting to get target fragment from fragment ");
        m.append(this.mFragment);
        return m.toString();
    }

    public GetTargetFragmentUsageViolation(Fragment fragment) {
        super(fragment);
    }
}
