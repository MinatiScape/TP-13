package com.google.android.gms.clearcut;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.SystemClock;
import android.util.Log;
import com.google.android.gms.clearcut.internal.zzb;
import com.google.android.gms.clearcut.internal.zzs;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.util.Clock;
import com.google.android.gms.common.util.zzh;
import com.google.android.gms.internal.zzgsv;
import java.util.TimeZone;
/* loaded from: classes.dex */
public final class ClearcutLogger {
    @Deprecated
    public static final Api<Object> API;
    public static final zzd zzb;
    public final String zzf;
    public final int zzg;
    public String zzh;
    public int zzi;
    public String zzj;
    public final ClearcutLoggerApi zzn;
    public final Clock zzo;
    public TimeZoneOffsetProvider zzp;
    public final LogSampler zzq;

    /* loaded from: classes.dex */
    public class LogEventBuilder {
        public int zza;
        public String zzb;
        public String zzc;
        public String zzd;
        public final MessageProducer zzf;
        public final zzgsv zzn;
        public boolean zzo = false;

        public LogEventBuilder(byte[] bArr, MessageProducer messageProducer) {
            this.zza = ClearcutLogger.this.zzi;
            this.zzb = ClearcutLogger.this.zzh;
            this.zzc = ClearcutLogger.this.zzj;
            this.zzd = null;
            zzgsv zzgsvVar = new zzgsv();
            this.zzn = zzgsvVar;
            this.zzc = ClearcutLogger.this.zzj;
            this.zzd = null;
            ((zzh) ClearcutLogger.this.zzo).getClass();
            zzgsvVar.zza = System.currentTimeMillis();
            ((zzh) ClearcutLogger.this.zzo).getClass();
            zzgsvVar.zzb = SystemClock.elapsedRealtime();
            TimeZoneOffsetProvider timeZoneOffsetProvider = ClearcutLogger.this.zzp;
            long j = zzgsvVar.zza;
            timeZoneOffsetProvider.getClass();
            zzgsvVar.zzg = TimeZone.getDefault().getOffset(j) / 1000;
            if (bArr != null) {
                zzgsvVar.zzf = bArr;
            }
            this.zzf = messageProducer;
        }

        /* JADX WARN: Code restructure failed: missing block: B:140:0x0247, code lost:
            if (r2 < r4) goto L75;
         */
        /* JADX WARN: Removed duplicated region for block: B:143:0x024e  */
        /* JADX WARN: Removed duplicated region for block: B:151:0x0296  */
        /* JADX WARN: Removed duplicated region for block: B:161:0x01c0 A[EXC_TOP_SPLITTER, SYNTHETIC] */
        /* JADX WARN: Removed duplicated region for block: B:76:0x0164  */
        @java.lang.Deprecated
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final com.google.android.gms.common.api.internal.BasePendingResult logAsync() {
            /*
                Method dump skipped, instructions count: 720
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.clearcut.ClearcutLogger.LogEventBuilder.logAsync():com.google.android.gms.common.api.internal.BasePendingResult");
        }
    }

    /* loaded from: classes.dex */
    public interface LogSampler {
    }

    /* loaded from: classes.dex */
    public interface MessageProducer {
    }

    /* loaded from: classes.dex */
    public static class TimeZoneOffsetProvider {
    }

    static {
        Api.ClientKey clientKey = new Api.ClientKey();
        zzd zzdVar = new zzd();
        zzb = zzdVar;
        API = new Api<>(zzdVar, clientKey);
    }

    public ClearcutLogger(Context context) {
        zzb zzbVar = new zzb(context);
        zzh zzhVar = zzh.zza;
        zzs zzsVar = new zzs(context);
        this.zzi = -1;
        this.zzf = context.getPackageName();
        int i = 0;
        try {
            i = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            Log.wtf("ClearcutLogger", "This can't happen.", e);
        }
        this.zzg = i;
        this.zzi = -1;
        this.zzh = "WALLPAPER_PICKER";
        this.zzj = null;
        this.zzn = zzbVar;
        this.zzo = zzhVar;
        this.zzp = new TimeZoneOffsetProvider();
        this.zzq = zzsVar;
    }
}
