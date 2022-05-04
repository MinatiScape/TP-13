package com.google.android.gms.common.internal;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.google.android.gms.common.internal.GmsClientSupervisor;
import java.util.HashSet;
import java.util.Iterator;
/* compiled from: GmsClientSupervisorImpl.java */
/* loaded from: classes.dex */
public final class zzr implements ServiceConnection {
    public final HashSet zza = new HashSet();
    public int zzb = 2;
    public boolean zzc;
    public IBinder zzd;
    public final GmsClientSupervisor.ConnectionStatusConfig zze;
    public ComponentName zzf;
    public final /* synthetic */ zzq zzg;

    /* JADX WARN: Removed duplicated region for block: B:11:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0066  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void zza() {
        /*
            r7 = this;
            r0 = 3
            r7.zzb = r0
            com.google.android.gms.common.internal.zzq r0 = r7.zzg
            com.google.android.gms.common.stats.zza r1 = r0.zzd
            android.content.Context r0 = r0.zzb
            com.google.android.gms.common.internal.GmsClientSupervisor$ConnectionStatusConfig r2 = r7.zze
            android.content.Intent r2 = r2.getStartServiceIntent()
            com.google.android.gms.common.internal.GmsClientSupervisor$ConnectionStatusConfig r3 = r7.zze
            int r3 = r3.zzd
            r1.getClass()
            android.content.ComponentName r1 = r2.getComponent()
            r4 = 0
            r5 = 1
            if (r1 != 0) goto L1f
            goto L3f
        L1f:
            java.lang.String r1 = r1.getPackageName()
            java.lang.String r6 = "com.google.android.gms"
            r6.equals(r1)
            com.google.android.gms.internal.zzbmj r6 = com.google.android.gms.internal.zzbmk.zza(r0)     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L3f
            android.content.Context r6 = r6.zza     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L3f
            android.content.pm.PackageManager r6 = r6.getPackageManager()     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L3f
            android.content.pm.ApplicationInfo r1 = r6.getApplicationInfo(r1, r4)     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L3f
            int r1 = r1.flags     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L3f
            r6 = 2097152(0x200000, float:2.938736E-39)
            r1 = r1 & r6
            if (r1 == 0) goto L3f
            r1 = r5
            goto L40
        L3f:
            r1 = r4
        L40:
            if (r1 == 0) goto L4a
            java.lang.String r0 = "ConnectionTracker"
            java.lang.String r1 = "Attempted to bind to a service in a STOPPED package."
            android.util.Log.w(r0, r1)
            goto L4e
        L4a:
            boolean r4 = r0.bindService(r2, r7, r3)
        L4e:
            r7.zzc = r4
            if (r4 == 0) goto L66
            com.google.android.gms.common.internal.zzq r0 = r7.zzg
            android.os.Handler r0 = r0.zzc
            com.google.android.gms.common.internal.GmsClientSupervisor$ConnectionStatusConfig r1 = r7.zze
            android.os.Message r0 = r0.obtainMessage(r5, r1)
            com.google.android.gms.common.internal.zzq r7 = r7.zzg
            android.os.Handler r1 = r7.zzc
            long r2 = r7.zzf
            r1.sendMessageDelayed(r0, r2)
            return
        L66:
            r0 = 2
            r7.zzb = r0
            com.google.android.gms.common.internal.zzq r0 = r7.zzg     // Catch: java.lang.IllegalArgumentException -> L72
            com.google.android.gms.common.stats.zza r1 = r0.zzd     // Catch: java.lang.IllegalArgumentException -> L72
            android.content.Context r0 = r0.zzb     // Catch: java.lang.IllegalArgumentException -> L72
            r0.unbindService(r7)     // Catch: java.lang.IllegalArgumentException -> L72
        L72:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.common.internal.zzr.zza():void");
    }

    public zzr(zzq zzqVar, GmsClientSupervisor.ConnectionStatusConfig connectionStatusConfig) {
        this.zzg = zzqVar;
        this.zze = connectionStatusConfig;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        synchronized (this.zzg.zza) {
            this.zzg.zzc.removeMessages(1, this.zze);
            this.zzd = iBinder;
            this.zzf = componentName;
            Iterator it = this.zza.iterator();
            while (it.hasNext()) {
                ((ServiceConnection) it.next()).onServiceConnected(componentName, iBinder);
            }
            this.zzb = 1;
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        synchronized (this.zzg.zza) {
            this.zzg.zzc.removeMessages(1, this.zze);
            this.zzd = null;
            this.zzf = componentName;
            Iterator it = this.zza.iterator();
            while (it.hasNext()) {
                ((ServiceConnection) it.next()).onServiceDisconnected(componentName);
            }
            this.zzb = 2;
        }
    }
}
