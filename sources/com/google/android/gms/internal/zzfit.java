package com.google.android.gms.internal;

import android.content.res.Resources;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import java.util.Collections;
import java.util.Map;
import java.util.Objects;
/* loaded from: classes.dex */
public /* synthetic */ class zzfit implements zzfiy {
    public static zzfit sInstance$com$android$wallpaper$util$DisplayMetricsRetriever;
    public Object zza;
    public Object zzb;

    public zzfit(zzfis zzfisVar, zzfiq zzfiqVar) {
        this.zza = zzfisVar;
        this.zzb = zzfiqVar;
    }

    public static zzfit getInstance() {
        if (sInstance$com$android$wallpaper$util$DisplayMetricsRetriever == null) {
            sInstance$com$android$wallpaper$util$DisplayMetricsRetriever = new zzfit();
        }
        return sInstance$com$android$wallpaper$util$DisplayMetricsRetriever;
    }

    public DisplayMetrics getDisplayMetrics(Resources resources, Display display) {
        int i = resources.getConfiguration().orientation;
        if (i == 1) {
            return getPortraitDisplayMetrics(display);
        }
        if (i == 2) {
            return getLandscapeDisplayMetrics(display);
        }
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unknown device orientation: ");
        m.append(resources.getConfiguration().orientation);
        Log.e("DisplayMetricsRetriever", m.toString());
        return getPortraitDisplayMetrics(display);
    }

    public DisplayMetrics getLandscapeDisplayMetrics(Display display) {
        if (((DisplayMetrics) this.zzb) == null) {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            this.zzb = displayMetrics;
            writeDisplayMetrics(display, displayMetrics);
        }
        return (DisplayMetrics) this.zzb;
    }

    public DisplayMetrics getPortraitDisplayMetrics(Display display) {
        if (((DisplayMetrics) this.zza) == null) {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            this.zza = displayMetrics;
            writeDisplayMetrics(display, displayMetrics);
        }
        return (DisplayMetrics) this.zza;
    }

    public void writeDisplayMetrics(Display display, DisplayMetrics displayMetrics) {
        display.getMetrics(displayMetrics);
    }

    @Override // com.google.android.gms.internal.zzfiy
    public Object zza() {
        zzfis zzfisVar = (zzfis) this.zza;
        zzfiq zzfiqVar = (zzfiq) this.zzb;
        Objects.requireNonNull(zzfiqVar);
        Map<String, String> zzc = zzfis.zza("gms:phenotype:phenotype_flag:debug_disable_caching") ? zzfiqVar.zzc() : zzfiqVar.zzf;
        if (zzc == null) {
            synchronized (zzfiqVar.zze) {
                zzc = zzfiqVar.zzf;
                if (zzc == null) {
                    zzc = zzfiqVar.zzc();
                    zzfiqVar.zzf = zzc;
                }
            }
        }
        if (zzc == null) {
            zzc = Collections.emptyMap();
        }
        return zzc.get(zzfisVar.zza);
    }

    public zzfit() {
    }
}
