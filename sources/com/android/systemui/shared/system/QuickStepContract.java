package com.android.systemui.shared.system;

import android.content.Context;
import android.content.res.Resources;
import android.view.ViewConfiguration;
import com.android.internal.policy.ScreenDecorationsUtils;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.StringJoiner;
/* loaded from: classes.dex */
public class QuickStepContract {
    public static final String KEY_EXTRA_RECENT_TASKS = "recent_tasks";
    public static final String KEY_EXTRA_SHELL_BACK_ANIMATION = "extra_shell_back_animation";
    public static final String KEY_EXTRA_SHELL_ONE_HANDED = "extra_shell_one_handed";
    public static final String KEY_EXTRA_SHELL_PIP = "extra_shell_pip";
    public static final String KEY_EXTRA_SHELL_SHELL_TRANSITIONS = "extra_shell_shell_transitions";
    public static final String KEY_EXTRA_SHELL_SPLIT_SCREEN = "extra_shell_split_screen";
    public static final String KEY_EXTRA_SHELL_STARTING_WINDOW = "extra_shell_starting_window";
    public static final String KEY_EXTRA_SUPPORTS_WINDOW_CORNERS = "extra_supports_window_corners";
    public static final String KEY_EXTRA_SYSUI_PROXY = "extra_sysui_proxy";
    public static final String KEY_EXTRA_UNLOCK_ANIMATION_CONTROLLER = "unlock_animation";
    public static final String KEY_EXTRA_WINDOW_CORNER_RADIUS = "extra_window_corner_radius";
    public static final String LAUNCHER_ACTIVITY_CLASS_NAME = "com.google.android.apps.nexuslauncher.NexusLauncherActivity";
    public static final String NAV_BAR_MODE_3BUTTON_OVERLAY = "com.android.internal.systemui.navbar.threebutton";
    public static final String NAV_BAR_MODE_GESTURAL_OVERLAY = "com.android.internal.systemui.navbar.gestural";
    public static final float QUICKSTEP_TOUCH_SLOP_RATIO = 3.0f;
    public static final int SYSUI_STATE_A11Y_BUTTON_CLICKABLE = 16;
    public static final int SYSUI_STATE_A11Y_BUTTON_LONG_CLICKABLE = 32;
    public static final int SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY = 131072;
    public static final int SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED = 8192;
    public static final int SYSUI_STATE_BACK_DISABLED = 4194304;
    public static final int SYSUI_STATE_BOUNCER_SHOWING = 8;
    public static final int SYSUI_STATE_BUBBLES_EXPANDED = 16384;
    public static final int SYSUI_STATE_BUBBLES_MANAGE_MENU_EXPANDED = 8388608;
    public static final int SYSUI_STATE_DEVICE_DOZING = 2097152;
    public static final int SYSUI_STATE_DIALOG_SHOWING = 32768;
    public static final int SYSUI_STATE_HOME_DISABLED = 256;
    public static final int SYSUI_STATE_IME_SHOWING = 262144;
    public static final int SYSUI_STATE_IME_SWITCHER_SHOWING = 1048576;
    public static final int SYSUI_STATE_IMMERSIVE_MODE = 16777216;
    public static final int SYSUI_STATE_MAGNIFICATION_OVERLAP = 524288;
    public static final int SYSUI_STATE_NAV_BAR_HIDDEN = 2;
    public static final int SYSUI_STATE_NOTIFICATION_PANEL_EXPANDED = 4;
    public static final int SYSUI_STATE_ONE_HANDED_ACTIVE = 65536;
    public static final int SYSUI_STATE_OVERVIEW_DISABLED = 128;
    public static final int SYSUI_STATE_QUICK_SETTINGS_EXPANDED = 2048;
    public static final int SYSUI_STATE_SCREEN_PINNING = 1;
    public static final int SYSUI_STATE_SEARCH_DISABLED = 1024;
    public static final int SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING = 64;
    public static final int SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED = 512;
    public static final int SYSUI_STATE_TRACING_ENABLED = 4096;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface SystemUiStateFlags {
    }

    public static final float getQuickStepTouchSlopPx(Context context) {
        return ViewConfiguration.get(context).getScaledTouchSlop() * 3.0f;
    }

    public static boolean isAssistantGestureDisabled(int i) {
        if ((131072 & i) != 0) {
            i &= -3;
        }
        if ((i & 3083) != 0) {
            return true;
        }
        return (i & 4) != 0 && (i & 64) == 0;
    }

    public static boolean isBackGestureDisabled(int i) {
        if ((i & 8) != 0 || (32768 & i) != 0) {
            return false;
        }
        if ((131072 & i) != 0) {
            i &= -3;
        }
        return (i & 70) != 0;
    }

    public static boolean isGesturalMode(int i) {
        return i == 2;
    }

    public static boolean isLegacyMode(int i) {
        return i == 0;
    }

    public static boolean isSwipeUpMode(int i) {
        return i == 1;
    }

    public static int getQuickScrubTouchSlopPx() {
        return convertDpToPixel(24.0f);
    }

    public static int getQuickStepDragSlopPx() {
        return convertDpToPixel(10.0f);
    }

