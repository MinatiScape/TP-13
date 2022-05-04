package com.google.android.gms.common.api;

import com.google.android.gms.common.ConnectionResult;
import java.util.Collections;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public abstract class GoogleApiClient {

    /* loaded from: classes.dex */
    public interface ConnectionCallbacks {
        void onConnected();

        void onConnectionSuspended();
    }

    /* loaded from: classes.dex */
    public interface OnConnectionFailedListener {
        void onConnectionFailed(ConnectionResult connectionResult);
    }

    static {
        Collections.newSetFromMap(new WeakHashMap());
    }
}
