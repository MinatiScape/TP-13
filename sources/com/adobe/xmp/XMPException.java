package com.adobe.xmp;
/* loaded from: classes.dex */
public class XMPException extends Exception {
    private int errorCode;

    public XMPException(String message, int errorCode) {
        super(message);
        this.errorCode = errorCode;
    }

    public int getErrorCode() {
        return this.errorCode;
    }

    public XMPException(String message, int errorCode, Throwable t) {
        super(message, t);
        this.errorCode = errorCode;
    }
}
