package com.google.android.apps.wallpaper.backdrop;

import android.app.backup.BackupManager;
import android.content.Context;
import android.content.SharedPreferences;
/* loaded from: classes.dex */
public final class BackdropPreferences {
    public static BackdropPreferences sInstance;
    public SharedPreferences mSharedPrefs;
    public AnonymousClass1 mSharedPrefsChangedListener;

    public static BackdropPreferences getInstance(Context context) {
        if (sInstance == null) {
            sInstance = new BackdropPreferences(context);
        }
        return sInstance;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v1, types: [com.google.android.apps.wallpaper.backdrop.BackdropPreferences$1, android.content.SharedPreferences$OnSharedPreferenceChangeListener] */
    public BackdropPreferences(Context context) {
        this.mSharedPrefs = context.getSharedPreferences("wallpaper-backdrop", 0);
        final BackupManager backupManager = new BackupManager(context);
        ?? r3 = new SharedPreferences.OnSharedPreferenceChangeListener() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropPreferences.1
            @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
            public final void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str) {
                backupManager.dataChanged();
            }
        };
        this.mSharedPrefsChangedListener = r3;
        this.mSharedPrefs.registerOnSharedPreferenceChangeListener(r3);
    }
}
