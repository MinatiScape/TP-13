package com.bumptech.glide.module;

import java.lang.reflect.InvocationTargetException;
@Deprecated
/* loaded from: classes.dex */
public final class ManifestParser {
    public static void throwInstantiateGlideModuleException(Class cls, ReflectiveOperationException reflectiveOperationException) {
        throw new RuntimeException("Unable to instantiate GlideModule implementation for " + cls, reflectiveOperationException);
    }

    public static GlideModule parseModule(String str) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        try {
            try {
                Object newInstance = Class.forName(str).getDeclaredConstructor(new Class[0]).newInstance(new Object[0]);
                if (newInstance instanceof GlideModule) {
                    return (GlideModule) newInstance;
                }
                throw new RuntimeException("Expected instanceof GlideModule, but found: " + newInstance);
            } catch (IllegalAccessException e) {
                throwInstantiateGlideModuleException(cls2, e);
                throw null;
            } catch (InstantiationException e2) {
                throwInstantiateGlideModuleException(cls, e2);
                throw null;
            } catch (NoSuchMethodException e3) {
                throwInstantiateGlideModuleException(cls3, e3);
                throw null;
            } catch (InvocationTargetException e4) {
                throwInstantiateGlideModuleException(cls4, e4);
                throw null;
            }
        } catch (ClassNotFoundException e5) {
            throw new IllegalArgumentException("Unable to find GlideModule implementation", e5);
        }
    }
}
