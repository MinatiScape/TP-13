package com.adobe.xmp.impl;

import com.android.systemui.shared.system.QuickStepContract;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class ByteBuffer {
    public byte[] buffer;
    public String encoding;
    public int length;

    public ByteBuffer(int initialCapacity) {
        this.encoding = null;
        this.buffer = new byte[initialCapacity];
        this.length = 0;
    }

    public final void ensureCapacity(int requestedLength) {
        byte[] bArr = this.buffer;
        if (requestedLength > bArr.length) {
            byte[] bArr2 = new byte[bArr.length * 2];
            this.buffer = bArr2;
            System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
        }
    }

    public final String getEncoding() {
        if (this.encoding == null) {
            int i = this.length;
            if (i < 2) {
                this.encoding = "UTF-8";
            } else {
                byte[] bArr = this.buffer;
                byte b = bArr[0];
                if (b == 0) {
                    if (i < 4 || bArr[1] != 0) {
                        this.encoding = "UTF-16BE";
                    } else if ((bArr[2] & 255) == 254 && (bArr[3] & 255) == 255) {
                        this.encoding = "UTF-32BE";
                    } else {
                        this.encoding = "UTF-32";
                    }
                } else if ((b & 255) < 128) {
                    if (bArr[1] != 0) {
                        this.encoding = "UTF-8";
                    } else if (i < 4 || bArr[2] != 0) {
                        this.encoding = "UTF-16LE";
                    } else {
                        this.encoding = "UTF-32LE";
                    }
                } else if ((b & 255) == 239) {
                    this.encoding = "UTF-8";
                } else if ((b & 255) == 254) {
                    this.encoding = "UTF-16";
                } else if (i < 4 || bArr[2] != 0) {
                    this.encoding = "UTF-16";
                } else {
                    this.encoding = "UTF-32";
                }
            }
        }
        return this.encoding;
    }

    public ByteBuffer(byte[] buffer) {
        this.encoding = null;
        this.buffer = buffer;
        this.length = buffer.length;
    }

    public ByteBuffer(InputStream in) throws IOException {
        this.encoding = null;
        this.length = 0;
        this.buffer = new byte[QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED];
        while (true) {
            int read = in.read(this.buffer, this.length, QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED);
            if (read > 0) {
                int i = this.length + read;
                this.length = i;
                if (read == 16384) {
                    ensureCapacity(i + QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED);
                } else {
                    return;
                }
            } else {
                return;
            }
        }
    }
}
