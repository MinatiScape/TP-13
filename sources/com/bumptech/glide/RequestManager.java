package com.bumptech.glide;

import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Looper;
import android.util.Log;
import androidx.core.content.ContextCompat;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.load.resource.gif.GifDrawable;
import com.bumptech.glide.manager.ConnectivityMonitor;
import com.bumptech.glide.manager.ConnectivityMonitorFactory;
import com.bumptech.glide.manager.DefaultConnectivityMonitor;
import com.bumptech.glide.manager.DefaultConnectivityMonitorFactory;
import com.bumptech.glide.manager.Lifecycle;
import com.bumptech.glide.manager.LifecycleListener;
import com.bumptech.glide.manager.NullConnectivityMonitor;
import com.bumptech.glide.manager.RequestManagerTreeNode;
import com.bumptech.glide.manager.RequestTracker;
import com.bumptech.glide.manager.TargetTracker;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.Request;
import com.bumptech.glide.request.RequestListener;
import com.bumptech.glide.request.RequestOptions;
import com.bumptech.glide.request.target.Target;
import com.bumptech.glide.util.Util;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
/* loaded from: classes.dex */
public final class RequestManager implements ComponentCallbacks2, LifecycleListener {
    public static final RequestOptions DECODE_TYPE_BITMAP;
    public static final RequestOptions DOWNLOAD_ONLY_OPTIONS = ((RequestOptions) new RequestOptions().diskCacheStrategy(DiskCacheStrategy.DATA).priority()).skipMemoryCache(true);
    public final AnonymousClass1 addSelfToLifecycle;
    public final ConnectivityMonitor connectivityMonitor;
    public final Context context;
    public final CopyOnWriteArrayList<RequestListener<Object>> defaultRequestListeners;
    public final Glide glide;
    public final Lifecycle lifecycle;
    public RequestOptions requestOptions;
    public final RequestTracker requestTracker;
    public final TargetTracker targetTracker = new TargetTracker();
    public final RequestManagerTreeNode treeNode;

    /* loaded from: classes.dex */
    public class RequestManagerConnectivityListener implements ConnectivityMonitor.ConnectivityListener {
        public final RequestTracker requestTracker;

        public RequestManagerConnectivityListener(RequestTracker requestTracker) {
            this.requestTracker = requestTracker;
        }
    }

