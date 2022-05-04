package com.android.systemui.shared.plugins;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.content.res.Resources;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.ArraySet;
import android.util.Log;
import android.view.LayoutInflater;
import com.android.internal.annotations.VisibleForTesting;
import com.android.systemui.plugins.Plugin;
import com.android.systemui.plugins.PluginListener;
import com.android.systemui.shared.plugins.PluginEnabler;
import com.android.systemui.shared.plugins.PluginInstance;
import com.android.systemui.shared.plugins.VersionInfo;
import com.android.wallpaper.asset.Asset$$ExternalSyntheticLambda1;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public class PluginActionManager<T extends Plugin> {
    private static final boolean DEBUG = false;
    public static final String PLUGIN_PERMISSION = "com.android.systemui.permission.PLUGIN";
    private static final String TAG = "PluginInstanceManager";
    private final String mAction;
    private final boolean mAllowMultiple;
    private final Executor mBgExecutor;
    private final Context mContext;
    private final boolean mIsDebuggable;
    private final PluginListener<T> mListener;
    private final Executor mMainExecutor;
    private final NotificationManager mNotificationManager;
    private final Class<T> mPluginClass;
    private final PluginEnabler mPluginEnabler;
    private final PluginInstance.Factory mPluginInstanceFactory;
    @VisibleForTesting
    private final ArrayList<PluginInstance<T>> mPluginInstances;
    private final PackageManager mPm;
    private final ArraySet<String> mPrivilegedPlugins;

    /* loaded from: classes.dex */
    public static class Factory {
        private final Executor mBgExecutor;
        private final Context mContext;
        private final Executor mMainExecutor;
        private final NotificationManager mNotificationManager;
        private final PackageManager mPackageManager;
        private final PluginEnabler mPluginEnabler;
        private final PluginInstance.Factory mPluginInstanceFactory;
        private final List<String> mPrivilegedPlugins;

        public <T extends Plugin> PluginActionManager<T> create(String str, PluginListener<T> pluginListener, Class<T> cls, boolean z, boolean z2) {
            return new PluginActionManager<>(this.mContext, this.mPackageManager, str, pluginListener, cls, z, this.mMainExecutor, this.mBgExecutor, z2, this.mNotificationManager, this.mPluginEnabler, this.mPrivilegedPlugins, this.mPluginInstanceFactory);
        }

        public Factory(Context context, PackageManager packageManager, Executor executor, Executor executor2, NotificationManager notificationManager, PluginEnabler pluginEnabler, List<String> list, PluginInstance.Factory factory) {
            this.mContext = context;
            this.mPackageManager = packageManager;
            this.mMainExecutor = executor;
            this.mBgExecutor = executor2;
            this.mNotificationManager = notificationManager;
            this.mPluginEnabler = pluginEnabler;
            this.mPrivilegedPlugins = list;
            this.mPluginInstanceFactory = factory;
        }
    }

    /* loaded from: classes.dex */
    public static class PluginContextWrapper extends ContextWrapper {
        private final ClassLoader mClassLoader;
        private LayoutInflater mInflater;

        @Override // android.content.ContextWrapper, android.content.Context
        public Object getSystemService(String str) {
            if (!"layout_inflater".equals(str)) {
                return getBaseContext().getSystemService(str);
            }
            if (this.mInflater == null) {
                this.mInflater = LayoutInflater.from(getBaseContext()).cloneInContext(this);
            }
            return this.mInflater;
        }

        public PluginContextWrapper(Context context, ClassLoader classLoader) {
            super(context);
            this.mClassLoader = classLoader;
        }

        @Override // android.content.ContextWrapper, android.content.Context
        public ClassLoader getClassLoader() {
            return this.mClassLoader;
        }
    }

    /* renamed from: $r8$lambda$tRQyi7k9O-R4crA50YERIw8utIE */
    public static /* synthetic */ void m19$r8$lambda$tRQyi7k9OR4crA50YERIw8utIE(PluginActionManager pluginActionManager, String str) {
        pluginActionManager.lambda$onPackageRemoved$1(str);
    }

    public String toString() {
        return String.format("%s@%s (action=%s)", getClass().getSimpleName(), Integer.valueOf(hashCode()), this.mAction);
    }

    private PluginActionManager(Context context, PackageManager packageManager, String str, PluginListener<T> pluginListener, Class<T> cls, boolean z, Executor executor, Executor executor2, boolean z2, NotificationManager notificationManager, PluginEnabler pluginEnabler, List<String> list, PluginInstance.Factory factory) {
        ArraySet<String> arraySet = new ArraySet<>();
        this.mPrivilegedPlugins = arraySet;
        this.mPluginInstances = new ArrayList<>();
        this.mPluginClass = cls;
        this.mMainExecutor = executor;
        this.mBgExecutor = executor2;
        this.mContext = context;
        this.mPm = packageManager;
        this.mAction = str;
        this.mListener = pluginListener;
        this.mAllowMultiple = z;
        this.mNotificationManager = notificationManager;
        this.mPluginEnabler = pluginEnabler;
        this.mPluginInstanceFactory = factory;
        arraySet.addAll(list);
        this.mIsDebuggable = z2;
    }

    private void handleQueryPlugins(String str) {
        Intent intent = new Intent(this.mAction);
        if (str != null) {
            intent.setPackage(str);
        }
        List<ResolveInfo> queryIntentServices = this.mPm.queryIntentServices(intent, 0);
        if (queryIntentServices.size() <= 1 || this.mAllowMultiple) {
            for (ResolveInfo resolveInfo : queryIntentServices) {
                ServiceInfo serviceInfo = resolveInfo.serviceInfo;
                PluginInstance<T> loadPluginComponent = loadPluginComponent(new ComponentName(serviceInfo.packageName, serviceInfo.name));
                if (loadPluginComponent != null) {
                    this.mPluginInstances.add(loadPluginComponent);
                    this.mMainExecutor.execute(new PluginActionManager$$ExternalSyntheticLambda1(this, loadPluginComponent, 0));
                }
            }
            return;
        }
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Multiple plugins found for ");
        m.append(this.mAction);
        Log.w(TAG, m.toString());
    }

    private PluginInstance<T> loadPluginComponent(ComponentName componentName) {
        if (!this.mIsDebuggable && !isPluginPrivileged(componentName)) {
            Log.w(TAG, "Plugin cannot be loaded on production build: " + componentName);
            return null;
        } else if (!this.mPluginEnabler.isEnabled(componentName)) {
            return null;
        } else {
            String packageName = componentName.getPackageName();
            try {
                if (this.mPm.checkPermission(PLUGIN_PERMISSION, packageName) != 0) {
                    Log.d(TAG, "Plugin doesn't have permission: " + packageName);
                    return null;
                }
                try {
                    return this.mPluginInstanceFactory.create(this.mContext, this.mPm.getApplicationInfo(packageName, 0), componentName, this.mPluginClass);
                } catch (VersionInfo.InvalidVersionException e) {
                    this.reportInvalidVersion(componentName, componentName.getClassName(), e);
                    return null;
                }
            } catch (Throwable th) {
                Log.w(TAG, "Couldn't load plugin: " + packageName, th);
                return null;
            }
        }
    }

    /* renamed from: onPluginConnected */
    public void lambda$handleQueryPlugins$5(PluginInstance<T> pluginInstance) {
        PluginPrefs.setHasPlugins(this.mContext);
        pluginInstance.onCreate(this.mContext, this.mListener);
    }

    /* renamed from: onPluginDisconnected */
    public void lambda$removePkg$4(PluginInstance<T> pluginInstance) {
        pluginInstance.onDestroy(this.mListener);
    }

    public void queryAll() {
        for (int size = this.mPluginInstances.size() - 1; size >= 0; size--) {
            final PluginInstance<T> pluginInstance = this.mPluginInstances.get(size);
            this.mMainExecutor.execute(new Runnable() { // from class: com.android.systemui.shared.plugins.PluginActionManager$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    PluginActionManager.this.lambda$queryAll$3(pluginInstance);
                }
            });
        }
        this.mPluginInstances.clear();
        handleQueryPlugins(null);
    }

    private void queryPkg(String str) {
        if (this.mAllowMultiple || this.mPluginInstances.size() == 0) {
            handleQueryPlugins(str);
        }
    }

    /* renamed from: removePkg */
    public void lambda$onPackageRemoved$1(String str) {
        for (int size = this.mPluginInstances.size() - 1; size >= 0; size--) {
            final PluginInstance<T> pluginInstance = this.mPluginInstances.get(size);
            if (pluginInstance.getPackage().equals(str)) {
                this.mMainExecutor.execute(new Runnable() { // from class: com.android.systemui.shared.plugins.PluginActionManager$$ExternalSyntheticLambda2
                    @Override // java.lang.Runnable
                    public final void run() {
                        PluginActionManager.this.lambda$removePkg$4(pluginInstance);
                    }
                });
                this.mPluginInstances.remove(size);
            }
        }
    }

    public boolean checkAndDisable(String str) {
        Iterator it = new ArrayList(this.mPluginInstances).iterator();
        boolean z = false;
        while (it.hasNext()) {
            PluginInstance<T> pluginInstance = (PluginInstance) it.next();
            if (str.startsWith(pluginInstance.getPackage())) {
                z |= disable(pluginInstance, 3);
            }
        }
        return z;
    }

    public <C> boolean dependsOn(Plugin plugin, Class<C> cls) {
        Iterator it = new ArrayList(this.mPluginInstances).iterator();
        while (it.hasNext()) {
            PluginInstance pluginInstance = (PluginInstance) it.next();
            if (pluginInstance.containsPluginClass(plugin.getClass())) {
                if (pluginInstance.getVersionInfo() == null || !pluginInstance.getVersionInfo().hasClass(cls)) {
                    return false;
                }
                return true;
            }
        }
        return false;
    }

    public void destroy() {
        Iterator it = new ArrayList(this.mPluginInstances).iterator();
        while (it.hasNext()) {
            final PluginInstance pluginInstance = (PluginInstance) it.next();
            this.mMainExecutor.execute(new Runnable() { // from class: com.android.systemui.shared.plugins.PluginActionManager$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    PluginActionManager.this.lambda$destroy$0(pluginInstance);
                }
            });
        }
    }

    public boolean disableAll() {
        ArrayList arrayList = new ArrayList(this.mPluginInstances);
        boolean z = false;
        for (int i = 0; i < arrayList.size(); i++) {
            z |= disable((PluginInstance) arrayList.get(i), 4);
        }
        return z;
    }

    public boolean isPluginPrivileged(ComponentName componentName) {
        Iterator<String> it = this.mPrivilegedPlugins.iterator();
        while (it.hasNext()) {
            String next = it.next();
            ComponentName unflattenFromString = ComponentName.unflattenFromString(next);
            if (unflattenFromString == null) {
                if (next.equals(componentName.getPackageName())) {
                    return true;
                }
            } else if (unflattenFromString.equals(componentName)) {
                return true;
            }
        }
        return false;
    }

    public void loadAll() {
        this.mBgExecutor.execute(new PluginActionManager$$ExternalSyntheticLambda0(this, 0));
    }

    public void onPackageRemoved(String str) {
        this.mBgExecutor.execute(new Asset$$ExternalSyntheticLambda1(this, str, 2));
    }

    public void reloadPackage(final String str) {
        this.mBgExecutor.execute(new Runnable() { // from class: com.android.systemui.shared.plugins.PluginActionManager$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                PluginActionManager.this.lambda$reloadPackage$2(str);
            }
        });
    }

    private boolean disable(PluginInstance<T> pluginInstance, @PluginEnabler.DisableReason int i) {
        ComponentName componentName = pluginInstance.getComponentName();
        if (isPluginPrivileged(componentName)) {
            return false;
        }
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Disabling plugin ");
        m.append(componentName.flattenToShortString());
        Log.w(TAG, m.toString());
        this.mPluginEnabler.setDisabled(componentName, i);
        return true;
    }

    public /* synthetic */ void lambda$reloadPackage$2(String str) {
        lambda$onPackageRemoved$1(str);
        queryPkg(str);
    }

    private void reportInvalidVersion(ComponentName componentName, String str, VersionInfo.InvalidVersionException invalidVersionException) {
        Notification.Builder color = new Notification.Builder(this.mContext, PluginManager.NOTIFICATION_CHANNEL_ID).setStyle(new Notification.BigTextStyle()).setSmallIcon(Resources.getSystem().getIdentifier("stat_sys_warning", "drawable", "android")).setWhen(0L).setShowWhen(false).setVisibility(1).setColor(this.mContext.getColor(Resources.getSystem().getIdentifier("system_notification_accent_color", "color", "android")));
        try {
            str = this.mPm.getServiceInfo(componentName, 0).loadLabel(this.mPm).toString();
        } catch (PackageManager.NameNotFoundException unused) {
        }
        if (!invalidVersionException.isTooNew()) {
            Notification.Builder contentTitle = color.setContentTitle("Plugin \"" + str + "\" is too old");
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Contact plugin developer to get an updated version.\n");
            m.append(invalidVersionException.getMessage());
            contentTitle.setContentText(m.toString());
        } else {
            Notification.Builder contentTitle2 = color.setContentTitle("Plugin \"" + str + "\" is too new");
            StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Check to see if an OTA is available.\n");
            m2.append(invalidVersionException.getMessage());
            contentTitle2.setContentText(m2.toString());
        }
        Intent intent = new Intent(PluginManagerImpl.DISABLE_PLUGIN);
        StringBuilder m3 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("package://");
        m3.append(componentName.flattenToString());
        color.addAction(new Notification.Action.Builder((Icon) null, "Disable plugin", PendingIntent.getBroadcast(this.mContext, 0, intent.setData(Uri.parse(m3.toString())), 67108864)).build());
        this.mNotificationManager.notify(6, color.build());
        Log.w(TAG, "Plugin has invalid interface version " + invalidVersionException.getActualVersion() + ", expected " + invalidVersionException.getExpectedVersion());
    }
}
