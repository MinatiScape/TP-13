package com.bumptech.glide.load.data;

import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import java.io.IOException;
import java.io.OutputStream;
/* loaded from: classes.dex */
public final class BufferedOutputStream extends OutputStream {
    public ArrayPool arrayPool;
    public byte[] buffer;
    public int index;
    public final OutputStream out;

    public BufferedOutputStream(OutputStream out, ArrayPool arrayPool, int bufferSize) {
        this.out = out;
        this.arrayPool = arrayPool;
        this.buffer = (byte[]) arrayPool.get(bufferSize, byte[].class);
    }

    /* JADX WARN: Finally extract failed */
    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        try {
            flush();
            this.out.close();
            byte[] bArr = this.buffer;
            if (bArr != null) {
                this.arrayPool.put(bArr);
                this.buffer = null;
            }
        } catch (Throwable th) {
            this.out.close();
            throw th;
        }
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        int i = this.index;
        if (i > 0) {
            this.out.write(this.buffer, 0, i);
            this.index = 0;
        }
        this.out.flush();
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        byte[] bArr = this.buffer;
        int i = this.index;
        int i2 = i + 1;
        this.index = i2;
        bArr[i] = (byte) b;
        if (i2 == bArr.length && i2 > 0) {
            this.out.write(bArr, 0, i2);
            this.index = 0;
        }
    }

    @Override // java.io.OutputStream
    public void write(byte[] b) throws IOException {
        write(b, 0, b.length);
    }

    @Override // java.io.OutputStream
    public void write(byte[] b, int initialOffset, int length) throws IOException {
        int i = 0;
        do {
            int i2 = length - i;
            int i3 = initialOffset + i;
            int i4 = this.index;
            if (i4 != 0 || i2 < this.buffer.length) {
                int min = Math.min(i2, this.buffer.length - i4);
                System.arraycopy(b, i3, this.buffer, this.index, min);
                int i5 = this.index + min;
                this.index = i5;
                i += min;
                byte[] bArr = this.buffer;
                if (i5 == bArr.length && i5 > 0) {
                    this.out.write(bArr, 0, i5);
                    this.index = 0;
                    continue;
                }
            } else {
                this.out.write(b, i3, i2);
                return;
            }
        } while (i < length);
    }
}
