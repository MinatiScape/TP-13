package com.bumptech.glide.manager;

import com.bumptech.glide.request.Request;
import com.bumptech.glide.util.Util;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Set;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class RequestTracker {
    public boolean isPaused;
    public final Set<Request> requests = Collections.newSetFromMap(new WeakHashMap());
    public final ArrayList pendingRequests = new ArrayList();

    public final boolean clearAndRemove(Request request) {
        boolean z = true;
        if (request == null) {
            return true;
        }
        boolean remove = this.requests.remove(request);
        if (!this.pendingRequests.remove(request) && !remove) {
            z = false;
        }
        if (z) {
            request.clear();
        }
        return z;
    }

    public void addRequest(Request request) {
        this.requests.add(request);
    }

    public final void restartRequests() {
        Iterator it = Util.getSnapshot(this.requests).iterator();
        while (it.hasNext()) {
            Request request = (Request) it.next();
            if (!request.isComplete() && !request.isCleared()) {
                request.clear();
                if (!this.isPaused) {
                    request.begin();
                } else {
                    this.pendingRequests.add(request);
                }
            }
        }
    }

    public final String toString() {
        return super.toString() + "{numRequests=" + this.requests.size() + ", isPaused=" + this.isPaused + "}";
    }
}
