package com.bumptech.glide.load.data;

import androidx.fragment.R$id$$ExternalSyntheticOutline0;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class ExifOrientationStream extends FilterInputStream {
    public static final byte[] EXIF_SEGMENT = {-1, -31, 0, 28, 69, 120, 105, 102, 0, 0, 77, 77, 0, 0, 0, 0, 0, 8, 0, 1, 1, 18, 0, 2, 0, 0, 0, 1, 0};
    public static final int ORIENTATION_POSITION = 31;
    public final byte orientation;
    public int position;

    public ExifOrientationStream(InputStream in, int orientation) {
        super(in);
        if (orientation < -1 || orientation > 8) {
            throw new IllegalArgumentException(R$id$$ExternalSyntheticOutline0.m(43, "Cannot add invalid orientation: ", orientation));
        }
        this.orientation = (byte) orientation;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public void mark(int readLimit) {
        throw new UnsupportedOperationException();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int i;
        int i2;
        int i3 = this.position;
        if (i3 < 2 || i3 > (i2 = ORIENTATION_POSITION)) {
            i = super.read();
        } else if (i3 == i2) {
            i = this.orientation;
        } else {
            i = EXIF_SEGMENT[i3 - 2] & 255;
        }
        if (i != -1) {
            this.position++;
        }
        return i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public void reset() throws IOException {
        throw new UnsupportedOperationException();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long byteCount) throws IOException {
        long skip = super.skip(byteCount);
        if (skip > 0) {
            this.position = (int) (this.position + skip);
        }
        return skip;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] buffer, int byteOffset, int byteCount) throws IOException {
        int i;
        int i2 = this.position;
        int i3 = ORIENTATION_POSITION;
        if (i2 > i3) {
            i = super.read(buffer, byteOffset, byteCount);
        } else if (i2 == i3) {
            buffer[byteOffset] = this.orientation;
            i = 1;
        } else if (i2 < 2) {
            i = super.read(buffer, byteOffset, 2 - i2);
        } else {
            int min = Math.min(i3 - i2, byteCount);
            System.arraycopy(EXIF_SEGMENT, this.position - 2, buffer, byteOffset, min);
            i = min;
        }
        if (i > 0) {
            this.position += i;
        }
        return i;
    }
}
