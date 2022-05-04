package com.google.android.gms.common.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import androidx.preference.R$string;
import com.google.android.gms.common.internal.GmsClientSupervisor;
import com.google.android.gms.common.stats.zza;
import java.util.HashMap;
import java.util.Objects;
/* loaded from: classes.dex */
public final class zzq extends GmsClientSupervisor implements Handler.Callback {
    public final HashMap<GmsClientSupervisor.ConnectionStatusConfig, zzr> zza = new HashMap<>();
    public final Context zzb;
    public final Handler zzc;
    public final zza zzd;
    public final long zze;
    public final long zzf;

    public zzq(Context context) {
        this.zzb = context.getApplicationContext();
        this.zzc = new Handler(context.getMainLooper(), this);
        if (zza.zzb == null) {
            synchronized (zza.zza) {
                if (zza.zzb == null) {
                    zza.zzb = new zza();
                }
            }
        }
        this.zzd = zza.zzb;
        this.zze = 5000L;
        this.zzf = 300000L;
    }

    @Override // com.google.android.gms.common.internal.GmsClientSupervisor
    public final boolean bindService(GmsClientSupervisor.ConnectionStatusConfig connectionStatusConfig, ServiceConnection serviceConnection, String str) {
        boolean z;
        R$string.zza(serviceConnection, "ServiceConnection must not be null");
        synchronized (this.zza) {
            zzr zzrVar = this.zza.get(connectionStatusConfig);
            if (zzrVar == null) {
                zzrVar = new zzr(this, connectionStatusConfig);
                connectionStatusConfig.getStartServiceIntent();
                zzrVar.zza.add(serviceConnection);
                zzrVar.zza(str);
                this.zza.put(connectionStatusConfig, zzrVar);
            } else {
                this.zzc.removeMessages(0, connectionStatusConfig);
                if (!zzrVar.zza.contains(serviceConnection)) {
                    zza zzaVar = zzrVar.zzg.zzd;
                    zzrVar.zze.getStartServiceIntent();
                    zzrVar.zza.add(serviceConnection);
                    int i = zzrVar.zzb;
                    if (i == 1) {
                        serviceConnection.onServiceConnected(zzrVar.zzf, zzrVar.zzd);
                    } else if (i == 2) {
                        zzrVar.zza(str);
                    }
                } else {
                    String valueOf = String.valueOf(connectionStatusConfig);
                    StringBuilder sb = new StringBuilder(valueOf.length() + 81);
                    sb.append("Trying to bind a GmsServiceConnection that was already connected before.  config=");
                    sb.append(valueOf);
                    throw new IllegalStateException(sb.toString());
                }
            }
            z = zzrVar.zzc;
        }
        return z;
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        int i = message.what;
        if (i == 0) {
            synchronized (this.zza) {
                GmsClientSupervisor.ConnectionStatusConfig connectionStatusConfig = (GmsClientSupervisor.ConnectionStatusConfig) message.obj;
                zzr zzrVar = this.zza.get(connectionStatusConfig);
                if (zzrVar != null && zzrVar.zza.isEmpty()) {
                    if (zzrVar.zzc) {
                        zzrVar.zzg.zzc.removeMessages(1, zzrVar.zze);
                        zzq zzqVar = zzrVar.zzg;
                        zza zzaVar = zzqVar.zzd;
                        zzqVar.zzb.unbindService(zzrVar);
                        zzrVar.zzc = false;
                        zzrVar.zzb = 2;
                    }
                    this.zza.remove(connectionStatusConfig);
                }
            }
            return true;
        } else if (i != 1) {
            return false;
        } else {
            synchronized (this.zza) {
                GmsClientSupervisor.ConnectionStatusConfig connectionStatusConfig2 = (GmsClientSupervisor.ConnectionStatusConfig) message.obj;
                zzr zzrVar2 = this.zza.get(connectionStatusConfig2);
                if (zzrVar2 != null && zzrVar2.zzb == 3) {
                    String valueOf = String.valueOf(connectionStatusConfig2);
                    StringBuilder sb = new StringBuilder(valueOf.length() + 47);
                    sb.append("Timeout waiting for ServiceConnection callback ");
                    sb.append(valueOf);
                    Log.wtf("GmsClientSupervisor", sb.toString(), new Exception());
                    ComponentName componentName = zzrVar2.zzf;
                    if (componentName == null) {
                        Objects.requireNonNull(connectionStatusConfig2);
                        componentName = null;
                    }
                    if (componentName == null) {
                        componentName = new ComponentName(connectionStatusConfig2.zzb, "unknown");
                    }
                    zzrVar2.onServiceDisconnected(componentName);
                }
            }
            return true;
        }
    }

    @Override // com.google.android.gms.common.internal.GmsClientSupervisor
    public final void unbindService(GmsClientSupervisor.ConnectionStatusConfig connectionStatusConfig, ServiceConnection serviceConnection, String str) {
        R$string.zza(serviceConnection, "ServiceConnection must not be null");
        synchronized (this.zza) {
            zzr zzrVar = this.zza.get(connectionStatusConfig);
            if (zzrVar == null) {
                String valueOf = String.valueOf(connectionStatusConfig);
                StringBuilder sb = new StringBuilder(valueOf.length() + 50);
                sb.append("Nonexistent connection status for service config: ");
                sb.append(valueOf);
                throw new IllegalStateException(sb.toString());
            } else if (zzrVar.zza.contains(serviceConnection)) {
                zza zzaVar = zzrVar.zzg.zzd;
                zzrVar.zza.remove(serviceConnection);
                if (zzrVar.zza.isEmpty()) {
                    this.zzc.sendMessageDelayed(this.zzc.obtainMessage(0, connectionStatusConfig), this.zze);
                }
            } else {
                String valueOf2 = String.valueOf(connectionStatusConfig);
                StringBuilder sb2 = new StringBuilder(valueOf2.length() + 76);
                sb2.append("Trying to unbind a GmsServiceConnection  that was not bound before.  config=");
                sb2.append(valueOf2);
                throw new IllegalStateException(sb2.toString());
            }
        }
    }
}
