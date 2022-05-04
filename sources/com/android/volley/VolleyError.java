package com.android.volley;
/* loaded from: classes.dex */
public class VolleyError extends Exception {
    public final NetworkResponse networkResponse;
    private long networkTimeMs;

    public VolleyError() {
        this.networkResponse = null;
    }

    public VolleyError(NetworkResponse networkResponse) {
        this.networkResponse = networkResponse;
    }

    public VolleyError(String str) {
        super(str);
        this.networkResponse = null;
    }

    public VolleyError(Exception exc) {
        super(exc);
        this.networkResponse = null;
    }

    public final void setNetworkTimeMs(long j) {
        this.networkTimeMs = j;
    }
}
