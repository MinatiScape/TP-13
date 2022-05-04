package com.google.common.reflect;

import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
import com.google.common.base.Preconditions;
import com.google.common.base.Splitter;
import com.google.common.base.StandardSystemProperty;
import com.google.common.base.Supplier;
import com.google.common.collect.AbstractMapBasedMultimap;
import com.google.common.collect.CollectPreconditions;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.MultimapBuilder;
import com.google.common.collect.SetMultimap;
import com.google.common.collect.UnmodifiableIterator;
import java.io.File;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.jar.Manifest;
import java.util.logging.Level;
import java.util.logging.Logger;
/* loaded from: classes.dex */
public final class ClassPath {
    public static final Splitter CLASS_PATH_ATTRIBUTE_SEPARATOR;
    public static final Logger logger = Logger.getLogger(ClassPath.class.getName());

    /* loaded from: classes.dex */
    public static abstract class Scanner {
        public final HashSet scannedUris = new HashSet();

        public abstract void scanDirectory(ClassLoader loader, File directory) throws IOException;

        public abstract void scanJarFile(ClassLoader loader, JarFile file) throws IOException;

        public static ImmutableMap<File, ClassLoader> getClassPathEntries(ClassLoader classloader) {
            ImmutableList<URL> immutableList;
            int i;
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            ClassLoader parent = classloader.getParent();
            if (parent != null) {
                linkedHashMap.putAll(getClassPathEntries(parent));
            }
            if (classloader instanceof URLClassLoader) {
                immutableList = ImmutableList.copyOf(((URLClassLoader) classloader).getURLs());
            } else if (classloader.equals(ClassLoader.getSystemClassLoader())) {
                immutableList = parseJavaClassPath();
            } else {
                immutableList = ImmutableList.of();
            }
            ImmutableList.Itr listIterator = immutableList.listIterator(0);
            while (listIterator.hasNext()) {
                URL url = (URL) listIterator.next();
                if (url.getProtocol().equals("file")) {
                    File file = ClassPath.toFile(url);
                    if (!linkedHashMap.containsKey(file)) {
                        linkedHashMap.put(file, classloader);
                    }
                }
            }
            if ((linkedHashMap instanceof ImmutableMap) && !(linkedHashMap instanceof SortedMap)) {
                ImmutableMap<File, ClassLoader> immutableMap = (ImmutableMap) linkedHashMap;
                if (!immutableMap.isPartialView()) {
                    return immutableMap;
                }
            }
            Set entrySet = linkedHashMap.entrySet();
            if (entrySet instanceof Collection) {
                i = entrySet.size();
            } else {
                i = 4;
            }
            ImmutableMap.Builder builder = new ImmutableMap.Builder(i);
            builder.putAll(entrySet);
            return builder.build();
        }

        public static URL getClassPathEntry(File jarFile, String path) throws MalformedURLException {
            return new URL(jarFile.toURI().toURL(), path);
        }

        public static ImmutableSet<File> getClassPathFromManifest(File jarFile, Manifest manifest) {
            String str;
            if (manifest == null) {
                return ImmutableSet.of();
            }
            int i = ImmutableSet.$r8$clinit;
            ImmutableSet.Builder builder = new ImmutableSet.Builder();
            String value = manifest.getMainAttributes().getValue(Attributes.Name.CLASS_PATH.toString());
            if (value != null) {
                Splitter splitter = ClassPath.CLASS_PATH_ATTRIBUTE_SEPARATOR;
                splitter.getClass();
                Iterator<String> it = splitter.strategy.iterator(splitter, value);
                while (it.hasNext()) {
                    String next = it.next();
                    try {
                        URL classPathEntry = getClassPathEntry(jarFile, next);
                        if (classPathEntry.getProtocol().equals("file")) {
                            builder.add$1(ClassPath.toFile(classPathEntry));
                        }
                    } catch (MalformedURLException unused) {
                        Logger logger = ClassPath.logger;
                        Level level = Level.WARNING;
                        String valueOf = String.valueOf(next);
                        if (valueOf.length() != 0) {
                            str = "Invalid Class-Path entry: ".concat(valueOf);
                        } else {
                            str = new String("Invalid Class-Path entry: ");
                        }
                        logger.logp(level, "com.google.common.reflect.ClassPath$Scanner", "getClassPathFromManifest", str);
                    }
                }
            }
            return builder.build();
        }

