package com.google.protobuf;

import com.google.protobuf.GeneratedMessageLite;
import java.util.Collections;
import java.util.Map;
/* loaded from: classes.dex */
public final class ExtensionRegistryLite {
    public static final ExtensionRegistryLite EMPTY_REGISTRY_LITE;
    public static volatile ExtensionRegistryLite emptyRegistry;
    public final Map<ObjectIntPair, GeneratedMessageLite.GeneratedExtension<?, ?>> extensionsByNumber;

    /* loaded from: classes.dex */
    public static final class ObjectIntPair {
        public final int number;
        public final Object object;

        public final boolean equals(Object obj) {
            if (!(obj instanceof ObjectIntPair)) {
                return false;
            }
            ObjectIntPair objectIntPair = (ObjectIntPair) obj;
            if (this.object == objectIntPair.object && this.number == objectIntPair.number) {
                return true;
            }
            return false;
        }

        public final int hashCode() {
            return (System.identityHashCode(this.object) * 65535) + this.number;
        }

        public ObjectIntPair(Object obj, int i) {
            this.object = obj;
            this.number = i;
        }
    }

    public ExtensionRegistryLite() {
        throw null;
    }

    static {
        try {
            Class.forName("com.google.protobuf.Extension");
        } catch (ClassNotFoundException unused) {
        }
        EMPTY_REGISTRY_LITE = new ExtensionRegistryLite(0);
    }

    public static ExtensionRegistryLite getEmptyRegistry() {
        ExtensionRegistryLite extensionRegistryLite = emptyRegistry;
        if (extensionRegistryLite == null) {
            synchronized (ExtensionRegistryLite.class) {
                extensionRegistryLite = emptyRegistry;
                if (extensionRegistryLite == null) {
                    Class<?> cls = ExtensionRegistryFactory.EXTENSION_REGISTRY_CLASS;
                    if (cls != null) {
                        try {
                            extensionRegistryLite = (ExtensionRegistryLite) cls.getDeclaredMethod("getEmptyRegistry", new Class[0]).invoke(null, new Object[0]);
                        } catch (Exception unused) {
                        }
                        emptyRegistry = extensionRegistryLite;
                    }
                    extensionRegistryLite = EMPTY_REGISTRY_LITE;
                    emptyRegistry = extensionRegistryLite;
                }
            }
        }
        return extensionRegistryLite;
    }

    public ExtensionRegistryLite(int i) {
        this.extensionsByNumber = Collections.emptyMap();
    }
}
