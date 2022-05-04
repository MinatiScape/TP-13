package com.google.android.gms.clearcut.internal;

import android.content.Context;
import com.google.android.gms.clearcut.ClearcutLogger;
import com.google.android.gms.clearcut.ClearcutLoggerApi;
import com.google.android.gms.common.api.GoogleApi;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: ClearcutLoggerApiImpl.java */
/* loaded from: classes.dex */
public final class zzb extends GoogleApi<Object> implements ClearcutLoggerApi {
    public zzb(Context context) {
        super(context, ClearcutLogger.API, new Intrinsics());
    }
}
