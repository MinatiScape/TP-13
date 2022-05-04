package com.google.android.gms.common.images;

import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.os.ResultReceiver;
import com.google.android.gms.common.annotation.KeepName;
import java.util.HashSet;
/* loaded from: classes.dex */
public final class ImageManager {
    public static final Object zza = new Object();

    @KeepName
    /* loaded from: classes.dex */
    public final class ImageReceiver extends ResultReceiver {
        @Override // android.os.ResultReceiver
        public final void onReceiveResult(int i, Bundle bundle) {
            ParcelFileDescriptor parcelFileDescriptor = (ParcelFileDescriptor) bundle.getParcelable("com.google.android.gms.extra.fileDescriptor");
            Object obj = ImageManager.zza;
            throw null;
        }
    }

    static {
        new HashSet();
    }
}
