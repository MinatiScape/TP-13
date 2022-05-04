package com.google.android.gms.common.internal;

import android.content.Intent;
import android.text.TextUtils;
import androidx.core.R$id;
import com.google.android.gms.common.internal.BaseGmsClient;
import java.util.Arrays;
/* loaded from: classes.dex */
public abstract class GmsClientSupervisor {
    public static final Object zza = new Object();
    public static zzq zzb;

    /* loaded from: classes.dex */
    public static final class ConnectionStatusConfig {
        public final String zza;
        public final String zzb;
        public final int zzd;

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ConnectionStatusConfig)) {
                return false;
            }
            ConnectionStatusConfig connectionStatusConfig = (ConnectionStatusConfig) obj;
            return R$id.zza(this.zza, connectionStatusConfig.zza) && R$id.zza(this.zzb, connectionStatusConfig.zzb) && R$id.zza(null, null) && this.zzd == connectionStatusConfig.zzd;
        }

        public final int hashCode() {
            return Arrays.hashCode(new Object[]{this.zza, this.zzb, null, Integer.valueOf(this.zzd)});
        }

        public final Intent getStartServiceIntent() {
            if (this.zza != null) {
                return new Intent(this.zza).setPackage(this.zzb);
            }
            return new Intent().setComponent(null);
        }

        public final String toString() {
            String str = this.zza;
            str.getClass();
            return str;
        }

        public ConnectionStatusConfig(String str, String str2, int i) {
            if (!TextUtils.isEmpty(str)) {
                this.zza = str;
                if (!TextUtils.isEmpty(str2)) {
                    this.zzb = str2;
                    this.zzd = i;
                    return;
                }
                throw new IllegalArgumentException("Given String is empty or null");
            }
            throw new IllegalArgumentException("Given String is empty or null");
        }
    }

    public abstract boolean bindService(ConnectionStatusConfig connectionStatusConfig, BaseGmsClient.zze zzeVar, String str);

    public abstract void unbindService(ConnectionStatusConfig connectionStatusConfig, BaseGmsClient.zze zzeVar);
}
