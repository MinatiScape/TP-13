package com.android.volley;
/* loaded from: classes.dex */
public final class DefaultRetryPolicy {
    public final float mBackoffMultiplier;
    public int mCurrentRetryCount;
    public int mCurrentTimeoutMs = 2500;
    public final int mMaxNumRetries;

    public DefaultRetryPolicy(int i, float f) {
        this.mMaxNumRetries = i;
        this.mBackoffMultiplier = f;
    }
}
