package com.google.common.reflect;

import androidx.viewpager2.widget.FakeDrag$$ExternalSyntheticOutline0;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import com.bumptech.glide.Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;
import com.bumptech.glide.Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline1;
import com.google.common.base.Preconditions;
import com.google.common.base.Splitter;
import com.google.common.base.StandardSystemProperty;
import com.google.common.base.Supplier;
import com.google.common.collect.AbstractIndexedListIterator;
import com.google.common.collect.AbstractMapBasedMultimap;
import com.google.common.collect.AbstractSetMultimap;
import com.google.common.collect.CollectPreconditions;
import com.google.common.collect.CompactHashMap;
import com.google.common.collect.ImmutableCollection;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.MultimapBuilder$LinkedHashSetSupplier;
import com.google.common.collect.RegularImmutableList;
import com.google.common.collect.RegularImmutableSet;
import com.google.common.collect.SetMultimap;
import com.google.common.collect.SingletonImmutableSet;
import com.google.common.collect.UnmodifiableIterator;
import java.io.File;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Objects;
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
        public final Set<File> scannedUris = new HashSet();

        public static ImmutableMap<File, ClassLoader> getClassPathEntries(ClassLoader classloader) {
            Iterable iterable;
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            ClassLoader parent = classloader.getParent();
            if (parent != null) {
                linkedHashMap.putAll(getClassPathEntries(parent));
            }
            if (classloader instanceof URLClassLoader) {
                URL[] uRLs = ((URLClassLoader) classloader).getURLs();
                AbstractIndexedListIterator<Object> abstractIndexedListIterator = ImmutableList.EMPTY_ITR;
                if (uRLs.length == 0) {
                    iterable = RegularImmutableList.EMPTY;
                } else {
                    iterable = ImmutableList.construct((Object[]) uRLs.clone());
                }
            } else if (classloader.equals(ClassLoader.getSystemClassLoader())) {
                iterable = parseJavaClassPath();
            } else {
                AbstractIndexedListIterator<Object> abstractIndexedListIterator2 = ImmutableList.EMPTY_ITR;
                iterable = RegularImmutableList.EMPTY;
            }
            UnmodifiableIterator it = iterable.iterator();
            while (true) {
                AbstractIndexedListIterator abstractIndexedListIterator3 = (AbstractIndexedListIterator) it;
                if (!abstractIndexedListIterator3.hasNext()) {
                    break;
                }
                URL url = (URL) abstractIndexedListIterator3.next();
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
            ImmutableMap.Builder builder = new ImmutableMap.Builder(entrySet instanceof Collection ? entrySet.size() : 4);
            builder.putAll(entrySet);
            return builder.build();
        }

        public static URL getClassPathEntry(File jarFile, String path) throws MalformedURLException {
            return new URL(jarFile.toURI().toURL(), path);
        }

        public static ImmutableSet<File> getClassPathFromManifest(File jarFile, Manifest manifest) {
            ImmutableSet<File> immutableSet;
            Object[] objArr;
            if (manifest == null) {
                int i = ImmutableSet.$r8$clinit;
                return RegularImmutableSet.EMPTY;
            }
            int i2 = ImmutableSet.$r8$clinit;
            ImmutableSet.Builder builder = new ImmutableSet.Builder();
            String value = manifest.getMainAttributes().getValue(Attributes.Name.CLASS_PATH.toString());
            if (value != null) {
                Iterator<String> it = ((Splitter.AnonymousClass5) ClassPath.CLASS_PATH_ATTRIBUTE_SEPARATOR.split(value)).iterator();
                while (it.hasNext()) {
                    String next = it.next();
                    try {
                        URL classPathEntry = getClassPathEntry(jarFile, next);
                        if (classPathEntry.getProtocol().equals("file")) {
                            builder.add((ImmutableSet.Builder) ClassPath.toFile(classPathEntry));
                        }
                    } catch (MalformedURLException unused) {
                        Logger logger = ClassPath.logger;
                        Level level = Level.WARNING;
                        String valueOf = String.valueOf(next);
                        logger.logp(level, "com.google.common.reflect.ClassPath$Scanner", "getClassPathFromManifest", valueOf.length() != 0 ? "Invalid Class-Path entry: ".concat(valueOf) : new String("Invalid Class-Path entry: "));
                    }
                }
            }
            int i3 = builder.size;
            if (i3 != 0) {
                boolean z = false;
                if (i3 != 1) {
                    if (builder.hashTable == null || ImmutableSet.chooseTableSize(i3) != builder.hashTable.length) {
                        immutableSet = ImmutableSet.construct(builder.size, builder.contents);
                        builder.size = immutableSet.size();
                    } else {
                        int i4 = builder.size;
                        Object[] objArr2 = builder.contents;
                        int length = objArr2.length;
                        if (i4 < (length >> 1) + (length >> 2)) {
                            z = true;
                        }
                        if (z) {
                            objArr2 = Arrays.copyOf(objArr2, i4);
                        }
                        immutableSet = new RegularImmutableSet<>(objArr2, builder.hashCode, builder.hashTable, objArr.length - 1, builder.size);
                    }
                    builder.forceCopy = true;
                    builder.hashTable = null;
                    return immutableSet;
                }
                Object obj = builder.contents[0];
                int i5 = ImmutableSet.$r8$clinit;
                return new SingletonImmutableSet(obj);
            }
            int i6 = ImmutableSet.$r8$clinit;
            return RegularImmutableSet.EMPTY;
        }

        public static ImmutableList<URL> parseJavaClassPath() {
            MalformedURLException e;
            int i;
            URL url;
            MalformedURLException e2;
            AbstractIndexedListIterator<Object> abstractIndexedListIterator = ImmutableList.EMPTY_ITR;
            CollectPreconditions.checkNonnegative(4, "initialCapacity");
            Object[] objArr = new Object[4];
            Iterator<String> it = ((Splitter.AnonymousClass5) Splitter.on(StandardSystemProperty.PATH_SEPARATOR.value()).split(StandardSystemProperty.JAVA_CLASS_PATH.value())).iterator();
            int i2 = 0;
            while (it.hasNext()) {
                String next = it.next();
                try {
                    try {
                        url = new File(next).toURI().toURL();
                        try {
                            Objects.requireNonNull(url);
                            i = i2 + 1;
                            if (objArr.length < i) {
                                objArr = Arrays.copyOf(objArr, ImmutableCollection.Builder.expandedCapacity(objArr.length, i));
                            }
                        } catch (MalformedURLException e3) {
                            e2 = e3;
                            i = i2;
                        }
                    } catch (MalformedURLException e4) {
                        e = e4;
                    }
                } catch (SecurityException unused) {
                }
                try {
                    try {
                        objArr[i2] = url;
                    } catch (SecurityException unused2) {
                        i2 = i;
                        URL url2 = new URL("file", (String) null, new File(next).getAbsolutePath());
                        i = i2 + 1;
                        if (objArr.length < i) {
                            objArr = Arrays.copyOf(objArr, ImmutableCollection.Builder.expandedCapacity(objArr.length, i));
                        }
                        objArr[i2] = url2;
                        i2 = i;
                    }
                    i2 = i;
                } catch (MalformedURLException e5) {
                    e2 = e5;
                    e = e2;
                    i2 = i;
                    Logger logger = ClassPath.logger;
                    Level level = Level.WARNING;
                    String valueOf = String.valueOf(next);
                    logger.logp(level, "com.google.common.reflect.ClassPath$Scanner", "parseJavaClassPath", valueOf.length() != 0 ? "malformed classpath entry: ".concat(valueOf) : new String("malformed classpath entry: "), (Throwable) e);
                }
            }
            return ImmutableList.asImmutableList(objArr, i2);
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
                    logger.logp(level, "com.google.common.reflect.ClassPath$Scanner", "scanFrom", Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline1.m(valueOf2.length() + valueOf.length() + 16, "Cannot access ", valueOf, ": ", valueOf2));
                }
            }
        }

        public abstract void scanDirectory(ClassLoader loader, File directory) throws IOException;

        public abstract void scanJarFile(ClassLoader loader, JarFile file) throws IOException;
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

    /* loaded from: classes.dex */
    public static final class DefaultScanner extends Scanner {
        public final SetMultimap<ClassLoader, String> resources;

        public DefaultScanner() {
            CollectPreconditions.checkNonnegative(8, "expectedKeys");
            CollectPreconditions.checkNonnegative(2, "expectedValuesPerKey");
            final CompactHashMap compactHashMap = new CompactHashMap(8);
            final MultimapBuilder$LinkedHashSetSupplier multimapBuilder$LinkedHashSetSupplier = new MultimapBuilder$LinkedHashSetSupplier(2);
            this.resources = new AbstractSetMultimap<K, V>(compactHashMap, multimapBuilder$LinkedHashSetSupplier) { // from class: com.google.common.collect.Multimaps$CustomSetMultimap
                private static final long serialVersionUID = 0;
                public transient Supplier<? extends Set<V>> factory;

                {
                    Objects.requireNonNull(multimapBuilder$LinkedHashSetSupplier);
                    this.factory = multimapBuilder$LinkedHashSetSupplier;
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

                @Override // com.google.common.collect.AbstractMapBasedMultimap
                public Map<K, Collection<V>> createAsMap() {
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
                public Collection createCollection() {
                    return this.factory.get();
                }

                @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap
                public Set<K> createKeySet() {
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
                public <E> Collection<E> unmodifiableCollectionSubclass(Collection<E> collection) {
                    if (collection instanceof NavigableSet) {
                        return Sets.unmodifiableNavigableSet((NavigableSet) collection);
                    }
                    if (collection instanceof SortedSet) {
                        return Collections.unmodifiableSortedSet((SortedSet) collection);
                    }
                    return Collections.unmodifiableSet((Set) collection);
                }

                @Override // com.google.common.collect.AbstractSetMultimap, com.google.common.collect.AbstractMapBasedMultimap
                public Collection<V> wrapCollection(K key, Collection<V> collection) {
                    if (collection instanceof NavigableSet) {
                        return new AbstractMapBasedMultimap.WrappedNavigableSet(key, (NavigableSet) collection, null);
                    }
                    if (collection instanceof SortedSet) {
                        return new AbstractMapBasedMultimap.WrappedSortedSet(key, (SortedSet) collection, null);
                    }
                    return new AbstractMapBasedMultimap.WrappedSet(key, (Set) collection);
                }
            };
        }

        @Override // com.google.common.reflect.ClassPath.Scanner
        public void scanDirectory(ClassLoader classloader, File directory) throws IOException {
            HashSet hashSet = new HashSet();
            hashSet.add(directory.getCanonicalFile());
            scanDirectory(directory, classloader, "", hashSet);
        }

        @Override // com.google.common.reflect.ClassPath.Scanner
        public void scanJarFile(ClassLoader classloader, JarFile file) {
            Enumeration<JarEntry> entries = file.entries();
            while (entries.hasMoreElements()) {
                JarEntry nextElement = entries.nextElement();
                if (!nextElement.isDirectory() && !nextElement.getName().equals("META-INF/MANIFEST.MF")) {
                    ((AbstractSetMultimap) this.resources).get(classloader).add(nextElement.getName());
                }
            }
        }

        public final void scanDirectory(File directory, ClassLoader classloader, String packagePrefix, Set<File> currentPath) throws IOException {
            File[] listFiles = directory.listFiles();
            if (listFiles == null) {
                Logger logger = ClassPath.logger;
                Level level = Level.WARNING;
                String valueOf = String.valueOf(directory);
                logger.logp(level, "com.google.common.reflect.ClassPath$DefaultScanner", "scanDirectory", Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0.m(valueOf.length() + 22, "Cannot read directory ", valueOf));
                return;
            }
            for (File file : listFiles) {
                String name = file.getName();
                if (file.isDirectory()) {
                    File canonicalFile = file.getCanonicalFile();
                    if (currentPath.add(canonicalFile)) {
                        scanDirectory(canonicalFile, classloader, FakeDrag$$ExternalSyntheticOutline0.m(XMPPathFactory$$ExternalSyntheticOutline0.m(name, XMPPathFactory$$ExternalSyntheticOutline0.m(packagePrefix, 1)), packagePrefix, name, "/"), currentPath);
                        currentPath.remove(canonicalFile);
                    }
                } else {
                    String valueOf2 = String.valueOf(packagePrefix);
                    String valueOf3 = String.valueOf(name);
                    String concat = valueOf3.length() != 0 ? valueOf2.concat(valueOf3) : new String(valueOf2);
                    if (!concat.equals("META-INF/MANIFEST.MF")) {
                        ((AbstractSetMultimap) this.resources).get(classloader).add(concat);
                    }
                }
            }
        }
    }
}
