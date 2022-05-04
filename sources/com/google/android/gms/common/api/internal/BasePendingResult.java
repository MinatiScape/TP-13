package com.google.android.gms.common.api.internal;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.util.Pair;
import androidx.cardview.R$style$$ExternalSyntheticOutline0;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.gms.common.annotation.KeepName;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
@KeepName
/* loaded from: classes.dex */
public abstract class BasePendingResult<R extends Result> extends PendingResult<R> {
    public static final zzt zzc = new zzt();
    @KeepName
    private zzb mResultGuardian;
    public final Object zza;
    public final zza<R> zzb;
    public final CountDownLatch zze;
    public final ArrayList<PendingResult.zza> zzf;
    public final AtomicReference<Object> zzh;
    public R zzi;
    public Status zzj;
    public volatile boolean zzk;
    public boolean zzm;
    public boolean zzq;

    /* loaded from: classes.dex */
    public static class zza<R extends Result> extends Handler {
        @Override // android.os.Handler
        public final void handleMessage(Message message) {
            int i = message.what;
            if (i == 1) {
                Pair pair = (Pair) message.obj;
                ResultCallback resultCallback = (ResultCallback) pair.first;
                Result result = (Result) pair.second;
                try {
                    resultCallback.onResult();
                } catch (RuntimeException e) {
                    BasePendingResult.zzb(result);
                    throw e;
                }
            } else if (i != 2) {
                Log.wtf("BasePendingResult", R$style$$ExternalSyntheticOutline0.m(45, "Don't know how to handle message: ", i), new Exception());
            } else {
                BasePendingResult basePendingResult = (BasePendingResult) message.obj;
                Status status = Status.zzd;
                synchronized (basePendingResult.zza) {
                    if (!basePendingResult.zze()) {
                        basePendingResult.zza((BasePendingResult) basePendingResult.zza(status));
                        basePendingResult.zzm = true;
                    }
                }
            }
        }

        public zza(Looper looper) {
            super(looper);
        }
    }

    /* loaded from: classes.dex */
    public final class zzb {
        public zzb() {
        }

        public final void finalize() throws Throwable {
            BasePendingResult.zzb(BasePendingResult.this.zzi);
            super.finalize();
        }
    }

    @Deprecated
    public BasePendingResult() {
        this.zza = new Object();
        this.zze = new CountDownLatch(1);
        this.zzf = new ArrayList<>();
        this.zzh = new AtomicReference<>();
        this.zzq = false;
        this.zzb = new zza<>(Looper.getMainLooper());
        new WeakReference(null);
    }

    public abstract Status zza(Status status);

    public final void zza(R r) {
        synchronized (this.zza) {
            if (!this.zzm) {
                zze();
                boolean z = true;
                LaunchUtils.zza(!zze(), "Results have already been set");
                if (this.zzk) {
                    z = false;
                }
                LaunchUtils.zza(z, "Result has already been consumed");
                zzc(r);
                return;
            }
            zzb(r);
        }
    }

    public static void zzb(Result result) {
        if (result instanceof Releasable) {
            try {
                ((Releasable) result).release();
            } catch (RuntimeException e) {
                String valueOf = String.valueOf(result);
                StringBuilder sb = new StringBuilder(valueOf.length() + 18);
                sb.append("Unable to release ");
                sb.append(valueOf);
                Log.w("BasePendingResult", sb.toString(), e);
            }
        }
    }

    public final void zzc(R r) {
        this.zzi = r;
        this.zze.countDown();
        this.zzj = this.zzi.getStatus();
        if (this.zzi instanceof Releasable) {
            this.mResultGuardian = new zzb();
        }
        ArrayList<PendingResult.zza> arrayList = this.zzf;
        int size = arrayList.size();
        int i = 0;
        while (i < size) {
            PendingResult.zza zzaVar = arrayList.get(i);
            i++;
            zzaVar.zza();
        }
        this.zzf.clear();
    }

    public final boolean zze() {
        if (this.zze.getCount() == 0) {
            return true;
        }
        return false;
    }

    public BasePendingResult(zzbx zzbxVar) {
        Looper looper;
        this.zza = new Object();
        this.zze = new CountDownLatch(1);
        this.zzf = new ArrayList<>();
        this.zzh = new AtomicReference<>();
        this.zzq = false;
        if (zzbxVar != null) {
            looper = zzbxVar.zza.zzf;
        } else {
            looper = Looper.getMainLooper();
        }
        this.zzb = new zza<>(looper);
        new WeakReference(zzbxVar);
    }
}
