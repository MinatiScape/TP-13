package com.bumptech.glide.load.engine;

import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.EngineResource;
import com.bumptech.glide.util.Executors;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
/* loaded from: classes.dex */
public final class ActiveResources {
    public volatile DequeuedResourceCallback cb;
    public final boolean isActiveResourceRetentionAllowed;
    public volatile boolean isShutdown;
    public EngineResource.ResourceListener listener;
    public final Executor monitorClearedResourcesExecutor;
    public final Map<Key, ResourceWeakReference> activeEngineResources = new HashMap();
    public final ReferenceQueue<EngineResource<?>> resourceReferenceQueue = new ReferenceQueue<>();

    /* loaded from: classes.dex */
    public interface DequeuedResourceCallback {
        void onResourceDequeued();
    }

    public final void cleanupActiveReference(ResourceWeakReference resourceWeakReference) {
        Resource<?> resource;
        synchronized (this) {
            this.activeEngineResources.remove(resourceWeakReference.key);
            if (resourceWeakReference.isCacheable && (resource = resourceWeakReference.resource) != null) {
                this.listener.onResourceReleased(resourceWeakReference.key, new EngineResource<>(resource, true, false, resourceWeakReference.key, this.listener));
            }
        }
    }

    public void shutdown() {
        this.isShutdown = true;
        Executor executor = this.monitorClearedResourcesExecutor;
        if (executor instanceof ExecutorService) {
            Executors.shutdownAndAwaitTermination((ExecutorService) executor);
        }
    }

    /* loaded from: classes.dex */
    public static final class ResourceWeakReference extends WeakReference<EngineResource<?>> {
        public final boolean isCacheable;
        public final Key key;
        public Resource<?> resource;

        public ResourceWeakReference(Key key, EngineResource<?> engineResource, ReferenceQueue<? super EngineResource<?>> referenceQueue, boolean z) {
            super(engineResource, referenceQueue);
            Resource<?> resource;
            ContainerHelpers.checkNotNull(key);
            this.key = key;
            if (!engineResource.isMemoryCacheable || !z) {
                resource = null;
            } else {
                resource = engineResource.resource;
                ContainerHelpers.checkNotNull(resource);
            }
            this.resource = resource;
            this.isCacheable = engineResource.isMemoryCacheable;
        }
    }

    public ActiveResources(boolean z, Executor executor) {
        this.isActiveResourceRetentionAllowed = z;
        this.monitorClearedResourcesExecutor = executor;
        executor.execute(new Runnable() { // from class: com.bumptech.glide.load.engine.ActiveResources.2
            @Override // java.lang.Runnable
            public final void run() {
                ActiveResources activeResources = ActiveResources.this;
                while (!activeResources.isShutdown) {
                    try {
                        activeResources.cleanupActiveReference((ResourceWeakReference) activeResources.resourceReferenceQueue.remove());
                        DequeuedResourceCallback dequeuedResourceCallback = activeResources.cb;
                        if (dequeuedResourceCallback != null) {
                            dequeuedResourceCallback.onResourceDequeued();
                        }
                    } catch (InterruptedException unused) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        });
    }

    public void setDequeuedResourceCallback(DequeuedResourceCallback dequeuedResourceCallback) {
        this.cb = dequeuedResourceCallback;
    }
}