    @Override // android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final synchronized void onDestroy() {
        this.targetTracker.onDestroy();
        Iterator it = Util.getSnapshot(this.targetTracker.targets).iterator();
        while (it.hasNext()) {
            clear((Target) it.next());
        }
        this.targetTracker.targets.clear();
        RequestTracker requestTracker = this.requestTracker;
        Iterator it2 = Util.getSnapshot(requestTracker.requests).iterator();
        while (it2.hasNext()) {
            requestTracker.clearAndRemove((Request) it2.next());
        }
        requestTracker.pendingRequests.clear();
        this.lifecycle.removeListener(this);
        this.lifecycle.removeListener(this.connectivityMonitor);
        Util.getUiThreadHandler().removeCallbacks(this.addSelfToLifecycle);
        this.glide.unregisterRequestManager(this);
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final synchronized void onStart() {
        resumeRequests();
        this.targetTracker.onStart();
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final synchronized void onStop() {
        pauseRequests();
        this.targetTracker.onStop();
    }

    @Override // android.content.ComponentCallbacks2
    public final void onTrimMemory(int i) {
    }

    public final synchronized void pauseRequests() {
        RequestTracker requestTracker = this.requestTracker;
        requestTracker.isPaused = true;
        Iterator it = Util.getSnapshot(requestTracker.requests).iterator();
        while (it.hasNext()) {
            Request request = (Request) it.next();
            if (request.isRunning()) {
                request.pause();
                requestTracker.pendingRequests.add(request);
            }
        }
    }

    public final synchronized void resumeRequests() {
        RequestTracker requestTracker = this.requestTracker;
        requestTracker.isPaused = false;
        Iterator it = Util.getSnapshot(requestTracker.requests).iterator();
        while (it.hasNext()) {
            Request request = (Request) it.next();
            if (!request.isComplete() && !request.isRunning()) {
                request.begin();
            }
        }
        requestTracker.pendingRequests.clear();
    }

    public final synchronized String toString() {
        return super.toString() + "{tracker=" + this.requestTracker + ", treeNode=" + this.treeNode + "}";
    }

    public final synchronized boolean untrack(Target<?> target) {
        Request request = target.getRequest();
        if (request == null) {
            return true;
        }
        if (!this.requestTracker.clearAndRemove(request)) {
            return false;
        }
        this.targetTracker.targets.remove(target);
        target.setRequest(null);
        return true;
    }

    static {
        RequestOptions decode = new RequestOptions().decode(Bitmap.class);
        decode.isLocked = true;
        DECODE_TYPE_BITMAP = decode;
        new RequestOptions().decode(GifDrawable.class).isLocked = true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v1, types: [com.bumptech.glide.RequestManager$1, java.lang.Runnable] */
    public RequestManager(Glide glide, Lifecycle lifecycle, RequestManagerTreeNode requestManagerTreeNode, Context context) {
        boolean z;
        ConnectivityMonitor connectivityMonitor;
        RequestOptions requestOptions;
        String str;
        RequestTracker requestTracker = new RequestTracker();
        ConnectivityMonitorFactory connectivityMonitorFactory = glide.connectivityMonitorFactory;
        ?? r2 = new Runnable() { // from class: com.bumptech.glide.RequestManager.1
            @Override // java.lang.Runnable
            public final void run() {
                RequestManager requestManager = RequestManager.this;
                requestManager.lifecycle.addListener(requestManager);
            }
        };
        this.addSelfToLifecycle = r2;
        this.glide = glide;
        this.lifecycle = lifecycle;
        this.treeNode = requestManagerTreeNode;
        this.requestTracker = requestTracker;
        this.context = context;
        Context applicationContext = context.getApplicationContext();
        RequestManagerConnectivityListener requestManagerConnectivityListener = new RequestManagerConnectivityListener(requestTracker);
        ((DefaultConnectivityMonitorFactory) connectivityMonitorFactory).getClass();
        boolean z2 = false;
        if (ContextCompat.checkSelfPermission(applicationContext, "android.permission.ACCESS_NETWORK_STATE") == 0) {
            z = true;
        } else {
            z = false;
        }
        if (Log.isLoggable("ConnectivityMonitor", 3)) {
            if (z) {
                str = "ACCESS_NETWORK_STATE permission granted, registering connectivity monitor";
            } else {
                str = "ACCESS_NETWORK_STATE permission missing, cannot register connectivity monitor";
            }
            Log.d("ConnectivityMonitor", str);
        }
        if (z) {
            connectivityMonitor = new DefaultConnectivityMonitor(applicationContext, requestManagerConnectivityListener);
        } else {
            connectivityMonitor = new NullConnectivityMonitor();
        }
        this.connectivityMonitor = connectivityMonitor;
        char[] cArr = Util.HEX_CHAR_ARRAY;
        if (!(Looper.myLooper() == Looper.getMainLooper() ? true : z2)) {
            Util.getUiThreadHandler().post(r2);
        } else {
            lifecycle.addListener(this);
        }
        lifecycle.addListener(connectivityMonitor);
        this.defaultRequestListeners = new CopyOnWriteArrayList<>(glide.glideContext.defaultRequestListeners);
        GlideContext glideContext = glide.glideContext;
        synchronized (glideContext) {
            if (glideContext.defaultRequestOptions == null) {
                RequestOptions build = glideContext.defaultRequestOptionsFactory.build();
                build.isLocked = true;
                glideContext.defaultRequestOptions = build;
            }
            requestOptions = glideContext.defaultRequestOptions;
        }
        synchronized (this) {
            RequestOptions clone = requestOptions.clone();
            clone.autoClone();
            this.requestOptions = clone;
        }
        synchronized (glide.managers) {
            if (!glide.managers.contains(this)) {
                glide.managers.add(this);
            } else {
                throw new IllegalStateException("Cannot register already registered manager");
            }
        }
    }

    public final RequestBuilder<Bitmap> asBitmap() {
        return new RequestBuilder(this.glide, this, Bitmap.class, this.context).mo32apply((BaseRequestOptions<?>) DECODE_TYPE_BITMAP);
    }

    public final RequestBuilder<Drawable> asDrawable() {
        return new RequestBuilder<>(this.glide, this, Drawable.class, this.context);
    }

    public final void clear(Target<?> target) {
        boolean z;
        if (target != null) {
            boolean untrack = untrack(target);
            Request request = target.getRequest();
            if (!untrack) {
                Glide glide = this.glide;
                synchronized (glide.managers) {
                    Iterator it = glide.managers.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            if (((RequestManager) it.next()).untrack(target)) {
                                z = true;
                                break;
                            }
                        } else {
                            z = false;
                            break;
                        }
                    }
                }
                if (!z && request != null) {
                    target.setRequest(null);
                    request.clear();
                }
            }
        }
    }
}
