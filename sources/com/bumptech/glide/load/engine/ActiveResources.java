package com.bumptech.glide.load.engine;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.EngineResource;
import com.bumptech.glide.util.Util;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public final class ActiveResources {
    public volatile DequeuedResourceCallback cb;
    public Thread cleanReferenceQueueThread;
    public final boolean isActiveResourceRetentionAllowed;
    public volatile boolean isShutdown;
    public EngineResource.ResourceListener listener;
    public ReferenceQueue<EngineResource<?>> resourceReferenceQueue;
    public final Handler mainHandler = new Handler(Looper.getMainLooper(), new Handler.Callback() { // from class: com.bumptech.glide.load.engine.ActiveResources.1
        @Override // android.os.Handler.Callback
        public boolean handleMessage(Message msg) {
            if (msg.what != 1) {
                return false;
            }
            ActiveResources.this.cleanupActiveReference((ResourceWeakReference) msg.obj);
            return true;
        }
    });
    public final Map<Key, ResourceWeakReference> activeEngineResources = new HashMap();

    /* loaded from: classes.dex */
    public interface DequeuedResourceCallback {
        void onResourceDequeued();
    }

    /* loaded from: classes.dex */
    public static final class ResourceWeakReference extends WeakReference<EngineResource<?>> {
        public final boolean isCacheable;
        public final Key key;
        public Resource<?> resource;

        public ResourceWeakReference(Key key, EngineResource<?> referent, ReferenceQueue<? super EngineResource<?>> queue, boolean isActiveResourceRetentionAllowed) {
            super(referent, queue);
            Resource<?> resource;
            Objects.requireNonNull(key, "Argument must not be null");
            this.key = key;
            if (!referent.isCacheable || !isActiveResourceRetentionAllowed) {
                resource = null;
            } else {
                resource = referent.resource;
                Objects.requireNonNull(resource, "Argument must not be null");
            }
            this.resource = resource;
            this.isCacheable = referent.isCacheable;
        }
    }

    public ActiveResources(boolean isActiveResourceRetentionAllowed) {
        this.isActiveResourceRetentionAllowed = isActiveResourceRetentionAllowed;
    }

    public void activate(Key key, EngineResource<?> resource) {
        if (this.resourceReferenceQueue == null) {
            this.resourceReferenceQueue = new ReferenceQueue<>();
            Thread thread = new Thread(new Runnable() { // from class: com.bumptech.glide.load.engine.ActiveResources.2
                @Override // java.lang.Runnable
                public void run() {
                    Process.setThreadPriority(10);
                    ActiveResources activeResources = ActiveResources.this;
                    while (!activeResources.isShutdown) {
                        try {
                            activeResources.mainHandler.obtainMessage(1, (ResourceWeakReference) activeResources.resourceReferenceQueue.remove()).sendToTarget();
                            DequeuedResourceCallback dequeuedResourceCallback = activeResources.cb;
                            if (dequeuedResourceCallback != null) {
                                dequeuedResourceCallback.onResourceDequeued();
                            }
                        } catch (InterruptedException unused) {
                            Thread.currentThread().interrupt();
                        }
                    }
                }
            }, "glide-active-resources");
            this.cleanReferenceQueueThread = thread;
            thread.start();
        }
        ResourceWeakReference put = this.activeEngineResources.put(key, new ResourceWeakReference(key, resource, this.resourceReferenceQueue, this.isActiveResourceRetentionAllowed));
        if (put != null) {
            put.resource = null;
            put.clear();
        }
    }

    public void cleanupActiveReference(ResourceWeakReference ref) {
        Resource<?> resource;
        Util.assertMainThread();
        this.activeEngineResources.remove(ref.key);
        if (ref.isCacheable && (resource = ref.resource) != null) {
            EngineResource<?> engineResource = new EngineResource<>(resource, true, false);
            Key key = ref.key;
            EngineResource.ResourceListener resourceListener = this.listener;
            engineResource.key = key;
            engineResource.listener = resourceListener;
            ((Engine) resourceListener).onResourceReleased(key, engineResource);
        }
    }

    public void setDequeuedResourceCallback(DequeuedResourceCallback cb) {
        this.cb = cb;
    }

    public void shutdown() {
        this.isShutdown = true;
        Thread thread = this.cleanReferenceQueueThread;
        if (thread != null) {
            thread.interrupt();
            try {
                this.cleanReferenceQueueThread.join(TimeUnit.SECONDS.toMillis(5L));
                if (this.cleanReferenceQueueThread.isAlive()) {
                    throw new RuntimeException("Failed to join in time");
                }
            } catch (InterruptedException unused) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
