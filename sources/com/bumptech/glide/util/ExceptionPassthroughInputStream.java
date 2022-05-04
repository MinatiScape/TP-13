package com.bumptech.glide.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayDeque;
/* loaded from: classes.dex */
public final class ExceptionPassthroughInputStream extends InputStream {
    public static final ArrayDeque POOL = new ArrayDeque(0);
    public IOException exception;
    public InputStream wrapped;

    @Override // java.io.InputStream
    public final int read() throws IOException {
        try {
            return this.wrapped.read();
        } catch (IOException e) {
            this.exception = e;
            throw e;
        }
    }

    @Override // java.io.InputStream
    public final synchronized void reset() throws IOException {
        this.wrapped.reset();
    }

    static {
        char[] cArr = Util.HEX_CHAR_ARRAY;
    }

    @Override // java.io.InputStream
    public final int available() throws IOException {
        return this.wrapped.available();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.wrapped.close();
    }

    @Override // java.io.InputStream
    public final void mark(int i) {
        this.wrapped.mark(i);
    }

    @Override // java.io.InputStream
    public final boolean markSupported() {
        return this.wrapped.markSupported();
    }

    @Override // java.io.InputStream
    public final long skip(long j) throws IOException {
        try {
            return this.wrapped.skip(j);
        } catch (IOException e) {
            this.exception = e;
            throw e;
        }
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr) throws IOException {
        try {
            return this.wrapped.read(bArr);
        } catch (IOException e) {
            this.exception = e;
            throw e;
        }
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr, int i, int i2) throws IOException {
        try {
            return this.wrapped.read(bArr, i, i2);
        } catch (IOException e) {
            this.exception = e;
            throw e;
        }
    }
}
