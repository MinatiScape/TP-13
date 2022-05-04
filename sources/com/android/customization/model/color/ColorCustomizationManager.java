package com.android.customization.model.color;

import android.app.WallpaperColors;
import android.content.ContentResolver;
import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.provider.Settings;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import android.util.Log;
import com.android.customization.model.CustomizationManager;
import com.android.customization.model.theme.OverlayManagerCompat;
import com.android.systemui.shared.R;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class ColorCustomizationManager implements CustomizationManager<ColorOption> {
    public static final Set<String> COLOR_OVERLAY_SETTINGS;
    public static ColorCustomizationManager sColorCustomizationManager;
    public static final ExecutorService sExecutorService = Executors.newSingleThreadExecutor();
    public final ContentResolver mContentResolver;
    public Map<String, String> mCurrentOverlays;
    public String mCurrentSource;
    public WallpaperColors mHomeWallpaperColors;
    public WallpaperColors mLockWallpaperColors;
    public final OverlayManagerCompat mOverlayManagerCompat;
    public final ColorOptionsProvider mProvider;

    static {
        HashSet hashSet = new HashSet();
        COLOR_OVERLAY_SETTINGS = hashSet;
        hashSet.add("android.theme.customization.system_palette");
        hashSet.add("android.theme.customization.accent_color");
        hashSet.add("android.theme.customization.color_source");
    }

    public ColorCustomizationManager(ColorOptionsProvider colorOptionsProvider, ContentResolver contentResolver, OverlayManagerCompat overlayManagerCompat) {
        this.mProvider = colorOptionsProvider;
        this.mContentResolver = contentResolver;
        contentResolver.registerContentObserver(Settings.Secure.CONTENT_URI, true, new ContentObserver(null) { // from class: com.android.customization.model.color.ColorCustomizationManager.1
            {
                super(null);
            }

            @Override // android.database.ContentObserver
            public void onChange(boolean z, Uri uri) {
                super.onChange(z, uri);
                if (TextUtils.equals(uri.getLastPathSegment(), "theme_customization_overlay_packages")) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Resetting ");
                    m.append(ColorCustomizationManager.this.mCurrentOverlays);
                    m.append(" to null");
                    Log.i("ColorCustomizationManager", m.toString());
                    ColorCustomizationManager.this.mCurrentOverlays = null;
                }
            }
        });
        this.mOverlayManagerCompat = overlayManagerCompat;
    }

    public static ColorCustomizationManager getInstance(Context context, OverlayManagerCompat overlayManagerCompat) {
        if (sColorCustomizationManager == null) {
            Context applicationContext = context.getApplicationContext();
            sColorCustomizationManager = new ColorCustomizationManager(new ColorProvider(applicationContext, applicationContext.getString(R.string.themes_stub_package)), applicationContext.getContentResolver(), overlayManagerCompat);
        }
        return sColorCustomizationManager;
    }

    public String getCurrentColorSource() {
        if (this.mCurrentSource == null) {
            parseSettings(getStoredOverlays());
        }
        return this.mCurrentSource;
    }

    public String getStoredOverlays() {
        return Settings.Secure.getString(this.mContentResolver, "theme_customization_overlay_packages");
    }

    public void parseSettings(String str) {
        HashMap hashMap = new HashMap();
        if (str != null) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                JSONArray names = jSONObject.names();
                if (names != null) {
                    for (int i = 0; i < names.length(); i++) {
                        String string = names.getString(i);
                        if (((HashSet) COLOR_OVERLAY_SETTINGS).contains(string)) {
                            try {
                                hashMap.put(string, jSONObject.getString(string));
                            } catch (JSONException e) {
                                Log.e("ColorCustomizationManager", "parseColorOverlays: " + e.getLocalizedMessage(), e);
                            }
                        }
                    }
                }
            } catch (JSONException e2) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("parseColorOverlays: ");
                m.append(e2.getLocalizedMessage());
                Log.e("ColorCustomizationManager", m.toString(), e2);
            }
        }
        this.mCurrentSource = (String) hashMap.remove("android.theme.customization.color_source");
        this.mCurrentOverlays = hashMap;
    }
}
