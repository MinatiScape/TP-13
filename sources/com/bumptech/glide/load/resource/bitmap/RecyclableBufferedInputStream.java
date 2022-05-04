package com.bumptech.glide.load.resource.bitmap;

import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public class RecyclableBufferedInputStream extends FilterInputStream {
    public volatile byte[] buf;
    public final ArrayPool byteArrayPool;
    public int count;
    public int marklimit;
    public int markpos = -1;
    public int pos;

    /* loaded from: classes.dex */
    public static class InvalidMarkException extends IOException {
        private static final long serialVersionUID = -4338378848813561757L;

        public InvalidMarkException(String detailMessage) {
            super(detailMessage);
        }
    }

    public RecyclableBufferedInputStream(InputStream in, ArrayPool byteArrayPool, int bufferSize) {
        super(in);
        this.byteArrayPool = byteArrayPool;
        this.buf = (byte[]) byteArrayPool.get(bufferSize, byte[].class);
    }

    public static IOException streamClosed() throws IOException {
        throw new IOException("BufferedInputStream is closed");
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized int available() throws IOException {
        InputStream inputStream;
        inputStream = ((FilterInputStream) this).in;
        if (this.buf == null || inputStream == null) {
            streamClosed();
            throw null;
        }
        return (this.count - this.pos) + inputStream.available();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.buf != null) {
            this.byteArrayPool.put(this.buf);
            this.buf = null;
        }
        InputStream inputStream = ((FilterInputStream) this).in;
        ((FilterInputStream) this).in = null;
        if (inputStream != null) {
            inputStream.close();
        }
    }

    public final int fillbuf(InputStream localIn, byte[] localBuf) throws IOException {
        int i = this.markpos;
        if (i != -1) {
            int i2 = this.pos - i;
            int i3 = this.marklimit;
            if (i2 < i3) {
                if (i == 0 && i3 > localBuf.length && this.count == localBuf.length) {
                    int length = localBuf.length * 2;
                    if (length <= i3) {
                        i3 = length;
                    }
                    byte[] bArr = (byte[]) this.byteArrayPool.get(i3, byte[].class);
                    System.arraycopy(localBuf, 0, bArr, 0, localBuf.length);
                    this.buf = bArr;
                    this.byteArrayPool.put(localBuf);
                    localBuf = bArr;
                } else if (i > 0) {
                    System.arraycopy(localBuf, i, localBuf, 0, localBuf.length - i);
                }
                int i4 = this.pos - this.markpos;
                this.pos = i4;
                this.markpos = 0;
                this.count = 0;
                int read = localIn.read(localBuf, i4, localBuf.length - i4);
                int i5 = this.pos;
                if (read > 0) {
                    i5 += read;
                }
                this.count = i5;
                return read;
            }
        }
        int read2 = localIn.read(localBuf);
        if (read2 > 0) {
            this.markpos = -1;
            this.pos = 0;
            this.count = read2;
        }
        return read2;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized void mark(int readlimit) {
        this.marklimit = Math.max(this.marklimit, readlimit);
        this.markpos = this.pos;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return true;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized int read() throws IOException {
        byte[] bArr = this.buf;
        InputStream inputStream = ((FilterInputStream) this).in;
        if (bArr == null || inputStream == null) {
            streamClosed();
            throw null;
        } else if (this.pos >= this.count && fillbuf(inputStream, bArr) == -1) {
            return -1;
        } else {
            if (bArr != this.buf && (bArr = this.buf) == null) {
                streamClosed();
                throw null;
            }
            int i = this.count;
            int i2 = this.pos;
            if (i - i2 <= 0) {
                return -1;
            }
            this.pos = i2 + 1;
            return bArr[i2] & 255;
        }
    }

    public synchronized void release() {
        if (this.buf != null) {
            this.byteArrayPool.put(this.buf);
            this.buf = null;
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized void reset() throws IOException {
        if (this.buf != null) {
            int i = this.markpos;
            if (-1 != i) {
                this.pos = i;
            } else {
                int i2 = this.pos;
                int i3 = this.marklimit;
                StringBuilder sb = new StringBuilder(66);
                sb.append("Mark has been invalidated, pos: ");
                sb.append(i2);
                sb.append(" markLimit: ");
                sb.append(i3);
                throw new InvalidMarkException(sb.toString());
            }
        } else {
            throw new IOException("Stream is closed");
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized long skip(long byteCount) throws IOException {
        if (byteCount < 1) {
            return 0L;
        }
        byte[] bArr = this.buf;
        if (bArr != null) {
            InputStream inputStream = ((FilterInputStream) this).in;
            if (inputStream != null) {
                int i = this.count;
                int i2 = this.pos;
                if (i - i2 >= byteCount) {
                    this.pos = (int) (i2 + byteCount);
                    return byteCount;
                }
                long j = i - i2;
                this.pos = i;
                if (this.markpos == -1 || byteCount > this.marklimit) {
                    return j + inputStream.skip(byteCount - j);
                } else if (fillbuf(inputStream, bArr) == -1) {
                    return j;
                } else {
                    int i3 = this.count;
                    int i4 = this.pos;
                    if (i3 - i4 >= byteCount - j) {
                        this.pos = (int) ((i4 + byteCount) - j);
                        return byteCount;
                    }
                    long j2 = (j + i3) - i4;
                    this.pos = i3;
                    return j2;
                }
            } else {
                streamClosed();
                throw null;
            }
        } else {
            streamClosed();
            throw null;
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized int read(byte[] buffer, int offset, int byteCount) throws IOException {
        int i;
        int i2;
        byte[] bArr = this.buf;
        if (bArr == null) {
            streamClosed();
            throw null;
        } else if (byteCount == 0) {
            return 0;
        } else {
            InputStream inputStream = ((FilterInputStream) this).in;
            if (inputStream != null) {
                int i3 = this.pos;
                int i4 = this.count;
                if (i3 < i4) {
                    int i5 = i4 - i3 >= byteCount ? byteCount : i4 - i3;
                    System.arraycopy(bArr, i3, buffer, offset, i5);
                    this.pos += i5;
                    if (i5 == byteCount || inputStream.available() == 0) {
                        return i5;
                    }
                    offset += i5;
                    i = byteCount - i5;
                } else {
                    i = byteCount;
                }
                while (true) {
                    int i6 = -1;
                    if (this.markpos == -1 && i >= bArr.length) {
                        i2 = inputStream.read(buffer, offset, i);
                        if (i2 == -1) {
                            if (i != byteCount) {
                                i6 = byteCount - i;
                            }
                            return i6;
                        }
                    } else if (fillbuf(inputStream, bArr) == -1) {
                        if (i != byteCount) {
                            i6 = byteCount - i;
                        }
                        return i6;
                    } else {
                        if (bArr != this.buf && (bArr = this.buf) == null) {
                            streamClosed();
                            throw null;
                        }
                        int i7 = this.count;
                        int i8 = this.pos;
                        i2 = i7 - i8 >= i ? i : i7 - i8;
                        System.arraycopy(bArr, i8, buffer, offset, i2);
                        this.pos += i2;
                    }
                    i -= i2;
                    if (i == 0) {
                        return byteCount;
                    }
                    if (inputStream.available() == 0) {
                        return byteCount - i;
                    }
                    offset += i2;
                }
            } else {
                streamClosed();
                throw null;
            }
        }
    }
}
