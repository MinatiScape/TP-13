package com.android.systemui.shared.plugins;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.ArrayMap;
import com.android.systemui.plugins.annotations.Dependencies;
import com.android.systemui.plugins.annotations.DependsOn;
import com.android.systemui.plugins.annotations.ProvidesInterface;
import com.android.systemui.plugins.annotations.Requirements;
import com.android.systemui.plugins.annotations.Requires;
import java.util.function.BiConsumer;
/* loaded from: classes.dex */
public class VersionInfo {
    private Class<?> mDefault;
    private final ArrayMap<Class<?>, Version> mVersions = new ArrayMap<>();

    public VersionInfo addClass(Class<?> cls) {
        if (this.mDefault == null) {
            this.mDefault = cls;
        }
        addClass(cls, false);
        return this;
    }

    /* loaded from: classes.dex */
    public static class InvalidVersionException extends RuntimeException {
        private int mActual;
        private int mExpected;
        private final boolean mTooNew;

        public InvalidVersionException(String str, boolean z) {
            super(str);
            this.mTooNew = z;
        }

        public InvalidVersionException(Class<?> cls, boolean z, int i, int i2) {
            super(cls.getSimpleName() + " expected version " + i + " but had " + i2);
            this.mTooNew = z;
            this.mExpected = i;
            this.mActual = i2;
        }

        public int getActualVersion() {
            return this.mActual;
        }

        public int getExpectedVersion() {
            return this.mExpected;
        }

        public boolean isTooNew() {
            return this.mTooNew;
        }
    }

    /* loaded from: classes.dex */
    public static class Version {
        private final boolean mRequired;
        private final int mVersion;

        public Version(int i, boolean z) {
            this.mVersion = i;
            this.mRequired = z;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Version createVersion(Class<?> cls) {
        ProvidesInterface providesInterface = (ProvidesInterface) cls.getDeclaredAnnotation(ProvidesInterface.class);
        if (providesInterface != null) {
            return new Version(providesInterface.version(), false);
        }
        return null;
    }

    public void checkVersion(VersionInfo versionInfo) throws InvalidVersionException {
        final ArrayMap arrayMap = new ArrayMap(this.mVersions);
        versionInfo.mVersions.forEach(new BiConsumer<Class<?>, Version>() { // from class: com.android.systemui.shared.plugins.VersionInfo.1
            public void accept(Class<?> cls, Version version) {
                Version version2 = (Version) arrayMap.remove(cls);
                if (version2 == null) {
                    version2 = VersionInfo.this.createVersion(cls);
                }
                boolean z = false;
                if (version2 == null) {
                    throw new InvalidVersionException(cls.getSimpleName() + " does not provide an interface", false);
                } else if (version2.mVersion != version.mVersion) {
                    if (version2.mVersion < version.mVersion) {
                        z = true;
                    }
                    throw new InvalidVersionException(cls, z, version2.mVersion, version.mVersion);
                }
            }
        });
        arrayMap.forEach(new BiConsumer<Class<?>, Version>() { // from class: com.android.systemui.shared.plugins.VersionInfo.2
            public void accept(Class<?> cls, Version version) {
                if (version.mRequired) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Missing required dependency ");
                    m.append(cls.getSimpleName());
                    throw new InvalidVersionException(m.toString(), false);
                }
            }
        });
    }

    public int getDefaultVersion() {
        return this.mVersions.get(this.mDefault).mVersion;
    }

    public <T> boolean hasClass(Class<T> cls) {
        return this.mVersions.containsKey(cls);
    }

    public boolean hasVersionInfo() {
        return !this.mVersions.isEmpty();
    }

    private void addClass(Class<?> cls, boolean z) {
        Requires[] value;
        if (!this.mVersions.containsKey(cls)) {
            ProvidesInterface providesInterface = (ProvidesInterface) cls.getDeclaredAnnotation(ProvidesInterface.class);
            if (providesInterface != null) {
                this.mVersions.put(cls, new Version(providesInterface.version(), true));
            }
            Requires requires = (Requires) cls.getDeclaredAnnotation(Requires.class);
            if (requires != null) {
                this.mVersions.put(requires.target(), new Version(requires.version(), z));
            }
            Requirements requirements = (Requirements) cls.getDeclaredAnnotation(Requirements.class);
            if (requirements != null) {
                for (Requires requires2 : requirements.value()) {
                    this.mVersions.put(requires2.target(), new Version(requires2.version(), z));
                }
            }
            DependsOn dependsOn = (DependsOn) cls.getDeclaredAnnotation(DependsOn.class);
            if (dependsOn != null) {
                addClass(dependsOn.target(), true);
            }
            Dependencies dependencies = (Dependencies) cls.getDeclaredAnnotation(Dependencies.class);
            if (dependencies != null) {
                for (DependsOn dependsOn2 : dependencies.value()) {
                    addClass(dependsOn2.target(), true);
                }
            }
        }
    }
}
