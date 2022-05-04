package androidx.fragment.app.strictmode;

import androidx.fragment.app.Fragment;
/* loaded from: classes.dex */
public abstract class RetainInstanceUsageViolation extends Violation {
    public RetainInstanceUsageViolation(Fragment fragment) {
        super(fragment);
    }
}
