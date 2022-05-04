package com.google.android.gms.common.api.internal;

import android.app.ActivityManager;
import android.app.Application;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import androidx.collection.ArraySet;
import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.api.GoogleApi;
import com.google.android.gms.common.api.GoogleApiActivity;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzv;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
/* compiled from: GoogleApiManager.java */
/* loaded from: classes.dex */
public final class zzbn implements Handler.Callback {
    public static final Status zza = new Status(4, "Sign-out occurred while this API call was in progress.");
    public static final Status zzb = new Status(4, "The user must be signed in to make this API call.");
    public static final Object zzf = new Object();
    public static zzbn zzg;
    public final Context zzh;
    public final GoogleApiAvailability zzi;
    public final Handler zzq;
    public long zze = 10000;
    public final AtomicInteger zzk = new AtomicInteger(1);
    public final AtomicInteger zzl = new AtomicInteger(0);
    public final ConcurrentHashMap zzm = new ConcurrentHashMap(5, 0.75f, 1);
    public final ArraySet zzo = new ArraySet(0);
    public final ArraySet zzp = new ArraySet(0);
    public final zzv zzj = new zzv();

    public static zzbn zza(Context context) {
        zzbn zzbnVar;
        synchronized (zzf) {
            if (zzg == null) {
                HandlerThread handlerThread = new HandlerThread("GoogleApiHandler", 9);
                handlerThread.start();
                Looper looper = handlerThread.getLooper();
                Context applicationContext = context.getApplicationContext();
                Object obj = GoogleApiAvailability.zza;
                zzg = new zzbn(applicationContext, looper);
            }
            zzbnVar = zzg;
        }
        return zzbnVar;
    }

