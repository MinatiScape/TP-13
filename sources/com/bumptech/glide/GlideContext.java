package com.bumptech.glide;

import android.content.Context;
import android.content.ContextWrapper;
import android.os.Handler;
import android.os.Looper;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import com.bumptech.glide.request.RequestListener;
import com.bumptech.glide.request.RequestOptions;
import com.bumptech.glide.request.target.ImageViewTargetFactory;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public class GlideContext extends ContextWrapper {
    public static final TransitionOptions<?, ?> DEFAULT_TRANSITION_OPTIONS = new GenericTransitionOptions();
    public final ArrayPool arrayPool;
    public final List<RequestListener<Object>> defaultRequestListeners;
    public final RequestOptions defaultRequestOptions;
    public final Map<Class<?>, TransitionOptions<?, ?>> defaultTransitionOptions;
    public final Engine engine;
    public final ImageViewTargetFactory imageViewTargetFactory;
    public final int logLevel;
    public final Handler mainHandler = new Handler(Looper.getMainLooper());
    public final Registry registry;

    public GlideContext(Context context, ArrayPool arrayPool, Registry registry, ImageViewTargetFactory imageViewTargetFactory, RequestOptions defaultRequestOptions, Map<Class<?>, TransitionOptions<?, ?>> defaultTransitionOptions, List<RequestListener<Object>> defaultRequestListeners, Engine engine, int logLevel) {
        super(context.getApplicationContext());
        this.arrayPool = arrayPool;
        this.registry = registry;
        this.imageViewTargetFactory = imageViewTargetFactory;
        this.defaultRequestOptions = defaultRequestOptions;
        this.defaultRequestListeners = defaultRequestListeners;
        this.defaultTransitionOptions = defaultTransitionOptions;
        this.engine = engine;
        this.logLevel = logLevel;
    }
}
