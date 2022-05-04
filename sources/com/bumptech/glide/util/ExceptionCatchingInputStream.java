package com.bumptech.glide.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayDeque;
import java.util.Queue;
/* loaded from: classes.dex */
public class ExceptionCatchingInputStream extends InputStream {
    public static final Queue<ExceptionCatchingInputStream> QUEUE = new ArrayDeque(0);
    public IOException exception;
    public InputStream wrapped;

    static {
        char[] cArr = Util.HEX_CHAR_ARRAY;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        return this.wrapped.available();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.wrapped.close();
    }

    @Override // java.io.InputStream
    public void mark(int readLimit) {
        this.wrapped.mark(readLimit);
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        return this.wrapped.markSupported();
    }

    @Override // java.io.InputStream
    public int read(byte[] buffer) {
        try {
            return this.wrapped.read(buffer);
        } catch (IOException e) {
            this.exception = e;
            return -1;
        }
    }

    public void release() {
        this.exception = null;
        this.wrapped = null;
        Queue<ExceptionCatchingInputStream> queue = QUEUE;
        synchronized (queue) {
            ((ArrayDeque) queue).offer(this);
        }
    }

    @Override // java.io.InputStream
    public synchronized void reset() throws IOException {
        this.wrapped.reset();
    }

    @Override // java.io.InputStream
    public long skip(long byteCount) {
        try {
            return this.wrapped.skip(byteCount);
        } catch (IOException e) {
            this.exception = e;
            return 0L;
        }
    }

    @Override // java.io.InputStream
    public int read(byte[] buffer, int byteOffset, int byteCount) {
        try {
            return this.wrapped.read(buffer, byteOffset, byteCount);
        } catch (IOException e) {
            this.exception = e;
            return -1;
        }
    }

    @Override // java.io.InputStream
    public int read() {
        try {
            return this.wrapped.read();
        } catch (IOException e) {
            this.exception = e;
            return -1;
        }
    }
}
