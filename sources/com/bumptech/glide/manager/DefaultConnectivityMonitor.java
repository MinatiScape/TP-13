package com.bumptech.glide.manager;

import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import androidx.collection.ContainerHelpers;
import com.bumptech.glide.RequestManager;
import com.bumptech.glide.manager.ConnectivityMonitor;
/* loaded from: classes.dex */
public final class DefaultConnectivityMonitor implements ConnectivityMonitor {
    public final AnonymousClass1 connectivityReceiver = new BroadcastReceiver() { // from class: com.bumptech.glide.manager.DefaultConnectivityMonitor.1
        @Override // android.content.BroadcastReceiver
        public final void onReceive(Context context, Intent intent) {
            DefaultConnectivityMonitor defaultConnectivityMonitor = DefaultConnectivityMonitor.this;
            boolean z = defaultConnectivityMonitor.isConnected;
            defaultConnectivityMonitor.isConnected = DefaultConnectivityMonitor.isConnected(context);
            if (z != DefaultConnectivityMonitor.this.isConnected) {
                if (Log.isLoggable("ConnectivityMonitor", 3)) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("connectivity changed, isConnected: ");
                    m.append(DefaultConnectivityMonitor.this.isConnected);
                    Log.d("ConnectivityMonitor", m.toString());
                }
                DefaultConnectivityMonitor defaultConnectivityMonitor2 = DefaultConnectivityMonitor.this;
                RequestManager.RequestManagerConnectivityListener requestManagerConnectivityListener = (RequestManager.RequestManagerConnectivityListener) defaultConnectivityMonitor2.listener;
                if (defaultConnectivityMonitor2.isConnected) {
                    synchronized (RequestManager.this) {
                        requestManagerConnectivityListener.requestTracker.restartRequests();
                    }
                    return;
                }
                requestManagerConnectivityListener.getClass();
            }
        }
    };
    public final Context context;
    public boolean isConnected;
    public boolean isRegistered;
    public final ConnectivityMonitor.ConnectivityListener listener;

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final void onDestroy() {
    }

    @SuppressLint({"MissingPermission"})
    public static boolean isConnected(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        ContainerHelpers.checkNotNull(connectivityManager);
        try {
            NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
            if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
                return false;
            }
            return true;
        } catch (RuntimeException e) {
            if (Log.isLoggable("ConnectivityMonitor", 5)) {
                Log.w("ConnectivityMonitor", "Failed to determine connectivity status when connectivity changed", e);
            }
            return true;
        }
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final void onStart() {
        if (!this.isRegistered) {
            this.isConnected = isConnected(this.context);
            try {
                this.context.registerReceiver(this.connectivityReceiver, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
                this.isRegistered = true;
            } catch (SecurityException e) {
                if (Log.isLoggable("ConnectivityMonitor", 5)) {
                    Log.w("ConnectivityMonitor", "Failed to register", e);
                }
            }
        }
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final void onStop() {
        if (this.isRegistered) {
            this.context.unregisterReceiver(this.connectivityReceiver);
            this.isRegistered = false;
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.bumptech.glide.manager.DefaultConnectivityMonitor$1] */
    public DefaultConnectivityMonitor(Context context, RequestManager.RequestManagerConnectivityListener requestManagerConnectivityListener) {
        this.context = context.getApplicationContext();
        this.listener = requestManagerConnectivityListener;
    }
}
