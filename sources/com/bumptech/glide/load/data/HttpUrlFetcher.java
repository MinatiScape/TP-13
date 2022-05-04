package com.bumptech.glide.load.data;

import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import androidx.fragment.R$id$$ExternalSyntheticOutline0;
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
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Map;
import java.util.Objects;
/* loaded from: classes.dex */
public class HttpUrlFetcher implements DataFetcher<InputStream> {
    public static final HttpUrlConnectionFactory DEFAULT_CONNECTION_FACTORY = new DefaultHttpUrlConnectionFactory();
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

    public HttpUrlFetcher(GlideUrl glideUrl, int timeout, HttpUrlConnectionFactory connectionFactory) {
        this.glideUrl = glideUrl;
        this.timeout = timeout;
        this.connectionFactory = connectionFactory;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void cancel() {
        this.isCancelled = true;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void cleanup() {
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
    public Class<InputStream> getDataClass() {
        return InputStream.class;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public DataSource getDataSource() {
        return DataSource.REMOTE;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void loadData(Priority priority, DataFetcher.DataCallback<? super InputStream> callback) {
        StringBuilder sb;
        double d;
        int i = LogTime.$r8$clinit;
        long elapsedRealtimeNanos = SystemClock.elapsedRealtimeNanos();
        try {
            try {
                callback.onDataReady(loadDataWithRedirects(this.glideUrl.toURL(), 0, null, this.glideUrl.headers.getHeaders()));
            } catch (IOException e) {
                if (Log.isLoggable("HttpUrlFetcher", 3)) {
                    Log.d("HttpUrlFetcher", "Failed to load data for url", e);
                }
                callback.onLoadFailed(e);
                if (Log.isLoggable("HttpUrlFetcher", 2)) {
                    d = LogTime.getElapsedMillis(elapsedRealtimeNanos);
                    sb = new StringBuilder(59);
                } else {
                    return;
                }
            }
            if (Log.isLoggable("HttpUrlFetcher", 2)) {
                d = LogTime.getElapsedMillis(elapsedRealtimeNanos);
                sb = new StringBuilder(59);
                sb.append("Finished http url fetcher fetch in ");
                sb.append(d);
                Log.v("HttpUrlFetcher", sb.toString());
            }
        } catch (Throwable th) {
            if (Log.isLoggable("HttpUrlFetcher", 2)) {
                double elapsedMillis = LogTime.getElapsedMillis(elapsedRealtimeNanos);
                StringBuilder sb2 = new StringBuilder(59);
                sb2.append("Finished http url fetcher fetch in ");
                sb2.append(elapsedMillis);
                Log.v("HttpUrlFetcher", sb2.toString());
            }
            throw th;
        }
    }

    public final InputStream loadDataWithRedirects(URL url, int redirects, URL lastUrl, Map<String, String> headers) throws IOException {
        if (redirects < 5) {
            if (lastUrl != null) {
                try {
                    if (url.toURI().equals(lastUrl.toURI())) {
                        throw new HttpException("In re-direct loop");
                    }
                } catch (URISyntaxException unused) {
                }
            }
            Objects.requireNonNull((DefaultHttpUrlConnectionFactory) this.connectionFactory);
            this.urlConnection = (HttpURLConnection) url.openConnection();
            for (Map.Entry<String, String> entry : headers.entrySet()) {
                this.urlConnection.addRequestProperty(entry.getKey(), entry.getValue());
            }
            this.urlConnection.setConnectTimeout(this.timeout);
            this.urlConnection.setReadTimeout(this.timeout);
            boolean z = false;
            this.urlConnection.setUseCaches(false);
            this.urlConnection.setDoInput(true);
            this.urlConnection.setInstanceFollowRedirects(false);
            this.urlConnection.connect();
            this.stream = this.urlConnection.getInputStream();
            if (this.isCancelled) {
                return null;
            }
            int responseCode = this.urlConnection.getResponseCode();
            int i = responseCode / 100;
            if (i == 2) {
                HttpURLConnection httpURLConnection = this.urlConnection;
                if (TextUtils.isEmpty(httpURLConnection.getContentEncoding())) {
                    this.stream = new ContentLengthInputStream(httpURLConnection.getInputStream(), httpURLConnection.getContentLength());
                } else {
                    if (Log.isLoggable("HttpUrlFetcher", 3)) {
                        String valueOf = String.valueOf(httpURLConnection.getContentEncoding());
                        Log.d("HttpUrlFetcher", valueOf.length() != 0 ? "Got non empty content encoding: ".concat(valueOf) : new String("Got non empty content encoding: "));
                    }
                    this.stream = httpURLConnection.getInputStream();
                }
                return this.stream;
            }
            if (i == 3) {
                z = true;
            }
            if (z) {
                String headerField = this.urlConnection.getHeaderField("Location");
                if (!TextUtils.isEmpty(headerField)) {
                    URL url2 = new URL(url, headerField);
                    cleanup();
                    return loadDataWithRedirects(url2, redirects + 1, url, headers);
                }
                throw new HttpException("Received empty or null redirect url");
            } else if (responseCode == -1) {
                throw new HttpException(R$id$$ExternalSyntheticOutline0.m(49, "Http request failed with status code: ", responseCode), responseCode);
            } else {
                throw new HttpException(this.urlConnection.getResponseMessage(), responseCode);
            }
        } else {
            throw new HttpException("Too many (> 5) redirects!");
        }
    }
}
