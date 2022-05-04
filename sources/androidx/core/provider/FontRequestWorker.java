package androidx.core.provider;

import android.annotation.SuppressLint;
import android.graphics.Typeface;
import android.os.Process;
import androidx.collection.LruCache;
import androidx.collection.SimpleArrayMap;
import androidx.core.util.Consumer;
import java.util.ArrayList;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public final class FontRequestWorker {
    public static final ThreadPoolExecutor DEFAULT_EXECUTOR_SERVICE;
    public static final LruCache<String, Typeface> sTypefaceCache = new LruCache<>(16);
    public static final Object LOCK = new Object();
    public static final SimpleArrayMap<String, ArrayList<Consumer<TypefaceResult>>> PENDING_REPLIES = new SimpleArrayMap<>();

    static {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, 1, 10000, TimeUnit.MILLISECONDS, new LinkedBlockingDeque(), new ThreadFactory() { // from class: androidx.core.provider.RequestExecutor$DefaultThreadFactory
            public String mThreadName = "fonts-androidx";
            public int mPriority = 10;

            /* loaded from: classes.dex */
            public static class ProcessPriorityThread extends Thread {
                public final int mPriority;

                @Override // java.lang.Thread, java.lang.Runnable
                public final void run() {
                    Process.setThreadPriority(this.mPriority);
                    super.run();
                }

                public ProcessPriorityThread(Runnable runnable, String str, int i) {
                    super(runnable, str);
                    this.mPriority = i;
                }
            }

            @Override // java.util.concurrent.ThreadFactory
            public final Thread newThread(Runnable runnable) {
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
    public static androidx.core.provider.FontRequestWorker.TypefaceResult getFontSync(java.lang.String r11, android.content.Context r12, androidx.core.provider.FontRequest r13, int r14) {
        /*
            Method dump skipped, instructions count: 256
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.core.provider.FontRequestWorker.getFontSync(java.lang.String, android.content.Context, androidx.core.provider.FontRequest, int):androidx.core.provider.FontRequestWorker$TypefaceResult");
    }

    /* loaded from: classes.dex */
    public static final class TypefaceResult {
        public final int mResult;
        public final Typeface mTypeface;

        public TypefaceResult(int i) {
            this.mTypeface = null;
            this.mResult = i;
        }

        @SuppressLint({"WrongConstant"})
        public TypefaceResult(Typeface typeface) {
            this.mTypeface = typeface;
            this.mResult = 0;
        }
    }
}
