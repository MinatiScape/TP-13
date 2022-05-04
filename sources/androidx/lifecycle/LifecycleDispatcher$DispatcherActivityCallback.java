package androidx.lifecycle;

import android.app.Activity;
import android.os.Bundle;
/* loaded from: classes.dex */
class LifecycleDispatcher$DispatcherActivityCallback extends EmptyActivityLifecycleCallbacks {
    @Override // androidx.lifecycle.EmptyActivityLifecycleCallbacks, android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // androidx.lifecycle.EmptyActivityLifecycleCallbacks, android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
    }

    @Override // androidx.lifecycle.EmptyActivityLifecycleCallbacks, android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle bundle) {
        ReportFragment.injectIfNeededIn(activity);
    }
}