    public static int getQuickStepTouchSlopPx() {
        return convertDpToPixel(24.0f);
    }

    public static String getSystemUiStateString(int i) {
        String str;
        String str2;
        String str3;
        String str4;
        String str5;
        String str6;
        String str7;
        String str8;
        String str9;
        String str10;
        String str11;
        String str12;
        String str13;
        String str14;
        String str15;
        String str16;
        String str17;
        String str18;
        String str19;
        String str20;
        String str21;
        String str22;
        String str23;
        String str24;
        StringJoiner stringJoiner = new StringJoiner("|");
        String str25 = "";
        if ((i & 1) != 0) {
            str = "screen_pinned";
        } else {
            str = str25;
        }
        stringJoiner.add(str);
        if ((i & 128) != 0) {
            str2 = "overview_disabled";
        } else {
            str2 = str25;
        }
        stringJoiner.add(str2);
        if ((i & 256) != 0) {
            str3 = "home_disabled";
        } else {
            str3 = str25;
        }
        stringJoiner.add(str3);
        if ((i & SYSUI_STATE_SEARCH_DISABLED) != 0) {
            str4 = "search_disabled";
        } else {
            str4 = str25;
        }
        stringJoiner.add(str4);
        if ((i & 2) != 0) {
            str5 = "navbar_hidden";
        } else {
            str5 = str25;
        }
        stringJoiner.add(str5);
        if ((i & 4) != 0) {
            str6 = "notif_visible";
        } else {
            str6 = str25;
        }
        stringJoiner.add(str6);
        if ((i & SYSUI_STATE_QUICK_SETTINGS_EXPANDED) != 0) {
            str7 = "qs_visible";
        } else {
            str7 = str25;
        }
        stringJoiner.add(str7);
        if ((i & 64) != 0) {
            str8 = "keygrd_visible";
        } else {
            str8 = str25;
        }
        stringJoiner.add(str8);
        if ((i & SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED) != 0) {
            str9 = "keygrd_occluded";
        } else {
            str9 = str25;
        }
        stringJoiner.add(str9);
        if ((i & 8) != 0) {
            str10 = "bouncer_visible";
        } else {
            str10 = str25;
        }
        stringJoiner.add(str10);
        if ((32768 & i) != 0) {
            str11 = "dialog_showing";
        } else {
            str11 = str25;
        }
        stringJoiner.add(str11);
        if ((i & 16) != 0) {
            str12 = "a11y_click";
        } else {
            str12 = str25;
        }
        stringJoiner.add(str12);
        if ((i & 32) != 0) {
            str13 = "a11y_long_click";
        } else {
            str13 = str25;
        }
        stringJoiner.add(str13);
        if ((i & SYSUI_STATE_TRACING_ENABLED) != 0) {
            str14 = "tracing";
        } else {
            str14 = str25;
        }
        stringJoiner.add(str14);
        if ((i & SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED) != 0) {
            str15 = "asst_gesture_constrain";
        } else {
            str15 = str25;
        }
        stringJoiner.add(str15);
        if ((i & SYSUI_STATE_BUBBLES_EXPANDED) != 0) {
            str16 = "bubbles_expanded";
        } else {
            str16 = str25;
        }
        stringJoiner.add(str16);
        if ((65536 & i) != 0) {
            str17 = "one_handed_active";
        } else {
            str17 = str25;
        }
        stringJoiner.add(str17);
        if ((131072 & i) != 0) {
            str18 = "allow_gesture";
        } else {
            str18 = str25;
        }
        stringJoiner.add(str18);
        if ((262144 & i) != 0) {
            str19 = "ime_visible";
        } else {
            str19 = str25;
        }
        stringJoiner.add(str19);
        if ((524288 & i) != 0) {
            str20 = "magnification_overlap";
        } else {
            str20 = str25;
        }
        stringJoiner.add(str20);
        if ((1048576 & i) != 0) {
            str21 = "ime_switcher_showing";
        } else {
            str21 = str25;
        }
        stringJoiner.add(str21);
        if ((2097152 & i) != 0) {
            str22 = "device_dozing";
        } else {
            str22 = str25;
        }
        stringJoiner.add(str22);
        if ((4194304 & i) != 0) {
            str23 = "back_disabled";
        } else {
            str23 = str25;
        }
        stringJoiner.add(str23);
        if ((8388608 & i) != 0) {
            str24 = "bubbles_mange_menu_expanded";
        } else {
            str24 = str25;
        }
        stringJoiner.add(str24);
        if ((i & SYSUI_STATE_IMMERSIVE_MODE) != 0) {
            str25 = "immersive_mode";
        }
        stringJoiner.add(str25);
        return stringJoiner.toString();
    }

    private static int convertDpToPixel(float f) {
        return (int) (f * Resources.getSystem().getDisplayMetrics().density);
    }

    public static float getWindowCornerRadius(Context context) {
        return ScreenDecorationsUtils.getWindowCornerRadius(context);
    }

    public static boolean supportsRoundedCornersOnWindows(Resources resources) {
        return ScreenDecorationsUtils.supportsRoundedCornersOnWindows(resources);
    }
}
