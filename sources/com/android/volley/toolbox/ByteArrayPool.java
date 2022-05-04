package com.android.volley.toolbox;

import com.android.systemui.shared.system.QuickStepContract;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
/* loaded from: classes.dex */
public final class ByteArrayPool {
    public static final AnonymousClass1 BUF_COMPARATOR = new Comparator<byte[]>() { // from class: com.android.volley.toolbox.ByteArrayPool.1
        @Override // java.util.Comparator
        public final int compare(byte[] bArr, byte[] bArr2) {
            return bArr.length - bArr2.length;
        }
    };
    public final ArrayList mBuffersByLastUse = new ArrayList();
    public final ArrayList mBuffersBySize = new ArrayList(64);
    public int mCurrentSize = 0;
    public final int mSizeLimit = QuickStepContract.SYSUI_STATE_TRACING_ENABLED;

    public final synchronized byte[] getBuf(int i) {
        for (int i2 = 0; i2 < this.mBuffersBySize.size(); i2++) {
            byte[] bArr = (byte[]) this.mBuffersBySize.get(i2);
            if (bArr.length >= i) {
                this.mCurrentSize -= bArr.length;
                this.mBuffersBySize.remove(i2);
                this.mBuffersByLastUse.remove(bArr);
                return bArr;
            }
        }
        return new byte[i];
    }

    public final synchronized void returnBuf(byte[] bArr) {
        if (bArr != null) {
            if (bArr.length <= this.mSizeLimit) {
                this.mBuffersByLastUse.add(bArr);
                int binarySearch = Collections.binarySearch(this.mBuffersBySize, bArr, BUF_COMPARATOR);
                if (binarySearch < 0) {
                    binarySearch = (-binarySearch) - 1;
                }
                this.mBuffersBySize.add(binarySearch, bArr);
                this.mCurrentSize += bArr.length;
                trim();
            }
        }
    }

    public final synchronized void trim() {
        while (this.mCurrentSize > this.mSizeLimit) {
            byte[] bArr = (byte[]) this.mBuffersByLastUse.remove(0);
            this.mBuffersBySize.remove(bArr);
            this.mCurrentSize -= bArr.length;
        }
    }
}
