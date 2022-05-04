package androidx.fragment.app.strictmode;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.fragment.app.Fragment;
/* loaded from: classes.dex */
public final class FragmentReuseViolation extends Violation {
    private final String mPreviousWho;

    @Override // java.lang.Throwable
    public final String getMessage() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Attempting to reuse fragment ");
        m.append(this.mFragment);
        m.append(" with previous ID ");
        m.append(this.mPreviousWho);
        return m.toString();
    }

    public FragmentReuseViolation(Fragment fragment, String str) {
        super(fragment);
        this.mPreviousWho = str;
    }
}
