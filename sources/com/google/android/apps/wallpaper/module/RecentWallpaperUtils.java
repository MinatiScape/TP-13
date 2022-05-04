package com.google.android.apps.wallpaper.module;

import android.app.WallpaperColors;
import android.app.WallpaperInfo;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.view.WindowManager;
import com.android.systemui.flags.FlagManager;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.util.ScreenSizeCalculator;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.SafeContinuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt__StringsJVMKt;
import kotlin.text.StringsKt__StringsKt;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.Dispatchers;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final class RecentWallpaperUtils {
    public static final void access$storeBitmap(Context context, String str, Bitmap bitmap) {
        FileOutputStream openFileOutput;
        try {
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, context.openFileOutput(str, 0));
            th = null;
        } finally {
            try {
                throw th;
            } finally {
            }
        }
    }

    @NotNull
    public static final JSONArray cleanUpRecentsArray(@NotNull JSONArray jSONArray, @NotNull Context context) {
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length() - 1;
        if (length >= 0) {
            while (true) {
                int i = length - 1;
                JSONObject jSONObject = jSONArray.getJSONObject(length);
                if (jSONObject.has("component") && jSONObject.getString("component") != null) {
                    String string = jSONObject.getString("component");
                    Intrinsics.checkNotNullExpressionValue(string, "entry.getString(KEY_COMPONENT)");
                    List split$default = StringsKt__StringsKt.split$default(string, new String[]{"/"}, false, 0, 6);
                    if (context.getPackageManager().resolveService(new Intent("android.service.wallpaper.WallpaperService").setClassName((String) split$default.get(0), (String) split$default.get(1)), 0) == null) {
                        arrayList.add(jSONObject.getString(FlagManager.FIELD_ID));
                        jSONArray.remove(length);
                    }
                }
                if (i < 0) {
                    break;
                }
                length = i;
            }
        }
        while (jSONArray.length() > 5) {
            Object remove = jSONArray.remove(0);
            Objects.requireNonNull(remove, "null cannot be cast to non-null type org.json.JSONObject");
            arrayList.add(((JSONObject) remove).getString(FlagManager.FIELD_ID));
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            String removedId = (String) it.next();
            Intrinsics.checkNotNullExpressionValue(removedId, "removedId");
            context.deleteFile(getWallpaperFullBitmapFileName(removedId));
            context.deleteFile(getWallpaperThumbnailFileName(removedId));
        }
        return jSONArray;
    }

    public static final JSONObject createRecentEntryJson(String str, String str2, List<String> list, String str3, WallpaperInfo wallpaperInfo, Integer num) {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put(FlagManager.FIELD_ID, str);
        jSONObject.putOpt("collectionId", str2);
        if (list != null) {
            Object[] array = list.toArray(new String[0]);
            Objects.requireNonNull(array, "null cannot be cast to non-null type kotlin.Array<T>");
            jSONObject.putOpt("attributions", new JSONArray(array));
        }
        jSONObject.putOpt("actionUrl", str3);
        if (wallpaperInfo != null) {
            jSONObject.put("component", wallpaperInfo.getComponent().getPackageName() + '/' + ((Object) wallpaperInfo.getComponent().getClassName()));
        }
        if (num != null) {
            jSONObject.put("color", num.intValue());
        }
        return jSONObject;
    }

    @NotNull
    public static final String getWallpaperFullBitmapFileName(@NotNull String wallpaperId) {
        Intrinsics.checkNotNullParameter(wallpaperId, "wallpaperId");
        StringsKt__StringsJVMKt.replace$default(wallpaperId, "/", "-", false, 4);
        return "wp-full-" + wallpaperId + ".png";
    }

    @NotNull
    public static final String getWallpaperThumbnailFileName(@NotNull String wallpaperId) {
        Intrinsics.checkNotNullParameter(wallpaperId, "wallpaperId");
        StringsKt__StringsJVMKt.replace$default(wallpaperId, "/", "-", false, 4);
        return "wp-thumb-" + wallpaperId + ".png";
    }

    public static final Object obtainPlaceHolderColor(Asset asset, Context context, Continuation continuation) {
        final SafeContinuation safeContinuation = new SafeContinuation(IntrinsicsKt__IntrinsicsKt.intercepted(continuation));
        if (asset == null) {
            safeContinuation.resumeWith(null);
        } else {
            Object systemService = context.getSystemService("window");
            Objects.requireNonNull(systemService, "null cannot be cast to non-null type android.view.WindowManager");
            Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(((WindowManager) systemService).getDefaultDisplay());
            asset.decodeBitmap(screenSize.x / 2, screenSize.y / 2, new Asset.BitmapReceiver() { // from class: com.google.android.apps.wallpaper.module.RecentWallpaperUtils$obtainPlaceHolderColor$2$1
                @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
                public final void onBitmapDecoded(@Nullable Bitmap bitmap) {
                    if (bitmap != null) {
                        boolean z = false;
                        if (bitmap.getConfig() == Bitmap.Config.HARDWARE) {
                            bitmap = bitmap.copy(Bitmap.Config.ARGB_8888, false);
                            Intrinsics.checkNotNullExpressionValue(bitmap, "bitmap.copy(Bitmap.Config.ARGB_8888, false)");
                            z = true;
                        }
                        WallpaperColors fromBitmap = WallpaperColors.fromBitmap(bitmap);
                        if (z) {
                            bitmap.recycle();
                        }
                        safeContinuation.resumeWith(Integer.valueOf(fromBitmap.getPrimaryColor().toArgb()));
                        return;
                    }
                    safeContinuation.resumeWith(null);
                }
            });
        }
        return safeContinuation.getOrThrow();
    }

    @NotNull
    public static final List<RecentWallpaperEntry> parseRecentWallpapers(@NotNull JSONArray jsonArray) {
        ArrayList arrayList;
        Intrinsics.checkNotNullParameter(jsonArray, "jsonArray");
        int length = jsonArray.length();
        ArrayList arrayList2 = new ArrayList(length);
        for (int i = 0; i < length; i++) {
            JSONObject jSONObject = jsonArray.getJSONObject(i);
            Intrinsics.checkNotNullExpressionValue(jSONObject, "jsonArray.getJSONObject(it)");
            String string = jSONObject.getString(FlagManager.FIELD_ID);
            Intrinsics.checkNotNullExpressionValue(string, "obj.getString(KEY_ID)");
            String optString = jSONObject.optString("collectionId", null);
            JSONArray optJSONArray = jSONObject.optJSONArray("attributions");
            if (optJSONArray == null) {
                arrayList = null;
            } else {
                int length2 = optJSONArray.length();
                arrayList = new ArrayList(length2);
                for (int i2 = 0; i2 < length2; i2++) {
                    arrayList.add(optJSONArray.getString(i2));
                }
            }
            arrayList2.add(new RecentWallpaperEntry(string, optString, arrayList, jSONObject.optString("actionUrl", null), jSONObject.optString("component", null), Integer.valueOf(jSONObject.optInt("color", 0))));
        }
        return arrayList2;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0043  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final /* synthetic */ java.lang.Object recentFromImageWallpaperInfo(com.android.wallpaper.model.WallpaperInfo r12, android.content.Context r13, kotlin.coroutines.Continuation r14) {
        /*
            boolean r0 = r14 instanceof com.google.android.apps.wallpaper.module.RecentWallpaperUtils$recentFromImageWallpaperInfo$1
            if (r0 == 0) goto L13
            r0 = r14
            com.google.android.apps.wallpaper.module.RecentWallpaperUtils$recentFromImageWallpaperInfo$1 r0 = (com.google.android.apps.wallpaper.module.RecentWallpaperUtils$recentFromImageWallpaperInfo$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.label = r1
            goto L18
        L13:
            com.google.android.apps.wallpaper.module.RecentWallpaperUtils$recentFromImageWallpaperInfo$1 r0 = new com.google.android.apps.wallpaper.module.RecentWallpaperUtils$recentFromImageWallpaperInfo$1
            r0.<init>(r14)
        L18:
            java.lang.Object r14 = r0.result
            kotlin.coroutines.intrinsics.CoroutineSingletons r1 = kotlin.coroutines.intrinsics.CoroutineSingletons.COROUTINE_SUSPENDED
            int r2 = r0.label
            r3 = 1
            if (r2 == 0) goto L43
            if (r2 != r3) goto L3b
            java.lang.Object r12 = r0.L$3
            java.lang.String r12 = (java.lang.String) r12
            java.lang.Object r13 = r0.L$2
            java.util.List r13 = (java.util.List) r13
            java.lang.Object r1 = r0.L$1
            java.lang.String r1 = (java.lang.String) r1
            java.lang.Object r0 = r0.L$0
            java.lang.String r0 = (java.lang.String) r0
            kotlin.ResultKt.throwOnFailure(r14)
            r9 = r12
            r8 = r13
            r6 = r0
            r7 = r1
            goto L75
        L3b:
            java.lang.IllegalStateException r12 = new java.lang.IllegalStateException
            java.lang.String r13 = "call to 'resume' before 'invoke' with coroutine"
            r12.<init>(r13)
            throw r12
        L43:
            kotlin.ResultKt.throwOnFailure(r14)
            java.lang.String r14 = r12.getWallpaperId()
            java.lang.String r2 = "wallpaper.wallpaperId"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r14, r2)
            java.lang.String r2 = r12.getCollectionId(r13)
            java.util.List r4 = r12.getAttributions(r13)
            java.lang.String r5 = r12.getActionUrl(r13)
            com.android.wallpaper.asset.Asset r12 = r12.getAsset(r13)
            r0.L$0 = r14
            r0.L$1 = r2
            r0.L$2 = r4
            r0.L$3 = r5
            r0.label = r3
            java.lang.Object r12 = obtainPlaceHolderColor(r12, r13, r0)
            if (r12 != r1) goto L70
            return r1
        L70:
            r6 = r14
            r7 = r2
            r8 = r4
            r9 = r5
            r14 = r12
        L75:
            r10 = 0
            r11 = r14
            java.lang.Integer r11 = (java.lang.Integer) r11
            org.json.JSONObject r12 = createRecentEntryJson(r6, r7, r8, r9, r10, r11)
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.wallpaper.module.RecentWallpaperUtils.recentFromImageWallpaperInfo(com.android.wallpaper.model.WallpaperInfo, android.content.Context, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0043  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object recentFromLiveWallpaper(com.android.wallpaper.model.LiveWallpaperInfo r12, android.content.Context r13, kotlin.coroutines.Continuation r14) {
        /*
            boolean r0 = r14 instanceof com.google.android.apps.wallpaper.module.RecentWallpaperUtils$recentFromLiveWallpaper$1
            if (r0 == 0) goto L13
            r0 = r14
            com.google.android.apps.wallpaper.module.RecentWallpaperUtils$recentFromLiveWallpaper$1 r0 = (com.google.android.apps.wallpaper.module.RecentWallpaperUtils$recentFromLiveWallpaper$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.label = r1
            goto L18
        L13:
            com.google.android.apps.wallpaper.module.RecentWallpaperUtils$recentFromLiveWallpaper$1 r0 = new com.google.android.apps.wallpaper.module.RecentWallpaperUtils$recentFromLiveWallpaper$1
            r0.<init>(r14)
        L18:
            java.lang.Object r14 = r0.result
            kotlin.coroutines.intrinsics.CoroutineSingletons r1 = kotlin.coroutines.intrinsics.CoroutineSingletons.COROUTINE_SUSPENDED
            int r2 = r0.label
            r3 = 1
            if (r2 == 0) goto L43
            if (r2 != r3) goto L3b
            java.lang.Object r12 = r0.L$3
            android.app.WallpaperInfo r12 = (android.app.WallpaperInfo) r12
            java.lang.Object r13 = r0.L$2
            java.util.List r13 = (java.util.List) r13
            java.lang.Object r1 = r0.L$1
            java.lang.String r1 = (java.lang.String) r1
            java.lang.Object r0 = r0.L$0
            java.lang.String r0 = (java.lang.String) r0
            kotlin.ResultKt.throwOnFailure(r14)
            r10 = r12
            r8 = r13
            r6 = r0
            r7 = r1
            goto L93
        L3b:
            java.lang.IllegalStateException r12 = new java.lang.IllegalStateException
            java.lang.String r13 = "call to 'resume' before 'invoke' with coroutine"
            r12.<init>(r13)
            throw r12
        L43:
            kotlin.ResultKt.throwOnFailure(r14)
            android.app.WallpaperInfo r14 = r12.mInfo
            android.content.pm.PackageManager r2 = r13.getPackageManager()
            android.content.Intent r4 = new android.content.Intent
            java.lang.String r5 = "android.service.wallpaper.WallpaperService"
            r4.<init>(r5)
            java.lang.String r5 = r14.getPackageName()
            java.lang.String r6 = r14.getServiceName()
            android.content.Intent r4 = r4.setClassName(r5, r6)
            r5 = 0
            android.content.pm.ResolveInfo r2 = r2.resolveService(r4, r5)
            if (r2 != 0) goto L68
            r12 = 0
            return r12
        L68:
            java.lang.String r2 = r12.getWallpaperId()
            java.lang.String r4 = "wallpaper.wallpaperId"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r2, r4)
            java.lang.String r4 = r12.getCollectionId(r13)
            java.util.List r5 = r12.getAttributions(r13)
            com.android.wallpaper.asset.Asset r12 = r12.getThumbAsset(r13)
            r0.L$0 = r2
            r0.L$1 = r4
            r0.L$2 = r5
            r0.L$3 = r14
            r0.label = r3
            java.lang.Object r12 = obtainPlaceHolderColor(r12, r13, r0)
            if (r12 != r1) goto L8e
            return r1
        L8e:
            r10 = r14
            r6 = r2
            r7 = r4
            r8 = r5
            r14 = r12
        L93:
            r11 = r14
            java.lang.Integer r11 = (java.lang.Integer) r11
            r9 = 0
            org.json.JSONObject r12 = createRecentEntryJson(r6, r7, r8, r9, r10, r11)
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.wallpaper.module.RecentWallpaperUtils.recentFromLiveWallpaper(com.android.wallpaper.model.LiveWallpaperInfo, android.content.Context, kotlin.coroutines.Continuation):java.lang.Object");
    }

    public static final boolean reorderRecentsOnly(@NotNull JSONArray jSONArray, @NotNull String str) {
        JSONObject jSONObject;
        int i;
        int length = jSONArray.length();
        if (length > 0) {
            i = 0;
            while (true) {
                int i2 = i + 1;
                jSONObject = jSONArray.getJSONObject(i);
                if (Intrinsics.areEqual(jSONObject.get(FlagManager.FIELD_ID), str)) {
                    break;
                } else if (i2 >= length) {
                    break;
                } else {
                    i = i2;
                }
            }
        } else {
            jSONObject = null;
        }
        i = -1;
        if (i == -1) {
            return false;
        }
        jSONArray.remove(i);
        jSONArray.put(jSONObject);
        return true;
    }

    @Nullable
    public static final Object saveFullBitmap(@NotNull Context context, @NotNull String str, @NotNull Bitmap bitmap, @NotNull Continuation<? super Unit> continuation) {
        Dispatchers dispatchers = Dispatchers.INSTANCE;
        Object withContext = BuildersKt.withContext(Dispatchers.IO, new RecentWallpaperUtils$saveFullBitmap$2(context, str, bitmap, null), continuation);
        return withContext == CoroutineSingletons.COROUTINE_SUSPENDED ? withContext : Unit.INSTANCE;
    }

    @Nullable
    public static final Object saveThumbnail(@NotNull Context context, @NotNull String str, @Nullable com.android.wallpaper.model.WallpaperInfo wallpaperInfo, @Nullable Bitmap bitmap, @NotNull Continuation<? super Unit> continuation) {
        Dispatchers dispatchers = Dispatchers.INSTANCE;
        Object withContext = BuildersKt.withContext(Dispatchers.IO, new RecentWallpaperUtils$saveThumbnail$2(context, bitmap, str, wallpaperInfo, null), continuation);
        return withContext == CoroutineSingletons.COROUTINE_SUSPENDED ? withContext : Unit.INSTANCE;
    }
}
