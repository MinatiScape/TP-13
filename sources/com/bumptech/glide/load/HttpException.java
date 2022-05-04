package com.bumptech.glide.load;

import java.io.IOException;
/* loaded from: classes.dex */
public final class HttpException extends IOException {
    private static final long serialVersionUID = 1;
    private final int statusCode;

    public HttpException() {
        throw null;
    }

    @Deprecated
    public HttpException(String str) {
        this(str, -1, null);
    }

    public HttpException(String str, int i, IOException iOException) {
        super(str + ", status code: " + i, iOException);
        this.statusCode = i;
    }
}