        public static ImmutableList<URL> parseJavaClassPath() {
            String str;
            ImmutableList.Itr itr = ImmutableList.EMPTY_ITR;
            ImmutableList.Builder builder = new ImmutableList.Builder();
            Splitter on = Splitter.on(StandardSystemProperty.PATH_SEPARATOR.value());
            String value = StandardSystemProperty.JAVA_CLASS_PATH.value();
            value.getClass();
            Iterator<String> it = on.strategy.iterator(on, value);
            while (it.hasNext()) {
                String next = it.next();
                try {
                    try {
                        builder.add(new File(next).toURI().toURL());
                    } catch (SecurityException unused) {
                        builder.add(new URL("file", (String) null, new File(next).getAbsolutePath()));
                    }
                } catch (MalformedURLException e) {
                    Logger logger = ClassPath.logger;
                    Level level = Level.WARNING;
                    String valueOf = String.valueOf(next);
                    if (valueOf.length() != 0) {
                        str = "malformed classpath entry: ".concat(valueOf);
                    } else {
                        str = new String("malformed classpath entry: ");
                    }
                    logger.logp(level, "com.google.common.reflect.ClassPath$Scanner", "parseJavaClassPath", str, (Throwable) e);
                }
            }
            builder.forceCopy = true;
            return ImmutableList.asImmutableList(builder.contents, builder.size);
        }

        public final void scan(File file, ClassLoader classloader) throws IOException {
            if (this.scannedUris.add(file.getCanonicalFile())) {
                try {
                    if (file.exists()) {
                        if (file.isDirectory()) {
                            scanDirectory(classloader, file);
                            return;
                        }
                        try {
                            JarFile jarFile = new JarFile(file);
                            try {
                                UnmodifiableIterator<File> it = getClassPathFromManifest(file, jarFile.getManifest()).iterator();
                                while (it.hasNext()) {
                                    scan(it.next(), classloader);
                                }
                                scanJarFile(classloader, jarFile);
                                jarFile.close();
                            } catch (Throwable th) {
                                try {
                                    jarFile.close();
                                } catch (IOException unused) {
                                }
                                throw th;
                            }
                        } catch (IOException unused2) {
                        }
                    }
                } catch (SecurityException e) {
                    Logger logger = ClassPath.logger;
                    Level level = Level.WARNING;
                    String valueOf = String.valueOf(file);
                    String valueOf2 = String.valueOf(e);
                    StringBuilder sb = new StringBuilder(valueOf2.length() + valueOf.length() + 16);
                    sb.append("Cannot access ");
                    sb.append(valueOf);
                    sb.append(": ");
                    sb.append(valueOf2);
                    logger.logp(level, "com.google.common.reflect.ClassPath$Scanner", "scanFrom", sb.toString());
                }
            }
        }
    }

    /* loaded from: classes.dex */
    public static final class DefaultScanner extends Scanner {
        public final SetMultimap<ClassLoader, String> resources;

        @Override // com.google.common.reflect.ClassPath.Scanner
        public final void scanDirectory(ClassLoader classloader, File directory) throws IOException {
            HashSet hashSet = new HashSet();
            hashSet.add(directory.getCanonicalFile());
            scanDirectory(directory, classloader, "", hashSet);
        }

