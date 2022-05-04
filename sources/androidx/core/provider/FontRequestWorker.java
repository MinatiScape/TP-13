package androidx.core.provider;

import android.annotation.SuppressLint;
import android.graphics.Typeface;
import android.os.Process;
import androidx.collection.LruCache;
import androidx.collection.SimpleArrayMap;
import androidx.core.util.Consumer;
import java.util.ArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public class FontRequestWorker {
    public static final ExecutorService DEFAULT_EXECUTOR_SERVICE;
    public static final LruCache<String, Typeface> sTypefaceCache = new LruCache<>(16);
    public static final Object LOCK = new Object();
    public static final SimpleArrayMap<String, ArrayList<Consumer<TypefaceResult>>> PENDING_REPLIES = new SimpleArrayMap<>();

    static {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, 1, 10000, TimeUnit.MILLISECONDS, new LinkedBlockingDeque(), new ThreadFactory("fonts-androidx", 10) { // from class: androidx.core.provider.RequestExecutor$DefaultThreadFactory
            public int mPriority;
            public String mThreadName;

            /* loaded from: classes.dex */
            public static class ProcessPriorityThread extends Thread {
                public final int mPriority;

                public ProcessPriorityThread(Runnable target, String name, int priority) {
                    super(target, name);
                    this.mPriority = priority;
                }

                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    Process.setThreadPriority(this.mPriority);
                    super.run();
                }
            }

            {
                this.mThreadName = threadName;
                this.mPriority = priority;
            }

            @Override // java.util.concurrent.ThreadFactory
            public Thread newThread(Runnable runnable) {
                return new ProcessPriorityThread(runnable, this.mThreadName, this.mPriority);
            }
        });
        threadPoolExecutor.allowCoreThreadTimeOut(true);
        DEFAULT_EXECUTOR_SERVICE = threadPoolExecutor;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0063  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static androidx.core.provider.FontRequestWorker.TypefaceResult getFontSync(final java.lang.String r11, final android.content.Context r12, final androidx.core.provider.FontRequest r13, int r14) {
        /*
            Method dump skipped, instructions count: 258
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.core.provider.FontRequestWorker.getFontSync(java.lang.String, android.content.Context, androidx.core.provider.FontRequest, int):androidx.core.provider.FontRequestWorker$TypefaceResult");
    }

    /* loaded from: classes.dex */
    public static final class TypefaceResult {
        public final int mResult;
        public final Typeface mTypeface;

        public TypefaceResult(int result) {
            this.mTypeface = null;
            this.mResult = result;
        }

        @SuppressLint({"WrongConstant"})
        public TypefaceResult(Typeface typeface) {
            this.mTypeface = typeface;
            this.mResult = 0;
        }
    }
}
