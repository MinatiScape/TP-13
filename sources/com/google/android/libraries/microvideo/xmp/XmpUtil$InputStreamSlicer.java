package com.google.android.libraries.microvideo.xmp;

import com.android.systemui.shared.system.QuickStepContract;
import com.google.common.io.ByteStreams;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Objects;
/* loaded from: classes.dex */
public class XmpUtil$InputStreamSlicer implements Closeable {
    public final InputStream inputStream;

    public XmpUtil$InputStreamSlicer(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.inputStream.close();
    }

    public int read() throws IOException {
        return this.inputStream.read();
    }

    public void skip(int length) throws IOException {
        int i;
        InputStream inputStream = this.inputStream;
        long j = length;
        int i2 = ByteStreams.$r8$clinit;
        byte[] bArr = new byte[QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED];
        long j2 = 0;
        while (true) {
            i = (j2 > j ? 1 : (j2 == j ? 0 : -1));
            if (i >= 0) {
                break;
            }
            long j3 = j - j2;
            int available = inputStream.available();
            long skip = available == 0 ? 0L : inputStream.skip(Math.min(available, j3));
            if (skip == 0) {
                skip = inputStream.read(bArr, 0, (int) Math.min(j3, (long) QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED));
                if (skip == -1) {
                    break;
                }
            }
            j2 += skip;
        }
        if (i < 0) {
            StringBuilder sb = new StringBuilder(100);
            sb.append("reached end of stream after skipping ");
            sb.append(j2);
            sb.append(" bytes; ");
            sb.append(j);
            sb.append(" bytes expected");
            throw new EOFException(sb.toString());
        }
    }

    public XmpUtil$Section read(int byteCount, int marker) throws IOException {
        byte[] bArr = new byte[byteCount];
        InputStream inputStream = this.inputStream;
        int i = ByteStreams.$r8$clinit;
        Objects.requireNonNull(inputStream);
        if (byteCount >= 0) {
            int i2 = 0;
            while (i2 < byteCount) {
                int read = inputStream.read(bArr, 0 + i2, byteCount - i2);
                if (read == -1) {
                    break;
                }
                i2 += read;
            }
            return new XmpUtil$Section(bArr, marker, 0, i2);
        }
        throw new IndexOutOfBoundsException("len is negative");
    }
}
