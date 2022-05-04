package com.android.customization.model.color;

import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import com.android.customization.model.CustomizationManager;
import com.android.customization.model.CustomizationOption;
import com.android.systemui.monet.Style;
import com.android.systemui.shared.R;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.stream.Collectors;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public abstract class ColorOption implements CustomizationOption<ColorOption> {
    public static final String TIMESTAMP_FIELD = "_applied_timestamp";
    public String mContentDescription;
    public final int mIndex;
    public final boolean mIsDefault;
    public final Map<String, String> mPackagesByCategory;
    public final int[] mPreviewColorIds = {R.id.color_preview_0, R.id.color_preview_1, R.id.color_preview_2, R.id.color_preview_3};
    public final Style mStyle;
    public final String mTitle;

    public abstract String getSource();

    public final JSONObject getJsonPackages() {
        JSONObject jSONObject;
        if (this.mIsDefault) {
            jSONObject = new JSONObject();
        } else {
            JSONObject jSONObject2 = new JSONObject(this.mPackagesByCategory);
            Iterator<String> keys = jSONObject2.keys();
            HashSet hashSet = new HashSet();
            while (keys.hasNext()) {
                String next = keys.next();
                if (jSONObject2.isNull(next)) {
                    hashSet.add(next);
                }
            }
            Iterator it = hashSet.iterator();
            while (it.hasNext()) {
                jSONObject2.remove((String) it.next());
            }
            jSONObject = jSONObject2;
        }
        try {
            jSONObject.put(TIMESTAMP_FIELD, System.currentTimeMillis());
        } catch (JSONException unused) {
            Log.e("ColorOption", "Couldn't add timestamp to serialized themebundle");
        }
        return jSONObject;
    }

    @Override // com.android.customization.model.CustomizationOption
    public final boolean isActive(CustomizationManager<ColorOption> customizationManager) {
        boolean z;
        ColorCustomizationManager colorCustomizationManager = (ColorCustomizationManager) customizationManager;
        if (colorCustomizationManager.mCurrentStyle == null) {
            colorCustomizationManager.parseSettings(Settings.Secure.getString(colorCustomizationManager.mContentResolver, "theme_customization_overlay_packages"));
        }
        String str = colorCustomizationManager.mCurrentStyle;
        if (TextUtils.isEmpty(str)) {
            str = Style.TONAL_SPOT.toString();
        }
        boolean equals = TextUtils.equals(this.mStyle.toString(), str);
        if (this.mIsDefault) {
            String string = Settings.Secure.getString(colorCustomizationManager.mContentResolver, "theme_customization_overlay_packages");
            if (!TextUtils.isEmpty(string) && !"{}".equals(string)) {
                if (colorCustomizationManager.mCurrentOverlays == null) {
                    colorCustomizationManager.parseSettings(Settings.Secure.getString(colorCustomizationManager.mContentResolver, "theme_customization_overlay_packages"));
                }
                if (!colorCustomizationManager.mCurrentOverlays.isEmpty() && (string.contains("android.theme.customization.system_palette") || string.contains("android.theme.customization.accent_color"))) {
                    return false;
                }
            }
            if (equals) {
                return true;
            }
            return false;
        }
        if (colorCustomizationManager.mCurrentOverlays == null) {
            colorCustomizationManager.parseSettings(Settings.Secure.getString(colorCustomizationManager.mContentResolver, "theme_customization_overlay_packages"));
        }
        Map<String, String> map = colorCustomizationManager.mCurrentOverlays;
        String currentColorSource = colorCustomizationManager.getCurrentColorSource();
        if (TextUtils.isEmpty(currentColorSource) || getSource().equals(currentColorSource)) {
            z = true;
        } else {
            z = false;
        }
        if (!z || !equals || !this.mPackagesByCategory.equals(map)) {
            return false;
        }
        return true;
    }

    public ColorOption(String str, Map<String, String> map, boolean z, Style style, int i) {
        this.mTitle = str;
        this.mIsDefault = z;
        this.mStyle = style;
        this.mIndex = i;
        this.mPackagesByCategory = Collections.unmodifiableMap((Map) map.entrySet().stream().filter(ColorOption$$ExternalSyntheticLambda2.INSTANCE).collect(Collectors.toMap(ColorOption$$ExternalSyntheticLambda0.INSTANCE, ColorOption$$ExternalSyntheticLambda1.INSTANCE)));
    }

    @Override // com.android.customization.model.CustomizationOption
    public final String getTitle() {
        return this.mTitle;
    }
}
