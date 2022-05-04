package com.android.wallpaper.util;

import android.content.Context;
import android.graphics.Point;
import android.hardware.display.DisplayManager;
import android.util.Log;
import android.view.Display;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class DisplayUtils {
    @NotNull
    public final List<Display> internalDisplays;

    public DisplayUtils(@NotNull Context context) {
        Intrinsics.checkNotNullParameter(context, "context");
        Context applicationContext = context.getApplicationContext();
        Object systemService = applicationContext.getSystemService("display");
        Objects.requireNonNull(systemService, "null cannot be cast to non-null type android.hardware.display.DisplayManager");
        Display[] displays = ((DisplayManager) systemService).getDisplays();
        Intrinsics.checkNotNullExpressionValue(displays, "dm.displays");
        if (!(displays.length == 0)) {
            ArrayList arrayList = new ArrayList();
            for (Display display : displays) {
                if (display.getType() == 1) {
                    arrayList.add(display);
                }
            }
            this.internalDisplays = arrayList;
            return;
        }
        Log.e("DisplayUtils", Intrinsics.stringPlus("No displays found on context ", applicationContext));
        throw new RuntimeException("No displays found!");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v3 */
    /* JADX WARN: Type inference failed for: r1v4 */
    @NotNull
    public final Display getWallpaperDisplay() {
        Display display;
        List<Display> maxWithOrNull = this.internalDisplays;
        Intrinsics.checkNotNullParameter(maxWithOrNull, "$this$maxWithOrNull");
        Iterator it = maxWithOrNull.iterator();
        if (!it.hasNext()) {
            display = null;
        } else {
            Object next = it.next();
            while (it.hasNext()) {
                Object next2 = it.next();
                Display a = next;
                Display b = (Display) next2;
                Intrinsics.checkNotNullExpressionValue(a, "a");
                Objects.requireNonNull(this);
                Point point = new Point();
                a.getRealSize(point);
                int i = point.x * point.y;
                Intrinsics.checkNotNullExpressionValue(b, "b");
                Objects.requireNonNull(this);
                Point point2 = new Point();
                b.getRealSize(point2);
                if (i - (point2.x * point2.y) < 0) {
                    next = next2;
                }
            }
            display = next;
        }
        Display display2 = display;
        return display2 == null ? this.internalDisplays.get(0) : display2;
    }
}
