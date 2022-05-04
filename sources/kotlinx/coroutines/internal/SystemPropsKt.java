package kotlinx.coroutines.internal;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.ServiceLoader;
import java.util.Set;
import java.util.jar.JarFile;
import java.util.zip.ZipEntry;
import kotlin.ExceptionsKt;
import kotlin.collections.CollectionsKt__IteratorsJVMKt;
import kotlin.collections.CollectionsKt___CollectionsKt;
import kotlin.collections.EmptySet;
import kotlin.collections.MapsKt__MapsJVMKt;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt__StringsKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class SystemPropsKt {
    @Nullable
    public static final String systemProp(@NotNull String str) {
        int i = SystemPropsKt__SystemPropsKt.AVAILABLE_PROCESSORS;
        try {
            return System.getProperty(str);
        } catch (SecurityException unused) {
            return null;
        }
    }

    @NotNull
    public static List loadMainDispatcherFactory$external__kotlinx_coroutines__android_common__kotlinx_coroutines() {
        List list;
        MainDispatcherFactory mainDispatcherFactory;
        if (!FastServiceLoaderKt.ANDROID_DETECTED) {
            ClassLoader classLoader = MainDispatcherFactory.class.getClassLoader();
            Intrinsics.checkNotNullExpressionValue(classLoader, "clz.classLoader");
            try {
                return loadProviders$external__kotlinx_coroutines__android_common__kotlinx_coroutines(classLoader);
            } catch (Throwable unused) {
                ServiceLoader load = ServiceLoader.load(MainDispatcherFactory.class, classLoader);
                Intrinsics.checkNotNullExpressionValue(load, "load(service, loader)");
                return CollectionsKt___CollectionsKt.toList(load);
            }
        } else {
            try {
                ArrayList arrayList = new ArrayList(2);
                MainDispatcherFactory mainDispatcherFactory2 = null;
                try {
                    mainDispatcherFactory = (MainDispatcherFactory) MainDispatcherFactory.class.cast(Class.forName("kotlinx.coroutines.android.AndroidDispatcherFactory", true, MainDispatcherFactory.class.getClassLoader()).getDeclaredConstructor(new Class[0]).newInstance(new Object[0]));
                } catch (ClassNotFoundException unused2) {
                    mainDispatcherFactory = null;
                }
                if (mainDispatcherFactory != null) {
                    arrayList.add(mainDispatcherFactory);
                }
                try {
                    mainDispatcherFactory2 = (MainDispatcherFactory) MainDispatcherFactory.class.cast(Class.forName("kotlinx.coroutines.test.internal.TestMainDispatcherFactory", true, MainDispatcherFactory.class.getClassLoader()).getDeclaredConstructor(new Class[0]).newInstance(new Object[0]));
                } catch (ClassNotFoundException unused3) {
                }
                if (mainDispatcherFactory2 == null) {
                    return arrayList;
                }
                arrayList.add(mainDispatcherFactory2);
                return arrayList;
            } catch (Throwable unused4) {
                ClassLoader classLoader2 = MainDispatcherFactory.class.getClassLoader();
                Intrinsics.checkNotNullExpressionValue(classLoader2, "clz.classLoader");
                try {
                    list = loadProviders$external__kotlinx_coroutines__android_common__kotlinx_coroutines(classLoader2);
                } catch (Throwable unused5) {
                    ServiceLoader load2 = ServiceLoader.load(MainDispatcherFactory.class, classLoader2);
                    Intrinsics.checkNotNullExpressionValue(load2, "load(service, loader)");
                    list = CollectionsKt___CollectionsKt.toList(load2);
                }
                return list;
            }
        }
    }

    @NotNull
    public static ArrayList loadProviders$external__kotlinx_coroutines__android_common__kotlinx_coroutines(@NotNull ClassLoader classLoader) {
        Collection<String> collection;
        List elements;
        Enumeration<URL> urls = classLoader.getResources(Intrinsics.stringPlus("META-INF/services/", MainDispatcherFactory.class.getName()));
        Intrinsics.checkNotNullExpressionValue(urls, "urls");
        ArrayList<URL> list = Collections.list(urls);
        Intrinsics.checkNotNullExpressionValue(list, "list(this)");
        ArrayList arrayList = new ArrayList();
        for (URL it : list) {
            Intrinsics.checkNotNullExpressionValue(it, "it");
            String url = it.toString();
            Intrinsics.checkNotNullExpressionValue(url, "url.toString()");
            Throwable th = null;
            if (url.startsWith("jar")) {
                String substringAfter$default = StringsKt__StringsKt.substringAfter$default(url, "jar:file:");
                int indexOf$default = StringsKt__StringsKt.indexOf$default(substringAfter$default, '!', 0, 6);
                if (indexOf$default != -1) {
                    substringAfter$default = substringAfter$default.substring(0, indexOf$default);
                    Intrinsics.checkNotNullExpressionValue(substringAfter$default, "this as java.lang.String…ing(startIndex, endIndex)");
                }
                String substringAfter$default2 = StringsKt__StringsKt.substringAfter$default(url, "!/");
                JarFile jarFile = new JarFile(substringAfter$default, false);
                try {
                    elements = parseFile(new BufferedReader(new InputStreamReader(jarFile.getInputStream(new ZipEntry(substringAfter$default2)), "UTF-8")));
                    jarFile.close();
                } catch (Throwable th2) {
                    try {
                        throw th2;
                    } catch (Throwable th3) {
                        try {
                            jarFile.close();
                            throw th3;
                        } catch (Throwable th4) {
                            ExceptionsKt.addSuppressed(th2, th4);
                            throw th2;
                        }
                    }
                }
            } else {
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(it.openStream()));
                try {
                    List parseFile = parseFile(bufferedReader);
                    CloseableKt.closeFinally(bufferedReader, th);
                    elements = parseFile;
                } finally {
                    try {
                        throw th;
                    } finally {
                    }
                }
            }
            Intrinsics.checkNotNullParameter(elements, "elements");
            arrayList.addAll(elements);
        }
        int size = arrayList.size();
        if (size == 0) {
            collection = EmptySet.INSTANCE;
        } else if (size != 1) {
            LinkedHashSet linkedHashSet = new LinkedHashSet(MapsKt__MapsJVMKt.mapCapacity(arrayList.size()));
            CollectionsKt___CollectionsKt.toCollection(arrayList, linkedHashSet);
            collection = linkedHashSet;
        } else {
            Set singleton = Collections.singleton(arrayList.get(0));
            Intrinsics.checkNotNullExpressionValue(singleton, "singleton(element)");
            collection = singleton;
        }
        if (!collection.isEmpty()) {
            ArrayList arrayList2 = new ArrayList(CollectionsKt__IteratorsJVMKt.collectionSizeOrDefault(collection));
            for (String str : collection) {
                Class<?> cls = Class.forName(str, false, classLoader);
                if (MainDispatcherFactory.class.isAssignableFrom(cls)) {
                    arrayList2.add(MainDispatcherFactory.class.cast(cls.getDeclaredConstructor(new Class[0]).newInstance(new Object[0])));
                } else {
                    throw new IllegalArgumentException(("Expected service of class " + MainDispatcherFactory.class + ", but found " + cls).toString());
                }
            }
            return arrayList2;
        }
        throw new IllegalArgumentException("No providers were loaded with FastServiceLoader".toString());
    }

    public static List parseFile(BufferedReader bufferedReader) {
        boolean z;
        boolean z2;
        int i;
        boolean z3;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                return CollectionsKt___CollectionsKt.toList(linkedHashSet);
            }
            boolean z4 = false;
            int indexOf = StringsKt__StringsKt.indexOf(readLine, "#", 0, false);
            if (indexOf != -1) {
                readLine = readLine.substring(0, indexOf);
                Intrinsics.checkNotNullExpressionValue(readLine, "this as java.lang.String…ing(startIndex, endIndex)");
            }
            int length = readLine.length() - 1;
            int i2 = 0;
            boolean z5 = false;
            while (i2 <= length) {
                if (!z5) {
                    i = i2;
                } else {
                    i = length;
                }
                char charAt = readLine.charAt(i);
                if (Character.isWhitespace(charAt) || Character.isSpaceChar(charAt)) {
                    z3 = true;
                } else {
                    z3 = false;
                }
                if (!z5) {
                    if (!z3) {
                        z5 = true;
                    } else {
                        i2++;
                    }
                } else if (!z3) {
                    break;
                } else {
                    length--;
                }
            }
            String obj = readLine.subSequence(i2, length + 1).toString();
            int i3 = 0;
            while (true) {
                if (i3 >= obj.length()) {
                    z = true;
                    break;
                }
                char charAt2 = obj.charAt(i3);
                i3++;
                if (charAt2 == '.' || Character.isJavaIdentifierPart(charAt2)) {
                    z2 = true;
                    continue;
                } else {
                    z2 = false;
                    continue;
                }
                if (!z2) {
                    z = false;
                    break;
                }
            }
            if (z) {
                if (obj.length() > 0) {
                    z4 = true;
                }
                if (z4) {
                    linkedHashSet.add(obj);
                }
            } else {
                throw new IllegalArgumentException(Intrinsics.stringPlus("Illegal service provider class name: ", obj).toString());
            }
        }
    }

    public static int systemProp$default(String str, int i, int i2, int i3, int i4) {
        if ((i4 & 4) != 0) {
            i2 = 1;
        }
        if ((i4 & 8) != 0) {
            i3 = Integer.MAX_VALUE;
        }
        return (int) systemProp(str, i, i2, i3);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00d7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final long systemProp(@org.jetbrains.annotations.NotNull java.lang.String r23, long r24, long r26, long r28) {
        /*
            Method dump skipped, instructions count: 251
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.internal.SystemPropsKt.systemProp(java.lang.String, long, long, long):long");
    }
}
