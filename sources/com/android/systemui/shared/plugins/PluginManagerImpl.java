package com.android.systemui.shared.plugins;

import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.SystemProperties;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.ArrayMap;
import android.util.ArraySet;
import android.util.Log;
import android.widget.Toast;
import com.android.systemui.plugins.Plugin;
import com.android.systemui.plugins.PluginListener;
import com.android.systemui.shared.plugins.PluginActionManager;
import com.android.systemui.shared.plugins.PluginManager;
import com.android.wallpaper.module.WallpaperSetter$$ExternalSyntheticLambda1;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.Thread;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Consumer;
/* loaded from: classes.dex */
public class PluginManagerImpl extends BroadcastReceiver implements PluginManager {
    public static final String DISABLE_PLUGIN = "com.android.systemui.action.DISABLE_PLUGIN";
    private static final String TAG = "PluginManagerImpl";
    private final PluginActionManager.Factory mActionManagerFactory;
    private final Context mContext;
    private final boolean mIsDebuggable;
    private boolean mListening;
    private final PluginEnabler mPluginEnabler;
    private final PluginPrefs mPluginPrefs;
    private final ArraySet<String> mPrivilegedPlugins;
    private final ArrayMap<PluginListener<?>, PluginActionManager<?>> mPluginMap = new ArrayMap<>();
    private final Map<String, ClassLoader> mClassLoaders = new ArrayMap();

    /* loaded from: classes.dex */
    public static class ClassLoaderFilter extends ClassLoader {
        private final ClassLoader mBase;
        private final String mPackage;

        public ClassLoaderFilter(ClassLoader classLoader, String str) {
            super(ClassLoader.getSystemClassLoader());
            this.mBase = classLoader;
            this.mPackage = str;
        }

        @Override // java.lang.ClassLoader
        public Class<?> loadClass(String str, boolean z) throws ClassNotFoundException {
            if (!str.startsWith(this.mPackage)) {
                super.loadClass(str, z);
            }
            return this.mBase.loadClass(str);
        }
    }

    /* loaded from: classes.dex */
    public static class CrashWhilePluginActiveException extends RuntimeException {
        public CrashWhilePluginActiveException(Throwable th) {
            super(th);
        }
    }

    /* loaded from: classes.dex */
    public class PluginExceptionHandler implements Thread.UncaughtExceptionHandler {
        private final Optional<Thread.UncaughtExceptionHandler> mExceptionHandlerOptional;

        private boolean checkStack(Throwable th) {
            StackTraceElement[] stackTrace;
            boolean z;
            if (th == null) {
                return false;
            }
            synchronized (this) {
                z = false;
                for (StackTraceElement stackTraceElement : th.getStackTrace()) {
                    for (PluginActionManager pluginActionManager : PluginManagerImpl.this.mPluginMap.values()) {
                        z |= pluginActionManager.checkAndDisable(stackTraceElement.getClassName());
                    }
                }
            }
            return checkStack(th.getCause()) | z;
        }

        @Override // java.lang.Thread.UncaughtExceptionHandler
        public void uncaughtException(final Thread thread, final Throwable th) {
            if (SystemProperties.getBoolean("plugin.debugging", false)) {
                this.mExceptionHandlerOptional.ifPresent(new WallpaperSetter$$ExternalSyntheticLambda1(thread, th));
                return;
            }
            boolean checkStack = checkStack(th);
            if (!checkStack) {
                synchronized (this) {
                    for (PluginActionManager pluginActionManager : PluginManagerImpl.this.mPluginMap.values()) {
                        checkStack |= pluginActionManager.disableAll();
                    }
                }
            }
            if (checkStack) {
                th = new CrashWhilePluginActiveException(th);
            }
            this.mExceptionHandlerOptional.ifPresent(new Consumer() { // from class: com.android.systemui.shared.plugins.PluginManagerImpl$PluginExceptionHandler$$ExternalSyntheticLambda0
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    ((Thread.UncaughtExceptionHandler) obj).uncaughtException(thread, th);
                }
            });
        }

