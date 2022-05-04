package com.android.customization.model.themedicon;

import android.content.ContentResolver;
import com.android.customization.module.CustomizationPreferences;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public final class ThemedIconSwitchProvider {
    public static ThemedIconSwitchProvider sThemedIconSwitchProvider;
    public final ContentResolver mContentResolver;
    public final CustomizationPreferences mCustomizationPreferences;
    public final ExecutorService mExecutorService = Executors.newSingleThreadExecutor();
    public final ThemedIconUtils mThemedIconUtils;

    /* loaded from: classes.dex */
    public interface FetchThemedIconEnabledCallback {
    }

    public ThemedIconSwitchProvider(ContentResolver contentResolver, ThemedIconUtils themedIconUtils, CustomizationPreferences customizationPreferences) {
        this.mContentResolver = contentResolver;
        this.mThemedIconUtils = themedIconUtils;
        this.mCustomizationPreferences = customizationPreferences;
    }
}
