package com.bumptech.glide.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final class ByteBufferUtil {
    public static final AtomicReference<byte[]> BUFFER_REF = new AtomicReference<>();

    /* loaded from: classes.dex */
    public static class ByteBufferStream extends InputStream {
        public final ByteBuffer byteBuffer;
        public int markPos = -1;

        @Override // java.io.InputStream
        public final synchronized void mark(int i) {
            this.markPos = this.byteBuffer.position();
        }

        @Override // java.io.InputStream
        public final boolean markSupported() {
            return true;
        }

        @Override // java.io.InputStream
        public final int read() {
            if (!this.byteBuffer.hasRemaining()) {
                return -1;
            }
            return this.byteBuffer.get() & 255;
        }

        @Override // java.io.InputStream
        public final synchronized void reset() throws IOException {
            int i = this.markPos;
            if (i != -1) {
                this.byteBuffer.position(i);
            } else {
                throw new IOException("Cannot reset to unset mark position");
            }
        }

        @Override // java.io.InputStream
        public final int available() {
            return this.byteBuffer.remaining();
        }

        @Override // java.io.InputStream
        public final long skip(long j) throws IOException {
            if (!this.byteBuffer.hasRemaining()) {
                return -1L;
            }
            long min = Math.min(j, available());
            ByteBuffer byteBuffer = this.byteBuffer;
            byteBuffer.position((int) (byteBuffer.position() + min));
            return min;
        }

        public ByteBufferStream(ByteBuffer byteBuffer) {
            this.byteBuffer = byteBuffer;
        }

        @Override // java.io.InputStream
        public final int read(byte[] bArr, int i, int i2) throws IOException {
            if (!this.byteBuffer.hasRemaining()) {
                return -1;
            }
            int min = Math.min(i2, available());
            this.byteBuffer.get(bArr, i, min);
            return min;
        }
    }

    public static MappedByteBuffer fromFile(File file) throws IOException {
        Throwable th;
        RandomAccessFile randomAccessFile;
        FileChannel fileChannel;
        Throwable th2;
        FileChannel fileChannel2 = null;
        try {
            long length = file.length();
            if (length > 2147483647L) {
                throw new IOException("File too large to map into memory");
            } else if (length != 0) {
                randomAccessFile = new RandomAccessFile(file, "r");
                try {
                    fileChannel = randomAccessFile.getChannel();
                    try {
                        MappedByteBuffer load = fileChannel.map(FileChannel.MapMode.READ_ONLY, 0L, length).load();
                        try {
                            fileChannel.close();
                        } catch (IOException unused) {
                        }
                        try {
                            randomAccessFile.close();
                        } catch (IOException unused2) {
                        }
                        return load;
                    } catch (Throwable th3) {
                        th2 = th3;
                        Throwable th4 = th2;
                        fileChannel2 = fileChannel;
                        th = th4;
                        if (fileChannel2 != null) {
                            try {
                                fileChannel2.close();
                            } catch (IOException unused3) {
                            }
                        }
                        if (randomAccessFile != null) {
                            try {
                                randomAccessFile.close();
                            } catch (IOException unused4) {
                            }
                        }
                        throw th;
                    }
                } catch (Throwable th5) {
                    th2 = th5;
                    fileChannel = null;
                }
            } else {
                throw new IOException("File unsuitable for memory mapping");
            }
        } catch (Throwable th6) {
            th = th6;
            randomAccessFile = null;
        }
    }

    public static void toFile(ByteBuffer byteBuffer, File file) throws IOException {
        Throwable th;
        RandomAccessFile randomAccessFile;
        byteBuffer.position(0);
        FileChannel fileChannel = null;
        try {
            randomAccessFile = new RandomAccessFile(file, "rw");
            try {
                fileChannel = randomAccessFile.getChannel();
                fileChannel.write(byteBuffer);
                fileChannel.force(false);
                fileChannel.close();
                randomAccessFile.close();
                try {
                    fileChannel.close();
                } catch (IOException unused) {
                }
                try {
                    randomAccessFile.close();
                } catch (IOException unused2) {
                }
            } catch (Throwable th2) {
                th = th2;
                if (fileChannel != null) {
                    try {
                        fileChannel.close();
                    } catch (IOException unused3) {
                    }
                }
                if (randomAccessFile != null) {
                    try {
                        randomAccessFile.close();
                    } catch (IOException unused4) {
                    }
                }
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            randomAccessFile = null;
        }
    }

    /* loaded from: classes.dex */
    public static final class SafeArray {
        public final byte[] data;
        public final int limit;
        public final int offset;

        public SafeArray(byte[] bArr, int i, int i2) {
            this.data = bArr;
            this.offset = i;
            this.limit = i2;
        }
    }
}
