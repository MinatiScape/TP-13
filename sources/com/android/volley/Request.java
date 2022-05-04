package com.android.volley;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import com.android.volley.Cache;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyLog;
import com.google.android.apps.common.volley.request.ProtoRequest;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class Request<T> implements Comparable<Request<T>> {
    public Cache.Entry mCacheEntry;
    public final int mDefaultTrafficStatsTag;
    public Response.ErrorListener mErrorListener;
    public final VolleyLog.MarkerLog mEventLog;
    public final Object mLock;
    public final int mMethod;
    public NetworkRequestCompleteListener mRequestCompleteListener;
    public RequestQueue mRequestQueue;
    public boolean mResponseDelivered;
    public DefaultRetryPolicy mRetryPolicy;
    public Integer mSequence;
    public boolean mShouldCache;
    public final String mUrl;

    /* loaded from: classes.dex */
    public interface NetworkRequestCompleteListener {
    }

    /* loaded from: classes.dex */
    public enum Priority {
        /* JADX INFO: Fake field, exist only in values array */
        LOW,
        NORMAL,
        /* JADX INFO: Fake field, exist only in values array */
        HIGH,
        /* JADX INFO: Fake field, exist only in values array */
        IMMEDIATE
    }

    public abstract void deliverResponse(T t);

    public byte[] getBody() throws AuthFailureError {
        return null;
    }

    public String getBodyContentType() {
        return "application/x-www-form-urlencoded; charset=UTF-8";
    }

    public abstract Response<T> parseNetworkResponse(NetworkResponse networkResponse);

    public final void addMarker(String str) {
        if (VolleyLog.MarkerLog.ENABLED) {
            this.mEventLog.add(str, Thread.currentThread().getId());
        }
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        Request request = (Request) obj;
        request.getClass();
        return this.mSequence.intValue() - request.mSequence.intValue();
    }

    public void deliverError(VolleyError volleyError) {
        Response.ErrorListener errorListener;
        synchronized (this.mLock) {
            errorListener = this.mErrorListener;
        }
        if (errorListener != null) {
            errorListener.onErrorResponse(volleyError);
        }
    }

    public final void finish(final String str) {
        RequestQueue requestQueue = this.mRequestQueue;
        if (requestQueue != null) {
            synchronized (requestQueue.mCurrentRequests) {
                requestQueue.mCurrentRequests.remove(this);
            }
            synchronized (requestQueue.mFinishedListeners) {
                Iterator it = requestQueue.mFinishedListeners.iterator();
                while (it.hasNext()) {
                    ((RequestQueue.RequestFinishedListener) it.next()).onRequestFinished();
                }
            }
            requestQueue.sendRequestEvent(this, 5);
        }
        if (VolleyLog.MarkerLog.ENABLED) {
            final long id = Thread.currentThread().getId();
            if (Looper.myLooper() != Looper.getMainLooper()) {
                new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.android.volley.Request.1
                    @Override // java.lang.Runnable
                    public final void run() {
                        Request.this.mEventLog.add(str, id);
                        Request request = Request.this;
                        request.mEventLog.finish(request.toString());
                    }
                });
                return;
            }
            this.mEventLog.add(str, id);
            this.mEventLog.finish(toString());
        }
    }

    public final String getCacheKey() {
        String str = this.mUrl;
        int i = this.mMethod;
        if (i == 0 || i == -1) {
            return str;
        }
        return Integer.toString(i) + '-' + str;
    }

    public final boolean hasHadResponseDelivered() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mResponseDelivered;
        }
        return z;
    }

    public final void notifyListenerResponseNotUsable() {
        NetworkRequestCompleteListener networkRequestCompleteListener;
        synchronized (this.mLock) {
            networkRequestCompleteListener = this.mRequestCompleteListener;
        }
        if (networkRequestCompleteListener != null) {
            ((WaitingRequestManager) networkRequestCompleteListener).onNoUsableResponseReceived(this);
        }
    }

    public final void notifyListenerResponseReceived(Response<?> response) {
        NetworkRequestCompleteListener networkRequestCompleteListener;
        boolean z;
        List<Request> list;
        synchronized (this.mLock) {
            networkRequestCompleteListener = this.mRequestCompleteListener;
        }
        if (networkRequestCompleteListener != null) {
            WaitingRequestManager waitingRequestManager = (WaitingRequestManager) networkRequestCompleteListener;
            Cache.Entry entry = response.cacheEntry;
            if (entry != null) {
                if (entry.ttl < System.currentTimeMillis()) {
                    z = true;
                } else {
                    z = false;
                }
                if (!z) {
                    String cacheKey = getCacheKey();
                    synchronized (waitingRequestManager) {
                        list = (List) waitingRequestManager.mWaitingRequests.remove(cacheKey);
                    }
                    if (list != null) {
                        if (VolleyLog.DEBUG) {
                            VolleyLog.v("Releasing %d waiting requests for cacheKey=%s.", Integer.valueOf(list.size()), cacheKey);
                        }
                        for (Request request : list) {
                            ((ExecutorDelivery) waitingRequestManager.mResponseDelivery).postResponse(request, response, null);
                        }
                        return;
                    }
                    return;
                }
            }
            waitingRequestManager.onNoUsableResponseReceived(this);
        }
    }

    public final void sendEvent(int i) {
        RequestQueue requestQueue = this.mRequestQueue;
        if (requestQueue != null) {
            requestQueue.sendRequestEvent(this, i);
        }
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("0x");
        m.append(Integer.toHexString(this.mDefaultTrafficStatsTag));
        String sb = m.toString();
        StringBuilder sb2 = new StringBuilder();
        synchronized (this.mLock) {
        }
        sb2.append("[ ] ");
        sb2.append(this.mUrl);
        sb2.append(" ");
        sb2.append(sb);
        sb2.append(" ");
        sb2.append(Priority.NORMAL);
        sb2.append(" ");
        sb2.append(this.mSequence);
        return sb2.toString();
    }

    public Request(int i, String str, ProtoRequest.Callback callback) {
        VolleyLog.MarkerLog markerLog;
        Uri parse;
        String host;
        if (VolleyLog.MarkerLog.ENABLED) {
            markerLog = new VolleyLog.MarkerLog();
        } else {
            markerLog = null;
        }
        this.mEventLog = markerLog;
        this.mLock = new Object();
        this.mShouldCache = true;
        int i2 = 0;
        this.mResponseDelivered = false;
        this.mCacheEntry = null;
        this.mMethod = i;
        this.mUrl = str;
        this.mErrorListener = callback;
        this.mRetryPolicy = new DefaultRetryPolicy(1, 1.0f);
        if (!(TextUtils.isEmpty(str) || (parse = Uri.parse(str)) == null || (host = parse.getHost()) == null)) {
            i2 = host.hashCode();
        }
        this.mDefaultTrafficStatsTag = i2;
    }

    public Map<String, String> getHeaders() throws AuthFailureError {
        return Collections.emptyMap();
    }
}
