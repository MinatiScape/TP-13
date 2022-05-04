package com.bumptech.glide.manager;

import com.bumptech.glide.request.target.Target;
import com.bumptech.glide.util.Util;
import java.util.Collections;
import java.util.Iterator;
import java.util.Set;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class TargetTracker implements LifecycleListener {
    public final Set<Target<?>> targets = Collections.newSetFromMap(new WeakHashMap());

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final void onDestroy() {
        Iterator it = Util.getSnapshot(this.targets).iterator();
        while (it.hasNext()) {
            ((Target) it.next()).onDestroy();
        }
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final void onStart() {
        Iterator it = Util.getSnapshot(this.targets).iterator();
        while (it.hasNext()) {
            ((Target) it.next()).onStart();
        }
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final void onStop() {
        Iterator it = Util.getSnapshot(this.targets).iterator();
        while (it.hasNext()) {
            ((Target) it.next()).onStop();
        }
    }
}
