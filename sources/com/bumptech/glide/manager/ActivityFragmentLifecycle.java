package com.bumptech.glide.manager;

import com.bumptech.glide.util.Util;
import java.util.Collections;
import java.util.Iterator;
import java.util.Set;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class ActivityFragmentLifecycle implements Lifecycle {
    public boolean isDestroyed;
    public boolean isStarted;
    public final Set<LifecycleListener> lifecycleListeners = Collections.newSetFromMap(new WeakHashMap());

    public final void onDestroy() {
        this.isDestroyed = true;
        Iterator it = Util.getSnapshot(this.lifecycleListeners).iterator();
        while (it.hasNext()) {
            ((LifecycleListener) it.next()).onDestroy();
        }
    }

    public final void onStart() {
        this.isStarted = true;
        Iterator it = Util.getSnapshot(this.lifecycleListeners).iterator();
        while (it.hasNext()) {
            ((LifecycleListener) it.next()).onStart();
        }
    }

    public final void onStop() {
        this.isStarted = false;
        Iterator it = Util.getSnapshot(this.lifecycleListeners).iterator();
        while (it.hasNext()) {
            ((LifecycleListener) it.next()).onStop();
        }
    }

    @Override // com.bumptech.glide.manager.Lifecycle
    public final void addListener(LifecycleListener lifecycleListener) {
        this.lifecycleListeners.add(lifecycleListener);
        if (this.isDestroyed) {
            lifecycleListener.onDestroy();
        } else if (this.isStarted) {
            lifecycleListener.onStart();
        } else {
            lifecycleListener.onStop();
        }
    }

    @Override // com.bumptech.glide.manager.Lifecycle
    public final void removeListener(LifecycleListener lifecycleListener) {
        this.lifecycleListeners.remove(lifecycleListener);
    }
}
