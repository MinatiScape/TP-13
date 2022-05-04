package com.android.wallpaper.util;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import com.android.wallpaper.module.LoggingOptInStatusProvider;
import com.google.android.libraries.microvideo.MicrovideoXmpMetadata;
/* loaded from: classes.dex */
public class LaunchUtils implements LoggingOptInStatusProvider, MicrovideoXmpMetadata.ThrowableSupplier {
    public static final LaunchUtils $instance = new LaunchUtils();

    public static void zza(Object obj) {
        if (obj == null) {
            throw new NullPointerException("null reference");
        }
    }

    public static void launchHome(Context context) {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.HOME");
        intent.setFlags(268468224);
        context.startActivity(intent);
    }

    public static void zza(Object obj, String str) {
        if (obj == null) {
            throw new NullPointerException(str);
        }
    }

    @Override // com.google.android.libraries.microvideo.MicrovideoXmpMetadata.ThrowableSupplier
    public Object get() {
        MicrovideoXmpMetadata.requiredValueMissing("payload length");
        throw null;
    }

    public static void zza(boolean z, String str) {
        if (!z) {
            throw new IllegalStateException(str);
        }
    }

    public static void zza(Handler handler) {
        if (Looper.myLooper() != handler.getLooper()) {
            throw new IllegalStateException("Must be called on the handler thread");
        }
    }
}
