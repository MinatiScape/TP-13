package com.google.android.gms.gcm;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import androidx.collection.ArrayMap;
import com.google.android.gms.iid.Rpc;
import java.util.Map;
/* loaded from: classes.dex */
public final class GcmNetworkManager {
    public static GcmNetworkManager zza;
    public Context zzb;
    public final PendingIntent zzc;
    public final ArrayMap zze = new ArrayMap();

    public final Intent zza() {
        String findIidPackage = Rpc.findIidPackage(this.zzb);
        int zza2 = findIidPackage != null ? GoogleCloudMessaging.zza(this.zzb) : -1;
        if (findIidPackage == null || zza2 < 5000000) {
            StringBuilder sb = new StringBuilder(91);
            sb.append("Google Play Services is not available, dropping GcmNetworkManager request. code=");
            sb.append(zza2);
            Log.e("GcmNetworkManager", sb.toString());
            return null;
        }
        Intent intent = new Intent("com.google.android.gms.gcm.ACTION_SCHEDULE");
        intent.setPackage(findIidPackage);
        intent.putExtra("app", this.zzc);
        intent.putExtra("source", 4);
        intent.putExtra("source_version", 12529000);
        return intent;
    }

    public final synchronized void zzb(String str, String str2) {
        Map map = (Map) this.zze.getOrDefault(str2, null);
        if (map != null) {
            if ((map.remove(str) != null) && map.isEmpty()) {
                this.zze.remove(str2);
            }
        }
    }

    public final synchronized boolean zzc(String str, String str2) {
        Map map = (Map) this.zze.getOrDefault(str2, null);
        if (map == null) {
            return false;
        }
        Boolean bool = (Boolean) map.get(str);
        if (bool == null) {
            return false;
        }
        return bool.booleanValue();
    }

    public GcmNetworkManager(Context context) {
        this.zzb = context;
        this.zzc = PendingIntent.getBroadcast(context, 0, new Intent().setPackage("com.google.example.invalidpackage"), 0);
    }

    public final synchronized boolean zzb(String str) {
        return this.zze.containsKey(str);
    }

    public final synchronized boolean zza(String str, String str2) {
        Map map;
        map = (Map) this.zze.getOrDefault(str2, null);
        if (map == null) {
            map = new ArrayMap();
            this.zze.put(str2, map);
        }
        return map.put(str, Boolean.FALSE) == null;
    }
}
