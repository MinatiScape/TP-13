package androidx.fragment.app.strictmode;

import androidx.fragment.app.Fragment;
/* loaded from: classes.dex */
public abstract class TargetFragmentUsageViolation extends Violation {
    public TargetFragmentUsageViolation(Fragment fragment) {
        super(fragment);
    }
}
