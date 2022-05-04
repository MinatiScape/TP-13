package com.android.wallpaper.asset;

import android.os.Handler;
import android.os.Looper;
import com.android.wallpaper.asset.StreamableAsset;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class StreamableAsset$$ExternalSyntheticLambda5 implements Runnable {
    public final /* synthetic */ StreamableAsset f$0;
    public final /* synthetic */ StreamableAsset.StreamReceiver f$1;

    public /* synthetic */ StreamableAsset$$ExternalSyntheticLambda5(StreamableAsset streamableAsset, StreamableAsset.StreamReceiver streamReceiver) {
        this.f$0 = streamableAsset;
        this.f$1 = streamReceiver;
    }

    @Override // java.lang.Runnable
    public final void run() {
        StreamableAsset streamableAsset = this.f$0;
        new Handler(Looper.getMainLooper()).post(new StreamableAsset$$ExternalSyntheticLambda1(this.f$1, streamableAsset.openInputStream(), 0));
    }
}
