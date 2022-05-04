package com.android.volley.toolbox;

import android.os.SystemClock;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.android.volley.AuthFailureError;
import com.android.volley.Cache;
import com.android.volley.ClientError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Network;
import com.android.volley.NetworkError;
import com.android.volley.NetworkResponse;
import com.android.volley.NoConnectionError;
import com.android.volley.Request;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.NetworkUtility;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
/* loaded from: classes.dex */
public final class BasicNetwork implements Network {
    public final BaseHttpStack mBaseHttpStack;
    public final ByteArrayPool mPool;

    public BasicNetwork(HurlStack hurlStack) {
        ByteArrayPool byteArrayPool = new ByteArrayPool();
        this.mBaseHttpStack = hurlStack;
        this.mPool = byteArrayPool;
    }

    public final NetworkResponse performRequest(Request<?> request) throws VolleyError {
        byte[] bArr;
        IOException e;
        NetworkUtility.RetryInfo retryInfo;
        int i;
        boolean z;
        Map<String, String> map;
        HttpResponse executeRequest;
        byte[] bArr2;
        long elapsedRealtime = SystemClock.elapsedRealtime();
        while (true) {
            Collections.emptyList();
            HttpResponse httpResponse = null;
            try {
                Cache.Entry entry = request.mCacheEntry;
                if (entry == null) {
                    map = Collections.emptyMap();
                } else {
                    HashMap hashMap = new HashMap();
                    String str = entry.etag;
                    if (str != null) {
                        hashMap.put("If-None-Match", str);
                    }
                    long j = entry.lastModified;
                    if (j > 0) {
                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", Locale.US);
                        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
                        hashMap.put("If-Modified-Since", simpleDateFormat.format(new Date(j)));
                    }
                    map = hashMap;
                }
                executeRequest = this.mBaseHttpStack.executeRequest(request, map);
            } catch (IOException e2) {
                bArr = null;
                e = e2;
            }
            try {
                int i2 = executeRequest.mStatusCode;
                List unmodifiableList = Collections.unmodifiableList(executeRequest.mHeaders);
                if (i2 == 304) {
                    return NetworkUtility.getNotModifiedNetworkResponse(request, SystemClock.elapsedRealtime() - elapsedRealtime, unmodifiableList);
                }
                InputStream inputStream = executeRequest.mContent;
                if (inputStream == null) {
                    inputStream = null;
                }
                if (inputStream != null) {
                    bArr2 = NetworkUtility.inputStreamToBytes(inputStream, executeRequest.mContentLength, this.mPool);
                } else {
                    bArr2 = new byte[0];
                }
                NetworkUtility.logSlowRequests(SystemClock.elapsedRealtime() - elapsedRealtime, request, bArr2, i2);
                if (i2 >= 200 && i2 <= 299) {
                    return new NetworkResponse(i2, bArr2, false, SystemClock.elapsedRealtime() - elapsedRealtime, unmodifiableList);
                }
                throw new IOException();
            } catch (IOException e3) {
                e = e3;
                bArr = null;
                httpResponse = executeRequest;
                if (e instanceof SocketTimeoutException) {
                    retryInfo = new NetworkUtility.RetryInfo("socket", new TimeoutError());
                } else if (e instanceof MalformedURLException) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Bad URL ");
                    m.append(request.mUrl);
                    throw new RuntimeException(m.toString(), e);
                } else if (httpResponse != null) {
                    int i3 = httpResponse.mStatusCode;
                    VolleyLog.e("Unexpected response code %d for %s", Integer.valueOf(i3), request.mUrl);
                    if (bArr != null) {
                        NetworkResponse networkResponse = new NetworkResponse(i3, bArr, false, SystemClock.elapsedRealtime() - elapsedRealtime, Collections.unmodifiableList(httpResponse.mHeaders));
                        if (i3 == 401 || i3 == 403) {
                            retryInfo = new NetworkUtility.RetryInfo("auth", new AuthFailureError(networkResponse));
                        } else if (i3 < 400 || i3 > 499) {
                            throw new ServerError(networkResponse);
                        } else {
                            throw new ClientError(networkResponse);
                        }
                    } else {
                        retryInfo = new NetworkUtility.RetryInfo("network", new NetworkError());
                    }
                } else {
                    request.getClass();
                    throw new NoConnectionError(e);
                }
                DefaultRetryPolicy defaultRetryPolicy = request.mRetryPolicy;
                i = defaultRetryPolicy.mCurrentTimeoutMs;
                try {
                    VolleyError volleyError = retryInfo.errorToRetry;
                    int i4 = defaultRetryPolicy.mCurrentRetryCount + 1;
                    defaultRetryPolicy.mCurrentRetryCount = i4;
                    defaultRetryPolicy.mCurrentTimeoutMs = ((int) (i * defaultRetryPolicy.mBackoffMultiplier)) + i;
                    if (i4 <= defaultRetryPolicy.mMaxNumRetries) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (z) {
                        request.addMarker(String.format("%s-retry [timeout=%s]", retryInfo.logPrefix, Integer.valueOf(i)));
                    } else {
                        throw volleyError;
                    }
                } catch (VolleyError e4) {
                    request.addMarker(String.format("%s-timeout-giveup [timeout=%s]", retryInfo.logPrefix, Integer.valueOf(i)));
                    throw e4;
                }
            }
            request.addMarker(String.format("%s-retry [timeout=%s]", retryInfo.logPrefix, Integer.valueOf(i)));
        }
    }
}
