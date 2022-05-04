package com.google.android.apps.wallpaper.module;

import android.content.Context;
import android.content.Intent;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.ArrayMap;
import android.util.Log;
import android.util.SparseArray;
import androidx.activity.ComponentActivity$$ExternalSyntheticLambda2;
import androidx.cardview.R$style;
import androidx.dynamicanimation.animation.AnimationHandler$$ExternalSyntheticLambda0;
import com.android.customization.model.grid.GridOption;
import com.android.customization.module.ThemesUserEventLogger;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.LoggingOptInStatusProvider;
import com.android.wallpaper.module.WallpaperPreferences;
import com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda8;
import com.android.wallpaper.util.LaunchUtils;
import com.bumptech.glide.manager.ApplicationLifecycle;
import com.google.android.gms.clearcut.ClearcutLogger;
import com.google.android.gms.clearcut.Counters;
import com.google.android.gms.common.util.zzh;
import com.google.wireless.android.apps.wallpaper.WallpaperLogProto$WallpaperEvent;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class ClearcutUserEventLogger extends ApplicationLifecycle implements ThemesUserEventLogger {
    public static final boolean IS_VERBOSE = Log.isLoggable("UserEvent", 2);
    public static final ArrayMap<Class, SparseArray<String>> sNameCache = new ArrayMap<>();
    public ClearcutLogger mClearcutLogger;
    public Context mContext;
    public Counters mCounters;
    public LoggingOptInStatusProvider mLoggingOptInStatusProvider;
    public WallpaperPreferences mPreferences;
    public final zzh mWallpaperStatusChecker;

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logAppLaunched(Intent intent) {
    }

    @Override // com.android.customization.module.ThemesUserEventLogger
    public final void logColorApplied(int i, int i2) {
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logCurrentWallpaperPreviewed() {
        logBasicEvent(6);
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logDailyRefreshTurnedOn() {
        logBasicEvent(3);
        logIfOptedIn(new AnimationHandler$$ExternalSyntheticLambda0(this, 2));
    }

    public final void log(WallpaperLogProto$WallpaperEvent wallpaperLogProto$WallpaperEvent) {
        SparseArray<String> sparseArray;
        int i;
        Field[] declaredFields;
        Field[] declaredFields2;
        ClearcutLogger clearcutLogger = this.mClearcutLogger;
        byte[] byteArray = wallpaperLogProto$WallpaperEvent.toByteArray();
        clearcutLogger.getClass();
        new ClearcutLogger.LogEventBuilder(byteArray, null).logAsync();
        if (IS_VERBOSE) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("type:");
            int number = wallpaperLogProto$WallpaperEvent.getType().getNumber();
            ArrayMap<Class, SparseArray<String>> arrayMap = sNameCache;
            synchronized (arrayMap) {
                sparseArray = arrayMap.get(WallpaperLogProto$WallpaperEvent.Type.class);
                if (sparseArray == null) {
                    sparseArray = new SparseArray<>();
                    for (Field field : WallpaperLogProto$WallpaperEvent.Type.class.getDeclaredFields()) {
                        if (field.getType() == Integer.TYPE && Modifier.isStatic(field.getModifiers())) {
                            try {
                                field.setAccessible(true);
                                sparseArray.put(field.getInt(null), field.getName());
                            } catch (IllegalAccessException unused) {
                            }
                        }
                    }
                    sNameCache.put(WallpaperLogProto$WallpaperEvent.Type.class, sparseArray);
                }
            }
            String str = sparseArray.get(number);
            if (str == null) {
                str = "UNKNOWN";
            }
            m.append(str);
            Log.d("UserEvent", m.toString());
            try {
                for (Field field2 : WallpaperLogProto$WallpaperEvent.class.getDeclaredFields()) {
                    Object obj = WallpaperLogProto$WallpaperEvent.class.getField(field2.getName()).get(wallpaperLogProto$WallpaperEvent);
                    if (!field2.getName().equals(WallpaperLogProto$WallpaperEvent.Type.class.getName()) && (obj instanceof Integer) && ((Integer) obj).intValue() != 0) {
                        Log.d("UserEvent", field2.getName() + ":" + ((Integer) obj).intValue());
                    }
                }
            } catch (IllegalAccessException | NoSuchFieldException unused2) {
            }
        }
    }

    public final void logBasicEvent(final int i) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                int i2 = i;
                clearcutUserEventLogger.getClass();
                WallpaperLogProto$WallpaperEvent.Builder newBuilder = WallpaperLogProto$WallpaperEvent.newBuilder();
                newBuilder.setType(WallpaperLogProto$WallpaperEvent.Type.forNumber(i2));
                clearcutUserEventLogger.log(newBuilder.build());
            }
        });
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logCategorySelected(String str) {
        logIfOptedIn(new ClearcutUserEventLogger$$ExternalSyntheticLambda13(this, 4, str));
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logDailyWallpaperMetadataRequestFailure(final int i) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda9
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                clearcutUserEventLogger.mCounters.getIntegerHistogram("DailyWallpaper.MetadataRequestFailureReason").increment(i);
                clearcutUserEventLogger.mCounters.logAllAsync();
            }
        });
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logDailyWallpaperRotationHour(final int i) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                clearcutUserEventLogger.mCounters.getIntegerHistogram("DailyWallpaper.RotationHourOfDay").increment(i);
                clearcutUserEventLogger.mCounters.logAllAsync();
            }
        });
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logDailyWallpaperRotationStatus(final int i) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                int i2 = i;
                clearcutUserEventLogger.mCounters.getIntegerHistogram("DailyWallpaper.RotationStatus").increment(i2);
                Counters.IntegerHistogram integerHistogram = clearcutUserEventLogger.mCounters.getIntegerHistogram("DailyWallpaper.DailyRotationResult");
                if (2 == i2 || 3 == i2 || 4 == i2) {
                    integerHistogram.increment(0);
                }
                if (i2 == 0 || 5 == i2) {
                    integerHistogram.increment(1);
                }
                clearcutUserEventLogger.mCounters.logAllAsync();
            }
        });
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logDailyWallpaperSetNextWallpaperCrash(final int i) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda8
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                clearcutUserEventLogger.mCounters.getIntegerHistogram("DailyWallpaper.SetNextWallpaperCrash").increment(i);
                clearcutUserEventLogger.mCounters.logAllAsync();
            }
        });
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logDailyWallpaperSetNextWallpaperResult(final int i) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                clearcutUserEventLogger.mCounters.getIntegerHistogram("DailyWallpaper.SetNextWallpaperResult").increment(i);
                clearcutUserEventLogger.mCounters.logAllAsync();
            }
        });
    }

    @Override // com.android.customization.module.ThemesUserEventLogger
    public final void logGridApplied(GridOption gridOption) {
        logIfOptedIn(new ClearcutUserEventLogger$$ExternalSyntheticLambda12(this, 14, gridOption));
    }

    @Override // com.android.customization.module.ThemesUserEventLogger
    public final void logGridSelected(GridOption gridOption) {
        logIfOptedIn(new ClearcutUserEventLogger$$ExternalSyntheticLambda12(this, 13, gridOption));
    }

    public final void logIfOptedIn(Runnable runnable) {
        ((LaunchUtils) this.mLoggingOptInStatusProvider).getClass();
        runnable.run();
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logIndividualWallpaperSelected(String str) {
        logIfOptedIn(new ClearcutUserEventLogger$$ExternalSyntheticLambda13(this, 5, str));
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logNumDailyWallpaperRotationsInLastWeek() {
        logIfOptedIn(new ComponentActivity$$ExternalSyntheticLambda2(this, 3));
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logNumDailyWallpaperRotationsPreviousDay() {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                ArrayList dailyRotationsPreviousDay;
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                if (clearcutUserEventLogger.mPreferences.getWallpaperPresentationMode() == 2 && (dailyRotationsPreviousDay = clearcutUserEventLogger.mPreferences.getDailyRotationsPreviousDay()) != null) {
                    clearcutUserEventLogger.mCounters.getIntegerHistogram("DailyWallpaper.NumRotationsPreviousDay").incrementBase(dailyRotationsPreviousDay.size());
                    clearcutUserEventLogger.mCounters.logAllAsync();
                }
            }
        });
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logNumDaysDailyRotationFailed(final int i) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda10
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                clearcutUserEventLogger.mCounters.getIntegerHistogram("DailyWallpaper.NumDaysInFailedState").increment(i);
                clearcutUserEventLogger.mCounters.logAllAsync();
            }
        });
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logNumDaysDailyRotationNotAttempted(final int i) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda11
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                clearcutUserEventLogger.mCounters.getIntegerHistogram("DailyWallpaper.NumDaysInNotAttemptedState").increment(i);
                clearcutUserEventLogger.mCounters.logAllAsync();
            }
        });
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logRestored() {
        logIfOptedIn(new ClearcutUserEventLogger$$ExternalSyntheticLambda14(this, "BackupAndRestore.Restored"));
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logResumed(boolean z, boolean z2) {
        if (z) {
            if (z2) {
                logBasicEvent(17);
            } else {
                logBasicEvent(18);
            }
        } else if (z2) {
            logBasicEvent(15);
        } else {
            logBasicEvent(16);
        }
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logSnapshot() {
        logIfOptedIn(new PreviewFragment$$ExternalSyntheticLambda8(this, 3));
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logStandalonePreviewImageUriHasReadPermission(final boolean z) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda16
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                clearcutUserEventLogger.mCounters.getIntegerHistogram("StandalonePreview.ImageUriPermissionStatus").increment(!z ? 1 : 0);
                clearcutUserEventLogger.mCounters.logAllAsync();
            }
        });
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logStandalonePreviewLaunched() {
        logIfOptedIn(new ClearcutUserEventLogger$$ExternalSyntheticLambda14(this, "StandalonePreview.Launched"));
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logStandalonePreviewStorageDialogApproved(final boolean z) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda17
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                clearcutUserEventLogger.mCounters.getIntegerHistogram("StandalonePreview.StorageDialogResponse").increment(!z ? 1 : 0);
                clearcutUserEventLogger.mCounters.logAllAsync();
            }
        });
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logStopped() {
        logBasicEvent(19);
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logWallpaperPresentationMode() {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                clearcutUserEventLogger.mCounters.getIntegerHistogram("WallpaperPresentationMode").increment(clearcutUserEventLogger.mPreferences.getWallpaperPresentationMode());
                clearcutUserEventLogger.mCounters.logAllAsync();
            }
        });
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logWallpaperSet(final String str, final String str2) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda15
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                String str3 = str;
                String str4 = str2;
                clearcutUserEventLogger.getClass();
                WallpaperLogProto$WallpaperEvent.Builder newBuilder = WallpaperLogProto$WallpaperEvent.newBuilder();
                newBuilder.setType(WallpaperLogProto$WallpaperEvent.Type.WALLPAPER_SET);
                if (str3 != null) {
                    newBuilder.copyOnWrite();
                    WallpaperLogProto$WallpaperEvent.m66$$Nest$msetCategoryCollectionId((WallpaperLogProto$WallpaperEvent) newBuilder.instance, str3);
                }
                if (str4 != null) {
                    newBuilder.copyOnWrite();
                    WallpaperLogProto$WallpaperEvent.m69$$Nest$msetWallpaperId((WallpaperLogProto$WallpaperEvent) newBuilder.instance, str4);
                }
                clearcutUserEventLogger.log(newBuilder.build());
            }
        });
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logWallpaperSetFailureReason(final int i) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                clearcutUserEventLogger.mCounters.getIntegerHistogram("IndividualWallpaperSetFailureReason").increment(i);
                clearcutUserEventLogger.mCounters.logAllAsync();
            }
        });
    }

    @Override // com.bumptech.glide.manager.ApplicationLifecycle, com.android.wallpaper.module.UserEventLogger
    public final void logWallpaperSetResult(final int i) {
        logIfOptedIn(new Runnable() { // from class: com.google.android.apps.wallpaper.module.ClearcutUserEventLogger$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                ClearcutUserEventLogger clearcutUserEventLogger = ClearcutUserEventLogger.this;
                clearcutUserEventLogger.mCounters.getIntegerHistogram("IndividualWallpaperSetResult").increment(i);
                clearcutUserEventLogger.mCounters.logAllAsync();
            }
        });
    }

    public ClearcutUserEventLogger(Context context) {
        this.mContext = context;
        Injector injector = R$style.getInjector();
        this.mPreferences = injector.getPreferences(context);
        this.mClearcutLogger = new ClearcutLogger(context);
        this.mLoggingOptInStatusProvider = injector.getLoggingOptInStatusProvider();
        this.mCounters = new Counters(this.mClearcutLogger, "WALLPAPER_PICKER_COUNTERS", QuickStepContract.SYSUI_STATE_SEARCH_DISABLED, zzh.zza);
        this.mWallpaperStatusChecker = injector.getWallpaperStatusChecker();
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logActionClicked(String str, int i) {
        boolean z;
        int i2;
        if (i == R.string.build_case) {
            z = true;
        } else {
            z = true;
        }
        if (z) {
            i2 = 8;
        } else {
            i2 = 7;
        }
        logIfOptedIn(new ClearcutUserEventLogger$$ExternalSyntheticLambda13(this, i2, str));
    }
}
