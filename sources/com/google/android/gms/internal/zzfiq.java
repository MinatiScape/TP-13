package com.google.android.gms.internal;

import android.content.ContentResolver;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.net.Uri;
import android.util.Log;
import com.android.systemui.flags.FlagManager;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;
/* compiled from: ConfigurationContentLoader.java */
/* loaded from: classes.dex */
public final class zzfiq {
    public static final ConcurrentHashMap<Uri, zzfiq> zza = new ConcurrentHashMap<>();
    public static final String[] zzg = {"key", FlagManager.EXTRA_VALUE};
    public final ContentResolver zzb;
    public final Uri zzc;
    public volatile HashMap zzf;
    public final Object zze = new Object();
    public final zzfir zzd = new zzfir(this);

    public final HashMap zzc() {
        try {
            HashMap hashMap = new HashMap();
            Cursor query = this.zzb.query(this.zzc, zzg, null, null, null);
            if (query != null) {
                while (query.moveToNext()) {
                    hashMap.put(query.getString(0), query.getString(1));
                }
                query.close();
            }
            return hashMap;
        } catch (SQLiteException | SecurityException unused) {
            Log.e("ConfigurationContentLoader", "PhenotypeFlag unable to load ContentProvider, using default values");
            return null;
        }
    }

    public zzfiq(ContentResolver contentResolver, Uri uri) {
        this.zzb = contentResolver;
        this.zzc = uri;
    }
}
