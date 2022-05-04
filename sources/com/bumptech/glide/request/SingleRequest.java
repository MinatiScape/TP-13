package com.bumptech.glide.request;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import com.bumptech.glide.GlideBuilder;
import com.bumptech.glide.GlideContext;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.GlideException;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.model.Model;
import com.bumptech.glide.load.resource.drawable.DrawableDecoderCompat;
import com.bumptech.glide.request.target.SizeReadyCallback;
import com.bumptech.glide.request.target.Target;
import com.bumptech.glide.request.transition.TransitionFactory;
import com.bumptech.glide.util.LogTime;
import com.bumptech.glide.util.Util;
import com.bumptech.glide.util.pool.StateVerifier;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public final class SingleRequest<R> implements Request, SizeReadyCallback, ResourceCallback {
    public static final boolean IS_VERBOSE_LOGGABLE = Log.isLoggable("Request", 2);
    public final TransitionFactory<? super R> animationFactory;
    public final Executor callbackExecutor;
    public final Context context;
    public volatile Engine engine;
    public Drawable errorDrawable;
    public Drawable fallbackDrawable;
    public final GlideContext glideContext;
    public int height;
    public boolean isCallingCallbacks;
    public Engine.LoadStatus loadStatus;
    public final Object model;
    public final int overrideHeight;
    public final int overrideWidth;
    public Drawable placeholderDrawable;
    public final Priority priority;
    public final RequestCoordinator requestCoordinator;
    public final List<RequestListener<R>> requestListeners;
    public final Object requestLock;
    public final BaseRequestOptions<?> requestOptions;
    public RuntimeException requestOrigin;
    public Resource<R> resource;
    public long startTime;
    public final StateVerifier.DefaultStateVerifier stateVerifier;
    public Status status;
    public final String tag;
    public final Target<R> target;
    public final RequestListener<R> targetListener;
    public final Class<R> transcodeClass;
    public int width;

    /* loaded from: classes.dex */
    public enum Status {
        PENDING,
        RUNNING,
        WAITING_FOR_SIZE,
        COMPLETE,
        FAILED,
        CLEARED
    }

    public SingleRequest(Context context, GlideContext glideContext, Object obj, Object obj2, Class cls, BaseRequestOptions baseRequestOptions, int i, int i2, Priority priority, Target target, RequestFutureTarget requestFutureTarget, ArrayList arrayList, RequestCoordinator requestCoordinator, Engine engine, TransitionFactory transitionFactory, Executor executor) {
        String str;
        if (IS_VERBOSE_LOGGABLE) {
            str = String.valueOf(hashCode());
        } else {
            str = null;
        }
        this.tag = str;
        this.stateVerifier = new StateVerifier.DefaultStateVerifier();
        this.requestLock = obj;
        this.context = context;
        this.glideContext = glideContext;
        this.model = obj2;
        this.transcodeClass = cls;
        this.requestOptions = baseRequestOptions;
        this.overrideWidth = i;
        this.overrideHeight = i2;
        this.priority = priority;
        this.target = target;
        this.targetListener = requestFutureTarget;
        this.requestListeners = arrayList;
        this.requestCoordinator = requestCoordinator;
        this.engine = engine;
        this.animationFactory = transitionFactory;
        this.callbackExecutor = executor;
        this.status = Status.PENDING;
        if (this.requestOrigin == null && glideContext.experiments.experiments.containsKey(GlideBuilder.LogRequestOrigins.class)) {
            this.requestOrigin = new RuntimeException("Glide request origin trace");
        }
    }

    public final void onResourceReady(Resource<?> resource, DataSource dataSource, boolean z) {
        Throwable th;
        this.stateVerifier.throwIfRecycled();
        Resource<?> resource2 = null;
        try {
            synchronized (this.requestLock) {
                try {
                    this.loadStatus = null;
                    if (resource == null) {
                        onLoadFailed(new GlideException("Expected to receive a Resource<R> with an object of " + this.transcodeClass + " inside, but instead got null."), 5);
                        return;
                    }
                    Object obj = resource.get();
                    try {
                        if (obj != null && this.transcodeClass.isAssignableFrom(obj.getClass())) {
                            RequestCoordinator requestCoordinator = this.requestCoordinator;
                            if (!(requestCoordinator == null || requestCoordinator.canSetImage(this))) {
                                this.resource = null;
                                this.status = Status.COMPLETE;
                                this.engine.getClass();
                                Engine.release(resource);
                            }
                            onResourceReady(resource, obj, dataSource);
                            return;
                        }
                        this.resource = null;
                        StringBuilder sb = new StringBuilder();
                        sb.append("Expected to receive an object of ");
                        sb.append(this.transcodeClass);
                        sb.append(" but instead got ");
                        sb.append(obj != null ? obj.getClass() : "");
                        sb.append("{");
                        sb.append(obj);
                        sb.append("} inside Resource{");
                        sb.append(resource);
                        sb.append("}.");
                        sb.append(obj != null ? "" : " To indicate failure return a null Resource object, rather than a Resource object containing null data.");
                        onLoadFailed(new GlideException(sb.toString()), 5);
                        this.engine.getClass();
                        Engine.release(resource);
                    } catch (Throwable th2) {
                        th = th2;
                        resource2 = resource;
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                }
            }
        } catch (Throwable th4) {
            if (resource2 != null) {
                this.engine.getClass();
                Engine.release(resource2);
            }
            throw th4;
        }
    }

    @Override // com.bumptech.glide.request.Request
    public final void begin() {
        int i;
        int i2;
        synchronized (this.requestLock) {
            try {
                if (!this.isCallingCallbacks) {
                    this.stateVerifier.throwIfRecycled();
                    int i3 = LogTime.$r8$clinit;
                    this.startTime = SystemClock.elapsedRealtimeNanos();
                    if (this.model == null) {
                        if (Util.isValidDimensions(this.overrideWidth, this.overrideHeight)) {
                            this.width = this.overrideWidth;
                            this.height = this.overrideHeight;
                        }
                        if (this.fallbackDrawable == null) {
                            BaseRequestOptions<?> baseRequestOptions = this.requestOptions;
                            Drawable drawable = baseRequestOptions.fallbackDrawable;
                            this.fallbackDrawable = drawable;
                            if (drawable == null && (i2 = baseRequestOptions.fallbackId) > 0) {
                                this.fallbackDrawable = loadDrawable(i2);
                            }
                        }
                        if (this.fallbackDrawable == null) {
                            i = 5;
                        } else {
                            i = 3;
                        }
                        onLoadFailed(new GlideException("Received null model"), i);
                        return;
                    }
                    Status status = this.status;
                    Status status2 = Status.RUNNING;
                    if (status != status2) {
                        boolean z = false;
                        if (status == Status.COMPLETE) {
                            onResourceReady((Resource<?>) this.resource, DataSource.MEMORY_CACHE, false);
                            return;
                        }
                        Status status3 = Status.WAITING_FOR_SIZE;
                        this.status = status3;
                        if (Util.isValidDimensions(this.overrideWidth, this.overrideHeight)) {
                            onSizeReady(this.overrideWidth, this.overrideHeight);
                        } else {
                            this.target.getSize(this);
                        }
                        Status status4 = this.status;
                        if (status4 == status2 || status4 == status3) {
                            RequestCoordinator requestCoordinator = this.requestCoordinator;
                            if (requestCoordinator == null || requestCoordinator.canNotifyStatusChanged(this)) {
                                z = true;
                            }
                            if (z) {
                                this.target.onLoadStarted(getPlaceholderDrawable());
                            }
                        }
                        if (IS_VERBOSE_LOGGABLE) {
                            logV("finished run method in " + LogTime.getElapsedMillis(this.startTime));
                        }
                        return;
                    }
                    throw new IllegalArgumentException("Cannot restart a running request");
                }
                throw new IllegalStateException("You can't start or clear loads in RequestListener or Target callbacks. If you're trying to start a fallback request when a load fails, use RequestBuilder#error(RequestBuilder). Otherwise consider posting your into() or clear() calls to the main thread using a Handler instead.");
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void cancel() {
        if (!this.isCallingCallbacks) {
            this.stateVerifier.throwIfRecycled();
            this.target.removeCallback(this);
            Engine.LoadStatus loadStatus = this.loadStatus;
            if (loadStatus != null) {
                synchronized (Engine.this) {
                    loadStatus.engineJob.removeCallback(loadStatus.cb);
                }
                this.loadStatus = null;
                return;
            }
            return;
        }
        throw new IllegalStateException("You can't start or clear loads in RequestListener or Target callbacks. If you're trying to start a fallback request when a load fails, use RequestBuilder#error(RequestBuilder). Otherwise consider posting your into() or clear() calls to the main thread using a Handler instead.");
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0030 A[Catch: all -> 0x004f, TryCatch #0 {, blocks: (B:4:0x0003, B:6:0x0007, B:8:0x0012, B:10:0x0014, B:12:0x001c, B:14:0x0020, B:16:0x0024, B:22:0x0030, B:23:0x0039, B:24:0x003b, B:28:0x0047, B:29:0x004e), top: B:33:0x0003 }] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x003e  */
    /* JADX WARN: Removed duplicated region for block: B:34:? A[RETURN, SYNTHETIC] */
    @Override // com.bumptech.glide.request.Request
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void clear() {
        /*
            r5 = this;
            java.lang.Object r0 = r5.requestLock
            monitor-enter(r0)
            boolean r1 = r5.isCallingCallbacks     // Catch: java.lang.Throwable -> L4f
            if (r1 != 0) goto L47
            com.bumptech.glide.util.pool.StateVerifier$DefaultStateVerifier r1 = r5.stateVerifier     // Catch: java.lang.Throwable -> L4f
            r1.throwIfRecycled()     // Catch: java.lang.Throwable -> L4f
            com.bumptech.glide.request.SingleRequest$Status r1 = r5.status     // Catch: java.lang.Throwable -> L4f
            com.bumptech.glide.request.SingleRequest$Status r2 = com.bumptech.glide.request.SingleRequest.Status.CLEARED     // Catch: java.lang.Throwable -> L4f
            if (r1 != r2) goto L14
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L4f
            return
        L14:
            r5.cancel()     // Catch: java.lang.Throwable -> L4f
            com.bumptech.glide.load.engine.Resource<R> r1 = r5.resource     // Catch: java.lang.Throwable -> L4f
            r3 = 0
            if (r1 == 0) goto L1f
            r5.resource = r3     // Catch: java.lang.Throwable -> L4f
            goto L20
        L1f:
            r1 = r3
        L20:
            com.bumptech.glide.request.RequestCoordinator r3 = r5.requestCoordinator     // Catch: java.lang.Throwable -> L4f
            if (r3 == 0) goto L2d
            boolean r3 = r3.canNotifyCleared(r5)     // Catch: java.lang.Throwable -> L4f
            if (r3 == 0) goto L2b
            goto L2d
        L2b:
            r3 = 0
            goto L2e
        L2d:
            r3 = 1
        L2e:
            if (r3 == 0) goto L39
            com.bumptech.glide.request.target.Target<R> r3 = r5.target     // Catch: java.lang.Throwable -> L4f
            android.graphics.drawable.Drawable r4 = r5.getPlaceholderDrawable()     // Catch: java.lang.Throwable -> L4f
            r3.onLoadCleared(r4)     // Catch: java.lang.Throwable -> L4f
        L39:
            r5.status = r2     // Catch: java.lang.Throwable -> L4f
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L4f
            if (r1 == 0) goto L46
            com.bumptech.glide.load.engine.Engine r5 = r5.engine
            r5.getClass()
            com.bumptech.glide.load.engine.Engine.release(r1)
        L46:
            return
        L47:
            java.lang.IllegalStateException r5 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> L4f
            java.lang.String r1 = "You can't start or clear loads in RequestListener or Target callbacks. If you're trying to start a fallback request when a load fails, use RequestBuilder#error(RequestBuilder). Otherwise consider posting your into() or clear() calls to the main thread using a Handler instead."
            r5.<init>(r1)     // Catch: java.lang.Throwable -> L4f
            throw r5     // Catch: java.lang.Throwable -> L4f
        L4f:
            r5 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L4f
            throw r5
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.request.SingleRequest.clear():void");
    }

    public final Drawable getPlaceholderDrawable() {
        int i;
        if (this.placeholderDrawable == null) {
            BaseRequestOptions<?> baseRequestOptions = this.requestOptions;
            Drawable drawable = baseRequestOptions.placeholderDrawable;
            this.placeholderDrawable = drawable;
            if (drawable == null && (i = baseRequestOptions.placeholderId) > 0) {
                this.placeholderDrawable = loadDrawable(i);
            }
        }
        return this.placeholderDrawable;
    }

    @Override // com.bumptech.glide.request.Request
    public final boolean isAnyResourceSet() {
        boolean z;
        synchronized (this.requestLock) {
            if (this.status == Status.COMPLETE) {
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    @Override // com.bumptech.glide.request.Request
    public final boolean isCleared() {
        boolean z;
        synchronized (this.requestLock) {
            if (this.status == Status.CLEARED) {
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    @Override // com.bumptech.glide.request.Request
    public final boolean isComplete() {
        boolean z;
        synchronized (this.requestLock) {
            if (this.status == Status.COMPLETE) {
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    @Override // com.bumptech.glide.request.Request
    public final boolean isEquivalentTo(Request request) {
        int i;
        int i2;
        Object obj;
        Class<R> cls;
        BaseRequestOptions<?> baseRequestOptions;
        Priority priority;
        int i3;
        int i4;
        int i5;
        Object obj2;
        Class<R> cls2;
        BaseRequestOptions<?> baseRequestOptions2;
        Priority priority2;
        int i6;
        boolean z;
        if (!(request instanceof SingleRequest)) {
            return false;
        }
        synchronized (this.requestLock) {
            i = this.overrideWidth;
            i2 = this.overrideHeight;
            obj = this.model;
            cls = this.transcodeClass;
            baseRequestOptions = this.requestOptions;
            priority = this.priority;
            List<RequestListener<R>> list = this.requestListeners;
            if (list != null) {
                i3 = list.size();
            } else {
                i3 = 0;
            }
        }
        SingleRequest singleRequest = (SingleRequest) request;
        synchronized (singleRequest.requestLock) {
            i4 = singleRequest.overrideWidth;
            i5 = singleRequest.overrideHeight;
            obj2 = singleRequest.model;
            cls2 = singleRequest.transcodeClass;
            baseRequestOptions2 = singleRequest.requestOptions;
            priority2 = singleRequest.priority;
            List<RequestListener<R>> list2 = singleRequest.requestListeners;
            if (list2 != null) {
                i6 = list2.size();
            } else {
                i6 = 0;
            }
        }
        if (i != i4 || i2 != i5) {
            return false;
        }
        char[] cArr = Util.HEX_CHAR_ARRAY;
        if (obj == null) {
            if (obj2 == null) {
                z = true;
            } else {
                z = false;
            }
        } else if (obj instanceof Model) {
            z = ((Model) obj).isEquivalentTo();
        } else {
            z = obj.equals(obj2);
        }
        if (!z || !cls.equals(cls2) || !baseRequestOptions.equals(baseRequestOptions2) || priority != priority2 || i3 != i6) {
            return false;
        }
        return true;
    }

    public final boolean isFirstReadyResource() {
        RequestCoordinator requestCoordinator = this.requestCoordinator;
        if (requestCoordinator == null || !requestCoordinator.getRoot().isAnyResourceSet()) {
            return true;
        }
        return false;
    }

    @Override // com.bumptech.glide.request.Request
    public final boolean isRunning() {
        boolean z;
        synchronized (this.requestLock) {
            Status status = this.status;
            if (!(status == Status.RUNNING || status == Status.WAITING_FOR_SIZE)) {
                z = false;
            }
            z = true;
        }
        return z;
    }

    public final Drawable loadDrawable(int i) {
        Resources.Theme theme = this.requestOptions.theme;
        if (theme == null) {
            theme = this.context.getTheme();
        }
        GlideContext glideContext = this.glideContext;
        return DrawableDecoderCompat.getDrawable(glideContext, glideContext, i, theme);
    }

    public final void logV(String str) {
        Log.v("Request", str + " this: " + this.tag);
    }

    public final void onLoadFailed(GlideException glideException, int i) {
        int i2;
        int i3;
        this.stateVerifier.throwIfRecycled();
        synchronized (this.requestLock) {
            glideException.setOrigin(this.requestOrigin);
            int i4 = this.glideContext.logLevel;
            if (i4 <= i) {
                Log.w("Glide", "Load failed for " + this.model + " with size [" + this.width + "x" + this.height + "]", glideException);
                if (i4 <= 4) {
                    glideException.logRootCauses();
                }
            }
            Drawable drawable = null;
            this.loadStatus = null;
            this.status = Status.FAILED;
            boolean z = true;
            this.isCallingCallbacks = true;
            List<RequestListener<R>> list = this.requestListeners;
            if (list != null) {
                for (RequestListener<R> requestListener : list) {
                    isFirstReadyResource();
                    requestListener.onLoadFailed(glideException);
                }
            }
            RequestListener<R> requestListener2 = this.targetListener;
            if (requestListener2 != null) {
                isFirstReadyResource();
                requestListener2.onLoadFailed(glideException);
            }
            RequestCoordinator requestCoordinator = this.requestCoordinator;
            if (requestCoordinator != null && !requestCoordinator.canNotifyStatusChanged(this)) {
                z = false;
            }
            if (this.model == null) {
                if (this.fallbackDrawable == null) {
                    BaseRequestOptions<?> baseRequestOptions = this.requestOptions;
                    Drawable drawable2 = baseRequestOptions.fallbackDrawable;
                    this.fallbackDrawable = drawable2;
                    if (drawable2 == null && (i3 = baseRequestOptions.fallbackId) > 0) {
                        this.fallbackDrawable = loadDrawable(i3);
                    }
                }
                drawable = this.fallbackDrawable;
            }
            if (drawable == null) {
                if (this.errorDrawable == null) {
                    BaseRequestOptions<?> baseRequestOptions2 = this.requestOptions;
                    Drawable drawable3 = baseRequestOptions2.errorPlaceholder;
                    this.errorDrawable = drawable3;
                    if (drawable3 == null && (i2 = baseRequestOptions2.errorId) > 0) {
                        this.errorDrawable = loadDrawable(i2);
                    }
                }
                drawable = this.errorDrawable;
            }
            if (drawable == null) {
                drawable = getPlaceholderDrawable();
            }
            this.target.onLoadFailed(drawable);
            this.isCallingCallbacks = false;
            RequestCoordinator requestCoordinator2 = this.requestCoordinator;
            if (requestCoordinator2 != null) {
                requestCoordinator2.onRequestFailed(this);
            }
        }
    }

    @Override // com.bumptech.glide.request.target.SizeReadyCallback
    public final void onSizeReady(int i, int i2) {
        Object obj;
        Throwable th;
        int i3;
        int i4 = i;
        this.stateVerifier.throwIfRecycled();
        Object obj2 = this.requestLock;
        synchronized (obj2) {
            try {
                boolean z = IS_VERBOSE_LOGGABLE;
                if (z) {
                    logV("Got onSizeReady in " + LogTime.getElapsedMillis(this.startTime));
                }
                if (this.status == Status.WAITING_FOR_SIZE) {
                    Status status = Status.RUNNING;
                    this.status = status;
                    float f = this.requestOptions.sizeMultiplier;
                    if (i4 != Integer.MIN_VALUE) {
                        i4 = Math.round(i4 * f);
                    }
                    this.width = i4;
                    if (i2 == Integer.MIN_VALUE) {
                        i3 = i2;
                    } else {
                        i3 = Math.round(f * i2);
                    }
                    this.height = i3;
                    if (z) {
                        logV("finished setup for calling load in " + LogTime.getElapsedMillis(this.startTime));
                    }
                    Engine engine = this.engine;
                    GlideContext glideContext = this.glideContext;
                    Object obj3 = this.model;
                    BaseRequestOptions<?> baseRequestOptions = this.requestOptions;
                    try {
                        obj = obj2;
                        try {
                            this.loadStatus = engine.load(glideContext, obj3, baseRequestOptions.signature, this.width, this.height, baseRequestOptions.resourceClass, this.transcodeClass, this.priority, baseRequestOptions.diskCacheStrategy, baseRequestOptions.transformations, baseRequestOptions.isTransformationRequired, baseRequestOptions.isScaleOnlyOrNoTransform, baseRequestOptions.options, baseRequestOptions.isCacheable, baseRequestOptions.useUnlimitedSourceGeneratorsPool, baseRequestOptions.useAnimationPool, baseRequestOptions.onlyRetrieveFromCache, this, this.callbackExecutor);
                            if (this.status != status) {
                                this.loadStatus = null;
                            }
                            if (z) {
                                logV("finished onSizeReady in " + LogTime.getElapsedMillis(this.startTime));
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            while (true) {
                                try {
                                    break;
                                } catch (Throwable th3) {
                                    th = th3;
                                }
                            }
                            throw th;
                        }
                    } catch (Throwable th4) {
                        th = th4;
                        obj = obj2;
                    }
                }
            } catch (Throwable th5) {
                th = th5;
                obj = obj2;
            }
        }
    }

    @Override // com.bumptech.glide.request.Request
    public final void pause() {
        synchronized (this.requestLock) {
            if (isRunning()) {
                clear();
            }
        }
    }

    /* JADX WARN: Finally extract failed */
    public final void onResourceReady(Resource resource, Object obj, DataSource dataSource) {
        boolean isFirstReadyResource = isFirstReadyResource();
        this.status = Status.COMPLETE;
        this.resource = resource;
        if (this.glideContext.logLevel <= 3) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Finished loading ");
            m.append(obj.getClass().getSimpleName());
            m.append(" from ");
            m.append(dataSource);
            m.append(" for ");
            m.append(this.model);
            m.append(" with size [");
            m.append(this.width);
            m.append("x");
            m.append(this.height);
            m.append("] in ");
            m.append(LogTime.getElapsedMillis(this.startTime));
            m.append(" ms");
            Log.d("Glide", m.toString());
        }
        this.isCallingCallbacks = true;
        try {
            List<RequestListener<R>> list = this.requestListeners;
            if (list != null) {
                for (RequestListener<R> requestListener : list) {
                    requestListener.onResourceReady(obj);
                }
            }
            RequestListener<R> requestListener2 = this.targetListener;
            if (requestListener2 != null) {
                requestListener2.onResourceReady(obj);
            }
            this.target.onResourceReady(obj, this.animationFactory.build(dataSource, isFirstReadyResource));
            this.isCallingCallbacks = false;
            RequestCoordinator requestCoordinator = this.requestCoordinator;
            if (requestCoordinator != null) {
                requestCoordinator.onRequestSuccess(this);
            }
        } catch (Throwable th) {
            this.isCallingCallbacks = false;
            throw th;
        }
    }
}
