package com.android.wallpaper.module;

import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherApps;
import android.content.pm.PackageManager;
import android.os.UserHandle;
import com.android.wallpaper.module.PackageStatusNotifier;
import java.util.HashMap;
/* loaded from: classes.dex */
public final class DefaultPackageStatusNotifier implements PackageStatusNotifier {
    public final Context mAppContext;
    public final LauncherApps mLauncherApps;
    public final HashMap mListeners = new HashMap();

    /* loaded from: classes.dex */
    public static class ListenerWrapper extends LauncherApps.Callback {
        public final Context mAppContext;
        public final Intent mIntentFilter;
        public final PackageStatusNotifier.Listener mListener;

        @Override // android.content.pm.LauncherApps.Callback
        public final void onPackagesAvailable(String[] strArr, UserHandle userHandle, boolean z) {
            int i;
            for (String str : strArr) {
                if (isValidPackage(str)) {
                    PackageStatusNotifier.Listener listener = this.mListener;
                    if (z) {
                        i = 2;
                    } else {
                        i = 1;
                    }
                    listener.onPackageChanged(str, i);
                }
            }
        }

        @Override // android.content.pm.LauncherApps.Callback
        public final void onPackagesSuspended(String[] strArr, UserHandle userHandle) {
            for (String str : strArr) {
                if (isValidPackage(str)) {
                    this.mListener.onPackageChanged(str, 3);
                }
            }
        }

        @Override // android.content.pm.LauncherApps.Callback
        public final void onPackagesUnavailable(String[] strArr, UserHandle userHandle, boolean z) {
            for (String str : strArr) {
                if (!z && isValidPackage(str)) {
                    this.mListener.onPackageChanged(str, 3);
                }
            }
        }

        @Override // android.content.pm.LauncherApps.Callback
        public final void onPackagesUnsuspended(String[] strArr, UserHandle userHandle) {
            for (String str : strArr) {
                if (isValidPackage(str)) {
                    this.mListener.onPackageChanged(str, 1);
                }
            }
        }

        public final boolean isValidPackage(String str) {
            this.mIntentFilter.setPackage(str);
            PackageManager packageManager = this.mAppContext.getPackageManager();
            if (!packageManager.queryIntentServices(this.mIntentFilter, 0).isEmpty() || !packageManager.queryIntentActivities(this.mIntentFilter, 0).isEmpty()) {
                return true;
            }
            return false;
        }

        @Override // android.content.pm.LauncherApps.Callback
        public final void onPackageRemoved(String str, UserHandle userHandle) {
            this.mListener.onPackageChanged(str, 3);
        }

        public ListenerWrapper(Context context, String str, PackageStatusNotifier.Listener listener) {
            this.mAppContext = context.getApplicationContext();
            this.mIntentFilter = new Intent(str);
            this.mListener = listener;
        }

        @Override // android.content.pm.LauncherApps.Callback
        public final void onPackageAdded(String str, UserHandle userHandle) {
            if (isValidPackage(str)) {
                this.mListener.onPackageChanged(str, 1);
            }
        }

        @Override // android.content.pm.LauncherApps.Callback
        public final void onPackageChanged(String str, UserHandle userHandle) {
            if (isValidPackage(str)) {
                this.mListener.onPackageChanged(str, 2);
            }
        }
    }

    public final void addListener(PackageStatusNotifier.Listener listener, String str) {
        ListenerWrapper listenerWrapper = new ListenerWrapper(this.mAppContext, str, listener);
        removeListenerAndMaybeUnregisterCallback(listener);
        this.mListeners.put(listener, listenerWrapper);
        this.mLauncherApps.registerCallback(listenerWrapper);
    }

    public final void removeListenerAndMaybeUnregisterCallback(PackageStatusNotifier.Listener listener) {
        ListenerWrapper listenerWrapper = (ListenerWrapper) this.mListeners.remove(listener);
        if (listenerWrapper != null) {
            this.mLauncherApps.unregisterCallback(listenerWrapper);
        }
    }

    public DefaultPackageStatusNotifier(Context context) {
        this.mAppContext = context.getApplicationContext();
        this.mLauncherApps = (LauncherApps) context.getSystemService("launcherapps");
    }
}
