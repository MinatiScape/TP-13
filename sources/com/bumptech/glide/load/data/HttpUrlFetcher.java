package com.bumptech.glide.load.data;

import android.os.SystemClock;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import android.util.Log;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.HttpException;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.GlideUrl;
import com.bumptech.glide.util.ContentLengthInputStream;
import com.bumptech.glide.util.LogTime;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Map;
/* loaded from: classes.dex */
public final class HttpUrlFetcher implements DataFetcher<InputStream> {
    public static final HttpUrlConnectionFactory DEFAULT_CONNECTION_FACTORY = new DefaultHttpUrlConnectionFactory();
    public static final int INVALID_STATUS_CODE = -1;
    public static final String REDIRECT_HEADER_FIELD = "Location";
    public final HttpUrlConnectionFactory connectionFactory;
    public final GlideUrl glideUrl;
    public volatile boolean isCancelled;
    public InputStream stream;
    public final int timeout;
    public HttpURLConnection urlConnection;

    /* loaded from: classes.dex */
    public static class DefaultHttpUrlConnectionFactory implements HttpUrlConnectionFactory {
    }

    /* loaded from: classes.dex */
    public interface HttpUrlConnectionFactory {
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final void cancel() {
        this.isCancelled = true;
    }

    public final InputStream loadDataWithRedirects(URL url, int i, URL url2, Map<String, String> map) throws HttpException {
        boolean z;
        if (i < 5) {
            if (url2 != null) {
                try {
                    if (url.toURI().equals(url2.toURI())) {
                        throw new HttpException("In re-direct loop", -1, null);
                    }
                } catch (URISyntaxException unused) {
                }
            }
            boolean z2 = false;
            try {
                ((DefaultHttpUrlConnectionFactory) this.connectionFactory).getClass();
                HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
                for (Map.Entry<String, String> entry : map.entrySet()) {
                    httpURLConnection.addRequestProperty(entry.getKey(), entry.getValue());
                }
                httpURLConnection.setConnectTimeout(this.timeout);
                httpURLConnection.setReadTimeout(this.timeout);
                httpURLConnection.setUseCaches(false);
                httpURLConnection.setDoInput(true);
                httpURLConnection.setInstanceFollowRedirects(false);
                this.urlConnection = httpURLConnection;
                try {
                    httpURLConnection.connect();
                    this.stream = this.urlConnection.getInputStream();
                    if (this.isCancelled) {
                        return null;
                    }
                    int httpStatusCodeOrInvalid = getHttpStatusCodeOrInvalid(this.urlConnection);
                    int i2 = httpStatusCodeOrInvalid / 100;
                    if (i2 == 2) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (z) {
                        HttpURLConnection httpURLConnection2 = this.urlConnection;
                        try {
                            if (TextUtils.isEmpty(httpURLConnection2.getContentEncoding())) {
                                this.stream = new ContentLengthInputStream(httpURLConnection2.getInputStream(), httpURLConnection2.getContentLength());
                            } else {
                                if (Log.isLoggable("HttpUrlFetcher", 3)) {
                                    Log.d("HttpUrlFetcher", "Got non empty content encoding: " + httpURLConnection2.getContentEncoding());
                                }
                                this.stream = httpURLConnection2.getInputStream();
                            }
                            return this.stream;
                        } catch (IOException e) {
                            throw new HttpException("Failed to obtain InputStream", getHttpStatusCodeOrInvalid(httpURLConnection2), e);
                        }
                    } else {
                        if (i2 == 3) {
                            z2 = true;
                        }
                        if (z2) {
                            String headerField = this.urlConnection.getHeaderField(REDIRECT_HEADER_FIELD);
                            if (!TextUtils.isEmpty(headerField)) {
                                try {
                                    URL url3 = new URL(url, headerField);
                                    cleanup();
                                    return loadDataWithRedirects(url3, i + 1, url, map);
                                } catch (MalformedURLException e2) {
                                    throw new HttpException(SupportMenuInflater$$ExternalSyntheticOutline0.m("Bad redirect url: ", headerField), httpStatusCodeOrInvalid, e2);
                                }
                            } else {
                                throw new HttpException("Received empty or null redirect url", httpStatusCodeOrInvalid, null);
                            }
                        } else if (httpStatusCodeOrInvalid == -1) {
                            throw new HttpException("Http request failed", httpStatusCodeOrInvalid, null);
                        } else {
                            try {
                                throw new HttpException(this.urlConnection.getResponseMessage(), httpStatusCodeOrInvalid, null);
                            } catch (IOException e3) {
                                throw new HttpException("Failed to get a response message", httpStatusCodeOrInvalid, e3);
                            }
                        }
                    }
                } catch (IOException e4) {
                    throw new HttpException("Failed to connect or obtain data", getHttpStatusCodeOrInvalid(this.urlConnection), e4);
                }
            } catch (IOException e5) {
                throw new HttpException("URL.openConnection threw", 0, e5);
            }
        } else {
            throw new HttpException("Too many (> 5) redirects!", -1, null);
        }
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final void cleanup() {
        InputStream inputStream = this.stream;
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (IOException unused) {
            }
        }
        HttpURLConnection httpURLConnection = this.urlConnection;
        if (httpURLConnection != null) {
            httpURLConnection.disconnect();
        }
        this.urlConnection = null;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final void loadData(Priority priority, DataFetcher.DataCallback<? super InputStream> dataCallback) {
        StringBuilder sb;
        int i = LogTime.$r8$clinit;
        long elapsedRealtimeNanos = SystemClock.elapsedRealtimeNanos();
        try {
            try {
                dataCallback.onDataReady(loadDataWithRedirects(this.glideUrl.toURL(), 0, null, this.glideUrl.headers.getHeaders()));
            } catch (IOException e) {
                if (Log.isLoggable("HttpUrlFetcher", 3)) {
                    Log.d("HttpUrlFetcher", "Failed to load data for url", e);
                }
                dataCallback.onLoadFailed(e);
                if (Log.isLoggable("HttpUrlFetcher", 2)) {
                    sb = new StringBuilder();
                } else {
                    return;
                }
            }
            if (Log.isLoggable("HttpUrlFetcher", 2)) {
                sb = new StringBuilder();
                sb.append("Finished http url fetcher fetch in ");
                sb.append(LogTime.getElapsedMillis(elapsedRealtimeNanos));
                Log.v("HttpUrlFetcher", sb.toString());
            }
        } catch (Throwable th) {
            if (Log.isLoggable("HttpUrlFetcher", 2)) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Finished http url fetcher fetch in ");
                m.append(LogTime.getElapsedMillis(elapsedRealtimeNanos));
                Log.v("HttpUrlFetcher", m.toString());
            }
            throw th;
        }
    }

    public HttpUrlFetcher(GlideUrl glideUrl, int i, HttpUrlConnectionFactory httpUrlConnectionFactory) {
        this.glideUrl = glideUrl;
        this.timeout = i;
        this.connectionFactory = httpUrlConnectionFactory;
    }

    public static int getHttpStatusCodeOrInvalid(HttpURLConnection httpURLConnection) {
        try {
            return httpURLConnection.getResponseCode();
        } catch (IOException e) {
            if (!Log.isLoggable("HttpUrlFetcher", 3)) {
                return -1;
            }
            Log.d("HttpUrlFetcher", "Failed to get a response code", e);
            return -1;
        }
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final Class<InputStream> getDataClass() {
        return InputStream.class;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final DataSource getDataSource() {
        return DataSource.REMOTE;
    }
}
