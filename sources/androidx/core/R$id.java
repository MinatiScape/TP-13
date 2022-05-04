package androidx.core;

import com.android.systemui.shared.R;
import com.android.wallpaper.model.WallpaperInfo;
import com.google.android.gms.common.internal.zzam;
import java.util.concurrent.ExecutorService;
/* loaded from: classes.dex */
public final class R$id {
    public static int getActionIconForType(int i) {
        if (i == 2) {
            return R.drawable.ic_case_24px;
        }
        ExecutorService executorService = WallpaperInfo.sExecutor;
        return R.drawable.ic_explore_24px;
    }

    public static int getActionLabelForType(int i) {
        if (i == 2) {
            return R.string.build_case;
        }
        ExecutorService executorService = WallpaperInfo.sExecutor;
        return R.string.explore;
    }

    public static boolean zza(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static zzam zza(Object obj) {
        return new zzam(obj, null);
    }
}
