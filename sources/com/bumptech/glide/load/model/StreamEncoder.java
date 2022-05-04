package com.bumptech.glide.load.model;

import android.util.Log;
import com.android.systemui.shared.system.QuickStepContract;
import com.bumptech.glide.load.Encoder;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public class StreamEncoder implements Encoder<InputStream> {
    public final ArrayPool byteArrayPool;

    public StreamEncoder(ArrayPool byteArrayPool) {
        this.byteArrayPool = byteArrayPool;
    }

    @Override // com.bumptech.glide.load.Encoder
    public boolean encode(InputStream data, File file, Options options) {
        Throwable th;
        FileOutputStream fileOutputStream;
        IOException e;
        InputStream inputStream = data;
        byte[] bArr = (byte[]) this.byteArrayPool.get(QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE, byte[].class);
        boolean z = false;
        FileOutputStream fileOutputStream2 = null;
        try {
            try {
                try {
                    fileOutputStream = new FileOutputStream(file);
                    while (true) {
                        try {
                            int read = inputStream.read(bArr);
                            if (read == -1) {
                                break;
                            }
                            fileOutputStream.write(bArr, 0, read);
                        } catch (IOException e2) {
                            e = e2;
                            fileOutputStream2 = fileOutputStream;
                            if (Log.isLoggable("StreamEncoder", 3)) {
                                Log.d("StreamEncoder", "Failed to encode data onto the OutputStream", e);
                            }
                            if (fileOutputStream2 != null) {
                                fileOutputStream2.close();
                            }
                            this.byteArrayPool.put(bArr);
                            return z;
                        } catch (Throwable th2) {
                            th = th2;
                            if (fileOutputStream != null) {
                                try {
                                    fileOutputStream.close();
                                } catch (IOException unused) {
                                }
                            }
                            this.byteArrayPool.put(bArr);
                            throw th;
                        }
                    }
                    fileOutputStream.close();
                    z = true;
                    fileOutputStream.close();
                } catch (IOException unused2) {
                }
            } catch (IOException e3) {
                e = e3;
            }
            this.byteArrayPool.put(bArr);
            return z;
        } catch (Throwable th3) {
            th = th3;
            fileOutputStream = fileOutputStream2;
        }
    }
}
