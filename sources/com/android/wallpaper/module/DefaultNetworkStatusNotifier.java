package com.android.wallpaper.module;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class DefaultNetworkStatusNotifier implements NetworkStatusNotifier {
    public Context mAppContext;
    public ConnectivityManager mConnectivityManager;
    public ArrayList mListeners = new ArrayList();
    public AnonymousClass1 mReceiver;

    public final int getNetworkStatus() {
        NetworkInfo activeNetworkInfo = this.mConnectivityManager.getActiveNetworkInfo();
        if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
            return 0;
        }
        return 1;
    }

    public DefaultNetworkStatusNotifier(Context context) {
        Context applicationContext = context.getApplicationContext();
        this.mAppContext = applicationContext;
        this.mConnectivityManager = (ConnectivityManager) applicationContext.getSystemService("connectivity");
    }
}
