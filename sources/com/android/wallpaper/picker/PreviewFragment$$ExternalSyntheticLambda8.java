package com.android.wallpaper.picker;

import android.content.Context;
import android.text.TextUtils;
import android.view.animation.PathInterpolator;
import com.android.systemui.shared.rotation.RotationButtonController;
import com.android.wallpaper.module.WallpaperPreferences;
import com.android.wallpaper.picker.ImagePreviewFragment;
import com.google.android.apps.wallpaper.module.ClearcutUserEventLogger;
import com.google.android.gms.common.util.zzh;
import com.google.wireless.android.apps.wallpaper.WallpaperLogProto$WallpaperEvent;
import com.google.wireless.android.apps.wallpaper.WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewFragment$$ExternalSyntheticLambda8 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ PreviewFragment$$ExternalSyntheticLambda8(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        String str;
        switch (this.$r8$classId) {
            case 0:
                PathInterpolator pathInterpolator = PreviewFragment.ALPHA_OUT;
                ((PreviewFragment) this.f$0).finishActivity(true);
                return;
            case 1:
                RotationButtonController.m22$r8$lambda$YjnDy7AOTuEVJEKSHSjIm0lgOY((RotationButtonController) this.f$0);
                return;
            case 2:
                ImagePreviewFragment.AnonymousClass3 r7 = (ImagePreviewFragment.AnonymousClass3) this.f$0;
                if (ImagePreviewFragment.this.mImageScaleChangeCounter.decrementAndGet() == 0) {
                    ImagePreviewFragment.this.recalculateColors(false);
                    return;
                }
                return;
            default:
                ClearcutUserEventLogger clearcutUserEventLogger = (ClearcutUserEventLogger) this.f$0;
                boolean z = ClearcutUserEventLogger.IS_VERBOSE;
                clearcutUserEventLogger.getClass();
                WallpaperLogProto$WallpaperEvent.Builder newBuilder = WallpaperLogProto$WallpaperEvent.newBuilder();
                newBuilder.setType(WallpaperLogProto$WallpaperEvent.Type.SNAPSHOT);
                WallpaperPreferences wallpaperPreferences = clearcutUserEventLogger.mPreferences;
                zzh zzhVar = clearcutUserEventLogger.mWallpaperStatusChecker;
                Context context = clearcutUserEventLogger.mContext;
                zzhVar.getClass();
                boolean isLockWallpaperSet = zzh.isLockWallpaperSet(context);
                WallpaperPickerSnapshotProto$WallpaperPickerSnapshot.Builder newBuilder2 = WallpaperPickerSnapshotProto$WallpaperPickerSnapshot.newBuilder();
                int appLaunchCount = wallpaperPreferences.getAppLaunchCount();
                newBuilder2.copyOnWrite();
                WallpaperPickerSnapshotProto$WallpaperPickerSnapshot.m72$$Nest$msetAppLaunchCount((WallpaperPickerSnapshotProto$WallpaperPickerSnapshot) newBuilder2.instance, appLaunchCount);
                int firstLaunchDateSinceSetup = wallpaperPreferences.getFirstLaunchDateSinceSetup();
                if (firstLaunchDateSinceSetup != 0) {
                    newBuilder2.copyOnWrite();
                    WallpaperPickerSnapshotProto$WallpaperPickerSnapshot.m73$$Nest$msetFirstLaunchDateSinceSetup((WallpaperPickerSnapshotProto$WallpaperPickerSnapshot) newBuilder2.instance, firstLaunchDateSinceSetup);
                }
                int firstWallpaperApplyDateSinceSetup = wallpaperPreferences.getFirstWallpaperApplyDateSinceSetup();
                if (firstWallpaperApplyDateSinceSetup != 0) {
                    newBuilder2.copyOnWrite();
                    WallpaperPickerSnapshotProto$WallpaperPickerSnapshot.m74$$Nest$msetFirstWallpaperApplyDateSinceSetup((WallpaperPickerSnapshotProto$WallpaperPickerSnapshot) newBuilder2.instance, firstWallpaperApplyDateSinceSetup);
                }
                String homeWallpaperCollectionId = wallpaperPreferences.getHomeWallpaperCollectionId();
                if (homeWallpaperCollectionId != null) {
                    newBuilder2.copyOnWrite();
                    WallpaperPickerSnapshotProto$WallpaperPickerSnapshot.m75$$Nest$msetHomeWallpaperCategory((WallpaperPickerSnapshotProto$WallpaperPickerSnapshot) newBuilder2.instance, homeWallpaperCollectionId);
                }
                if (TextUtils.isEmpty(wallpaperPreferences.getHomeWallpaperRemoteId())) {
                    str = wallpaperPreferences.getHomeWallpaperServiceName();
                } else {
                    str = wallpaperPreferences.getHomeWallpaperRemoteId();
                }
                if (str != null) {
                    newBuilder2.copyOnWrite();
                    WallpaperPickerSnapshotProto$WallpaperPickerSnapshot.m76$$Nest$msetHomeWallpaperId((WallpaperPickerSnapshotProto$WallpaperPickerSnapshot) newBuilder2.instance, str);
                }
                if (isLockWallpaperSet) {
                    homeWallpaperCollectionId = wallpaperPreferences.getLockWallpaperCollectionId();
                }
                if (homeWallpaperCollectionId != null) {
                    newBuilder2.copyOnWrite();
                    WallpaperPickerSnapshotProto$WallpaperPickerSnapshot.m77$$Nest$msetLockScreenWallpaperCategory((WallpaperPickerSnapshotProto$WallpaperPickerSnapshot) newBuilder2.instance, homeWallpaperCollectionId);
                }
                if (isLockWallpaperSet) {
                    str = wallpaperPreferences.getLockWallpaperRemoteId();
                }
                if (str != null) {
                    newBuilder2.copyOnWrite();
                    WallpaperPickerSnapshotProto$WallpaperPickerSnapshot.m78$$Nest$msetLockScreenWallpaperId((WallpaperPickerSnapshotProto$WallpaperPickerSnapshot) newBuilder2.instance, str);
                }
                newBuilder.copyOnWrite();
                WallpaperLogProto$WallpaperEvent.m70$$Nest$msetWallpaperPickerSnapshot((WallpaperLogProto$WallpaperEvent) newBuilder.instance, newBuilder2.build());
                clearcutUserEventLogger.log(newBuilder.build());
                return;
        }
    }
}
