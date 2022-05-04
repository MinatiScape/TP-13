package androidx.transition;

import android.graphics.Path;
import android.graphics.Typeface;
import com.google.android.apps.wallpaper.backdrop.JobSchedulerBackdropTaskScheduler;
/* loaded from: classes.dex */
public abstract class PathMotion {
    public static JobSchedulerBackdropTaskScheduler sInstance;

    public abstract Path getPath(float f, float f2, float f3, float f4);

    public abstract void onFontRetrievalFailed(int i);

    public abstract void onFontRetrieved(Typeface typeface, boolean z);
}
