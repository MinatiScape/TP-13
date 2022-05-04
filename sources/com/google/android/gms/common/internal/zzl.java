package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.IInterface;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Scope;
import java.util.Set;
/* compiled from: GmsClient.java */
/* loaded from: classes.dex */
public abstract class zzl<T extends IInterface> extends BaseGmsClient<T> implements Api.Client {
    public final Set<Scope> zzd;
    public final Account zze;

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public zzl(android.content.Context r10, android.os.Looper r11, int r12, com.google.android.gms.common.internal.ClientSettings r13, com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks r14, com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener r15) {
        /*
            r9 = this;
            java.lang.Object r0 = com.google.android.gms.common.internal.GmsClientSupervisor.zza
            monitor-enter(r0)
            com.google.android.gms.common.internal.zzq r1 = com.google.android.gms.common.internal.GmsClientSupervisor.zzb     // Catch: java.lang.Throwable -> L13
            if (r1 != 0) goto L15
            com.google.android.gms.common.internal.zzq r1 = new com.google.android.gms.common.internal.zzq     // Catch: java.lang.Throwable -> L13
            android.content.Context r2 = r10.getApplicationContext()     // Catch: java.lang.Throwable -> L13
            r1.<init>(r2)     // Catch: java.lang.Throwable -> L13
            com.google.android.gms.common.internal.GmsClientSupervisor.zzb = r1     // Catch: java.lang.Throwable -> L13
            goto L15
        L13:
            r9 = move-exception
            goto L5b
        L15:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L13
            com.google.android.gms.common.internal.zzq r4 = com.google.android.gms.common.internal.GmsClientSupervisor.zzb
            java.lang.Object r0 = com.google.android.gms.common.GoogleApiAvailability.zza
            com.android.wallpaper.util.LaunchUtils.zza(r14)
            com.android.wallpaper.util.LaunchUtils.zza(r15)
            com.google.android.gms.common.internal.zzm r6 = new com.google.android.gms.common.internal.zzm
            r6.<init>(r14)
            com.google.android.gms.common.internal.zzn r7 = new com.google.android.gms.common.internal.zzn
            r7.<init>(r15)
            java.lang.String r8 = r13.zzh
            r1 = r9
            r2 = r10
            r3 = r11
            r5 = r12
            r1.<init>(r2, r3, r4, r5, r6, r7, r8)
            android.accounts.Account r10 = r13.zza
            r9.zze = r10
            java.util.Set<com.google.android.gms.common.api.Scope> r10 = r13.zzc
            java.util.Iterator r11 = r10.iterator()
        L3d:
            boolean r12 = r11.hasNext()
            if (r12 == 0) goto L58
            java.lang.Object r12 = r11.next()
            com.google.android.gms.common.api.Scope r12 = (com.google.android.gms.common.api.Scope) r12
            boolean r12 = r10.contains(r12)
            if (r12 == 0) goto L50
            goto L3d
        L50:
            java.lang.IllegalStateException r9 = new java.lang.IllegalStateException
            java.lang.String r10 = "Expanding scopes is not permitted, use implied scopes instead"
            r9.<init>(r10)
            throw r9
        L58:
            r9.zzd = r10
            return
        L5b:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L13
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.common.internal.zzl.<init>(android.content.Context, android.os.Looper, int, com.google.android.gms.common.internal.ClientSettings, com.google.android.gms.common.api.GoogleApiClient$ConnectionCallbacks, com.google.android.gms.common.api.GoogleApiClient$OnConnectionFailedListener):void");
    }
}
