package androidx.arch.core.executor;

import android.os.Handler;
import android.os.Looper;
import androidx.transition.PathMotion;
/* loaded from: classes.dex */
public final class ArchTaskExecutor extends PathMotion {
    public static volatile ArchTaskExecutor sInstance;
    public DefaultTaskExecutor mDefaultTaskExecutor;
    public DefaultTaskExecutor mDelegate;

    public static ArchTaskExecutor getInstance() {
        if (sInstance != null) {
            return sInstance;
        }
        synchronized (ArchTaskExecutor.class) {
            if (sInstance == null) {
                sInstance = new ArchTaskExecutor();
            }
        }
        return sInstance;
    }

    public final void postToMainThread(Runnable runnable) {
        DefaultTaskExecutor defaultTaskExecutor = this.mDelegate;
        if (defaultTaskExecutor.mMainHandler == null) {
            synchronized (defaultTaskExecutor.mLock) {
                if (defaultTaskExecutor.mMainHandler == null) {
                    defaultTaskExecutor.mMainHandler = Handler.createAsync(Looper.getMainLooper());
                }
            }
        }
        defaultTaskExecutor.mMainHandler.post(runnable);
    }

    public ArchTaskExecutor() {
        DefaultTaskExecutor defaultTaskExecutor = new DefaultTaskExecutor();
        this.mDefaultTaskExecutor = defaultTaskExecutor;
        this.mDelegate = defaultTaskExecutor;
    }
}
