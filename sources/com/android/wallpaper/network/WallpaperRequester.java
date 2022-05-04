package com.android.wallpaper.network;

import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.util.Log;
import com.android.volley.CacheDispatcher;
import com.android.volley.NetworkDispatcher;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.BasicNetwork;
import com.android.volley.toolbox.DiskBasedCache;
import com.android.volley.toolbox.HurlStack;
import com.android.volley.toolbox.Volley$1;
import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestBuilder;
import com.bumptech.glide.load.model.stream.HttpGlideUrlLoader;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.RequestOptions;
import com.bumptech.glide.request.target.SimpleTarget;
import com.bumptech.glide.util.Executors;
import com.google.android.apps.common.volley.request.ProtoRequest;
/* loaded from: classes.dex */
public final class WallpaperRequester {
    public Context mAppContext;
    public RequestQueue mRequestQueue;

    public final void addToRequestQueue(ProtoRequest protoRequest) {
        RequestQueue requestQueue = this.mRequestQueue;
        requestQueue.getClass();
        protoRequest.mRequestQueue = requestQueue;
        synchronized (requestQueue.mCurrentRequests) {
            requestQueue.mCurrentRequests.add(protoRequest);
        }
        protoRequest.mSequence = Integer.valueOf(requestQueue.mSequenceGenerator.incrementAndGet());
        protoRequest.addMarker("add-to-queue");
        requestQueue.sendRequestEvent(protoRequest, 0);
        if (!protoRequest.mShouldCache) {
            requestQueue.mNetworkQueue.add(protoRequest);
        } else {
            requestQueue.mCacheQueue.add(protoRequest);
        }
    }

    public final void loadImageBitmap(Uri uri, SimpleTarget simpleTarget) {
        try {
            RequestBuilder<Bitmap> apply = Glide.with(this.mAppContext).asBitmap().loadGeneric(uri).mo32apply((BaseRequestOptions<?>) RequestOptions.noTransformation()).mo32apply((BaseRequestOptions<?>) new RequestOptions().set(HttpGlideUrlLoader.TIMEOUT, 10000));
            apply.into(simpleTarget, null, apply, Executors.MAIN_THREAD_EXECUTOR);
        } catch (Exception e) {
            Log.e("WallpaperRequester", "Unable to get Bitmap for image with url: " + uri, e);
        }
    }

    public WallpaperRequester(Context context) {
        NetworkDispatcher[] networkDispatcherArr;
        this.mAppContext = context.getApplicationContext();
        RequestQueue requestQueue = new RequestQueue(new DiskBasedCache(new Volley$1(context.getApplicationContext().getApplicationContext())), new BasicNetwork(new HurlStack()));
        CacheDispatcher cacheDispatcher = requestQueue.mCacheDispatcher;
        if (cacheDispatcher != null) {
            cacheDispatcher.mQuit = true;
            cacheDispatcher.interrupt();
        }
        for (NetworkDispatcher networkDispatcher : requestQueue.mDispatchers) {
            if (networkDispatcher != null) {
                networkDispatcher.mQuit = true;
                networkDispatcher.interrupt();
            }
        }
        CacheDispatcher cacheDispatcher2 = new CacheDispatcher(requestQueue.mCacheQueue, requestQueue.mNetworkQueue, requestQueue.mCache, requestQueue.mDelivery);
        requestQueue.mCacheDispatcher = cacheDispatcher2;
        cacheDispatcher2.start();
        for (int i = 0; i < requestQueue.mDispatchers.length; i++) {
            NetworkDispatcher networkDispatcher2 = new NetworkDispatcher(requestQueue.mNetworkQueue, requestQueue.mNetwork, requestQueue.mCache, requestQueue.mDelivery);
            requestQueue.mDispatchers[i] = networkDispatcher2;
            networkDispatcher2.start();
        }
        this.mRequestQueue = requestQueue;
    }
}
