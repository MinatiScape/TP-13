package com.bumptech.glide.manager;

import com.bumptech.glide.util.Util;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Set;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class ActivityFragmentLifecycle implements Lifecycle {
    public boolean isDestroyed;
    public boolean isStarted;
    public final Set<LifecycleListener> lifecycleListeners = Collections.newSetFromMap(new WeakHashMap());

    @Override // com.bumptech.glide.manager.Lifecycle
    public void addListener(LifecycleListener listener) {
        this.lifecycleListeners.add(listener);
        if (this.isDestroyed) {
            listener.onDestroy();
        } else if (this.isStarted) {
            listener.onStart();
        } else {
            listener.onStop();
        }
    }

    public void onDestroy() {
        this.isDestroyed = true;
        Iterator it = ((ArrayList) Util.getSnapshot(this.lifecycleListeners)).iterator();
        while (it.hasNext()) {
            ((LifecycleListener) it.next()).onDestroy();
        }
    }

    public void onStart() {
        this.isStarted = true;
        Iterator it = ((ArrayList) Util.getSnapshot(this.lifecycleListeners)).iterator();
        while (it.hasNext()) {
            ((LifecycleListener) it.next()).onStart();
        }
    }

    public void onStop() {
        this.isStarted = false;
        Iterator it = ((ArrayList) Util.getSnapshot(this.lifecycleListeners)).iterator();
        while (it.hasNext()) {
            ((LifecycleListener) it.next()).onStop();
        }
    }

    @Override // com.bumptech.glide.manager.Lifecycle
    public void removeListener(LifecycleListener listener) {
        this.lifecycleListeners.remove(listener);
    }
}
