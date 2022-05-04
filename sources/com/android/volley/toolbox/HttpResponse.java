package com.android.volley.toolbox;

import com.android.volley.Header;
import java.io.InputStream;
import java.util.List;
/* loaded from: classes.dex */
public final class HttpResponse {
    public final InputStream mContent;
    public final int mContentLength;
    public final List<Header> mHeaders;
    public final int mStatusCode;

    public HttpResponse(int i, List<Header> list) {
        this(i, list, -1, null);
    }

    public HttpResponse(int i, List<Header> list, int i2, InputStream inputStream) {
        this.mStatusCode = i;
        this.mHeaders = list;
        this.mContentLength = i2;
        this.mContent = inputStream;
    }
}