        private PluginExceptionHandler(Optional<Thread.UncaughtExceptionHandler> optional) {
            this.mExceptionHandlerOptional = optional;
        }
    }

    public PluginManagerImpl(Context context, PluginActionManager.Factory factory, boolean z, Optional<Thread.UncaughtExceptionHandler> optional, PluginEnabler pluginEnabler, PluginPrefs pluginPrefs, List<String> list) {
        ArraySet<String> arraySet = new ArraySet<>();
        this.mPrivilegedPlugins = arraySet;
        this.mContext = context;
        this.mActionManagerFactory = factory;
        this.mIsDebuggable = z;
        arraySet.addAll(list);
        this.mPluginPrefs = pluginPrefs;
        this.mPluginEnabler = pluginEnabler;
        Thread.setUncaughtExceptionPreHandler(new PluginExceptionHandler(optional));
    }

    private boolean clearClassLoader(String str) {
        return this.mClassLoaders.remove(str) != null;
    }

    private boolean isPluginPrivileged(ComponentName componentName) {
        Iterator<String> it = this.mPrivilegedPlugins.iterator();
        while (it.hasNext()) {
            String next = it.next();
            ComponentName unflattenFromString = ComponentName.unflattenFromString(next);
            if (unflattenFromString != null) {
                if (unflattenFromString.equals(componentName)) {
                    return true;
                }
            } else if (next.equals(componentName.getPackageName())) {
                return true;
            }
        }
        return false;
    }

    private void startListening() {
        if (!this.mListening) {
            this.mListening = true;
            IntentFilter intentFilter = new IntentFilter("android.intent.action.PACKAGE_ADDED");
            intentFilter.addAction("android.intent.action.PACKAGE_CHANGED");
            intentFilter.addAction("android.intent.action.PACKAGE_REPLACED");
            intentFilter.addAction("android.intent.action.PACKAGE_REMOVED");
            intentFilter.addDataScheme("package");
            this.mContext.registerReceiver(this, intentFilter);
            intentFilter.addAction(PluginManager.PLUGIN_CHANGED);
            intentFilter.addAction(DISABLE_PLUGIN);
            intentFilter.addDataScheme("package");
            this.mContext.registerReceiver(this, intentFilter, PluginActionManager.PLUGIN_PERMISSION, null);
            this.mContext.registerReceiver(this, new IntentFilter("android.intent.action.USER_UNLOCKED"));
        }
    }

    private void stopListening() {
        if (this.mListening) {
            this.mListening = false;
            this.mContext.unregisterReceiver(this);
        }
    }

    @Override // com.android.systemui.shared.plugins.PluginManager
    public <T extends Plugin> void addPluginListener(PluginListener<T> pluginListener, Class<T> cls) {
        addPluginListener((PluginListener) pluginListener, (Class) cls, false);
    }

    @Override // com.android.systemui.shared.plugins.PluginManager
    public <T> boolean dependsOn(Plugin plugin, Class<T> cls) {
        synchronized (this) {
            for (int i = 0; i < this.mPluginMap.size(); i++) {
                if (this.mPluginMap.valueAt(i).dependsOn(plugin, cls)) {
                    return true;
                }
            }
            return false;
        }
    }

    public void dump(FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        synchronized (this) {
            printWriter.println(String.format("  plugin map (%d):", Integer.valueOf(this.mPluginMap.size())));
            for (PluginListener<?> pluginListener : this.mPluginMap.keySet()) {
                printWriter.println(String.format("    %s -> %s", pluginListener, this.mPluginMap.get(pluginListener)));
            }
        }
    }

    @Override // com.android.systemui.shared.plugins.PluginManager
    public String[] getPrivilegedPlugins() {
        return (String[]) this.mPrivilegedPlugins.toArray(new String[0]);
    }

    public boolean isDebuggable() {
        return this.mIsDebuggable;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        int disableReason;
        if ("android.intent.action.USER_UNLOCKED".equals(intent.getAction())) {
            synchronized (this) {
                for (PluginActionManager<?> pluginActionManager : this.mPluginMap.values()) {
                    pluginActionManager.loadAll();
                }
            }
        } else if (DISABLE_PLUGIN.equals(intent.getAction())) {
            ComponentName unflattenFromString = ComponentName.unflattenFromString(intent.getData().toString().substring(10));
            if (!isPluginPrivileged(unflattenFromString)) {
                this.mPluginEnabler.setDisabled(unflattenFromString, 2);
                ((NotificationManager) this.mContext.getSystemService(NotificationManager.class)).cancel(unflattenFromString.getClassName(), 6);
            }
        } else {
            String encodedSchemeSpecificPart = intent.getData().getEncodedSchemeSpecificPart();
            ComponentName unflattenFromString2 = ComponentName.unflattenFromString(encodedSchemeSpecificPart);
            if (clearClassLoader(encodedSchemeSpecificPart)) {
                if (Build.IS_ENG) {
                    Context context2 = this.mContext;
                    Toast.makeText(context2, "Reloading " + encodedSchemeSpecificPart, 1).show();
                } else {
                    String str = TAG;
                    Log.v(str, "Reloading " + encodedSchemeSpecificPart);
                }
            }
            if ("android.intent.action.PACKAGE_REPLACED".equals(intent.getAction()) && unflattenFromString2 != null && ((disableReason = this.mPluginEnabler.getDisableReason(unflattenFromString2)) == 3 || disableReason == 4 || disableReason == 2)) {
                String str2 = TAG;
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Re-enabling previously disabled plugin that has been updated: ");
                m.append(unflattenFromString2.flattenToShortString());
                Log.i(str2, m.toString());
                this.mPluginEnabler.setEnabled(unflattenFromString2);
            }
            synchronized (this) {
                if (!"android.intent.action.PACKAGE_ADDED".equals(intent.getAction()) && !"android.intent.action.PACKAGE_CHANGED".equals(intent.getAction()) && !"android.intent.action.PACKAGE_REPLACED".equals(intent.getAction())) {
                    for (PluginActionManager<?> pluginActionManager2 : this.mPluginMap.values()) {
                        pluginActionManager2.onPackageRemoved(encodedSchemeSpecificPart);
                    }
                }
                for (PluginActionManager<?> pluginActionManager3 : this.mPluginMap.values()) {
                    pluginActionManager3.reloadPackage(encodedSchemeSpecificPart);
                }
            }
        }
    }

    @Override // com.android.systemui.shared.plugins.PluginManager
    public void removePluginListener(PluginListener<?> pluginListener) {
        synchronized (this) {
            if (this.mPluginMap.containsKey(pluginListener)) {
                this.mPluginMap.remove(pluginListener).destroy();
                if (this.mPluginMap.size() == 0) {
                    stopListening();
                }
            }
        }
    }

    @Override // com.android.systemui.shared.plugins.PluginManager
    public <T extends Plugin> void addPluginListener(PluginListener<T> pluginListener, Class<T> cls, boolean z) {
        addPluginListener(PluginManager.Helper.getAction(cls), pluginListener, cls, z);
    }

    @Override // com.android.systemui.shared.plugins.PluginManager
    public <T extends Plugin> void addPluginListener(String str, PluginListener<T> pluginListener, Class<T> cls) {
        addPluginListener(str, pluginListener, cls, false);
    }

    @Override // com.android.systemui.shared.plugins.PluginManager
    public <T extends Plugin> void addPluginListener(String str, PluginListener<T> pluginListener, Class<T> cls, boolean z) {
        this.mPluginPrefs.addAction(str);
        PluginActionManager<?> create = this.mActionManagerFactory.create(str, pluginListener, cls, z, isDebuggable());
        create.loadAll();
        synchronized (this) {
            this.mPluginMap.put(pluginListener, create);
        }
        startListening();
    }
}
