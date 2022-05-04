package com.bumptech.glide;

import android.annotation.SuppressLint;
import android.content.Context;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.widget.ImageView;
import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.manager.RequestTracker;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.ErrorRequestCoordinator;
import com.bumptech.glide.request.Request;
import com.bumptech.glide.request.RequestCoordinator;
import com.bumptech.glide.request.RequestFutureTarget;
import com.bumptech.glide.request.RequestListener;
import com.bumptech.glide.request.RequestOptions;
import com.bumptech.glide.request.SingleRequest;
import com.bumptech.glide.request.ThumbnailRequestCoordinator;
import com.bumptech.glide.request.target.Target;
import com.bumptech.glide.util.Executors;
import com.bumptech.glide.util.Util;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public final class RequestBuilder<TranscodeType> extends BaseRequestOptions<RequestBuilder<TranscodeType>> {
    public final Context context;
    public RequestBuilder<TranscodeType> errorBuilder;
    public final GlideContext glideContext;
    public boolean isDefaultTransitionOptionsSet = true;
    public boolean isModelSet;
    public boolean isThumbnailBuilt;
    public Object model;
    public ArrayList requestListeners;
    public final RequestManager requestManager;
    public RequestBuilder<TranscodeType> thumbnailBuilder;
    public final Class<TranscodeType> transcodeClass;
    public TransitionOptions<?, ? super TranscodeType> transitionOptions;

    @Override // com.bumptech.glide.request.BaseRequestOptions
    /* renamed from: apply */
    public final RequestBuilder<TranscodeType> mo32apply(BaseRequestOptions<?> baseRequestOptions) {
        ContainerHelpers.checkNotNull(baseRequestOptions);
        return (RequestBuilder) super.mo32apply(baseRequestOptions);
    }

    public final void into(Target target, RequestFutureTarget requestFutureTarget, BaseRequestOptions baseRequestOptions, Executor executor) {
        ContainerHelpers.checkNotNull(target);
        if (this.isModelSet) {
            Request buildRequestRecursive = buildRequestRecursive(new Object(), target, requestFutureTarget, null, this.transitionOptions, baseRequestOptions.priority, baseRequestOptions.overrideWidth, baseRequestOptions.overrideHeight, baseRequestOptions, executor);
            Request request = target.getRequest();
            if (buildRequestRecursive.isEquivalentTo(request)) {
                if (!(!baseRequestOptions.isCacheable && request.isComplete())) {
                    ContainerHelpers.checkNotNull(request);
                    if (!request.isRunning()) {
                        request.begin();
                        return;
                    }
                    return;
                }
            }
            this.requestManager.clear(target);
            target.setRequest(buildRequestRecursive);
            RequestManager requestManager = this.requestManager;
            synchronized (requestManager) {
                requestManager.targetTracker.targets.add(target);
                RequestTracker requestTracker = requestManager.requestTracker;
                requestTracker.requests.add(buildRequestRecursive);
                if (!requestTracker.isPaused) {
                    buildRequestRecursive.begin();
                } else {
                    buildRequestRecursive.clear();
                    if (Log.isLoggable("RequestTracker", 2)) {
                        Log.v("RequestTracker", "Paused, delaying request");
                    }
                    requestTracker.pendingRequests.add(buildRequestRecursive);
                }
            }
            return;
        }
        throw new IllegalArgumentException("You must call #load() before calling #into()");
    }

    /* renamed from: com.bumptech.glide.RequestBuilder$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public static /* synthetic */ class AnonymousClass1 {
        public static final /* synthetic */ int[] $SwitchMap$android$widget$ImageView$ScaleType;
        public static final /* synthetic */ int[] $SwitchMap$com$bumptech$glide$Priority;

        static {
            int[] iArr = new int[Priority.values().length];
            $SwitchMap$com$bumptech$glide$Priority = iArr;
            try {
                iArr[3] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$bumptech$glide$Priority[2] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$bumptech$glide$Priority[1] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$bumptech$glide$Priority[0] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            int[] iArr2 = new int[ImageView.ScaleType.values().length];
            $SwitchMap$android$widget$ImageView$ScaleType = iArr2;
            try {
                iArr2[ImageView.ScaleType.CENTER_CROP.ordinal()] = 1;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.CENTER_INSIDE.ordinal()] = 2;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_START.ordinal()] = 4;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_END.ordinal()] = 5;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_XY.ordinal()] = 6;
            } catch (NoSuchFieldError unused10) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.CENTER.ordinal()] = 7;
            } catch (NoSuchFieldError unused11) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.MATRIX.ordinal()] = 8;
            } catch (NoSuchFieldError unused12) {
            }
        }
    }

    static {
        ((RequestOptions) new RequestOptions().diskCacheStrategy(DiskCacheStrategy.DATA).priority()).skipMemoryCache(true);
    }

    public final RequestBuilder<TranscodeType> addListener(RequestListener<TranscodeType> requestListener) {
        if (this.isAutoCloneEnabled) {
            return clone().addListener(requestListener);
        }
        if (requestListener != null) {
            if (this.requestListeners == null) {
                this.requestListeners = new ArrayList();
            }
            this.requestListeners.add(requestListener);
        }
        selfOrThrowIfLocked();
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final Request buildRequestRecursive(Object obj, Target target, RequestFutureTarget requestFutureTarget, RequestCoordinator requestCoordinator, TransitionOptions transitionOptions, Priority priority, int i, int i2, BaseRequestOptions baseRequestOptions, Executor executor) {
        ErrorRequestCoordinator errorRequestCoordinator;
        ErrorRequestCoordinator errorRequestCoordinator2;
        SingleRequest singleRequest;
        int i3;
        int i4;
        TransitionOptions<?, ? super TranscodeType> transitionOptions2;
        Priority priority2;
        int i5;
        int i6;
        if (this.errorBuilder != null) {
            ErrorRequestCoordinator errorRequestCoordinator3 = new ErrorRequestCoordinator(obj, requestCoordinator);
            errorRequestCoordinator = errorRequestCoordinator3;
            errorRequestCoordinator2 = errorRequestCoordinator3;
        } else {
            errorRequestCoordinator = null;
            errorRequestCoordinator2 = requestCoordinator;
        }
        RequestBuilder<TranscodeType> requestBuilder = this.thumbnailBuilder;
        if (requestBuilder == null) {
            singleRequest = obtainRequest(obj, target, requestFutureTarget, baseRequestOptions, errorRequestCoordinator2, transitionOptions, priority, i, i2, executor);
        } else if (!this.isThumbnailBuilt) {
            TransitionOptions<?, ? super TranscodeType> transitionOptions3 = requestBuilder.transitionOptions;
            if (requestBuilder.isDefaultTransitionOptionsSet) {
                transitionOptions2 = transitionOptions;
            } else {
                transitionOptions2 = transitionOptions3;
            }
            if (BaseRequestOptions.isSet(requestBuilder.fields, 8)) {
                priority2 = this.thumbnailBuilder.priority;
            } else {
                int ordinal = priority.ordinal();
                if (ordinal == 0 || ordinal == 1) {
                    priority2 = Priority.IMMEDIATE;
                } else if (ordinal == 2) {
                    priority2 = Priority.HIGH;
                } else if (ordinal == 3) {
                    priority2 = Priority.NORMAL;
                } else {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("unknown priority: ");
                    m.append(this.priority);
                    throw new IllegalArgumentException(m.toString());
                }
            }
            Priority priority3 = priority2;
            RequestBuilder<TranscodeType> requestBuilder2 = this.thumbnailBuilder;
            int i7 = requestBuilder2.overrideWidth;
            int i8 = requestBuilder2.overrideHeight;
            if (Util.isValidDimensions(i, i2)) {
                RequestBuilder<TranscodeType> requestBuilder3 = this.thumbnailBuilder;
                if (!Util.isValidDimensions(requestBuilder3.overrideWidth, requestBuilder3.overrideHeight)) {
                    i6 = baseRequestOptions.overrideWidth;
                    i5 = baseRequestOptions.overrideHeight;
                    ThumbnailRequestCoordinator thumbnailRequestCoordinator = new ThumbnailRequestCoordinator(obj, errorRequestCoordinator2);
                    SingleRequest obtainRequest = obtainRequest(obj, target, requestFutureTarget, baseRequestOptions, thumbnailRequestCoordinator, transitionOptions, priority, i, i2, executor);
                    this.isThumbnailBuilt = true;
                    RequestBuilder<TranscodeType> requestBuilder4 = this.thumbnailBuilder;
                    Request buildRequestRecursive = requestBuilder4.buildRequestRecursive(obj, target, requestFutureTarget, thumbnailRequestCoordinator, transitionOptions2, priority3, i6, i5, requestBuilder4, executor);
                    this.isThumbnailBuilt = false;
                    thumbnailRequestCoordinator.full = obtainRequest;
                    thumbnailRequestCoordinator.thumb = buildRequestRecursive;
                    singleRequest = thumbnailRequestCoordinator;
                }
            }
            i5 = i8;
            i6 = i7;
            ThumbnailRequestCoordinator thumbnailRequestCoordinator2 = new ThumbnailRequestCoordinator(obj, errorRequestCoordinator2);
            SingleRequest obtainRequest2 = obtainRequest(obj, target, requestFutureTarget, baseRequestOptions, thumbnailRequestCoordinator2, transitionOptions, priority, i, i2, executor);
            this.isThumbnailBuilt = true;
            RequestBuilder<TranscodeType> requestBuilder42 = this.thumbnailBuilder;
            Request buildRequestRecursive2 = requestBuilder42.buildRequestRecursive(obj, target, requestFutureTarget, thumbnailRequestCoordinator2, transitionOptions2, priority3, i6, i5, requestBuilder42, executor);
            this.isThumbnailBuilt = false;
            thumbnailRequestCoordinator2.full = obtainRequest2;
            thumbnailRequestCoordinator2.thumb = buildRequestRecursive2;
            singleRequest = thumbnailRequestCoordinator2;
        } else {
            throw new IllegalStateException("You cannot use a request as both the main request and a thumbnail, consider using clone() on the request(s) passed to thumbnail()");
        }
        if (errorRequestCoordinator == null) {
            return singleRequest;
        }
        RequestBuilder<TranscodeType> requestBuilder5 = this.errorBuilder;
        int i9 = requestBuilder5.overrideWidth;
        int i10 = requestBuilder5.overrideHeight;
        if (Util.isValidDimensions(i, i2)) {
            RequestBuilder<TranscodeType> requestBuilder6 = this.errorBuilder;
            if (!Util.isValidDimensions(requestBuilder6.overrideWidth, requestBuilder6.overrideHeight)) {
                i4 = baseRequestOptions.overrideWidth;
                i3 = baseRequestOptions.overrideHeight;
                RequestBuilder<TranscodeType> requestBuilder7 = this.errorBuilder;
                Request buildRequestRecursive3 = requestBuilder7.buildRequestRecursive(obj, target, requestFutureTarget, errorRequestCoordinator, requestBuilder7.transitionOptions, requestBuilder7.priority, i4, i3, requestBuilder7, executor);
                errorRequestCoordinator.primary = singleRequest;
                errorRequestCoordinator.error = buildRequestRecursive3;
                return errorRequestCoordinator;
            }
        }
        i3 = i10;
        i4 = i9;
        RequestBuilder<TranscodeType> requestBuilder72 = this.errorBuilder;
        Request buildRequestRecursive32 = requestBuilder72.buildRequestRecursive(obj, target, requestFutureTarget, errorRequestCoordinator, requestBuilder72.transitionOptions, requestBuilder72.priority, i4, i3, requestBuilder72, executor);
        errorRequestCoordinator.primary = singleRequest;
        errorRequestCoordinator.error = buildRequestRecursive32;
        return errorRequestCoordinator;
    }

    public final RequestBuilder<TranscodeType> loadGeneric(Object obj) {
        if (this.isAutoCloneEnabled) {
            return clone().loadGeneric(obj);
        }
        this.model = obj;
        this.isModelSet = true;
        selfOrThrowIfLocked();
        return this;
    }

    public final SingleRequest obtainRequest(Object obj, Target target, RequestFutureTarget requestFutureTarget, BaseRequestOptions baseRequestOptions, RequestCoordinator requestCoordinator, TransitionOptions transitionOptions, Priority priority, int i, int i2, Executor executor) {
        Context context = this.context;
        GlideContext glideContext = this.glideContext;
        return new SingleRequest(context, glideContext, obj, this.model, this.transcodeClass, baseRequestOptions, i, i2, priority, target, requestFutureTarget, this.requestListeners, requestCoordinator, glideContext.engine, transitionOptions.transitionFactory, executor);
    }

    public final RequestFutureTarget submit() {
        RequestFutureTarget requestFutureTarget = new RequestFutureTarget();
        into(requestFutureTarget, requestFutureTarget, this, Executors.DIRECT_EXECUTOR);
        return requestFutureTarget;
    }

    public final RequestBuilder<TranscodeType> thumbnail(RequestBuilder<TranscodeType> requestBuilder) {
        if (this.isAutoCloneEnabled) {
            return clone().thumbnail(requestBuilder);
        }
        this.thumbnailBuilder = requestBuilder;
        selfOrThrowIfLocked();
        return this;
    }

    public final RequestBuilder<TranscodeType> transition(TransitionOptions<?, ? super TranscodeType> transitionOptions) {
        if (this.isAutoCloneEnabled) {
            return clone().transition(transitionOptions);
        }
        this.transitionOptions = transitionOptions;
        this.isDefaultTransitionOptionsSet = false;
        selfOrThrowIfLocked();
        return this;
    }

    @SuppressLint({"CheckResult"})
    public RequestBuilder(Glide glide, RequestManager requestManager, Class<TranscodeType> cls, Context context) {
        RequestOptions requestOptions;
        this.requestManager = requestManager;
        this.transcodeClass = cls;
        this.context = context;
        GlideContext glideContext = requestManager.glide.glideContext;
        TransitionOptions<?, ?> transitionOptions = glideContext.defaultTransitionOptions.get(cls);
        if (transitionOptions == null) {
            for (Map.Entry<Class<?>, TransitionOptions<?, ?>> entry : glideContext.defaultTransitionOptions.entrySet()) {
                if (entry.getKey().isAssignableFrom(cls)) {
                    transitionOptions = (TransitionOptions<?, ? super TranscodeType>) entry.getValue();
                }
            }
        }
        this.transitionOptions = (TransitionOptions<?, ? super TranscodeType>) (transitionOptions == null ? (TransitionOptions<?, ? super TranscodeType>) GlideContext.DEFAULT_TRANSITION_OPTIONS : transitionOptions);
        this.glideContext = glide.glideContext;
        Iterator<RequestListener<Object>> it = requestManager.defaultRequestListeners.iterator();
        while (it.hasNext()) {
            addListener(it.next());
        }
        synchronized (requestManager) {
            requestOptions = requestManager.requestOptions;
        }
        mo32apply((BaseRequestOptions<?>) requestOptions);
    }

    @Override // com.bumptech.glide.request.BaseRequestOptions
    /* renamed from: apply  reason: collision with other method in class */
    public final BaseRequestOptions mo32apply(BaseRequestOptions baseRequestOptions) {
        ContainerHelpers.checkNotNull(baseRequestOptions);
        return (RequestBuilder) super.mo32apply((BaseRequestOptions<?>) baseRequestOptions);
    }

    @Override // com.bumptech.glide.request.BaseRequestOptions
    public final RequestBuilder<TranscodeType> clone() {
        RequestBuilder<TranscodeType> requestBuilder = (RequestBuilder) super.clone();
        requestBuilder.transitionOptions = (TransitionOptions<?, ? super TranscodeType>) requestBuilder.transitionOptions.clone();
        if (requestBuilder.requestListeners != null) {
            requestBuilder.requestListeners = new ArrayList(requestBuilder.requestListeners);
        }
        RequestBuilder<TranscodeType> requestBuilder2 = requestBuilder.thumbnailBuilder;
        if (requestBuilder2 != null) {
            requestBuilder.thumbnailBuilder = requestBuilder2.clone();
        }
        RequestBuilder<TranscodeType> requestBuilder3 = requestBuilder.errorBuilder;
        if (requestBuilder3 != null) {
            requestBuilder.errorBuilder = requestBuilder3.clone();
        }
        return requestBuilder;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0089  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void into(android.widget.ImageView r5) {
        /*
            r4 = this;
            com.bumptech.glide.util.Util.assertMainThread()
            androidx.collection.ContainerHelpers.checkNotNull(r5)
            int r0 = r4.fields
            r1 = 2048(0x800, float:2.87E-42)
            boolean r0 = com.bumptech.glide.request.BaseRequestOptions.isSet(r0, r1)
            if (r0 != 0) goto L71
            boolean r0 = r4.isTransformationAllowed
            if (r0 == 0) goto L71
            android.widget.ImageView$ScaleType r0 = r5.getScaleType()
            if (r0 == 0) goto L71
            int[] r0 = com.bumptech.glide.RequestBuilder.AnonymousClass1.$SwitchMap$android$widget$ImageView$ScaleType
            android.widget.ImageView$ScaleType r1 = r5.getScaleType()
            int r1 = r1.ordinal()
            r0 = r0[r1]
            r1 = 1
            switch(r0) {
                case 1: goto L61;
                case 2: goto L4f;
                case 3: goto L3d;
                case 4: goto L3d;
                case 5: goto L3d;
                case 6: goto L2b;
                default: goto L2a;
            }
        L2a:
            goto L71
        L2b:
            com.bumptech.glide.RequestBuilder r0 = r4.clone()
            com.bumptech.glide.load.resource.bitmap.DownsampleStrategy$CenterInside r2 = com.bumptech.glide.load.resource.bitmap.DownsampleStrategy.CENTER_INSIDE
            com.bumptech.glide.load.resource.bitmap.CenterInside r3 = new com.bumptech.glide.load.resource.bitmap.CenterInside
            r3.<init>()
            com.bumptech.glide.request.BaseRequestOptions r0 = r0.optionalTransform(r2, r3)
            r0.isScaleOnlyOrNoTransform = r1
            goto L72
        L3d:
            com.bumptech.glide.RequestBuilder r0 = r4.clone()
            com.bumptech.glide.load.resource.bitmap.DownsampleStrategy$FitCenter r2 = com.bumptech.glide.load.resource.bitmap.DownsampleStrategy.FIT_CENTER
            com.bumptech.glide.load.resource.bitmap.FitCenter r3 = new com.bumptech.glide.load.resource.bitmap.FitCenter
            r3.<init>()
            com.bumptech.glide.request.BaseRequestOptions r0 = r0.optionalTransform(r2, r3)
            r0.isScaleOnlyOrNoTransform = r1
            goto L72
        L4f:
            com.bumptech.glide.RequestBuilder r0 = r4.clone()
            com.bumptech.glide.load.resource.bitmap.DownsampleStrategy$CenterInside r2 = com.bumptech.glide.load.resource.bitmap.DownsampleStrategy.CENTER_INSIDE
            com.bumptech.glide.load.resource.bitmap.CenterInside r3 = new com.bumptech.glide.load.resource.bitmap.CenterInside
            r3.<init>()
            com.bumptech.glide.request.BaseRequestOptions r0 = r0.optionalTransform(r2, r3)
            r0.isScaleOnlyOrNoTransform = r1
            goto L72
        L61:
            com.bumptech.glide.RequestBuilder r0 = r4.clone()
            com.bumptech.glide.load.resource.bitmap.DownsampleStrategy$CenterOutside r1 = com.bumptech.glide.load.resource.bitmap.DownsampleStrategy.CENTER_OUTSIDE
            com.bumptech.glide.load.resource.bitmap.CenterCrop r2 = new com.bumptech.glide.load.resource.bitmap.CenterCrop
            r2.<init>()
            com.bumptech.glide.request.BaseRequestOptions r0 = r0.optionalTransform(r1, r2)
            goto L72
        L71:
            r0 = r4
        L72:
            com.bumptech.glide.GlideContext r1 = r4.glideContext
            java.lang.Class<TranscodeType> r2 = r4.transcodeClass
            androidx.savedstate.R$id r1 = r1.imageViewTargetFactory
            r1.getClass()
            java.lang.Class<android.graphics.Bitmap> r1 = android.graphics.Bitmap.class
            boolean r1 = r1.equals(r2)
            if (r1 == 0) goto L89
            com.bumptech.glide.request.target.BitmapImageViewTarget r1 = new com.bumptech.glide.request.target.BitmapImageViewTarget
            r1.<init>(r5)
            goto L96
        L89:
            java.lang.Class<android.graphics.drawable.Drawable> r1 = android.graphics.drawable.Drawable.class
            boolean r1 = r1.isAssignableFrom(r2)
            if (r1 == 0) goto L9d
            com.bumptech.glide.request.target.DrawableImageViewTarget r1 = new com.bumptech.glide.request.target.DrawableImageViewTarget
            r1.<init>(r5)
        L96:
            r5 = 0
            com.bumptech.glide.util.Executors$1 r2 = com.bumptech.glide.util.Executors.MAIN_THREAD_EXECUTOR
            r4.into(r1, r5, r0, r2)
            return
        L9d:
            java.lang.IllegalArgumentException r4 = new java.lang.IllegalArgumentException
            java.lang.StringBuilder r5 = new java.lang.StringBuilder
            r5.<init>()
            java.lang.String r0 = "Unhandled class: "
            r5.append(r0)
            r5.append(r2)
            java.lang.String r0 = ", try .as*(Class).transcode(ResourceTranscoder)"
            r5.append(r0)
            java.lang.String r5 = r5.toString()
            r4.<init>(r5)
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.RequestBuilder.into(android.widget.ImageView):void");
    }
}