    public zzbn(Context context, Looper looper) {
        GoogleApiAvailability googleApiAvailability = GoogleApiAvailability.zzb;
        this.zzh = context;
        Handler handler = new Handler(looper, this);
        this.zzq = handler;
        this.zzi = googleApiAvailability;
        handler.sendMessage(handler.obtainMessage(6));
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        Status status;
        int i = message.what;
        zzbp zzbpVar = null;
        long j = 300000;
        boolean z = false;
        switch (i) {
            case 1:
                if (((Boolean) message.obj).booleanValue()) {
                    j = 10000;
                }
                this.zze = j;
                this.zzq.removeMessages(12);
                for (zzi zziVar : this.zzm.keySet()) {
                    Handler handler = this.zzq;
                    handler.sendMessageDelayed(handler.obtainMessage(12, zziVar), this.zze);
                }
                break;
            case 2:
                ((zzk) message.obj).getClass();
                throw null;
            case 3:
                for (zzbp zzbpVar2 : this.zzm.values()) {
                    LaunchUtils.zza(zzbpVar2.zza.zzq);
                    zzbpVar2.zzm = null;
                    zzbpVar2.zzi();
                }
                break;
            case 4:
            case 8:
            case 13:
                zzcu zzcuVar = (zzcu) message.obj;
                zzbp zzbpVar3 = (zzbp) this.zzm.get(zzcuVar.zzc.zze);
                if (zzbpVar3 == null) {
                    zzb(zzcuVar.zzc);
                    zzbpVar3 = (zzbp) this.zzm.get(zzcuVar.zzc.zze);
                }
                if (!zzbpVar3.zzc.requiresSignIn() || this.zzl.get() == zzcuVar.zzb) {
                    zzbpVar3.zza(zzcuVar.zza);
                    break;
                } else {
                    zzcuVar.zza.zza(zza);
                    zzbpVar3.zza$5();
                    break;
                }
            case 5:
                int i2 = message.arg1;
                ConnectionResult connectionResult = (ConnectionResult) message.obj;
                Iterator it = this.zzm.values().iterator();
                while (true) {
                    if (it.hasNext()) {
                        zzbp zzbpVar4 = (zzbp) it.next();
                        if (zzbpVar4.zzi == i2) {
                            zzbpVar = zzbpVar4;
                        }
                    }
                }
                if (zzbpVar != null) {
                    String errorString = this.zzi.getErrorString(connectionResult.zzc);
                    String str = connectionResult.zze;
                    StringBuilder sb = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(str, ParseRDF$$ExternalSyntheticOutline0.m(errorString, 69)));
                    sb.append("Error resolution was canceled by the user, original error message: ");
                    sb.append(errorString);
                    sb.append(": ");
                    sb.append(str);
                    zzbpVar.zza(new Status(17, sb.toString()));
                    break;
                } else {
                    StringBuilder sb2 = new StringBuilder(76);
                    sb2.append("Could not find API instance ");
                    sb2.append(i2);
                    sb2.append(" while trying to fail enqueued calls.");
                    Log.wtf("GoogleApiManager", sb2.toString(), new Exception());
                    break;
                }
            case 6:
                if (this.zzh.getApplicationContext() instanceof Application) {
                    Application application = (Application) this.zzh.getApplicationContext();
                    zzl zzlVar = zzl.zza;
                    synchronized (zzlVar) {
                        if (!zzlVar.zze) {
                            application.registerActivityLifecycleCallbacks(zzlVar);
                            application.registerComponentCallbacks(zzlVar);
                            zzlVar.zze = true;
                        }
                    }
                    zzbo zzboVar = new zzbo(this);
                    synchronized (zzlVar) {
                        zzlVar.zzd.add(zzboVar);
                    }
                    if (!zzlVar.zzc.get()) {
                        ActivityManager.RunningAppProcessInfo runningAppProcessInfo = new ActivityManager.RunningAppProcessInfo();
                        ActivityManager.getMyMemoryState(runningAppProcessInfo);
                        if (!zzlVar.zzc.getAndSet(true) && runningAppProcessInfo.importance > 100) {
                            zzlVar.zzb.set(true);
                        }
                    }
                    if (!zzlVar.zzb.get()) {
                        this.zze = 300000L;
                        break;
                    }
                }
                break;
            case 7:
                zzb((GoogleApi) message.obj);
                break;
            case 9:
                if (this.zzm.containsKey(message.obj)) {
                    zzbp zzbpVar5 = (zzbp) this.zzm.get(message.obj);
                    LaunchUtils.zza(zzbpVar5.zza.zzq);
                    if (zzbpVar5.zzk) {
                        zzbpVar5.zzi();
                        break;
                    }
                }
                break;
            case 10:
                ArraySet arraySet = this.zzp;
                arraySet.getClass();
                ArraySet.ElementIterator elementIterator = new ArraySet.ElementIterator();
                while (elementIterator.hasNext()) {
                    ((zzbp) this.zzm.remove((zzi) elementIterator.next())).zza$5();
                }
                this.zzp.clear();
                break;
            case 11:
                if (this.zzm.containsKey(message.obj)) {
                    zzbp zzbpVar6 = (zzbp) this.zzm.get(message.obj);
                    LaunchUtils.zza(zzbpVar6.zza.zzq);
                    if (zzbpVar6.zzk) {
                        zzbpVar6.zzp();
                        zzbn zzbnVar = zzbpVar6.zza;
                        if (zzbnVar.zzi.isGooglePlayServicesAvailable(zzbnVar.zzh) == 18) {
                            status = new Status(8, "Connection timed out while waiting for Google Play services update to complete.");
                        } else {
                            status = new Status(8, "API failed to connect while resuming due to an unknown error.");
                        }
                        zzbpVar6.zza(status);
                        zzbpVar6.zzc.disconnect();
                        break;
                    }
                }
                break;
            case 12:
                if (this.zzm.containsKey(message.obj)) {
                    zzbp zzbpVar7 = (zzbp) this.zzm.get(message.obj);
                    LaunchUtils.zza(zzbpVar7.zza.zzq);
                    if (zzbpVar7.zzc.isConnected() && zzbpVar7.zzh.size() == 0) {
                        zzaf zzafVar = zzbpVar7.zzf;
                        if (!zzafVar.zza.isEmpty() || !zzafVar.zzb.isEmpty()) {
                            z = true;
                        }
                        if (z) {
                            zzbpVar7.zzq();
                            break;
                        } else {
                            zzbpVar7.zzc.disconnect();
                            break;
                        }
                    }
                }
                break;
            default:
                StringBuilder sb3 = new StringBuilder(31);
                sb3.append("Unknown message id: ");
                sb3.append(i);
                Log.w("GoogleApiManager", sb3.toString());
                return false;
        }
        return true;
    }

    public final void zzb(GoogleApi<?> googleApi) {
        zzi<?> zziVar = googleApi.zze;
        zzbp zzbpVar = (zzbp) this.zzm.get(zziVar);
        if (zzbpVar == null) {
            zzbpVar = new zzbp(this, googleApi);
            this.zzm.put(zziVar, zzbpVar);
        }
        if (zzbpVar.zzc.requiresSignIn()) {
            this.zzp.add(zziVar);
        }
        zzbpVar.zzi();
    }

    public final boolean zza(ConnectionResult connectionResult, int i) {
        PendingIntent pendingIntent;
        GoogleApiAvailability googleApiAvailability = this.zzi;
        Context context = this.zzh;
        googleApiAvailability.getClass();
        int i2 = connectionResult.zzc;
        if ((i2 == 0 || connectionResult.zzd == null) ? false : true) {
            pendingIntent = connectionResult.zzd;
        } else {
            pendingIntent = googleApiAvailability.getErrorResolutionPendingIntent(context, i2, null);
        }
        if (pendingIntent == null) {
            return false;
        }
        int i3 = connectionResult.zzc;
        int i4 = GoogleApiActivity.$r8$clinit;
        Intent intent = new Intent(context, GoogleApiActivity.class);
        intent.putExtra("pending_intent", pendingIntent);
        intent.putExtra("failing_client_id", i);
        intent.putExtra("notify_manager", true);
        googleApiAvailability.zza(context, i3, PendingIntent.getActivity(context, 0, intent, 134217728));
        return true;
    }
}
