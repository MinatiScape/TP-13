package com.android.systemui.statusbar.policy;

import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;
import androidx.lifecycle.LifecycleOwner;
/* loaded from: classes.dex */
public interface CallbackController<T> {
    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    /* synthetic */ default void lambda$observe$0(Object obj, LifecycleOwner lifecycleOwner, Lifecycle.Event event) {
        if (event == Lifecycle.Event.ON_RESUME) {
            addCallback(obj);
        } else if (event == Lifecycle.Event.ON_PAUSE) {
            removeCallback(obj);
        }
    }

    void addCallback(T t);

    default T observe(LifecycleOwner lifecycleOwner, T t) {
        return observe(lifecycleOwner.getLifecycle(), (Lifecycle) t);
    }

    void removeCallback(T t);

    default T observe(Lifecycle lifecycle, final T t) {
        lifecycle.addObserver(new LifecycleEventObserver() { // from class: com.android.systemui.statusbar.policy.CallbackController$$ExternalSyntheticLambda0
            @Override // androidx.lifecycle.LifecycleEventObserver
            public final void onStateChanged(LifecycleOwner lifecycleOwner, Lifecycle.Event event) {
                CallbackController.this.lambda$observe$0(t, lifecycleOwner, event);
            }
        });
        return t;
    }
}