        /* JADX WARN: Type inference failed for: r1v2, types: [com.google.common.collect.MultimapBuilder$MultimapBuilderWithKeys$4] */
        public DefaultScanner() {
            CollectPreconditions.checkNonnegative(8, "expectedKeys");
            final MultimapBuilder.AnonymousClass1 r0 = new MultimapBuilder.AnonymousClass1();
            CollectPreconditions.checkNonnegative(2, "expectedValuesPerKey");
            this.resources = new MultimapBuilder.SetMultimapBuilder<Object, Object>() { // from class: com.google.common.collect.MultimapBuilder.MultimapBuilderWithKeys.4
                public final /* synthetic */ int val$expectedValuesPerKey = 2;

                public final <K, V> SetMultimap<K, V> build() {
                    return new AbstractSetMultimap<K, V>(new CompactHashMap(((AnonymousClass1) r0).val$expectedKeys), new LinkedHashSetSupplier(this.val$expectedValuesPerKey)) { // from class: com.google.common.collect.Multimaps$CustomSetMultimap
                        private static final long serialVersionUID = 0;
                        public transient Supplier<? extends Set<V>> factory;

                        @Override // com.google.common.collect.AbstractMapBasedMultimap
                        public final AbstractMapBasedMultimap.AsMap createAsMap() {
                            Map<K, Collection<V>> map = this.map;
                            if (map instanceof NavigableMap) {
                                return new AbstractMapBasedMultimap.NavigableAsMap((NavigableMap) this.map);
                            }
                            if (map instanceof SortedMap) {
                                return new AbstractMapBasedMultimap.SortedAsMap((SortedMap) this.map);
                            }
                            return new AbstractMapBasedMultimap.AsMap(this.map);
                        }

                        @Override // com.google.common.collect.AbstractMapBasedMultimap
                        public final Collection createCollection() {
                            return this.factory.get();
                        }

                        @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap
                        public final AbstractMapBasedMultimap.KeySet createKeySet() {
                            Map<K, Collection<V>> map = this.map;
                            if (map instanceof NavigableMap) {
                                return new AbstractMapBasedMultimap.NavigableKeySet((NavigableMap) this.map);
                            }
                            if (map instanceof SortedMap) {
                                return new AbstractMapBasedMultimap.SortedKeySet((SortedMap) this.map);
                            }
                            return new AbstractMapBasedMultimap.KeySet(this.map);
                        }

                        @Override // com.google.common.collect.AbstractSetMultimap, com.google.common.collect.AbstractMapBasedMultimap
                        public final <E> Collection<E> unmodifiableCollectionSubclass(Collection<E> collection) {
                            if (collection instanceof NavigableSet) {
                                return Sets.unmodifiableNavigableSet((NavigableSet) collection);
                            }
                            if (collection instanceof SortedSet) {
                                return Collections.unmodifiableSortedSet((SortedSet) collection);
                            }
                            return Collections.unmodifiableSet((Set) collection);
                        }

                        @Override // com.google.common.collect.AbstractSetMultimap, com.google.common.collect.AbstractMapBasedMultimap
                        public final Collection<V> wrapCollection(K key, Collection<V> collection) {
                            if (collection instanceof NavigableSet) {
                                return new AbstractMapBasedMultimap.WrappedNavigableSet(key, (NavigableSet) collection, null);
                            }
                            if (collection instanceof SortedSet) {
                                return new AbstractMapBasedMultimap.WrappedSortedSet(key, (SortedSet) collection, null);
                            }
                            return new AbstractMapBasedMultimap.WrappedSet(key, (Set) collection);
                        }

                        {
                            this.factory = factory;
                        }

                        private void readObject(ObjectInputStream stream) throws IOException, ClassNotFoundException {
                            stream.defaultReadObject();
                            this.factory = (Supplier) stream.readObject();
                            setMap((Map) stream.readObject());
                        }

                        private void writeObject(ObjectOutputStream stream) throws IOException {
                            stream.defaultWriteObject();
                            stream.writeObject(this.factory);
                            stream.writeObject(this.map);
                        }
                    };
                }
            }.build();
        }

        @Override // com.google.common.reflect.ClassPath.Scanner
        public final void scanJarFile(ClassLoader classloader, JarFile file) {
            Enumeration<JarEntry> entries = file.entries();
            while (entries.hasMoreElements()) {
                JarEntry nextElement = entries.nextElement();
                if (!nextElement.isDirectory() && !nextElement.getName().equals("META-INF/MANIFEST.MF")) {
                    this.resources.get(classloader).add(nextElement.getName());
                }
            }
        }

        public final void scanDirectory(File directory, ClassLoader classloader, String packagePrefix, HashSet currentPath) throws IOException {
            File[] listFiles = directory.listFiles();
            if (listFiles == null) {
                Logger logger = ClassPath.logger;
                Level level = Level.WARNING;
                String valueOf = String.valueOf(directory);
                StringBuilder sb = new StringBuilder(valueOf.length() + 22);
                sb.append("Cannot read directory ");
                sb.append(valueOf);
                logger.logp(level, "com.google.common.reflect.ClassPath$DefaultScanner", "scanDirectory", sb.toString());
                return;
            }
            for (File file : listFiles) {
                String name = file.getName();
                if (file.isDirectory()) {
                    File canonicalFile = file.getCanonicalFile();
                    if (currentPath.add(canonicalFile)) {
                        scanDirectory(canonicalFile, classloader, XMPNode$$ExternalSyntheticOutline0.m(ParseRDF$$ExternalSyntheticOutline0.m(name, ParseRDF$$ExternalSyntheticOutline0.m(packagePrefix, 1)), packagePrefix, name, "/"), currentPath);
                        currentPath.remove(canonicalFile);
                    }
                } else {
                    String valueOf2 = String.valueOf(packagePrefix);
                    String valueOf3 = String.valueOf(name);
                    String concat = valueOf3.length() != 0 ? valueOf2.concat(valueOf3) : new String(valueOf2);
                    if (!concat.equals("META-INF/MANIFEST.MF")) {
                        this.resources.get(classloader).add(concat);
                    }
                }
            }
        }
    }

    static {
        Splitter on = Splitter.on(" ");
        CLASS_PATH_ATTRIBUTE_SEPARATOR = new Splitter(on.strategy, true, on.trimmer, on.limit);
    }

    public static String getClassName(String filename) {
        return filename.substring(0, filename.length() - 6).replace('/', '.');
    }

    public static File toFile(URL url) {
        Preconditions.checkArgument(url.getProtocol().equals("file"));
        try {
            return new File(url.toURI());
        } catch (URISyntaxException unused) {
            return new File(url.getPath());
        }
    }
}
