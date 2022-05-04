package com.android.wallpaper.module;

import android.content.res.Resources;
import java.io.File;
/* loaded from: classes.dex */
public class DefaultPartnerProvider implements PartnerProvider {
    public final String mPackageName;
    public final Resources mResources;

    public final File getLegacyWallpaperDirectory() {
        int i;
        Resources resources = this.mResources;
        if (resources != null) {
            i = resources.getIdentifier("system_wallpaper_directory", "string", this.mPackageName);
        } else {
            i = 0;
        }
        if (i != 0) {
            return new File(resources.getString(i));
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0079  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public DefaultPartnerProvider(android.content.Context r6) {
        /*
            r5 = this;
            r5.<init>()
            android.content.pm.PackageManager r6 = r6.getPackageManager()
            java.lang.String r0 = "com.google.android.apps.wallpaper.nexus"
            android.content.Intent r1 = new android.content.Intent
            java.lang.String r2 = "com.android.launcher3.action.PARTNER_CUSTOMIZATION"
            r1.<init>(r2)
            r2 = 0
            java.util.List r1 = r6.queryBroadcastReceivers(r1, r2)
            java.util.Iterator r1 = r1.iterator()
        L19:
            boolean r2 = r1.hasNext()
            r3 = 0
            if (r2 == 0) goto L54
            java.lang.Object r2 = r1.next()
            android.content.pm.ResolveInfo r2 = (android.content.pm.ResolveInfo) r2
            android.content.pm.ActivityInfo r2 = r2.activityInfo
            if (r2 == 0) goto L19
            android.content.pm.ApplicationInfo r4 = r2.applicationInfo
            int r4 = r4.flags
            r4 = r4 & 1
            if (r4 == 0) goto L19
            java.lang.String r2 = r2.packageName
            android.content.res.Resources r4 = r6.getResourcesForApplication(r2)     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L3d
            android.util.Pair r1 = android.util.Pair.create(r2, r4)     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L3d
            goto L55
        L3d:
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.String r4 = "Failed to find resources for "
            r3.append(r4)
            r3.append(r2)
            java.lang.String r2 = r3.toString()
            java.lang.String r3 = "DefaultPartnerProvider"
            android.util.Log.w(r3, r2)
            goto L19
        L54:
            r1 = r3
        L55:
            if (r1 == 0) goto L58
            goto L7a
        L58:
            r1 = 128(0x80, float:1.794E-43)
            android.content.pm.ApplicationInfo r1 = r6.getApplicationInfo(r0, r1)     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L69
            if (r1 == 0) goto L71
            android.os.Bundle r2 = r1.metaData     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L69
            if (r2 == 0) goto L71
            android.content.res.Resources r6 = r6.getResourcesForApplication(r1)     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L69
            goto L72
        L69:
            r6 = move-exception
            java.lang.String r1 = "GooglePartnerProvider"
            java.lang.String r2 = "Stub APK not found: "
            android.util.Log.w(r1, r2, r6)
        L71:
            r6 = r3
        L72:
            if (r6 == 0) goto L79
            android.util.Pair r1 = android.util.Pair.create(r0, r6)
            goto L7a
        L79:
            r1 = r3
        L7a:
            if (r1 == 0) goto L89
            java.lang.Object r6 = r1.first
            java.lang.String r6 = (java.lang.String) r6
            r5.mPackageName = r6
            java.lang.Object r6 = r1.second
            android.content.res.Resources r6 = (android.content.res.Resources) r6
            r5.mResources = r6
            goto L8d
        L89:
            r5.mPackageName = r3
            r5.mResources = r3
        L8d:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.module.DefaultPartnerProvider.<init>(android.content.Context):void");
    }
}
