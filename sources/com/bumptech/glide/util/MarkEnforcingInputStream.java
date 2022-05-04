package com.bumptech.glide.util;

import androidx.recyclerview.widget.RecyclerView;
import java.io.FilterInputStream;
import java.io.IOException;
/* loaded from: classes.dex */
public final class MarkEnforcingInputStream extends FilterInputStream {
    public int availableBytes = RecyclerView.UNDEFINED_DURATION;

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final synchronized void mark(int i) {
        super.mark(i);
        this.availableBytes = i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read() throws IOException {
        if (getBytesToRead(1L) == -1) {
            return -1;
        }
        int read = super.read();
        updateAvailableBytesAfterRead(1L);
        return read;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final synchronized void reset() throws IOException {
        super.reset();
        this.availableBytes = RecyclerView.UNDEFINED_DURATION;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int available() throws IOException {
        int i = this.availableBytes;
        if (i == Integer.MIN_VALUE) {
            return super.available();
        }
        return Math.min(i, super.available());
    }

    public final long getBytesToRead(long j) {
        int i = this.availableBytes;
        if (i == 0) {
            return -1L;
        }
        if (i == Integer.MIN_VALUE || j <= i) {
            return j;
        }
        return i;
    }

    public final void updateAvailableBytesAfterRead(long j) {
        int i = this.availableBytes;
        if (i != Integer.MIN_VALUE && j != -1) {
            this.availableBytes = (int) (i - j);
        }
    }

    public MarkEnforcingInputStream(ExceptionPassthroughInputStream exceptionPassthroughInputStream) {
        super(exceptionPassthroughInputStream);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final long skip(long j) throws IOException {
        long bytesToRead = getBytesToRead(j);
        if (bytesToRead == -1) {
            return 0L;
        }
        long skip = super.skip(bytesToRead);
        updateAvailableBytesAfterRead(skip);
        return skip;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read(byte[] bArr, int i, int i2) throws IOException {
        int bytesToRead = (int) getBytesToRead(i2);
        if (bytesToRead == -1) {
            return -1;
        }
        int read = super.read(bArr, i, bytesToRead);
        updateAvailableBytesAfterRead(read);
        return read;
    }
}
