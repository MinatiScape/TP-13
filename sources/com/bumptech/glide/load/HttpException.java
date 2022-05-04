package com.bumptech.glide.load;

import java.io.IOException;
/* loaded from: classes.dex */
public final class HttpException extends IOException {
    private static final long serialVersionUID = 1;
    private final int statusCode;

    public HttpException(String message) {
        super(message, null);
        this.statusCode = -1;
    }

    public HttpException(String message, int statusCode) {
        super(message, null);
        this.statusCode = statusCode;
    }
}
