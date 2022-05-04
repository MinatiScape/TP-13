package com.bumptech.glide.request;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.support.v4.app.FragmentTabHost$SavedState$$ExternalSyntheticOutline0;
import android.util.Log;
import androidx.core.util.Pools$Pool;
import androidx.recyclerview.R$attr$$ExternalSyntheticOutline0;
import androidx.viewpager2.widget.FakeDrag$$ExternalSyntheticOutline0;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import com.bumptech.glide.GlideContext;
import com.bumptech.glide.Priority;
import com.bumptech.glide.gifdecoder.GifHeaderParser$$ExternalSyntheticOutline0;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.engine.DataFetcherGenerator;
import com.bumptech.glide.load.engine.DecodeJob;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.EngineJob;
import com.bumptech.glide.load.engine.EngineResource;
import com.bumptech.glide.load.engine.GlideException;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.model.Model;
import com.bumptech.glide.load.resource.drawable.DrawableDecoderCompat;
import com.bumptech.glide.request.target.SizeReadyCallback;
import com.bumptech.glide.request.target.Target;
import com.bumptech.glide.request.transition.TransitionFactory;
import com.bumptech.glide.util.LogTime;
import com.bumptech.glide.util.Util;
import com.bumptech.glide.util.pool.FactoryPools;
import com.bumptech.glide.util.pool.StateVerifier;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public final class SingleRequest<R> implements Request, SizeReadyCallback, ResourceCallback, FactoryPools.Poolable {
    public TransitionFactory<? super R> animationFactory;
    public Context context;
    public Engine engine;
    public Drawable errorDrawable;
    public Drawable fallbackDrawable;
    public GlideContext glideContext;
    public int height;
    public boolean isCallingCallbacks;
    public Engine.LoadStatus loadStatus;
    public Object model;
    public int overrideHeight;
    public int overrideWidth;
    public Drawable placeholderDrawable;
    public Priority priority;
    public RequestCoordinator requestCoordinator;
    public List<RequestListener<R>> requestListeners;
    public BaseRequestOptions<?> requestOptions;
    public Resource<R> resource;
    public long startTime;
    public final StateVerifier stateVerifier;
    public int status;
    public final String tag;
    public Target<R> target;
    public RequestListener<R> targetListener;
    public Class<R> transcodeClass;
    public int width;
    public static final Pools$Pool<SingleRequest<?>> POOL = FactoryPools.simple(150, new FactoryPools.Factory<SingleRequest<?>>() { // from class: com.bumptech.glide.request.SingleRequest.1
        @Override // com.bumptech.glide.util.pool.FactoryPools.Factory
        public SingleRequest<?> create() {
            return new SingleRequest<>();
        }
    });
    public static final boolean IS_VERBOSE_LOGGABLE = Log.isLoggable("Request", 2);

    public SingleRequest() {
        this.tag = IS_VERBOSE_LOGGABLE ? String.valueOf(hashCode()) : null;
        this.stateVerifier = new StateVerifier.DefaultStateVerifier();
    }

    public final void assertNotCallingCallbacks() {
        if (this.isCallingCallbacks) {
            throw new IllegalStateException("You can't start or clear loads in RequestListener or Target callbacks. If you're trying to start a fallback request when a load fails, use RequestBuilder#error(RequestBuilder). Otherwise consider posting your into() or clear() calls to the main thread using a Handler instead.");
        }
    }

    @Override // com.bumptech.glide.request.Request
    public void begin() {
        assertNotCallingCallbacks();
        this.stateVerifier.throwIfRecycled();
        int i = LogTime.$r8$clinit;
        this.startTime = SystemClock.elapsedRealtimeNanos();
        int i2 = 3;
        if (this.model == null) {
            if (Util.isValidDimensions(this.overrideWidth, this.overrideHeight)) {
                this.width = this.overrideWidth;
                this.height = this.overrideHeight;
            }
            if (getFallbackDrawable() == null) {
                i2 = 5;
            }
            onLoadFailed(new GlideException("Received null model"), i2);
            return;
        }
        int i3 = this.status;
        if (i3 == 2) {
            throw new IllegalArgumentException("Cannot restart a running request");
        } else if (i3 == 4) {
            onResourceReady(this.resource, DataSource.MEMORY_CACHE);
        } else {
            this.status = 3;
            if (Util.isValidDimensions(this.overrideWidth, this.overrideHeight)) {
                onSizeReady(this.overrideWidth, this.overrideHeight);
            } else {
                this.target.getSize(this);
            }
            int i4 = this.status;
            if (i4 == 2 || i4 == 3) {
                RequestCoordinator requestCoordinator = this.requestCoordinator;
                if (requestCoordinator == null || requestCoordinator.canNotifyStatusChanged(this)) {
                    this.target.onLoadStarted(getPlaceholderDrawable());
                }
            }
            if (IS_VERBOSE_LOGGABLE) {
                double elapsedMillis = LogTime.getElapsedMillis(this.startTime);
                StringBuilder sb = new StringBuilder(47);
                sb.append("finished run method in ");
                sb.append(elapsedMillis);
                logV(sb.toString());
            }
        }
    }

    @Override // com.bumptech.glide.request.Request
    public void clear() {
        Util.assertMainThread();
        assertNotCallingCallbacks();
        this.stateVerifier.throwIfRecycled();
        if (this.status != 6) {
            assertNotCallingCallbacks();
            this.stateVerifier.throwIfRecycled();
            this.target.removeCallback(this);
            Engine.LoadStatus loadStatus = this.loadStatus;
            boolean z = true;
            if (loadStatus != null) {
                EngineJob<?> engineJob = loadStatus.engineJob;
                ResourceCallback resourceCallback = loadStatus.cb;
                Objects.requireNonNull(engineJob);
                Util.assertMainThread();
                engineJob.stateVerifier.throwIfRecycled();
                if (engineJob.hasResource || engineJob.hasLoadFailed) {
                    if (engineJob.ignoredCallbacks == null) {
                        engineJob.ignoredCallbacks = new ArrayList(2);
                    }
                    if (!engineJob.ignoredCallbacks.contains(resourceCallback)) {
                        engineJob.ignoredCallbacks.add(resourceCallback);
                    }
                } else {
                    engineJob.cbs.remove(resourceCallback);
                    if (engineJob.cbs.isEmpty() && !engineJob.hasLoadFailed && !engineJob.hasResource && !engineJob.isCancelled) {
                        engineJob.isCancelled = true;
                        DecodeJob<?> decodeJob = engineJob.decodeJob;
                        decodeJob.isCancelled = true;
                        DataFetcherGenerator dataFetcherGenerator = decodeJob.currentGenerator;
                        if (dataFetcherGenerator != null) {
                            dataFetcherGenerator.cancel();
                        }
                        ((Engine) engineJob.listener).onEngineJobCancelled(engineJob, engineJob.key);
                    }
                }
                this.loadStatus = null;
            }
            Resource<R> resource = this.resource;
            if (resource != null) {
                releaseResource(resource);
            }
            RequestCoordinator requestCoordinator = this.requestCoordinator;
            if (requestCoordinator != null && !requestCoordinator.canNotifyCleared(this)) {
                z = false;
            }
            if (z) {
                this.target.onLoadCleared(getPlaceholderDrawable());
            }
            this.status = 6;
        }
    }

    public final Drawable getFallbackDrawable() {
        int i;
        if (this.fallbackDrawable == null) {
            BaseRequestOptions<?> baseRequestOptions = this.requestOptions;
            Drawable drawable = baseRequestOptions.fallbackDrawable;
            this.fallbackDrawable = drawable;
            if (drawable == null && (i = baseRequestOptions.fallbackId) > 0) {
                this.fallbackDrawable = loadDrawable(i);
            }
        }
        return this.fallbackDrawable;
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

    @Override // com.bumptech.glide.util.pool.FactoryPools.Poolable
    public StateVerifier getVerifier() {
        return this.stateVerifier;
    }

    @Override // com.bumptech.glide.request.Request
    public boolean isCleared() {
        return this.status == 6;
    }

    @Override // com.bumptech.glide.request.Request
    public boolean isComplete() {
        return this.status == 4;
    }

    @Override // com.bumptech.glide.request.Request
    public boolean isEquivalentTo(Request o) {
        boolean z;
        if (!(o instanceof SingleRequest)) {
            return false;
        }
        SingleRequest singleRequest = (SingleRequest) o;
        if (this.overrideWidth != singleRequest.overrideWidth || this.overrideHeight != singleRequest.overrideHeight) {
            return false;
        }
        Object obj = this.model;
        Object obj2 = singleRequest.model;
        char[] cArr = Util.HEX_CHAR_ARRAY;
        if (obj == null) {
            z = obj2 == null;
        } else if (obj instanceof Model) {
            z = ((Model) obj).isEquivalentTo(obj2);
        } else {
            z = obj.equals(obj2);
        }
        if (!z || !this.transcodeClass.equals(singleRequest.transcodeClass) || !this.requestOptions.equals(singleRequest.requestOptions) || this.priority != singleRequest.priority) {
            return false;
        }
        List<RequestListener<R>> list = this.requestListeners;
        int size = list == null ? 0 : list.size();
        List<RequestListener<R>> list2 = singleRequest.requestListeners;
        return size == (list2 == null ? 0 : list2.size());
    }

    public final boolean isFirstReadyResource() {
        RequestCoordinator requestCoordinator = this.requestCoordinator;
        return requestCoordinator == null || !requestCoordinator.isAnyResourceSet();
    }

    @Override // com.bumptech.glide.request.Request
    public boolean isResourceSet() {
        return isComplete();
    }

    @Override // com.bumptech.glide.request.Request
    public boolean isRunning() {
        int i = this.status;
        return i == 2 || i == 3;
    }

    public final Drawable loadDrawable(int resourceId) {
        Resources.Theme theme = this.requestOptions.theme;
        if (theme == null) {
            theme = this.context.getTheme();
        }
        GlideContext glideContext = this.glideContext;
        return DrawableDecoderCompat.getDrawable(glideContext, glideContext, resourceId, theme);
    }

    public final void logV(String message) {
        String str = this.tag;
        StringBuilder sb = new StringBuilder(XMPPathFactory$$ExternalSyntheticOutline0.m(str, XMPPathFactory$$ExternalSyntheticOutline0.m(message, 7)));
        sb.append(message);
        sb.append(" this: ");
        sb.append(str);
        Log.v("Request", sb.toString());
    }

    @Override // com.bumptech.glide.request.ResourceCallback
    public void onLoadFailed(GlideException e) {
        onLoadFailed(e, 5);
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.request.ResourceCallback
    public void onResourceReady(Resource<?> resource, DataSource dataSource) {
        boolean z;
        this.stateVerifier.throwIfRecycled();
        this.loadStatus = null;
        if (resource == 0) {
            String valueOf = String.valueOf(this.transcodeClass);
            onLoadFailed(new GlideException(FakeDrag$$ExternalSyntheticOutline0.m(valueOf.length() + 82, "Expected to receive a Resource<R> with an object of ", valueOf, " inside, but instead got null.")), 5);
            return;
        }
        Object obj = resource.get();
        if (obj == null || !this.transcodeClass.isAssignableFrom(obj.getClass())) {
            releaseResource(resource);
            String valueOf2 = String.valueOf(this.transcodeClass);
            String str = "";
            String valueOf3 = String.valueOf(obj != null ? obj.getClass() : str);
            String valueOf4 = String.valueOf(obj);
            String valueOf5 = String.valueOf(resource);
            String str2 = str;
            if (obj == null) {
                str2 = " To indicate failure return a null Resource object, rather than a Resource object containing null data.";
            }
            StringBuilder m = R$attr$$ExternalSyntheticOutline0.m(str2.length() + valueOf5.length() + valueOf4.length() + valueOf3.length() + valueOf2.length() + 71, "Expected to receive an object of ", valueOf2, " but instead got ", valueOf3);
            m.append("{");
            m.append(valueOf4);
            m.append("} inside Resource{");
            m.append(valueOf5);
            onLoadFailed(new GlideException(FragmentTabHost$SavedState$$ExternalSyntheticOutline0.m(m, "}.", str2)), 5);
            return;
        }
        RequestCoordinator requestCoordinator = this.requestCoordinator;
        boolean z2 = true;
        if (!(requestCoordinator == null || requestCoordinator.canSetImage(this))) {
            releaseResource(resource);
            this.status = 4;
            return;
        }
        boolean isFirstReadyResource = isFirstReadyResource();
        this.status = 4;
        this.resource = resource;
        if (this.glideContext.logLevel <= 3) {
            String simpleName = obj.getClass().getSimpleName();
            String valueOf6 = String.valueOf(dataSource);
            String valueOf7 = String.valueOf(this.model);
            int i = this.width;
            int i2 = this.height;
            double elapsedMillis = LogTime.getElapsedMillis(this.startTime);
            StringBuilder m2 = R$attr$$ExternalSyntheticOutline0.m(valueOf7.length() + valueOf6.length() + simpleName.length() + 95, "Finished loading ", simpleName, " from ", valueOf6);
            m2.append(" for ");
            m2.append(valueOf7);
            m2.append(" with size [");
            m2.append(i);
            m2.append("x");
            m2.append(i2);
            m2.append("] in ");
            m2.append(elapsedMillis);
            m2.append(" ms");
            Log.d("Glide", m2.toString());
        }
        this.isCallingCallbacks = true;
        try {
            List<RequestListener<R>> list = this.requestListeners;
            if (list != null) {
                z = false;
                for (RequestListener<R> requestListener : list) {
                    z |= requestListener.onResourceReady(obj, this.model, this.target, dataSource, isFirstReadyResource);
                }
            } else {
                z = false;
            }
            RequestListener<R> requestListener2 = this.targetListener;
            if (requestListener2 == 0 || !requestListener2.onResourceReady(obj, this.model, this.target, dataSource, isFirstReadyResource)) {
                z2 = false;
            }
            if (!z2 && !z) {
                this.target.onResourceReady(obj, this.animationFactory.build(dataSource, isFirstReadyResource));
            }
            this.isCallingCallbacks = false;
            RequestCoordinator requestCoordinator2 = this.requestCoordinator;
            if (requestCoordinator2 != null) {
                requestCoordinator2.onRequestSuccess(this);
            }
        } catch (Throwable th) {
            this.isCallingCallbacks = false;
            throw th;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:92:0x026d  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0272  */
    @Override // com.bumptech.glide.request.target.SizeReadyCallback
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void onSizeReady(int r38, int r39) {
        /*
            Method dump skipped, instructions count: 658
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.request.SingleRequest.onSizeReady(int, int):void");
    }

    @Override // com.bumptech.glide.request.Request
    public void recycle() {
        assertNotCallingCallbacks();
        this.context = null;
        this.glideContext = null;
        this.model = null;
        this.transcodeClass = null;
        this.requestOptions = null;
        this.overrideWidth = -1;
        this.overrideHeight = -1;
        this.target = null;
        this.requestListeners = null;
        this.targetListener = null;
        this.requestCoordinator = null;
        this.animationFactory = null;
        this.loadStatus = null;
        this.errorDrawable = null;
        this.placeholderDrawable = null;
        this.fallbackDrawable = null;
        this.width = -1;
        this.height = -1;
        ((FactoryPools.FactoryPool) POOL).release(this);
    }

    public final void releaseResource(Resource<?> resource) {
        Objects.requireNonNull(this.engine);
        Util.assertMainThread();
        if (resource instanceof EngineResource) {
            ((EngineResource) resource).release();
            this.resource = null;
            return;
        }
        throw new IllegalArgumentException("Cannot release anything but an EngineResource");
    }

    public final void setErrorPlaceholder() {
        int i;
        RequestCoordinator requestCoordinator = this.requestCoordinator;
        if (requestCoordinator == null || requestCoordinator.canNotifyStatusChanged(this)) {
            Drawable drawable = null;
            if (this.model == null) {
                drawable = getFallbackDrawable();
            }
            if (drawable == null) {
                if (this.errorDrawable == null) {
                    BaseRequestOptions<?> baseRequestOptions = this.requestOptions;
                    Drawable drawable2 = baseRequestOptions.errorPlaceholder;
                    this.errorDrawable = drawable2;
                    if (drawable2 == null && (i = baseRequestOptions.errorId) > 0) {
                        this.errorDrawable = loadDrawable(i);
                    }
                }
                drawable = this.errorDrawable;
            }
            if (drawable == null) {
                drawable = getPlaceholderDrawable();
            }
            this.target.onLoadFailed(drawable);
        }
    }

    /* JADX WARN: Finally extract failed */
    public final void onLoadFailed(GlideException e, int maxLogLevel) {
        boolean z;
        this.stateVerifier.throwIfRecycled();
        int i = this.glideContext.logLevel;
        if (i <= maxLogLevel) {
            String valueOf = String.valueOf(this.model);
            int i2 = this.width;
            int i3 = this.height;
            StringBuilder sb = new StringBuilder(valueOf.length() + 52);
            sb.append("Load failed for ");
            sb.append(valueOf);
            sb.append(" with size [");
            sb.append(i2);
            sb.append("x");
            sb.append(i3);
            sb.append("]");
            Log.w("Glide", sb.toString(), e);
            if (i <= 4) {
                Objects.requireNonNull(e);
                ArrayList arrayList = new ArrayList();
                e.addRootCauses(e, arrayList);
                int size = arrayList.size();
                int i4 = 0;
                while (i4 < size) {
                    int i5 = i4 + 1;
                    StringBuilder m = GifHeaderParser$$ExternalSyntheticOutline0.m(39, "Root cause (", i5, " of ", size);
                    m.append(")");
                    Log.i("Glide", m.toString(), (Throwable) arrayList.get(i4));
                    i4 = i5;
                }
            }
        }
        this.loadStatus = null;
        this.status = 5;
        boolean z2 = true;
        this.isCallingCallbacks = true;
        try {
            List<RequestListener<R>> list = this.requestListeners;
            if (list != null) {
                z = false;
                for (RequestListener<R> requestListener : list) {
                    z |= requestListener.onLoadFailed(e, this.model, this.target, isFirstReadyResource());
                }
            } else {
                z = false;
            }
            RequestListener<R> requestListener2 = this.targetListener;
            if (requestListener2 == null || !requestListener2.onLoadFailed(e, this.model, this.target, isFirstReadyResource())) {
                z2 = false;
            }
            if (!z && !z2) {
                setErrorPlaceholder();
            }
            this.isCallingCallbacks = false;
            RequestCoordinator requestCoordinator = this.requestCoordinator;
            if (requestCoordinator != null) {
                requestCoordinator.onRequestFailed(this);
            }
        } catch (Throwable th) {
            this.isCallingCallbacks = false;
            throw th;
        }
    }
}
