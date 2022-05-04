package com.bumptech.glide.util;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class ContentLengthInputStream extends FilterInputStream {
    public final long contentLength;
    public int readSoFar;

    public ContentLengthInputStream(InputStream in, long contentLength) {
        super(in);
        this.contentLength = contentLength;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized int available() throws IOException {
        return (int) Math.max(this.contentLength - this.readSoFar, ((FilterInputStream) this).in.available());
    }

    public final int checkReadSoFarOrThrow(int read) throws IOException {
        if (read >= 0) {
            this.readSoFar += read;
        } else if (this.contentLength - this.readSoFar > 0) {
            long j = this.contentLength;
            int i = this.readSoFar;
            StringBuilder sb = new StringBuilder(87);
            sb.append("Failed to read all expected data, expected: ");
            sb.append(j);
            sb.append(", but read: ");
            sb.append(i);
            throw new IOException(sb.toString());
        }
        return read;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized int read() throws IOException {
        int read;
        read = super.read();
        checkReadSoFarOrThrow(read >= 0 ? 1 : -1);
        return read;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] buffer) throws IOException {
        return read(buffer, 0, buffer.length);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized int read(byte[] buffer, int byteOffset, int byteCount) throws IOException {
        int read;
        read = super.read(buffer, byteOffset, byteCount);
        checkReadSoFarOrThrow(read);
        return read;
    }
}
