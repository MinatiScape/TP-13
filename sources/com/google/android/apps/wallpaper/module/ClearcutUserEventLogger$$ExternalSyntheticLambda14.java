package com.google.android.apps.wallpaper.module;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class ClearcutUserEventLogger$$ExternalSyntheticLambda14 implements Runnable {
    public final /* synthetic */ ClearcutUserEventLogger f$0;
    public final /* synthetic */ String f$1;

    public /* synthetic */ ClearcutUserEventLogger$$ExternalSyntheticLambda14(ClearcutUserEventLogger clearcutUserEventLogger, String str) {
        this.f$0 = clearcutUserEventLogger;
        this.f$1 = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        ClearcutUserEventLogger clearcutUserEventLogger = this.f$0;
        clearcutUserEventLogger.mCounters.getCounter(this.f$1).incrementBase(0L);
        clearcutUserEventLogger.mCounters.logAllAsync();
    }
}
