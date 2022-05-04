package com.android.volley.toolbox;

import com.android.volley.AuthFailureError;
import com.android.volley.Header;
import com.android.volley.Request;
import java.io.DataOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public final class HurlStack extends BaseHttpStack {

    /* loaded from: classes.dex */
    public static class UrlConnectionInputStream extends FilterInputStream {
        public final HttpURLConnection mConnection;

        /* JADX WARN: Illegal instructions before constructor call */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public UrlConnectionInputStream(java.net.HttpURLConnection r2) {
            /*
                r1 = this;
                java.io.InputStream r0 = r2.getInputStream()     // Catch: java.io.IOException -> L5
                goto L9
            L5:
                java.io.InputStream r0 = r2.getErrorStream()
            L9:
                r1.<init>(r0)
                r1.mConnection = r2
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.volley.toolbox.HurlStack.UrlConnectionInputStream.<init>(java.net.HttpURLConnection):void");
        }

        @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
        public final void close() throws IOException {
            super.close();
            this.mConnection.disconnect();
        }
    }

    public static List<Header> convertHeaders(Map<String, List<String>> map) {
        ArrayList arrayList = new ArrayList(map.size());
        for (Map.Entry<String, List<String>> entry : map.entrySet()) {
            if (entry.getKey() != null) {
                for (String str : entry.getValue()) {
                    arrayList.add(new Header(entry.getKey(), str));
                }
            }
        }
        return arrayList;
    }

    public static void setConnectionParametersForRequest(HttpURLConnection httpURLConnection, Request request) throws IOException, AuthFailureError {
        switch (request.mMethod) {
            case -1:
                return;
            case 0:
                httpURLConnection.setRequestMethod("GET");
                return;
            case 1:
                httpURLConnection.setRequestMethod("POST");
                byte[] body = request.getBody();
                if (body != null) {
                    httpURLConnection.setDoOutput(true);
                    if (!httpURLConnection.getRequestProperties().containsKey("Content-Type")) {
                        httpURLConnection.setRequestProperty("Content-Type", request.getBodyContentType());
                    }
                    DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream());
                    dataOutputStream.write(body);
                    dataOutputStream.close();
                    return;
                }
                return;
            case 2:
                httpURLConnection.setRequestMethod("PUT");
                byte[] body2 = request.getBody();
                if (body2 != null) {
                    httpURLConnection.setDoOutput(true);
                    if (!httpURLConnection.getRequestProperties().containsKey("Content-Type")) {
                        httpURLConnection.setRequestProperty("Content-Type", request.getBodyContentType());
                    }
                    DataOutputStream dataOutputStream2 = new DataOutputStream(httpURLConnection.getOutputStream());
                    dataOutputStream2.write(body2);
                    dataOutputStream2.close();
                    return;
                }
                return;
            case 3:
                httpURLConnection.setRequestMethod("DELETE");
                return;
            case 4:
                httpURLConnection.setRequestMethod("HEAD");
                return;
            case 5:
                httpURLConnection.setRequestMethod("OPTIONS");
                return;
            case 6:
                httpURLConnection.setRequestMethod("TRACE");
                return;
            case 7:
                httpURLConnection.setRequestMethod("PATCH");
                byte[] body3 = request.getBody();
                if (body3 != null) {
                    httpURLConnection.setDoOutput(true);
                    if (!httpURLConnection.getRequestProperties().containsKey("Content-Type")) {
                        httpURLConnection.setRequestProperty("Content-Type", request.getBodyContentType());
                    }
                    DataOutputStream dataOutputStream3 = new DataOutputStream(httpURLConnection.getOutputStream());
                    dataOutputStream3.write(body3);
                    dataOutputStream3.close();
                    return;
                }
                return;
            default:
                throw new IllegalStateException("Unknown method type.");
        }
    }

    @Override // com.android.volley.toolbox.BaseHttpStack
    public final HttpResponse executeRequest(Request<?> request, Map<String, String> map) throws IOException, AuthFailureError {
        Throwable th;
        boolean z;
        String str = request.mUrl;
        HashMap hashMap = new HashMap();
        hashMap.putAll(map);
        hashMap.putAll(request.getHeaders());
        URL url = new URL(str);
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setInstanceFollowRedirects(HttpURLConnection.getFollowRedirects());
        int i = request.mRetryPolicy.mCurrentTimeoutMs;
        httpURLConnection.setConnectTimeout(i);
        httpURLConnection.setReadTimeout(i);
        boolean z2 = false;
        httpURLConnection.setUseCaches(false);
        httpURLConnection.setDoInput(true);
        "https".equals(url.getProtocol());
        try {
            for (String str2 : hashMap.keySet()) {
                httpURLConnection.setRequestProperty(str2, (String) hashMap.get(str2));
            }
            setConnectionParametersForRequest(httpURLConnection, request);
            int responseCode = httpURLConnection.getResponseCode();
            if (responseCode != -1) {
                if (request.mMethod == 4 || ((100 <= responseCode && responseCode < 200) || responseCode == 204 || responseCode == 304)) {
                    z = false;
                } else {
                    z = true;
                }
                if (!z) {
                    HttpResponse httpResponse = new HttpResponse(responseCode, convertHeaders(httpURLConnection.getHeaderFields()));
                    httpURLConnection.disconnect();
                    return httpResponse;
                }
                try {
                    return new HttpResponse(responseCode, convertHeaders(httpURLConnection.getHeaderFields()), httpURLConnection.getContentLength(), new UrlConnectionInputStream(httpURLConnection));
                } catch (Throwable th2) {
                    th = th2;
                    z2 = true;
                    if (!z2) {
                        httpURLConnection.disconnect();
                    }
                    throw th;
                }
            } else {
                throw new IOException("Could not retrieve response code from HttpUrlConnection.");
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }
}
