package com.google.common.collect;

import com.android.systemui.shared.system.QuickStepContract;
import com.google.common.base.Equivalence;
import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.MapMakerInternalMap.InternalEntry;
import com.google.common.collect.MapMakerInternalMap.Segment;
import com.google.common.math.IntMath;
import com.google.common.primitives.Ints;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.AbstractCollection;
import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.concurrent.locks.ReentrantLock;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class MapMakerInternalMap<K, V, E extends InternalEntry<K, V, E>, S extends Segment<K, V, E, S>> extends AbstractMap<K, V> implements ConcurrentMap<K, V>, Serializable {
    public static final AnonymousClass1 UNSET_WEAK_VALUE_REFERENCE = new WeakValueReference<Object, Object, DummyInternalEntry>() { // from class: com.google.common.collect.MapMakerInternalMap.1
        @Override // com.google.common.collect.MapMakerInternalMap.WeakValueReference
        public final void clear() {
        }

        @Override // com.google.common.collect.MapMakerInternalMap.WeakValueReference
        public final Object get() {
            return null;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.WeakValueReference
        public final /* bridge */ /* synthetic */ DummyInternalEntry getEntry() {
            return null;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.WeakValueReference
        public final WeakValueReference copyFor(ReferenceQueue queue, WeakValueEntry entry) {
            DummyInternalEntry dummyInternalEntry = (DummyInternalEntry) entry;
            return this;
        }
    };
    private static final long serialVersionUID = 5;
    public final int concurrencyLevel;
    public final transient InternalEntryHelper<K, V, E, S> entryHelper;
    public transient EntrySet entrySet;
    public final Equivalence<Object> keyEquivalence;
    public transient KeySet keySet;
    public final transient int segmentMask;
    public final transient int segmentShift;
    public final transient Segment<K, V, E, S>[] segments;
    public transient Values values;

    /* loaded from: classes.dex */
    public static abstract class AbstractSerializationProxy<K, V> extends ForwardingConcurrentMap<K, V> implements Serializable {
        private static final long serialVersionUID = 3;
        public final int concurrencyLevel;
        public transient ConcurrentMap<K, V> delegate;
        public final Equivalence<Object> keyEquivalence;
        public final Strength keyStrength;
        public final Equivalence<Object> valueEquivalence;
        public final Strength valueStrength;

        @Override // com.google.common.collect.ForwardingMap, com.google.common.collect.ForwardingObject
        /* renamed from: delegate */
        public final Object mo65delegate() {
            return this.delegate;
        }

        @Override // com.google.common.collect.ForwardingMap, com.google.common.collect.ForwardingObject
        /* renamed from: delegate  reason: collision with other method in class */
        public final Map mo65delegate() {
            return this.delegate;
        }

        public AbstractSerializationProxy(Strength keyStrength, Strength valueStrength, Equivalence<Object> keyEquivalence, Equivalence<Object> valueEquivalence, int concurrencyLevel, ConcurrentMap<K, V> delegate) {
            this.keyStrength = keyStrength;
            this.valueStrength = valueStrength;
            this.keyEquivalence = keyEquivalence;
            this.valueEquivalence = valueEquivalence;
            this.concurrencyLevel = concurrencyLevel;
            this.delegate = delegate;
        }
    }

    /* loaded from: classes.dex */
    public static final class DummyInternalEntry implements InternalEntry<Object, Object, DummyInternalEntry> {
        public DummyInternalEntry() {
            throw null;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final int getHash() {
            throw new AssertionError();
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final Object getKey() {
            throw new AssertionError();
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final DummyInternalEntry getNext() {
            throw new AssertionError();
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final Object getValue() {
            throw new AssertionError();
        }
    }

    /* loaded from: classes.dex */
    public final class EntrySet extends SafeToArraySet<Map.Entry<K, V>> {
        public EntrySet() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final void clear() {
            MapMakerInternalMap.this.clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean contains(Object o) {
            Map.Entry entry;
            Object key;
            Object obj;
            if ((o instanceof Map.Entry) && (key = (entry = (Map.Entry) o).getKey()) != null && (obj = MapMakerInternalMap.this.get(key)) != null && MapMakerInternalMap.this.valueEquivalence().equivalent(entry.getValue(), obj)) {
                return true;
            }
            return false;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean isEmpty() {
            return MapMakerInternalMap.this.isEmpty();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public final Iterator<Map.Entry<K, V>> iterator() {
            return new EntryIterator(MapMakerInternalMap.this);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean remove(Object o) {
            Map.Entry entry;
            Object key;
            if ((o instanceof Map.Entry) && (key = (entry = (Map.Entry) o).getKey()) != null && MapMakerInternalMap.this.remove(key, entry.getValue())) {
                return true;
            }
            return false;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final int size() {
            return MapMakerInternalMap.this.size();
        }
    }

    /* loaded from: classes.dex */
    public abstract class HashIterator<T> implements Iterator<T> {
        public Segment<K, V, E, S> currentSegment;
        public AtomicReferenceArray<E> currentTable;
        public MapMakerInternalMap<K, V, E, S>.WriteThroughEntry lastReturned;
        public E nextEntry;
        public MapMakerInternalMap<K, V, E, S>.WriteThroughEntry nextExternal;
        public int nextSegmentIndex;
        public int nextTableIndex = -1;

        public final void advance() {
            boolean z;
            this.nextExternal = null;
            E e = this.nextEntry;
            if (e != null) {
                while (true) {
                    E e2 = (E) e.getNext();
                    this.nextEntry = e2;
                    if (e2 == null) {
                        break;
                    } else if (advanceTo(e2)) {
                        z = true;
                        break;
                    } else {
                        e = this.nextEntry;
                    }
                }
            }
            z = false;
            if (!z && !nextInTable()) {
                while (true) {
                    int i = this.nextSegmentIndex;
                    if (i >= 0) {
                        Segment<K, V, E, S>[] segmentArr = MapMakerInternalMap.this.segments;
                        this.nextSegmentIndex = i - 1;
                        Segment<K, V, E, S> segment = segmentArr[i];
                        this.currentSegment = segment;
                        if (segment.count != 0) {
                            AtomicReferenceArray<E> atomicReferenceArray = this.currentSegment.table;
                            this.currentTable = atomicReferenceArray;
                            this.nextTableIndex = atomicReferenceArray.length() - 1;
                            if (nextInTable()) {
                                return;
                            }
                        }
                    } else {
                        return;
                    }
                }
            }
        }

        public HashIterator() {
            this.nextSegmentIndex = MapMakerInternalMap.this.segments.length - 1;
            advance();
        }

        @Override // java.util.Iterator
        public final boolean hasNext() {
            if (this.nextExternal != null) {
                return true;
            }
            return false;
        }

        public final MapMakerInternalMap<K, V, E, S>.WriteThroughEntry nextEntry() {
            MapMakerInternalMap<K, V, E, S>.WriteThroughEntry writeThroughEntry = this.nextExternal;
            if (writeThroughEntry != null) {
                this.lastReturned = writeThroughEntry;
                advance();
                return this.lastReturned;
            }
            throw new NoSuchElementException();
        }

        public final boolean nextInTable() {
            while (true) {
                int i = this.nextTableIndex;
                boolean z = false;
                if (i < 0) {
                    return false;
                }
                AtomicReferenceArray<E> atomicReferenceArray = this.currentTable;
                this.nextTableIndex = i - 1;
                E e = atomicReferenceArray.get(i);
                this.nextEntry = e;
                if (e != null) {
                    if (advanceTo(e)) {
                        break;
                    }
                    E e2 = this.nextEntry;
                    if (e2 != null) {
                        while (true) {
                            E e3 = (E) e2.getNext();
                            this.nextEntry = e3;
                            if (e3 == null) {
                                break;
                            } else if (advanceTo(e3)) {
                                z = true;
                                break;
                            } else {
                                e2 = this.nextEntry;
                            }
                        }
                    }
                    if (z) {
                        break;
                    }
                }
            }
            return true;
        }

        @Override // java.util.Iterator
        public final void remove() {
            boolean z;
            if (this.lastReturned != null) {
                z = true;
            } else {
                z = false;
            }
            CollectPreconditions.checkRemove(z);
            MapMakerInternalMap.this.remove(this.lastReturned.key);
            this.lastReturned = null;
        }

        public final boolean advanceTo(E entry) {
            Object obj;
            boolean z;
            try {
                Object key = entry.getKey();
                MapMakerInternalMap.this.getClass();
                if (entry.getKey() == null) {
                    obj = null;
                } else {
                    obj = entry.getValue();
                }
                if (obj != null) {
                    this.nextExternal = new WriteThroughEntry(key, obj);
                    z = true;
                } else {
                    z = false;
                }
                return z;
            } finally {
                this.currentSegment.postReadCleanup();
            }
        }
    }

    /* loaded from: classes.dex */
    public interface InternalEntry<K, V, E extends InternalEntry<K, V, E>> {
        int getHash();

        K getKey();

        E getNext();

        V getValue();
    }

    /* loaded from: classes.dex */
    public interface InternalEntryHelper<K, V, E extends InternalEntry<K, V, E>, S extends Segment<K, V, E, S>> {
        E copy(S segment, E entry, E newNext);

        Strength keyStrength();

        E newEntry(S segment, K key, int hash, E next);

        Segment newSegment(MapMakerInternalMap mapMakerInternalMap, int i);

        void setValue(S segment, E entry, V value);

        Strength valueStrength();
    }

    /* loaded from: classes.dex */
    public final class KeySet extends SafeToArraySet<K> {
        public KeySet() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final void clear() {
            MapMakerInternalMap.this.clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean contains(Object o) {
            return MapMakerInternalMap.this.containsKey(o);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean isEmpty() {
            return MapMakerInternalMap.this.isEmpty();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public final Iterator<K> iterator() {
            return new KeyIterator(MapMakerInternalMap.this);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean remove(Object o) {
            if (MapMakerInternalMap.this.remove(o) != null) {
                return true;
            }
            return false;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final int size() {
            return MapMakerInternalMap.this.size();
        }
    }

    /* loaded from: classes.dex */
    public static abstract class SafeToArraySet<E> extends AbstractSet<E> {
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final Object[] toArray() {
            return MapMakerInternalMap.access$900(this).toArray();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final <T> T[] toArray(T[] a) {
            return (T[]) MapMakerInternalMap.access$900(this).toArray(a);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class Segment<K, V, E extends InternalEntry<K, V, E>, S extends Segment<K, V, E, S>> extends ReentrantLock {
        public static final /* synthetic */ int $r8$clinit = 0;
        public volatile int count;
        public final MapMakerInternalMap<K, V, E, S> map;
        public int modCount;
        public volatile AtomicReferenceArray<E> table;
        public int threshold;
        public final AtomicInteger readCount = new AtomicInteger();
        public final int maxSegmentSize = -1;

        public abstract E castForTesting(InternalEntry<K, V, ?> entry);

        /* JADX WARN: Finally extract failed */
        public final void drainKeyReferenceQueue(ReferenceQueue<K> keyReferenceQueue) {
            int i = 0;
            do {
                Reference<? extends K> poll = keyReferenceQueue.poll();
                if (poll != null) {
                    InternalEntry internalEntry = (InternalEntry) poll;
                    MapMakerInternalMap<K, V, E, S> mapMakerInternalMap = this.map;
                    mapMakerInternalMap.getClass();
                    int hash = internalEntry.getHash();
                    Segment<K, V, E, S> segmentFor = mapMakerInternalMap.segmentFor(hash);
                    segmentFor.lock();
                    try {
                        AtomicReferenceArray<E> atomicReferenceArray = segmentFor.table;
                        int length = hash & (atomicReferenceArray.length() - 1);
                        E e = atomicReferenceArray.get(length);
                        InternalEntry internalEntry2 = e;
                        while (true) {
                            if (internalEntry2 == null) {
                                break;
                            } else if (internalEntry2 == internalEntry) {
                                segmentFor.modCount++;
                                atomicReferenceArray.set(length, segmentFor.removeFromChain(e, internalEntry2));
                                segmentFor.count--;
                                break;
                            } else {
                                internalEntry2 = internalEntry2.getNext();
                            }
                        }
                        segmentFor.unlock();
                        i++;
                    } catch (Throwable th) {
                        segmentFor.unlock();
                        throw th;
                    }
                } else {
                    return;
                }
            } while (i != 16);
        }

        /* JADX WARN: Finally extract failed */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r8v7 */
        public final void drainValueReferenceQueue(ReferenceQueue<V> valueReferenceQueue) {
            int i = 0;
            do {
                Reference<? extends V> poll = valueReferenceQueue.poll();
                if (poll != null) {
                    WeakValueReference<K, V, E> weakValueReference = (WeakValueReference) poll;
                    MapMakerInternalMap<K, V, E, S> mapMakerInternalMap = this.map;
                    mapMakerInternalMap.getClass();
                    E entry = weakValueReference.getEntry();
                    int hash = entry.getHash();
                    Segment<K, V, E, S> segmentFor = mapMakerInternalMap.segmentFor(hash);
                    Object key = entry.getKey();
                    segmentFor.lock();
                    try {
                        AtomicReferenceArray<E> atomicReferenceArray = segmentFor.table;
                        int length = (atomicReferenceArray.length() - 1) & hash;
                        E e = atomicReferenceArray.get(length);
                        E e2 = e;
                        while (true) {
                            if (e2 == null) {
                                break;
                            }
                            Object key2 = e2.getKey();
                            if (e2.getHash() != hash || key2 == null || !segmentFor.map.keyEquivalence.equivalent(key, key2)) {
                                e2 = (E) e2.getNext();
                            } else if (e2.getValueReference() == weakValueReference) {
                                segmentFor.modCount++;
                                atomicReferenceArray.set(length, segmentFor.removeFromChain(e, e2));
                                segmentFor.count--;
                            }
                        }
                        segmentFor.unlock();
                        i++;
                    } catch (Throwable th) {
                        segmentFor.unlock();
                        throw th;
                    }
                } else {
                    return;
                }
            } while (i != 16);
        }

        public void maybeClearReferenceQueues() {
        }

        public void maybeDrainReferenceQueues() {
        }

        public abstract S self();

        /* JADX WARN: Finally extract failed */
        /* JADX WARN: Multi-variable type inference failed */
        public boolean containsValue(Object value) {
            try {
                if (this.count != 0) {
                    AtomicReferenceArray<E> atomicReferenceArray = this.table;
                    int length = atomicReferenceArray.length();
                    for (int i = 0; i < length; i++) {
                        for (E e = atomicReferenceArray.get(i); e != null; e = e.getNext()) {
                            Object liveValue = getLiveValue(e);
                            if (liveValue != null && this.map.valueEquivalence().equivalent(value, liveValue)) {
                                postReadCleanup();
                                return true;
                            }
                        }
                    }
                }
                postReadCleanup();
                return false;
            } catch (Throwable th) {
                postReadCleanup();
                throw th;
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        public final void expand() {
            AtomicReferenceArray<E> atomicReferenceArray = this.table;
            int length = atomicReferenceArray.length();
            if (length < 1073741824) {
                int i = this.count;
                AtomicReferenceArray<E> atomicReferenceArray2 = (AtomicReferenceArray<E>) new AtomicReferenceArray(length << 1);
                this.threshold = (atomicReferenceArray2.length() * 3) / 4;
                int length2 = atomicReferenceArray2.length() - 1;
                for (int i2 = 0; i2 < length; i2++) {
                    E e = atomicReferenceArray.get(i2);
                    if (e != null) {
                        InternalEntry next = e.getNext();
                        int hash = e.getHash() & length2;
                        if (next == null) {
                            atomicReferenceArray2.set(hash, e);
                        } else {
                            InternalEntry internalEntry = e;
                            while (next != null) {
                                int hash2 = next.getHash() & length2;
                                if (hash2 != hash) {
                                    internalEntry = next;
                                    hash = hash2;
                                }
                                next = next.getNext();
                            }
                            atomicReferenceArray2.set(hash, internalEntry);
                            while (e != internalEntry) {
                                int hash3 = e.getHash() & length2;
                                InternalEntry copy = this.map.entryHelper.copy(self(), e, (InternalEntry) atomicReferenceArray2.get(hash3));
                                if (copy != null) {
                                    atomicReferenceArray2.set(hash3, copy);
                                } else {
                                    i--;
                                }
                                e = e.getNext();
                            }
                        }
                    }
                }
                this.table = atomicReferenceArray2;
                this.count = i;
            }
        }

        public final E getLiveEntry(Object key, int hash) {
            if (this.count != 0) {
                AtomicReferenceArray<E> atomicReferenceArray = this.table;
                for (E e = atomicReferenceArray.get((atomicReferenceArray.length() - 1) & hash); e != null; e = (E) e.getNext()) {
                    if (e.getHash() == hash) {
                        Object key2 = e.getKey();
                        if (key2 == null) {
                            tryDrainReferenceQueues();
                        } else if (this.map.keyEquivalence.equivalent(key, key2)) {
                            return e;
                        }
                    }
                }
            }
            return null;
        }

        public final void postReadCleanup() {
            if ((this.readCount.incrementAndGet() & 63) == 0) {
                runLockedCleanup();
            }
        }

        public final E removeFromChain(E first, E entry) {
            int i = this.count;
            E e = (E) entry.getNext();
            while (first != entry) {
                E copy = this.map.entryHelper.copy(self(), first, e);
                if (copy != null) {
                    e = copy;
                } else {
                    i--;
                }
                first = (E) first.getNext();
            }
            this.count = i;
            return e;
        }

        public final void setValue(E entry, V value) {
            this.map.entryHelper.setValue(self(), entry, value);
        }

        public Segment(MapMakerInternalMap mapMakerInternalMap, int i) {
            this.map = mapMakerInternalMap;
            AtomicReferenceArray<E> atomicReferenceArray = new AtomicReferenceArray<>(i);
            int length = (atomicReferenceArray.length() * 3) / 4;
            this.threshold = length;
            if (length == -1) {
                this.threshold = length + 1;
            }
            this.table = atomicReferenceArray;
        }

        public final V getLiveValue(E entry) {
            if (entry.getKey() == null) {
                tryDrainReferenceQueues();
                return null;
            }
            V v = (V) entry.getValue();
            if (v != null) {
                return v;
            }
            tryDrainReferenceQueues();
            return null;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public final V put(K key, int hash, V value, boolean onlyIfAbsent) {
            lock();
            try {
                runLockedCleanup();
                int i = this.count + 1;
                if (i > this.threshold) {
                    expand();
                    i = this.count + 1;
                }
                AtomicReferenceArray<E> atomicReferenceArray = this.table;
                int length = (atomicReferenceArray.length() - 1) & hash;
                E e = atomicReferenceArray.get(length);
                for (InternalEntry internalEntry = e; internalEntry != null; internalEntry = internalEntry.getNext()) {
                    Object key2 = internalEntry.getKey();
                    if (internalEntry.getHash() == hash && key2 != null && this.map.keyEquivalence.equivalent(key, key2)) {
                        V v = (V) internalEntry.getValue();
                        if (v == null) {
                            this.modCount++;
                            setValue(internalEntry, value);
                            this.count = this.count;
                            return null;
                        } else if (onlyIfAbsent) {
                            return v;
                        } else {
                            this.modCount++;
                            setValue(internalEntry, value);
                            return v;
                        }
                    }
                }
                this.modCount++;
                E newEntry = this.map.entryHelper.newEntry(self(), key, hash, e);
                setValue(newEntry, value);
                atomicReferenceArray.set(length, newEntry);
                this.count = i;
                return null;
            } finally {
                unlock();
            }
        }

        public final void runLockedCleanup() {
            if (tryLock()) {
                try {
                    maybeDrainReferenceQueues();
                    this.readCount.set(0);
                } finally {
                    unlock();
                }
            }
        }

        public final void tryDrainReferenceQueues() {
            if (tryLock()) {
                try {
                    maybeDrainReferenceQueues();
                } finally {
                    unlock();
                }
            }
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier removed */
    /* loaded from: classes.dex */
    public static abstract class Strength extends Enum<Strength> {
        public static final /* synthetic */ Strength[] $VALUES;
        public static final AnonymousClass1 STRONG;
        public static final AnonymousClass2 WEAK;

        public Strength() {
            throw null;
        }

        public Strength(String str, int i) {
        }

        public abstract Equivalence<Object> defaultEquivalence();

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v0, types: [com.google.common.collect.MapMakerInternalMap$Strength$1] */
        /* JADX WARN: Type inference failed for: r1v0, types: [com.google.common.collect.MapMakerInternalMap$Strength$2] */
        static {
            ?? r0 = new Strength() { // from class: com.google.common.collect.MapMakerInternalMap.Strength.1
                @Override // com.google.common.collect.MapMakerInternalMap.Strength
                public final Equivalence<Object> defaultEquivalence() {
                    return Equivalence.equals();
                }
            };
            STRONG = r0;
            ?? r1 = new Strength() { // from class: com.google.common.collect.MapMakerInternalMap.Strength.2
                @Override // com.google.common.collect.MapMakerInternalMap.Strength
                public final Equivalence<Object> defaultEquivalence() {
                    return Equivalence.identity();
                }
            };
            WEAK = r1;
            $VALUES = new Strength[]{r0, r1};
        }

        public static Strength valueOf(String name) {
            return (Strength) Enum.valueOf(Strength.class, name);
        }

        public static Strength[] values() {
            return (Strength[]) $VALUES.clone();
        }
    }

    /* loaded from: classes.dex */
    public static final class StrongKeyWeakValueEntry<K, V> extends AbstractStrongKeyEntry<K, V, StrongKeyWeakValueEntry<K, V>> implements WeakValueEntry<K, V, StrongKeyWeakValueEntry<K, V>> {
        public volatile WeakValueReference<K, V, StrongKeyWeakValueEntry<K, V>> valueReference = MapMakerInternalMap.UNSET_WEAK_VALUE_REFERENCE;

        /* loaded from: classes.dex */
        public static final class Helper<K, V> implements InternalEntryHelper<K, V, StrongKeyWeakValueEntry<K, V>, StrongKeyWeakValueSegment<K, V>> {
            public static final Helper<?, ?> INSTANCE = new Helper<>();

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final InternalEntry copy(Segment segment, InternalEntry entry, InternalEntry newNext) {
                boolean z;
                StrongKeyWeakValueSegment strongKeyWeakValueSegment = (StrongKeyWeakValueSegment) segment;
                StrongKeyWeakValueEntry strongKeyWeakValueEntry = (StrongKeyWeakValueEntry) entry;
                StrongKeyWeakValueEntry strongKeyWeakValueEntry2 = (StrongKeyWeakValueEntry) newNext;
                int i = Segment.$r8$clinit;
                if (strongKeyWeakValueEntry.getValue() == null) {
                    z = true;
                } else {
                    z = false;
                }
                if (z) {
                    return null;
                }
                ReferenceQueue referenceQueue = strongKeyWeakValueSegment.queueForValues;
                StrongKeyWeakValueEntry strongKeyWeakValueEntry3 = new StrongKeyWeakValueEntry(strongKeyWeakValueEntry.key, strongKeyWeakValueEntry.hash, strongKeyWeakValueEntry2);
                strongKeyWeakValueEntry3.valueReference = strongKeyWeakValueEntry.valueReference.copyFor(referenceQueue, strongKeyWeakValueEntry3);
                return strongKeyWeakValueEntry3;
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final InternalEntry newEntry(Segment segment, Object key, int hash, InternalEntry next) {
                StrongKeyWeakValueSegment strongKeyWeakValueSegment = (StrongKeyWeakValueSegment) segment;
                return new StrongKeyWeakValueEntry(key, hash, (StrongKeyWeakValueEntry) next);
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final Segment newSegment(MapMakerInternalMap mapMakerInternalMap, int i) {
                return new StrongKeyWeakValueSegment(mapMakerInternalMap, i);
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final void setValue(Segment segment, InternalEntry entry, Object value) {
                StrongKeyWeakValueEntry strongKeyWeakValueEntry = (StrongKeyWeakValueEntry) entry;
                ReferenceQueue referenceQueue = ((StrongKeyWeakValueSegment) segment).queueForValues;
                WeakValueReference<K, V, StrongKeyWeakValueEntry<K, V>> weakValueReference = strongKeyWeakValueEntry.valueReference;
                strongKeyWeakValueEntry.valueReference = new WeakValueReferenceImpl(referenceQueue, value, strongKeyWeakValueEntry);
                weakValueReference.clear();
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final Strength keyStrength() {
                return Strength.STRONG;
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final Strength valueStrength() {
                return Strength.WEAK;
            }
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final V getValue() {
            return this.valueReference.get();
        }

        public StrongKeyWeakValueEntry(K key, int hash, StrongKeyWeakValueEntry<K, V> next) {
            super(key, hash, next);
        }

        @Override // com.google.common.collect.MapMakerInternalMap.WeakValueEntry
        public final WeakValueReference<K, V, StrongKeyWeakValueEntry<K, V>> getValueReference() {
            return this.valueReference;
        }
    }

    /* loaded from: classes.dex */
    public static final class StrongKeyWeakValueSegment<K, V> extends Segment<K, V, StrongKeyWeakValueEntry<K, V>, StrongKeyWeakValueSegment<K, V>> {
        private final ReferenceQueue<V> queueForValues = new ReferenceQueue<>();

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final Segment self() {
            return this;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final void maybeClearReferenceQueues() {
            do {
            } while (this.queueForValues.poll() != null);
        }

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final void maybeDrainReferenceQueues() {
            drainValueReferenceQueue(this.queueForValues);
        }

        public StrongKeyWeakValueSegment(MapMakerInternalMap mapMakerInternalMap, int i) {
            super(mapMakerInternalMap, i);
        }

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final InternalEntry castForTesting(InternalEntry entry) {
            return (StrongKeyWeakValueEntry) entry;
        }
    }

    /* loaded from: classes.dex */
    public final class Values extends AbstractCollection<V> {
        @Override // java.util.AbstractCollection, java.util.Collection
        public final Object[] toArray() {
            return MapMakerInternalMap.access$900(this).toArray();
        }

        public Values() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final void clear() {
            MapMakerInternalMap.this.clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final boolean contains(Object o) {
            return MapMakerInternalMap.this.containsValue(o);
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final boolean isEmpty() {
            return MapMakerInternalMap.this.isEmpty();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public final Iterator<V> iterator() {
            return new ValueIterator(MapMakerInternalMap.this);
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final int size() {
            return MapMakerInternalMap.this.size();
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final <T> T[] toArray(T[] a) {
            return (T[]) MapMakerInternalMap.access$900(this).toArray(a);
        }
    }

    /* loaded from: classes.dex */
    public static final class WeakKeyStrongValueSegment<K, V> extends Segment<K, V, WeakKeyStrongValueEntry<K, V>, WeakKeyStrongValueSegment<K, V>> {
        private final ReferenceQueue<K> queueForKeys = new ReferenceQueue<>();

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final Segment self() {
            return this;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final void maybeClearReferenceQueues() {
            do {
            } while (this.queueForKeys.poll() != null);
        }

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final void maybeDrainReferenceQueues() {
            drainKeyReferenceQueue(this.queueForKeys);
        }

        public WeakKeyStrongValueSegment(MapMakerInternalMap mapMakerInternalMap, int i) {
            super(mapMakerInternalMap, i);
        }

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final InternalEntry castForTesting(InternalEntry entry) {
            return (WeakKeyStrongValueEntry) entry;
        }
    }

    /* loaded from: classes.dex */
    public static final class WeakKeyWeakValueEntry<K, V> extends AbstractWeakKeyEntry<K, V, WeakKeyWeakValueEntry<K, V>> implements WeakValueEntry<K, V, WeakKeyWeakValueEntry<K, V>> {
        public volatile WeakValueReference<K, V, WeakKeyWeakValueEntry<K, V>> valueReference = MapMakerInternalMap.UNSET_WEAK_VALUE_REFERENCE;

        /* loaded from: classes.dex */
        public static final class Helper<K, V> implements InternalEntryHelper<K, V, WeakKeyWeakValueEntry<K, V>, WeakKeyWeakValueSegment<K, V>> {
            public static final Helper<?, ?> INSTANCE = new Helper<>();

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final InternalEntry copy(Segment segment, InternalEntry entry, InternalEntry newNext) {
                boolean z;
                WeakKeyWeakValueSegment weakKeyWeakValueSegment = (WeakKeyWeakValueSegment) segment;
                WeakKeyWeakValueEntry weakKeyWeakValueEntry = (WeakKeyWeakValueEntry) entry;
                WeakKeyWeakValueEntry weakKeyWeakValueEntry2 = (WeakKeyWeakValueEntry) newNext;
                if (weakKeyWeakValueEntry.get() != null) {
                    int i = Segment.$r8$clinit;
                    if (weakKeyWeakValueEntry.getValue() == null) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (!z) {
                        ReferenceQueue referenceQueue = weakKeyWeakValueSegment.queueForKeys;
                        ReferenceQueue referenceQueue2 = weakKeyWeakValueSegment.queueForValues;
                        WeakKeyWeakValueEntry weakKeyWeakValueEntry3 = new WeakKeyWeakValueEntry(referenceQueue, weakKeyWeakValueEntry.get(), weakKeyWeakValueEntry.hash, weakKeyWeakValueEntry2);
                        weakKeyWeakValueEntry3.valueReference = weakKeyWeakValueEntry.valueReference.copyFor(referenceQueue2, weakKeyWeakValueEntry3);
                        return weakKeyWeakValueEntry3;
                    }
                }
                return null;
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final InternalEntry newEntry(Segment segment, Object key, int hash, InternalEntry next) {
                return new WeakKeyWeakValueEntry(((WeakKeyWeakValueSegment) segment).queueForKeys, key, hash, (WeakKeyWeakValueEntry) next);
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final Segment newSegment(MapMakerInternalMap mapMakerInternalMap, int i) {
                return new WeakKeyWeakValueSegment(mapMakerInternalMap, i);
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final void setValue(Segment segment, InternalEntry entry, Object value) {
                WeakKeyWeakValueEntry weakKeyWeakValueEntry = (WeakKeyWeakValueEntry) entry;
                ReferenceQueue referenceQueue = ((WeakKeyWeakValueSegment) segment).queueForValues;
                WeakValueReference<K, V, WeakKeyWeakValueEntry<K, V>> weakValueReference = weakKeyWeakValueEntry.valueReference;
                weakKeyWeakValueEntry.valueReference = new WeakValueReferenceImpl(referenceQueue, value, weakKeyWeakValueEntry);
                weakValueReference.clear();
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final Strength keyStrength() {
                return Strength.WEAK;
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final Strength valueStrength() {
                return Strength.WEAK;
            }
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final V getValue() {
            return this.valueReference.get();
        }

        public WeakKeyWeakValueEntry(ReferenceQueue<K> queue, K key, int hash, WeakKeyWeakValueEntry<K, V> next) {
            super(queue, key, hash, next);
        }

        @Override // com.google.common.collect.MapMakerInternalMap.WeakValueEntry
        public final WeakValueReference<K, V, WeakKeyWeakValueEntry<K, V>> getValueReference() {
            return this.valueReference;
        }
    }

    /* loaded from: classes.dex */
    public static final class WeakKeyWeakValueSegment<K, V> extends Segment<K, V, WeakKeyWeakValueEntry<K, V>, WeakKeyWeakValueSegment<K, V>> {
        private final ReferenceQueue<K> queueForKeys = new ReferenceQueue<>();
        private final ReferenceQueue<V> queueForValues = new ReferenceQueue<>();

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final Segment self() {
            return this;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final void maybeClearReferenceQueues() {
            do {
            } while (this.queueForKeys.poll() != null);
        }

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final void maybeDrainReferenceQueues() {
            drainKeyReferenceQueue(this.queueForKeys);
            drainValueReferenceQueue(this.queueForValues);
        }

        public WeakKeyWeakValueSegment(MapMakerInternalMap mapMakerInternalMap, int i) {
            super(mapMakerInternalMap, i);
        }

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final InternalEntry castForTesting(InternalEntry entry) {
            return (WeakKeyWeakValueEntry) entry;
        }
    }

    /* loaded from: classes.dex */
    public interface WeakValueEntry<K, V, E extends InternalEntry<K, V, E>> extends InternalEntry<K, V, E> {
        WeakValueReference<K, V, E> getValueReference();
    }

    /* loaded from: classes.dex */
    public interface WeakValueReference<K, V, E extends InternalEntry<K, V, E>> {
        void clear();

        WeakValueReference copyFor(ReferenceQueue queue, WeakValueEntry entry);

        V get();

        E getEntry();
    }

    /* loaded from: classes.dex */
    public static final class WeakValueReferenceImpl<K, V, E extends InternalEntry<K, V, E>> extends WeakReference<V> implements WeakValueReference<K, V, E> {
        public final E entry;

        @Override // com.google.common.collect.MapMakerInternalMap.WeakValueReference
        public final WeakValueReference copyFor(ReferenceQueue queue, WeakValueEntry entry) {
            return new WeakValueReferenceImpl(queue, get(), entry);
        }

        public WeakValueReferenceImpl(ReferenceQueue<V> queue, V referent, E entry) {
            super(referent, queue);
            this.entry = entry;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.WeakValueReference
        public final E getEntry() {
            return this.entry;
        }
    }

    /* loaded from: classes.dex */
    public final class WriteThroughEntry extends AbstractMapEntry<K, V> {
        public final K key;
        public V value;

        public WriteThroughEntry(K key, V value) {
            this.key = key;
            this.value = value;
        }

        @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
        public final boolean equals(Object object) {
            if (!(object instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry) object;
            if (!this.key.equals(entry.getKey()) || !this.value.equals(entry.getValue())) {
                return false;
            }
            return true;
        }

        @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
        public final int hashCode() {
            return this.value.hashCode() ^ this.key.hashCode();
        }

        @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
        public final V setValue(V newValue) {
            V v = (V) MapMakerInternalMap.this.put(this.key, newValue);
            this.value = newValue;
            return v;
        }

        @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
        public final K getKey() {
            return this.key;
        }

        @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
        public final V getValue() {
            return this.value;
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object key) {
        E liveEntry;
        boolean z = false;
        if (key == null) {
            return false;
        }
        int hash = hash(key);
        Segment<K, V, E, S> segmentFor = segmentFor(hash);
        segmentFor.getClass();
        try {
            if (!(segmentFor.count == 0 || (liveEntry = segmentFor.getLiveEntry(key, hash)) == null)) {
                if (liveEntry.getValue() != null) {
                    z = true;
                }
            }
            return z;
        } finally {
            segmentFor.postReadCleanup();
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final V get(Object key) {
        V v = null;
        if (key == null) {
            return null;
        }
        int hash = hash(key);
        Segment<K, V, E, S> segmentFor = segmentFor(hash);
        segmentFor.getClass();
        try {
            E liveEntry = segmentFor.getLiveEntry(key, hash);
            if (liveEntry != null && (v = (V) liveEntry.getValue()) == null) {
                segmentFor.tryDrainReferenceQueues();
            }
            return v;
        } finally {
            segmentFor.postReadCleanup();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x003a, code lost:
        r10 = (V) r6.getValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x003e, code lost:
        if (r10 == null) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0045, code lost:
        if (r6.getValue() != null) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0047, code lost:
        r1 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0049, code lost:
        r1 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x004a, code lost:
        if (r1 == false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x004c, code lost:
        r9.modCount++;
        r2.set(r3, r9.removeFromChain(r5, r6));
        r9.count--;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:?, code lost:
        return r10;
     */
    @Override // java.util.AbstractMap, java.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final V remove(java.lang.Object r10) {
        /*
            r9 = this;
            r0 = 0
            if (r10 != 0) goto L4
            return r0
        L4:
            int r1 = r9.hash(r10)
            com.google.common.collect.MapMakerInternalMap$Segment r9 = r9.segmentFor(r1)
            r9.lock()
            r9.runLockedCleanup()     // Catch: java.lang.Throwable -> L6b
            java.util.concurrent.atomic.AtomicReferenceArray<E extends com.google.common.collect.MapMakerInternalMap$InternalEntry<K, V, E>> r2 = r9.table     // Catch: java.lang.Throwable -> L6b
            int r3 = r2.length()     // Catch: java.lang.Throwable -> L6b
            r4 = 1
            int r3 = r3 - r4
            r3 = r3 & r1
            java.lang.Object r5 = r2.get(r3)     // Catch: java.lang.Throwable -> L6b
            com.google.common.collect.MapMakerInternalMap$InternalEntry r5 = (com.google.common.collect.MapMakerInternalMap.InternalEntry) r5     // Catch: java.lang.Throwable -> L6b
            r6 = r5
        L22:
            if (r6 == 0) goto L67
            java.lang.Object r7 = r6.getKey()     // Catch: java.lang.Throwable -> L6b
            int r8 = r6.getHash()     // Catch: java.lang.Throwable -> L6b
            if (r8 != r1) goto L62
            if (r7 == 0) goto L62
            com.google.common.collect.MapMakerInternalMap<K, V, E extends com.google.common.collect.MapMakerInternalMap$InternalEntry<K, V, E>, S extends com.google.common.collect.MapMakerInternalMap$Segment<K, V, E, S>> r8 = r9.map     // Catch: java.lang.Throwable -> L6b
            com.google.common.base.Equivalence<java.lang.Object> r8 = r8.keyEquivalence     // Catch: java.lang.Throwable -> L6b
            boolean r7 = r8.equivalent(r10, r7)     // Catch: java.lang.Throwable -> L6b
            if (r7 == 0) goto L62
            java.lang.Object r10 = r6.getValue()     // Catch: java.lang.Throwable -> L6b
            if (r10 == 0) goto L41
            goto L4c
        L41:
            java.lang.Object r1 = r6.getValue()     // Catch: java.lang.Throwable -> L6b
            if (r1 != 0) goto L49
            r1 = r4
            goto L4a
        L49:
            r1 = 0
        L4a:
            if (r1 == 0) goto L67
        L4c:
            int r0 = r9.modCount     // Catch: java.lang.Throwable -> L6b
            int r0 = r0 + r4
            r9.modCount = r0     // Catch: java.lang.Throwable -> L6b
            com.google.common.collect.MapMakerInternalMap$InternalEntry r0 = r9.removeFromChain(r5, r6)     // Catch: java.lang.Throwable -> L6b
            int r1 = r9.count     // Catch: java.lang.Throwable -> L6b
            int r1 = r1 - r4
            r2.set(r3, r0)     // Catch: java.lang.Throwable -> L6b
            r9.count = r1     // Catch: java.lang.Throwable -> L6b
            r9.unlock()
            r0 = r10
            goto L6a
        L62:
            com.google.common.collect.MapMakerInternalMap$InternalEntry r6 = r6.getNext()     // Catch: java.lang.Throwable -> L6b
            goto L22
        L67:
            r9.unlock()
        L6a:
            return r0
        L6b:
            r10 = move-exception
            r9.unlock()
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.common.collect.MapMakerInternalMap.remove(java.lang.Object):java.lang.Object");
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    public final V replace(K key, V value) {
        key.getClass();
        value.getClass();
        int hash = hash(key);
        Segment<K, V, E, S> segmentFor = segmentFor(hash);
        segmentFor.lock();
        try {
            segmentFor.runLockedCleanup();
            AtomicReferenceArray<E> atomicReferenceArray = segmentFor.table;
            int length = (atomicReferenceArray.length() - 1) & hash;
            E e = atomicReferenceArray.get(length);
            E e2 = e;
            while (true) {
                if (e2 == null) {
                    break;
                }
                Object key2 = e2.getKey();
                if (e2.getHash() != hash || key2 == null || !segmentFor.map.keyEquivalence.equivalent(key, key2)) {
                    e2 = (E) e2.getNext();
                } else {
                    V v = (V) e2.getValue();
                    if (v == null) {
                        if (e2.getValue() == null) {
                            segmentFor.modCount++;
                            atomicReferenceArray.set(length, segmentFor.removeFromChain(e, e2));
                            segmentFor.count--;
                        }
                    } else {
                        segmentFor.modCount++;
                        segmentFor.setValue(e2, value);
                        return v;
                    }
                }
            }
            return null;
        } finally {
            segmentFor.unlock();
        }
    }

    /* loaded from: classes.dex */
    public static abstract class AbstractStrongKeyEntry<K, V, E extends InternalEntry<K, V, E>> implements InternalEntry<K, V, E> {
        public final int hash;
        public final K key;
        public final E next;

        public AbstractStrongKeyEntry(K key, int hash, E next) {
            this.key = key;
            this.hash = hash;
            this.next = next;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final int getHash() {
            return this.hash;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final K getKey() {
            return this.key;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final E getNext() {
            return this.next;
        }
    }

    /* loaded from: classes.dex */
    public static abstract class AbstractWeakKeyEntry<K, V, E extends InternalEntry<K, V, E>> extends WeakReference<K> implements InternalEntry<K, V, E> {
        public final int hash;
        public final E next;

        public AbstractWeakKeyEntry(ReferenceQueue<K> queue, K key, int hash, E next) {
            super(key, queue);
            this.hash = hash;
            this.next = next;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final K getKey() {
            return get();
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final int getHash() {
            return this.hash;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final E getNext() {
            return this.next;
        }
    }

    /* loaded from: classes.dex */
    public final class EntryIterator extends MapMakerInternalMap<K, V, E, S>.HashIterator<Map.Entry<K, V>> {
        @Override // java.util.Iterator
        public final Object next() {
            return nextEntry();
        }

        public EntryIterator(final MapMakerInternalMap this$0) {
            super();
        }
    }

    /* loaded from: classes.dex */
    public final class KeyIterator extends MapMakerInternalMap<K, V, E, S>.HashIterator<K> {
        @Override // java.util.Iterator
        public final K next() {
            return nextEntry().key;
        }

        public KeyIterator(final MapMakerInternalMap this$0) {
            super();
        }
    }

    /* loaded from: classes.dex */
    public static final class SerializationProxy<K, V> extends AbstractSerializationProxy<K, V> {
        private static final long serialVersionUID = 3;

        /* JADX WARN: Multi-variable type inference failed */
        private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
            boolean z;
            boolean z2;
            boolean z3;
            boolean z4;
            boolean z5;
            boolean z6;
            in.defaultReadObject();
            int readInt = in.readInt();
            MapMaker mapMaker = new MapMaker();
            int i = mapMaker.initialCapacity;
            boolean z7 = true;
            if (i == -1) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                if (readInt >= 0) {
                    z2 = true;
                } else {
                    z2 = false;
                }
                Preconditions.checkArgument(z2);
                mapMaker.initialCapacity = readInt;
                Strength strength = this.keyStrength;
                Strength strength2 = mapMaker.keyStrength;
                if (strength2 == null) {
                    z3 = true;
                } else {
                    z3 = false;
                }
                Preconditions.checkState(z3, "Key strength was already set to %s", strength2);
                strength.getClass();
                mapMaker.keyStrength = strength;
                Strength.AnonymousClass1 r2 = Strength.STRONG;
                if (strength != r2) {
                    mapMaker.useCustomMap = true;
                }
                Strength strength3 = this.valueStrength;
                Strength strength4 = mapMaker.valueStrength;
                if (strength4 == null) {
                    z4 = true;
                } else {
                    z4 = false;
                }
                Preconditions.checkState(z4, "Value strength was already set to %s", strength4);
                strength3.getClass();
                mapMaker.valueStrength = strength3;
                if (strength3 != r2) {
                    mapMaker.useCustomMap = true;
                }
                Equivalence<Object> equivalence = this.keyEquivalence;
                Equivalence<Object> equivalence2 = mapMaker.keyEquivalence;
                if (equivalence2 == null) {
                    z5 = true;
                } else {
                    z5 = false;
                }
                Preconditions.checkState(z5, "key equivalence was already set to %s", equivalence2);
                equivalence.getClass();
                mapMaker.keyEquivalence = equivalence;
                mapMaker.useCustomMap = true;
                int i2 = this.concurrencyLevel;
                int i3 = mapMaker.concurrencyLevel;
                if (i3 == -1) {
                    z6 = true;
                } else {
                    z6 = false;
                }
                if (z6) {
                    if (i2 <= 0) {
                        z7 = false;
                    }
                    Preconditions.checkArgument(z7);
                    mapMaker.concurrencyLevel = i2;
                    this.delegate = mapMaker.makeMap();
                    while (true) {
                        Object readObject = in.readObject();
                        if (readObject != null) {
                            this.delegate.put(readObject, in.readObject());
                        } else {
                            return;
                        }
                    }
                } else {
                    throw new IllegalStateException(Strings.lenientFormat("concurrency level was already set to %s", Integer.valueOf(i3)));
                }
            } else {
                throw new IllegalStateException(Strings.lenientFormat("initial capacity was already set to %s", Integer.valueOf(i)));
            }
        }

        private void writeObject(ObjectOutputStream out) throws IOException {
            out.defaultWriteObject();
            out.writeInt(this.delegate.size());
            for (Map.Entry<K, V> entry : this.delegate.entrySet()) {
                out.writeObject(entry.getKey());
                out.writeObject(entry.getValue());
            }
            out.writeObject(null);
        }

        public SerializationProxy(Strength keyStrength, Strength valueStrength, Equivalence<Object> keyEquivalence, Equivalence<Object> valueEquivalence, int concurrencyLevel, ConcurrentMap<K, V> delegate) {
            super(keyStrength, valueStrength, keyEquivalence, valueEquivalence, concurrencyLevel, delegate);
        }

        private Object readResolve() {
            return this.delegate;
        }
    }

    /* loaded from: classes.dex */
    public static final class StrongKeyStrongValueEntry<K, V> extends AbstractStrongKeyEntry<K, V, StrongKeyStrongValueEntry<K, V>> {
        public volatile V value = null;

        /* loaded from: classes.dex */
        public static final class Helper<K, V> implements InternalEntryHelper<K, V, StrongKeyStrongValueEntry<K, V>, StrongKeyStrongValueSegment<K, V>> {
            public static final Helper<?, ?> INSTANCE = new Helper<>();

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final InternalEntry copy(Segment segment, InternalEntry entry, InternalEntry newNext) {
                StrongKeyStrongValueSegment strongKeyStrongValueSegment = (StrongKeyStrongValueSegment) segment;
                StrongKeyStrongValueEntry strongKeyStrongValueEntry = (StrongKeyStrongValueEntry) entry;
                StrongKeyStrongValueEntry strongKeyStrongValueEntry2 = new StrongKeyStrongValueEntry(strongKeyStrongValueEntry.key, strongKeyStrongValueEntry.hash, (StrongKeyStrongValueEntry) newNext);
                strongKeyStrongValueEntry2.value = strongKeyStrongValueEntry.value;
                return strongKeyStrongValueEntry2;
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final InternalEntry newEntry(Segment segment, Object key, int hash, InternalEntry next) {
                StrongKeyStrongValueSegment strongKeyStrongValueSegment = (StrongKeyStrongValueSegment) segment;
                return new StrongKeyStrongValueEntry(key, hash, (StrongKeyStrongValueEntry) next);
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final Segment newSegment(MapMakerInternalMap mapMakerInternalMap, int i) {
                return new StrongKeyStrongValueSegment(mapMakerInternalMap, i);
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final void setValue(Segment segment, InternalEntry entry, Object value) {
                StrongKeyStrongValueSegment strongKeyStrongValueSegment = (StrongKeyStrongValueSegment) segment;
                ((StrongKeyStrongValueEntry) entry).value = value;
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final Strength keyStrength() {
                return Strength.STRONG;
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final Strength valueStrength() {
                return Strength.STRONG;
            }
        }

        public StrongKeyStrongValueEntry(K key, int hash, StrongKeyStrongValueEntry<K, V> next) {
            super(key, hash, next);
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final V getValue() {
            return this.value;
        }
    }

    /* loaded from: classes.dex */
    public final class ValueIterator extends MapMakerInternalMap<K, V, E, S>.HashIterator<V> {
        @Override // java.util.Iterator
        public final V next() {
            return nextEntry().value;
        }

        public ValueIterator(final MapMakerInternalMap this$0) {
            super();
        }
    }

    /* loaded from: classes.dex */
    public static final class WeakKeyStrongValueEntry<K, V> extends AbstractWeakKeyEntry<K, V, WeakKeyStrongValueEntry<K, V>> {
        public volatile V value = null;

        /* loaded from: classes.dex */
        public static final class Helper<K, V> implements InternalEntryHelper<K, V, WeakKeyStrongValueEntry<K, V>, WeakKeyStrongValueSegment<K, V>> {
            public static final Helper<?, ?> INSTANCE = new Helper<>();

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final InternalEntry copy(Segment segment, InternalEntry entry, InternalEntry newNext) {
                WeakKeyStrongValueSegment weakKeyStrongValueSegment = (WeakKeyStrongValueSegment) segment;
                WeakKeyStrongValueEntry weakKeyStrongValueEntry = (WeakKeyStrongValueEntry) entry;
                WeakKeyStrongValueEntry weakKeyStrongValueEntry2 = (WeakKeyStrongValueEntry) newNext;
                if (weakKeyStrongValueEntry.get() == null) {
                    return null;
                }
                WeakKeyStrongValueEntry weakKeyStrongValueEntry3 = new WeakKeyStrongValueEntry(weakKeyStrongValueSegment.queueForKeys, weakKeyStrongValueEntry.get(), weakKeyStrongValueEntry.hash, weakKeyStrongValueEntry2);
                weakKeyStrongValueEntry3.value = weakKeyStrongValueEntry.value;
                return weakKeyStrongValueEntry3;
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final InternalEntry newEntry(Segment segment, Object key, int hash, InternalEntry next) {
                return new WeakKeyStrongValueEntry(((WeakKeyStrongValueSegment) segment).queueForKeys, key, hash, (WeakKeyStrongValueEntry) next);
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final Segment newSegment(MapMakerInternalMap mapMakerInternalMap, int i) {
                return new WeakKeyStrongValueSegment(mapMakerInternalMap, i);
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final void setValue(Segment segment, InternalEntry entry, Object value) {
                WeakKeyStrongValueSegment weakKeyStrongValueSegment = (WeakKeyStrongValueSegment) segment;
                ((WeakKeyStrongValueEntry) entry).value = value;
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final Strength keyStrength() {
                return Strength.WEAK;
            }

            @Override // com.google.common.collect.MapMakerInternalMap.InternalEntryHelper
            public final Strength valueStrength() {
                return Strength.STRONG;
            }
        }

        public WeakKeyStrongValueEntry(ReferenceQueue<K> queue, K key, int hash, WeakKeyStrongValueEntry<K, V> next) {
            super(queue, key, hash, next);
        }

        @Override // com.google.common.collect.MapMakerInternalMap.InternalEntry
        public final V getValue() {
            return this.value;
        }
    }

    public static ArrayList access$900(Collection collection) {
        ArrayList arrayList = new ArrayList(collection.size());
        Iterator it = collection.iterator();
        it.getClass();
        while (it.hasNext()) {
            arrayList.add(it.next());
        }
        return arrayList;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        Segment<K, V, E, S>[] segmentArr = this.segments;
        int length = segmentArr.length;
        for (int i = 0; i < length; i++) {
            Segment<K, V, E, S> segment = segmentArr[i];
            if (segment.count != 0) {
                segment.lock();
                try {
                    AtomicReferenceArray<E> atomicReferenceArray = segment.table;
                    for (int i2 = 0; i2 < atomicReferenceArray.length(); i2++) {
                        atomicReferenceArray.set(i2, null);
                    }
                    segment.maybeClearReferenceQueues();
                    segment.readCount.set(0);
                    segment.modCount++;
                    segment.count = 0;
                } finally {
                    segment.unlock();
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v0 */
    /* JADX WARN: Type inference failed for: r10v1, types: [int] */
    /* JADX WARN: Type inference failed for: r11v0, types: [com.google.common.collect.MapMakerInternalMap$Segment] */
    /* JADX WARN: Type inference failed for: r13v0 */
    /* JADX WARN: Type inference failed for: r13v1, types: [int] */
    /* JADX WARN: Type inference failed for: r3v0, types: [com.google.common.collect.MapMakerInternalMap$Segment<K, V, E extends com.google.common.collect.MapMakerInternalMap$InternalEntry<K, V, E>, S extends com.google.common.collect.MapMakerInternalMap$Segment<K, V, E, S>>[]] */
    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsValue(Object value) {
        boolean z = false;
        if (value == null) {
            return false;
        }
        Segment<K, V, E, S>[] segmentArr = this.segments;
        long j = -1;
        int i = 0;
        while (i < 3) {
            long j2 = 0;
            int length = segmentArr.length;
            for (int i2 = z; i2 < length; i2++) {
                ?? r11 = segmentArr[i2];
                int i3 = r11.count;
                AtomicReferenceArray<E> atomicReferenceArray = r11.table;
                for (int i4 = z; i4 < atomicReferenceArray.length(); i4++) {
                    for (E e = atomicReferenceArray.get(i4); e != null; e = e.getNext()) {
                        Object liveValue = r11.getLiveValue(e);
                        if (liveValue != null && valueEquivalence().equivalent(value, liveValue)) {
                            return true;
                        }
                    }
                }
                j2 += r11.modCount;
                z = false;
            }
            if (j2 == j) {
                return false;
            }
            i++;
            j = j2;
            z = false;
        }
        return z;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set<Map.Entry<K, V>> entrySet() {
        EntrySet entrySet = this.entrySet;
        if (entrySet != null) {
            return entrySet;
        }
        EntrySet entrySet2 = new EntrySet();
        this.entrySet = entrySet2;
        return entrySet2;
    }

    public final int hash(Object key) {
        int i;
        Equivalence<Object> equivalence = this.keyEquivalence;
        if (key == null) {
            equivalence.getClass();
            i = 0;
        } else {
            i = equivalence.doHash(key);
        }
        int i2 = i + ((i << 15) ^ (-12931));
        int i3 = i2 ^ (i2 >>> 10);
        int i4 = i3 + (i3 << 3);
        int i5 = i4 ^ (i4 >>> 6);
        int i6 = (i5 << 2) + (i5 << 14) + i5;
        return (i6 >>> 16) ^ i6;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean isEmpty() {
        Segment<K, V, E, S>[] segmentArr = this.segments;
        long j = 0;
        for (int i = 0; i < segmentArr.length; i++) {
            if (segmentArr[i].count != 0) {
                return false;
            }
            j += segmentArr[i].modCount;
        }
        if (j == 0) {
            return true;
        }
        for (int i2 = 0; i2 < segmentArr.length; i2++) {
            if (segmentArr[i2].count != 0) {
                return false;
            }
            j -= segmentArr[i2].modCount;
        }
        if (j != 0) {
            return false;
        }
        return true;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set<K> keySet() {
        KeySet keySet = this.keySet;
        if (keySet != null) {
            return keySet;
        }
        KeySet keySet2 = new KeySet();
        this.keySet = keySet2;
        return keySet2;
    }

    public Strength keyStrength() {
        return this.entryHelper.keyStrength();
    }

    public final Segment<K, V, E, S> segmentFor(int hash) {
        return this.segments[this.segmentMask & (hash >>> this.segmentShift)];
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        long j = 0;
        for (Segment<K, V, E, S> segment : this.segments) {
            j += segment.count;
        }
        return Ints.saturatedCast(j);
    }

    public Equivalence<Object> valueEquivalence() {
        return this.entryHelper.valueStrength().defaultEquivalence();
    }

    public Strength valueStrength() {
        return this.entryHelper.valueStrength();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Collection<V> values() {
        Values values = this.values;
        if (values != null) {
            return values;
        }
        Values values2 = new Values();
        this.values = values2;
        return values2;
    }

    public Object writeReplace() {
        return new SerializationProxy(this.entryHelper.keyStrength(), this.entryHelper.valueStrength(), this.keyEquivalence, this.entryHelper.valueStrength().defaultEquivalence(), this.concurrencyLevel, this);
    }

    public MapMakerInternalMap(MapMaker builder, InternalEntryHelper<K, V, E, S> entryHelper) {
        int i = builder.concurrencyLevel;
        this.concurrencyLevel = Math.min(i == -1 ? 4 : i, (int) QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE);
        Equivalence<Object> equivalence = builder.keyEquivalence;
        Equivalence<Object> defaultEquivalence = builder.getKeyStrength().defaultEquivalence();
        if (equivalence == null) {
            if (defaultEquivalence != null) {
                equivalence = defaultEquivalence;
            } else {
                throw new NullPointerException("Both parameters are null");
            }
        }
        this.keyEquivalence = equivalence;
        this.entryHelper = entryHelper;
        int i2 = builder.initialCapacity;
        int min = Math.min(i2 == -1 ? 16 : i2, (int) IntMath.MAX_SIGNED_POWER_OF_TWO);
        int i3 = 0;
        int i4 = 1;
        int i5 = 0;
        int i6 = 1;
        while (i6 < this.concurrencyLevel) {
            i5++;
            i6 <<= 1;
        }
        this.segmentShift = 32 - i5;
        this.segmentMask = i6 - 1;
        this.segments = new Segment[i6];
        int i7 = min / i6;
        while (i4 < (i6 * i7 < min ? i7 + 1 : i7)) {
            i4 <<= 1;
        }
        while (true) {
            Segment<K, V, E, S>[] segmentArr = this.segments;
            if (i3 < segmentArr.length) {
                segmentArr[i3] = this.entryHelper.newSegment(this, i4);
                i3++;
            } else {
                return;
            }
        }
    }

    public E copyEntry(E original, E newNext) {
        Segment<K, V, E, S> segmentFor = segmentFor(original.getHash());
        return segmentFor.map.entryHelper.copy(segmentFor.self(), original, newNext);
    }

    public boolean isLiveForTesting(InternalEntry<K, V, ?> entry) {
        Segment<K, V, E, S> segmentFor = segmentFor(entry.getHash());
        if (segmentFor.getLiveValue(segmentFor.castForTesting(entry)) != null) {
            return true;
        }
        return false;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final V put(K key, V value) {
        key.getClass();
        value.getClass();
        int hash = hash(key);
        return segmentFor(hash).put(key, hash, value, false);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void putAll(Map<? extends K, ? extends V> m) {
        for (Map.Entry<? extends K, ? extends V> entry : m.entrySet()) {
            put(entry.getKey(), entry.getValue());
        }
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    public final V putIfAbsent(K key, V value) {
        key.getClass();
        value.getClass();
        int hash = hash(key);
        return segmentFor(hash).put(key, hash, value, true);
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x004b, code lost:
        if (r9.map.valueEquivalence().equivalent(r11, r6.getValue()) == false) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x004d, code lost:
        r0 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0053, code lost:
        if (r6.getValue() != null) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0055, code lost:
        r10 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0057, code lost:
        r10 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0058, code lost:
        if (r10 == false) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x005a, code lost:
        r9.modCount++;
        r2.set(r3, r9.removeFromChain(r5, r6));
        r9.count--;
     */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean remove(java.lang.Object r10, java.lang.Object r11) {
        /*
            r9 = this;
            r0 = 0
            if (r10 == 0) goto L7a
            if (r11 != 0) goto L7
            goto L7a
        L7:
            int r1 = r9.hash(r10)
            com.google.common.collect.MapMakerInternalMap$Segment r9 = r9.segmentFor(r1)
            r9.lock()
            r9.runLockedCleanup()     // Catch: java.lang.Throwable -> L75
            java.util.concurrent.atomic.AtomicReferenceArray<E extends com.google.common.collect.MapMakerInternalMap$InternalEntry<K, V, E>> r2 = r9.table     // Catch: java.lang.Throwable -> L75
            int r3 = r2.length()     // Catch: java.lang.Throwable -> L75
            r4 = 1
            int r3 = r3 - r4
            r3 = r3 & r1
            java.lang.Object r5 = r2.get(r3)     // Catch: java.lang.Throwable -> L75
            com.google.common.collect.MapMakerInternalMap$InternalEntry r5 = (com.google.common.collect.MapMakerInternalMap.InternalEntry) r5     // Catch: java.lang.Throwable -> L75
            r6 = r5
        L25:
            if (r6 == 0) goto L71
            java.lang.Object r7 = r6.getKey()     // Catch: java.lang.Throwable -> L75
            int r8 = r6.getHash()     // Catch: java.lang.Throwable -> L75
            if (r8 != r1) goto L6c
            if (r7 == 0) goto L6c
            com.google.common.collect.MapMakerInternalMap<K, V, E extends com.google.common.collect.MapMakerInternalMap$InternalEntry<K, V, E>, S extends com.google.common.collect.MapMakerInternalMap$Segment<K, V, E, S>> r8 = r9.map     // Catch: java.lang.Throwable -> L75
            com.google.common.base.Equivalence<java.lang.Object> r8 = r8.keyEquivalence     // Catch: java.lang.Throwable -> L75
            boolean r7 = r8.equivalent(r10, r7)     // Catch: java.lang.Throwable -> L75
            if (r7 == 0) goto L6c
            java.lang.Object r10 = r6.getValue()     // Catch: java.lang.Throwable -> L75
            com.google.common.collect.MapMakerInternalMap<K, V, E extends com.google.common.collect.MapMakerInternalMap$InternalEntry<K, V, E>, S extends com.google.common.collect.MapMakerInternalMap$Segment<K, V, E, S>> r1 = r9.map     // Catch: java.lang.Throwable -> L75
            com.google.common.base.Equivalence r1 = r1.valueEquivalence()     // Catch: java.lang.Throwable -> L75
            boolean r10 = r1.equivalent(r11, r10)     // Catch: java.lang.Throwable -> L75
            if (r10 == 0) goto L4f
            r0 = r4
            goto L5a
        L4f:
            java.lang.Object r10 = r6.getValue()     // Catch: java.lang.Throwable -> L75
            if (r10 != 0) goto L57
            r10 = r4
            goto L58
        L57:
            r10 = r0
        L58:
            if (r10 == 0) goto L71
        L5a:
            int r10 = r9.modCount     // Catch: java.lang.Throwable -> L75
            int r10 = r10 + r4
            r9.modCount = r10     // Catch: java.lang.Throwable -> L75
            com.google.common.collect.MapMakerInternalMap$InternalEntry r10 = r9.removeFromChain(r5, r6)     // Catch: java.lang.Throwable -> L75
            int r11 = r9.count     // Catch: java.lang.Throwable -> L75
            int r11 = r11 - r4
            r2.set(r3, r10)     // Catch: java.lang.Throwable -> L75
            r9.count = r11     // Catch: java.lang.Throwable -> L75
            goto L71
        L6c:
            com.google.common.collect.MapMakerInternalMap$InternalEntry r6 = r6.getNext()     // Catch: java.lang.Throwable -> L75
            goto L25
        L71:
            r9.unlock()
            return r0
        L75:
            r10 = move-exception
            r9.unlock()
            throw r10
        L7a:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.common.collect.MapMakerInternalMap.remove(java.lang.Object, java.lang.Object):boolean");
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    public final boolean replace(K key, V oldValue, V newValue) {
        key.getClass();
        newValue.getClass();
        if (oldValue == null) {
            return false;
        }
        int hash = hash(key);
        Segment<K, V, E, S> segmentFor = segmentFor(hash);
        segmentFor.lock();
        try {
            segmentFor.runLockedCleanup();
            AtomicReferenceArray<E> atomicReferenceArray = segmentFor.table;
            int length = (atomicReferenceArray.length() - 1) & hash;
            E e = atomicReferenceArray.get(length);
            E e2 = e;
            while (true) {
                if (e2 == null) {
                    break;
                }
                Object key2 = e2.getKey();
                if (e2.getHash() != hash || key2 == null || !segmentFor.map.keyEquivalence.equivalent(key, key2)) {
                    e2 = (E) e2.getNext();
                } else {
                    Object value = e2.getValue();
                    if (value == null) {
                        if (e2.getValue() == null) {
                            segmentFor.modCount++;
                            atomicReferenceArray.set(length, segmentFor.removeFromChain(e, e2));
                            segmentFor.count--;
                        }
                    } else if (segmentFor.map.valueEquivalence().equivalent(oldValue, value)) {
                        segmentFor.modCount++;
                        segmentFor.setValue(e2, newValue);
                        return true;
                    }
                }
            }
            return false;
        } finally {
            segmentFor.unlock();
        }
    }

    /* loaded from: classes.dex */
    public static final class StrongKeyStrongValueSegment<K, V> extends Segment<K, V, StrongKeyStrongValueEntry<K, V>, StrongKeyStrongValueSegment<K, V>> {
        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final Segment self() {
            return this;
        }

        public StrongKeyStrongValueSegment(MapMakerInternalMap mapMakerInternalMap, int i) {
            super(mapMakerInternalMap, i);
        }

        @Override // com.google.common.collect.MapMakerInternalMap.Segment
        public final InternalEntry castForTesting(InternalEntry entry) {
            return (StrongKeyStrongValueEntry) entry;
        }
    }
}
