package com.google.android.gms.common;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import com.android.systemui.flags.FlagManager;
import com.android.systemui.shared.system.QuickStepContract;
import com.google.android.gms.common.internal.zzs;
import com.google.android.gms.common.util.zzi;
import com.google.android.gms.internal.zzbmj;
import com.google.android.gms.internal.zzbmk;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class GoogleApiAvailabilityLight {
    public static final int GOOGLE_PLAY_SERVICES_VERSION_CODE = 12529000;

    public Intent getErrorResolutionIntent(Context context, int i, String str) {
        if (i == 1 || i == 2) {
            if (context == null || !zzi.zzb(context)) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("gcore_");
                m.append(GOOGLE_PLAY_SERVICES_VERSION_CODE);
                m.append("-");
                if (!TextUtils.isEmpty(str)) {
                    m.append(str);
                }
                m.append("-");
                if (context != null) {
                    m.append(context.getPackageName());
                }
                m.append("-");
                if (context != null) {
                    try {
                        zzbmj zza = zzbmk.zza(context);
                        m.append(zza.zza.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode);
                    } catch (PackageManager.NameNotFoundException unused) {
                    }
                }
                String sb = m.toString();
                int i2 = zzs.$r8$clinit;
                Intent intent = new Intent("android.intent.action.VIEW");
                Uri.Builder appendQueryParameter = Uri.parse("market://details").buildUpon().appendQueryParameter(FlagManager.EXTRA_ID, "com.google.android.gms");
                if (!TextUtils.isEmpty(sb)) {
                    appendQueryParameter.appendQueryParameter("pcampaignid", sb);
                }
                intent.setData(appendQueryParameter.build());
                intent.setPackage("com.android.vending");
                intent.addFlags(QuickStepContract.SYSUI_STATE_MAGNIFICATION_OVERLAP);
                return intent;
            }
            int i3 = zzs.$r8$clinit;
            Intent intent2 = new Intent("com.google.android.clockwork.home.UPDATE_ANDROID_WEAR_ACTION");
            intent2.setPackage("com.google.android.wearable.app");
            return intent2;
        } else if (i != 3) {
            return null;
        } else {
            int i4 = zzs.$r8$clinit;
            Uri fromParts = Uri.fromParts("package", "com.google.android.gms", null);
            Intent intent3 = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
            intent3.setData(fromParts);
            return intent3;
        }
    }

    static {
        AtomicBoolean atomicBoolean = GooglePlayServicesUtilLight.zza;
    }

    /* JADX WARN: Removed duplicated region for block: B:106:0x01b8  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x01f3  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x01f5  */
    /* JADX WARN: Removed duplicated region for block: B:139:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00db  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00dd  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00e0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static int isGooglePlayServicesAvailable(android.content.Context r11, int r12) {
        /*
            Method dump skipped, instructions count: 507
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.common.GoogleApiAvailabilityLight.isGooglePlayServicesAvailable(android.content.Context, int):int");
    }

    public PendingIntent getErrorResolutionPendingIntent(Context context, int i, String str) {
        Intent errorResolutionIntent = getErrorResolutionIntent(context, i, str);
        if (errorResolutionIntent == null) {
            return null;
        }
        return PendingIntent.getActivity(context, 0, errorResolutionIntent, 134217728);
    }
}
