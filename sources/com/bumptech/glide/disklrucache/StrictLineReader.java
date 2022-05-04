package com.bumptech.glide.disklrucache;

import com.android.systemui.shared.system.QuickStepContract;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
/* loaded from: classes.dex */
public final class StrictLineReader implements Closeable {
    public byte[] buf;
    public final Charset charset;
    public int end;
    public final InputStream in;
    public int pos;

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        synchronized (this.in) {
            if (this.buf != null) {
                this.buf = null;
                this.in.close();
            }
        }
    }

    public final String readLine() throws IOException {
        int i;
        synchronized (this.in) {
            byte[] bArr = this.buf;
            if (bArr != null) {
                if (this.pos >= this.end) {
                    int read = this.in.read(bArr, 0, bArr.length);
                    if (read != -1) {
                        this.pos = 0;
                        this.end = read;
                    } else {
                        throw new EOFException();
                    }
                }
                for (int i2 = this.pos; i2 != this.end; i2++) {
                    byte[] bArr2 = this.buf;
                    if (bArr2[i2] == 10) {
                        int i3 = this.pos;
                        if (i2 != i3) {
                            i = i2 - 1;
                            if (bArr2[i] == 13) {
                                String str = new String(bArr2, i3, i - i3, this.charset.name());
                                this.pos = i2 + 1;
                                return str;
                            }
                        }
                        i = i2;
                        String str2 = new String(bArr2, i3, i - i3, this.charset.name());
                        this.pos = i2 + 1;
                        return str2;
                    }
                }
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream((this.end - this.pos) + 80) { // from class: com.bumptech.glide.disklrucache.StrictLineReader.1
                    @Override // java.io.ByteArrayOutputStream
                    public final String toString() {
                        int i4 = ((ByteArrayOutputStream) this).count;
                        if (i4 > 0 && ((ByteArrayOutputStream) this).buf[i4 - 1] == 13) {
                            i4--;
                        }
                        try {
                            return new String(((ByteArrayOutputStream) this).buf, 0, i4, StrictLineReader.this.charset.name());
                        } catch (UnsupportedEncodingException e) {
                            throw new AssertionError(e);
                        }
                    }
                };
                while (true) {
                    byte[] bArr3 = this.buf;
                    int i4 = this.pos;
                    byteArrayOutputStream.write(bArr3, i4, this.end - i4);
                    this.end = -1;
                    InputStream inputStream = this.in;
                    byte[] bArr4 = this.buf;
                    int read2 = inputStream.read(bArr4, 0, bArr4.length);
                    if (read2 != -1) {
                        this.pos = 0;
                        this.end = read2;
                        for (int i5 = 0; i5 != this.end; i5++) {
                            byte[] bArr5 = this.buf;
                            if (bArr5[i5] == 10) {
                                int i6 = this.pos;
                                if (i5 != i6) {
                                    byteArrayOutputStream.write(bArr5, i6, i5 - i6);
                                }
                                this.pos = i5 + 1;
                                return byteArrayOutputStream.toString();
                            }
                        }
                    } else {
                        throw new EOFException();
                    }
                }
            } else {
                throw new IOException("LineReader is closed");
            }
        }
    }

    public StrictLineReader(FileInputStream fileInputStream, Charset charset) {
        if (charset == null) {
            throw null;
        } else if (charset.equals(Util.US_ASCII)) {
            this.in = fileInputStream;
            this.charset = charset;
            this.buf = new byte[QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED];
        } else {
            throw new IllegalArgumentException("Unsupported encoding");
        }
    }
}
