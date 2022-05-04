package com.bumptech.glide;

import android.content.Context;
import android.content.ContextWrapper;
import androidx.collection.ArrayMap;
import androidx.savedstate.R$id;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import com.bumptech.glide.request.RequestListener;
import com.bumptech.glide.request.RequestOptions;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public final class GlideContext extends ContextWrapper {
    public static final TransitionOptions<?, ?> DEFAULT_TRANSITION_OPTIONS = new GenericTransitionOptions();
    public final ArrayPool arrayPool;
    public final List<RequestListener<Object>> defaultRequestListeners;
    public RequestOptions defaultRequestOptions;
    public final Glide.RequestOptionsFactory defaultRequestOptionsFactory;
    public final Map<Class<?>, TransitionOptions<?, ?>> defaultTransitionOptions;
    public final Engine engine;
    public final GlideExperiments experiments;
    public final R$id imageViewTargetFactory;
    public final int logLevel;
    public final Registry registry;

    public GlideContext(Context context, ArrayPool arrayPool, Registry registry, R$id r$id, Glide.RequestOptionsFactory requestOptionsFactory, ArrayMap arrayMap, List list, Engine engine, GlideExperiments glideExperiments, int i) {
        super(context.getApplicationContext());
        this.arrayPool = arrayPool;
        this.registry = registry;
        this.imageViewTargetFactory = r$id;
        this.defaultRequestOptionsFactory = requestOptionsFactory;
        this.defaultRequestListeners = list;
        this.defaultTransitionOptions = arrayMap;
        this.engine = engine;
        this.experiments = glideExperiments;
        this.logLevel = i;
    }
}
