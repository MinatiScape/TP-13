package androidx.fragment.app.strictmode;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.fragment.app.Fragment;
/* loaded from: classes.dex */
public final class SetTargetFragmentUsageViolation extends TargetFragmentUsageViolation {
    private final int mRequestCode = 1;
    private final Fragment mTargetFragment;

    @Override // java.lang.Throwable
    public final String getMessage() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Attempting to set target fragment ");
        m.append(this.mTargetFragment);
        m.append(" with request code ");
        m.append(this.mRequestCode);
        m.append(" for fragment ");
        m.append(this.mFragment);
        return m.toString();
    }

    public SetTargetFragmentUsageViolation(Fragment fragment, Fragment fragment2) {
        super(fragment);
        this.mTargetFragment = fragment2;
    }
}
