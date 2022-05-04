package com.google.common.io;

import com.android.systemui.shared.system.QuickStepContract;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Objects;
/* loaded from: classes.dex */
public final class ByteStreams {
    public static final /* synthetic */ int $r8$clinit = 0;

    static {
        new OutputStream() { // from class: com.google.common.io.ByteStreams.1
            public String toString() {
                return "ByteStreams.nullOutputStream()";
            }

            @Override // java.io.OutputStream
            public void write(int b) {
            }

            @Override // java.io.OutputStream
            public void write(byte[] b) {
                Objects.requireNonNull(b);
            }

            @Override // java.io.OutputStream
            public void write(byte[] b, int off, int len) {
                Objects.requireNonNull(b);
            }
        };
    }

    public static long copy(InputStream from, OutputStream to) throws IOException {
        Objects.requireNonNull(from);
        Objects.requireNonNull(to);
        byte[] bArr = new byte[QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED];
        long j = 0;
        while (true) {
            int read = from.read(bArr);
            if (read == -1) {
                return j;
            }
            to.write(bArr, 0, read);
            j += read;
        }
    }
}
