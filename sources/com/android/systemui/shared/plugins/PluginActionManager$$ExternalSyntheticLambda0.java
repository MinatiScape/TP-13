package com.android.systemui.shared.plugins;

import android.app.WallpaperColors;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import com.android.customization.model.CustomizationManager;
import com.android.customization.model.color.ColorCustomizationManager;
import com.android.customization.model.color.ColorOption;
import com.android.customization.model.color.ColorSectionController;
import com.android.customization.module.ThemesUserEventLogger;
import com.android.customization.picker.color.ColorSectionView;
import com.android.systemui.shared.R;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class PluginActionManager$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ PluginActionManager$$ExternalSyntheticLambda0(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [com.android.customization.model.color.ColorSectionController$3] */
    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                ((PluginActionManager) this.f$0).queryAll();
                return;
            default:
                final ColorSectionController colorSectionController = (ColorSectionController) this.f$0;
                final ColorOption colorOption = colorSectionController.mSelectedColor;
                if (SystemClock.elapsedRealtime() - colorSectionController.mLastColorApplyingTime >= 500) {
                    colorSectionController.mLastColorApplyingTime = SystemClock.elapsedRealtime();
                    final ColorCustomizationManager colorCustomizationManager = colorSectionController.mColorManager;
                    final ?? r2 = new CustomizationManager.Callback() { // from class: com.android.customization.model.color.ColorSectionController.3
                        @Override // com.android.customization.model.CustomizationManager.Callback
                        public final void onError() {
                            Log.w("ColorSectionController", "Apply theme with error: null");
                        }

                        @Override // com.android.customization.model.CustomizationManager.Callback
                        public final void onSuccess() {
                            boolean z;
                            ColorSectionView colorSectionView = colorSectionController.mColorSectionView;
                            colorSectionView.announceForAccessibility(colorSectionView.getContext().getString(R.string.color_changed));
                            ColorSectionController colorSectionController2 = colorSectionController;
                            ThemesUserEventLogger themesUserEventLogger = colorSectionController2.mEventLogger;
                            ColorOption colorOption2 = colorOption;
                            WallpaperColors wallpaperColors = colorSectionController2.mLockWallpaperColors;
                            int i = 0;
                            if (wallpaperColors == null || wallpaperColors.equals(colorSectionController2.mHomeWallpaperColors)) {
                                z = true;
                            } else {
                                z = false;
                            }
                            if (TextUtils.equals(colorOption2.getSource(), "preset")) {
                                i = 26;
                            } else if (z) {
                                i = 25;
                            } else {
                                String source = colorOption2.getSource();
                                source.getClass();
                                if (source.equals("lock_wallpaper")) {
                                    i = 24;
                                } else if (source.equals("home_wallpaper")) {
                                    i = 23;
                                }
                            }
                            themesUserEventLogger.logColorApplied(i, colorOption.mIndex);
                        }
                    };
                    colorCustomizationManager.getClass();
                    ColorCustomizationManager.sExecutorService.submit(new Runnable() { // from class: com.android.customization.model.color.ColorCustomizationManager$$ExternalSyntheticLambda1
                        /* JADX WARN: Removed duplicated region for block: B:26:0x0093  */
                        /* JADX WARN: Removed duplicated region for block: B:27:0x0096  */
                        @Override // java.lang.Runnable
                        /*
                            Code decompiled incorrectly, please refer to instructions dump.
                            To view partially-correct add '--show-bad-code' argument
                        */
                        public final void run() {
                            /*
                                r10 = this;
                                com.android.customization.model.color.ColorCustomizationManager r0 = com.android.customization.model.color.ColorCustomizationManager.this
                                com.android.customization.model.color.ColorOption r1 = r2
                                com.android.customization.model.CustomizationManager$Callback r10 = r3
                                android.content.ContentResolver r2 = r0.mContentResolver
                                java.lang.String r3 = "theme_customization_overlay_packages"
                                java.lang.String r2 = android.provider.Settings.Secure.getString(r2, r3)
                                boolean r4 = android.text.TextUtils.isEmpty(r2)
                                if (r4 == 0) goto L16
                                java.lang.String r2 = "{}"
                            L16:
                                r4 = 0
                                r5 = 0
                                r6 = 1
                                org.json.JSONObject r7 = new org.json.JSONObject     // Catch: org.json.JSONException -> La3
                                r7.<init>(r2)     // Catch: org.json.JSONException -> La3
                                org.json.JSONObject r2 = r1.getJsonPackages()     // Catch: org.json.JSONException -> La0
                                java.util.HashSet r4 = com.android.customization.model.color.ColorCustomizationManager.COLOR_OVERLAY_SETTINGS     // Catch: org.json.JSONException -> La0
                                java.util.Iterator r4 = r4.iterator()     // Catch: org.json.JSONException -> La0
                            L28:
                                boolean r8 = r4.hasNext()     // Catch: org.json.JSONException -> La0
                                if (r8 == 0) goto L38
                                java.lang.Object r8 = r4.next()     // Catch: org.json.JSONException -> La0
                                java.lang.String r8 = (java.lang.String) r8     // Catch: org.json.JSONException -> La0
                                r7.remove(r8)     // Catch: org.json.JSONException -> La0
                                goto L28
                            L38:
                                java.util.Iterator r4 = r2.keys()     // Catch: org.json.JSONException -> La0
                            L3c:
                                boolean r8 = r4.hasNext()     // Catch: org.json.JSONException -> La0
                                if (r8 == 0) goto L50
                                java.lang.Object r8 = r4.next()     // Catch: org.json.JSONException -> La0
                                java.lang.String r8 = (java.lang.String) r8     // Catch: org.json.JSONException -> La0
                                java.lang.Object r9 = r2.get(r8)     // Catch: org.json.JSONException -> La0
                                r7.put(r8, r9)     // Catch: org.json.JSONException -> La0
                                goto L3c
                            L50:
                                java.lang.String r2 = "android.theme.customization.color_source"
                                java.lang.String r4 = r1.getSource()     // Catch: org.json.JSONException -> La0
                                r7.put(r2, r4)     // Catch: org.json.JSONException -> La0
                                java.lang.String r2 = "android.theme.customization.color_index"
                                int r4 = r1.mIndex     // Catch: org.json.JSONException -> La0
                                java.lang.String r4 = java.lang.String.valueOf(r4)     // Catch: org.json.JSONException -> La0
                                r7.put(r2, r4)     // Catch: org.json.JSONException -> La0
                                java.lang.String r2 = "android.theme.customization.theme_style"
                                com.android.systemui.monet.Style r4 = r1.mStyle     // Catch: org.json.JSONException -> La0
                                java.lang.String r4 = r4.toString()     // Catch: org.json.JSONException -> La0
                                java.lang.String r4 = java.lang.String.valueOf(r4)     // Catch: org.json.JSONException -> La0
                                r7.put(r2, r4)     // Catch: org.json.JSONException -> La0
                                java.lang.String r2 = "preset"
                                java.lang.String r1 = r1.getSource()     // Catch: org.json.JSONException -> La0
                                boolean r1 = r2.equals(r1)     // Catch: org.json.JSONException -> La0
                                java.lang.String r2 = "android.theme.customization.color_both"
                                if (r1 != 0) goto L9c
                                android.app.WallpaperColors r1 = r0.mLockWallpaperColors     // Catch: org.json.JSONException -> La0
                                if (r1 == 0) goto L90
                                android.app.WallpaperColors r4 = r0.mHomeWallpaperColors     // Catch: org.json.JSONException -> La0
                                boolean r1 = r1.equals(r4)     // Catch: org.json.JSONException -> La0
                                if (r1 == 0) goto L8e
                                goto L90
                            L8e:
                                r1 = r5
                                goto L91
                            L90:
                                r1 = r6
                            L91:
                                if (r1 == 0) goto L96
                                java.lang.String r1 = "1"
                                goto L98
                            L96:
                                java.lang.String r1 = "0"
                            L98:
                                r7.put(r2, r1)     // Catch: org.json.JSONException -> La0
                                goto La8
                            L9c:
                                r7.remove(r2)     // Catch: org.json.JSONException -> La0
                                goto La8
                            La0:
                                r1 = move-exception
                                r4 = r7
                                goto La4
                            La3:
                                r1 = move-exception
                            La4:
                                r1.printStackTrace()
                                r7 = r4
                            La8:
                                if (r7 == 0) goto Lb7
                                android.content.ContentResolver r0 = r0.mContentResolver
                                java.lang.String r1 = r7.toString()
                                boolean r0 = android.provider.Settings.Secure.putString(r0, r3, r1)
                                if (r0 == 0) goto Lb7
                                r5 = r6
                            Lb7:
                                android.os.Handler r0 = new android.os.Handler
                                android.os.Looper r1 = android.os.Looper.getMainLooper()
                                r0.<init>(r1)
                                com.android.customization.model.color.ColorCustomizationManager$$ExternalSyntheticLambda0 r1 = new com.android.customization.model.color.ColorCustomizationManager$$ExternalSyntheticLambda0
                                r1.<init>(r5, r10)
                                r0.post(r1)
                                return
                            */
                            throw new UnsupportedOperationException("Method not decompiled: com.android.customization.model.color.ColorCustomizationManager$$ExternalSyntheticLambda1.run():void");
                        }
                    });
                    return;
                }
                return;
        }
    }
}
