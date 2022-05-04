package com.google.android.gms.gcm;

import androidx.cardview.R$style$$ExternalSyntheticOutline0;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
/* compiled from: GcmTaskService.java */
/* loaded from: classes.dex */
public final class zzb implements ThreadFactory {
    public final AtomicInteger zza = new AtomicInteger(1);

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        Thread thread = new Thread(runnable, R$style$$ExternalSyntheticOutline0.m(20, "gcm-task#", this.zza.getAndIncrement()));
        thread.setPriority(4);
        return thread;
    }
}
