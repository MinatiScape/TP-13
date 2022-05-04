package com.android.volley;

import com.android.volley.Request;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.PriorityBlockingQueue;
/* loaded from: classes.dex */
public final class WaitingRequestManager implements Request.NetworkRequestCompleteListener {
    public final CacheDispatcher mCacheDispatcher;
    public final BlockingQueue<Request<?>> mNetworkQueue;
    public final ResponseDelivery mResponseDelivery;
    public final HashMap mWaitingRequests = new HashMap();

    public final synchronized boolean maybeAddToWaitingRequests(Request<?> request) {
        String cacheKey = request.getCacheKey();
        if (this.mWaitingRequests.containsKey(cacheKey)) {
            List list = (List) this.mWaitingRequests.get(cacheKey);
            if (list == null) {
                list = new ArrayList();
            }
            request.addMarker("waiting-for-response");
            list.add(request);
            this.mWaitingRequests.put(cacheKey, list);
            if (VolleyLog.DEBUG) {
                VolleyLog.d("Request for cacheKey=%s is in flight, putting on hold.", cacheKey);
            }
            return true;
        }
        this.mWaitingRequests.put(cacheKey, null);
        synchronized (request.mLock) {
            request.mRequestCompleteListener = this;
        }
        if (VolleyLog.DEBUG) {
            VolleyLog.d("new request, sending to network %s", cacheKey);
        }
        return false;
    }

    public final synchronized void onNoUsableResponseReceived(Request<?> request) {
        BlockingQueue<Request<?>> blockingQueue;
        String cacheKey = request.getCacheKey();
        List list = (List) this.mWaitingRequests.remove(cacheKey);
        if (list != null && !list.isEmpty()) {
            if (VolleyLog.DEBUG) {
                VolleyLog.v("%d waiting requests for cacheKey=%s; resend to network", Integer.valueOf(list.size()), cacheKey);
            }
            Request<?> request2 = (Request) list.remove(0);
            this.mWaitingRequests.put(cacheKey, list);
            synchronized (request2.mLock) {
                request2.mRequestCompleteListener = this;
            }
            if (!(this.mCacheDispatcher == null || (blockingQueue = this.mNetworkQueue) == null)) {
                try {
                    blockingQueue.put(request2);
                } catch (InterruptedException e) {
                    VolleyLog.e("Couldn't add request to queue. %s", e.toString());
                    Thread.currentThread().interrupt();
                    CacheDispatcher cacheDispatcher = this.mCacheDispatcher;
                    cacheDispatcher.mQuit = true;
                    cacheDispatcher.interrupt();
                }
            }
        }
    }

    public WaitingRequestManager(CacheDispatcher cacheDispatcher, PriorityBlockingQueue priorityBlockingQueue, ResponseDelivery responseDelivery) {
        this.mResponseDelivery = responseDelivery;
        this.mCacheDispatcher = cacheDispatcher;
        this.mNetworkQueue = priorityBlockingQueue;
    }
}
