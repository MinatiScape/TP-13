package android.support.v4.media;

import android.annotation.TargetApi;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.util.Log;
@TargetApi(16)
/* loaded from: classes.dex */
public final class MediaController2ImplLegacy implements AutoCloseable {
    public static final /* synthetic */ int $r8$clinit = 0;

    /* renamed from: android.support.v4.media.MediaController2ImplLegacy$3  reason: invalid class name */
    /* loaded from: classes.dex */
    class AnonymousClass3 extends ResultReceiver {
        @Override // android.os.ResultReceiver
        public final void onReceiveResult(int i, Bundle bundle) {
            int i2 = MediaController2ImplLegacy.$r8$clinit;
            throw null;
        }
    }

    static {
        Log.isLoggable("MC2ImplLegacy", 3);
        new Bundle().putBoolean("android.support.v4.media.root_default_root", true);
    }
}
