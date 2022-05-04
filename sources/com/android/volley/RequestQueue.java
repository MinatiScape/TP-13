package com.android.volley;

import android.os.Handler;
import android.os.Looper;
import com.android.volley.toolbox.BasicNetwork;
import com.android.volley.toolbox.DiskBasedCache;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public final class RequestQueue {
    public final Cache mCache;
    public CacheDispatcher mCacheDispatcher;
    public final ResponseDelivery mDelivery;
    public final Network mNetwork;
    public final AtomicInteger mSequenceGenerator = new AtomicInteger();
    public final HashSet mCurrentRequests = new HashSet();
    public final PriorityBlockingQueue<Request<?>> mCacheQueue = new PriorityBlockingQueue<>();
    public final PriorityBlockingQueue<Request<?>> mNetworkQueue = new PriorityBlockingQueue<>();
    public final ArrayList mFinishedListeners = new ArrayList();
    public final ArrayList mEventListeners = new ArrayList();
    public final NetworkDispatcher[] mDispatchers = new NetworkDispatcher[4];

    /* loaded from: classes.dex */
    public interface RequestEventListener {
        void onRequestEvent();
    }

    @Deprecated
    /* loaded from: classes.dex */
    public interface RequestFinishedListener<T> {
        void onRequestFinished();
    }

    public RequestQueue(DiskBasedCache diskBasedCache, BasicNetwork basicNetwork) {
        ExecutorDelivery executorDelivery = new ExecutorDelivery(new Handler(Looper.getMainLooper()));
        this.mCache = diskBasedCache;
        this.mNetwork = basicNetwork;
        this.mDelivery = executorDelivery;
    }

    public final void sendRequestEvent(Request<?> request, int i) {
        synchronized (this.mEventListeners) {
            Iterator it = this.mEventListeners.iterator();
            while (it.hasNext()) {
                ((RequestEventListener) it.next()).onRequestEvent();
            }
        }
    }
}
