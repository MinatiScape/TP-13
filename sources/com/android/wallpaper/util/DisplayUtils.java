package com.android.wallpaper.util;

import android.content.Context;
import android.graphics.Point;
import android.hardware.display.DisplayManager;
import android.util.Log;
import android.view.Display;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: DisplayUtils.kt */
/* loaded from: classes.dex */
public final class DisplayUtils {
    @NotNull
    public final ArrayList internalDisplays;

    public DisplayUtils(@NotNull Context context) {
        boolean z;
        boolean z2;
        Intrinsics.checkNotNullParameter(context, "context");
        Context applicationContext = context.getApplicationContext();
        Object systemService = applicationContext.getSystemService("display");
        if (systemService != null) {
            Display[] displays = ((DisplayManager) systemService).getDisplays();
            Intrinsics.checkNotNullExpressionValue(displays, "dm.displays");
            if (displays.length == 0) {
                z = true;
            } else {
                z = false;
            }
            if (!z) {
                ArrayList arrayList = new ArrayList();
                int length = displays.length;
                int i = 0;
                while (i < length) {
                    Display display = displays[i];
                    i++;
                    if (display.getType() == 1) {
                        z2 = true;
                    } else {
                        z2 = false;
                    }
                    if (z2) {
                        arrayList.add(display);
                    }
                }
                this.internalDisplays = arrayList;
                return;
            }
            Log.e("DisplayUtils", Intrinsics.stringPlus("No displays found on context ", applicationContext));
            throw new RuntimeException("No displays found!");
        }
        throw new NullPointerException("null cannot be cast to non-null type android.hardware.display.DisplayManager");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v3 */
    /* JADX WARN: Type inference failed for: r1v4 */
    @NotNull
    public final Display getWallpaperDisplay() {
        Display display;
        ArrayList arrayList = this.internalDisplays;
        Intrinsics.checkNotNullParameter(arrayList, "<this>");
        Iterator it = arrayList.iterator();
        if (!it.hasNext()) {
            display = null;
        } else {
            Object next = it.next();
            while (it.hasNext()) {
                Object next2 = it.next();
                Display a = next;
                Display b = (Display) next2;
                Intrinsics.checkNotNullExpressionValue(a, "a");
                int access$getRealSize = access$getRealSize(this, a);
                Intrinsics.checkNotNullExpressionValue(b, "b");
                if (access$getRealSize - access$getRealSize(this, b) < 0) {
                    next = next2;
                }
            }
            display = next;
        }
        Display display2 = display;
        if (display2 == null) {
            return (Display) this.internalDisplays.get(0);
        }
        return display2;
    }

    public static final int access$getRealSize(DisplayUtils displayUtils, Display display) {
        displayUtils.getClass();
        Point point = new Point();
        display.getRealSize(point);
        return point.x * point.y;
    }
}
