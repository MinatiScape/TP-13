package com.bumptech.glide.load.engine.bitmap_recycle;

import com.bumptech.glide.load.engine.bitmap_recycle.Poolable;
import java.util.ArrayList;
import java.util.HashMap;
/* loaded from: classes.dex */
public final class GroupedLinkedMap<K extends Poolable, V> {
    public final LinkedEntry<K, V> head = new LinkedEntry<>(null);
    public final HashMap keyToEntry = new HashMap();

    /* loaded from: classes.dex */
    public static class LinkedEntry<K, V> {
        public final K key;
        public LinkedEntry<K, V> next;
        public LinkedEntry<K, V> prev;
        public ArrayList values;

        public LinkedEntry() {
            throw null;
        }

        public LinkedEntry(K k) {
            this.prev = this;
            this.next = this;
            this.key = k;
        }
    }

    public final V get(K k) {
        LinkedEntry linkedEntry;
        int i;
        LinkedEntry linkedEntry2 = (LinkedEntry) this.keyToEntry.get(k);
        if (linkedEntry2 == null) {
            LinkedEntry linkedEntry3 = new LinkedEntry(k);
            this.keyToEntry.put(k, linkedEntry3);
            linkedEntry = linkedEntry3;
        } else {
            k.offer();
            linkedEntry = linkedEntry2;
        }
        LinkedEntry<K, V> linkedEntry4 = linkedEntry.prev;
        linkedEntry4.next = linkedEntry.next;
        linkedEntry.next.prev = linkedEntry4;
        LinkedEntry<K, V> linkedEntry5 = this.head;
        linkedEntry.prev = linkedEntry5;
        LinkedEntry<K, V> linkedEntry6 = linkedEntry5.next;
        linkedEntry.next = linkedEntry6;
        linkedEntry6.prev = linkedEntry;
        linkedEntry.prev.next = linkedEntry;
        ArrayList arrayList = linkedEntry.values;
        if (arrayList != null) {
            i = arrayList.size();
        } else {
            i = 0;
        }
        if (i > 0) {
            return (V) linkedEntry.values.remove(i - 1);
        }
        return null;
    }

    public final void put(K k, V v) {
        LinkedEntry linkedEntry = (LinkedEntry) this.keyToEntry.get(k);
        if (linkedEntry == null) {
            linkedEntry = new LinkedEntry(k);
            LinkedEntry<K, V> linkedEntry2 = linkedEntry.prev;
            linkedEntry2.next = linkedEntry.next;
            linkedEntry.next.prev = linkedEntry2;
            LinkedEntry<K, V> linkedEntry3 = this.head;
            linkedEntry.prev = linkedEntry3.prev;
            linkedEntry.next = linkedEntry3;
            linkedEntry3.prev = linkedEntry;
            linkedEntry.prev.next = linkedEntry;
            this.keyToEntry.put(k, linkedEntry);
        } else {
            k.offer();
        }
        if (linkedEntry.values == null) {
            linkedEntry.values = new ArrayList();
        }
        linkedEntry.values.add(v);
    }

    public final V removeLast() {
        int i;
        LinkedEntry linkedEntry = this.head.prev;
        while (true) {
            V v = null;
            if (linkedEntry.equals(this.head)) {
                return null;
            }
            ArrayList arrayList = linkedEntry.values;
            if (arrayList != null) {
                i = arrayList.size();
            } else {
                i = 0;
            }
            if (i > 0) {
                v = (V) linkedEntry.values.remove(i - 1);
            }
            if (v != null) {
                return v;
            }
            LinkedEntry<K, V> linkedEntry2 = linkedEntry.prev;
            linkedEntry2.next = linkedEntry.next;
            linkedEntry.next.prev = linkedEntry2;
            this.keyToEntry.remove(linkedEntry.key);
            ((Poolable) linkedEntry.key).offer();
            linkedEntry = linkedEntry.prev;
        }
    }

    public final String toString() {
        int i;
        StringBuilder sb = new StringBuilder("GroupedLinkedMap( ");
        boolean z = false;
        for (LinkedEntry linkedEntry = this.head.next; !linkedEntry.equals(this.head); linkedEntry = linkedEntry.next) {
            z = true;
            sb.append('{');
            sb.append(linkedEntry.key);
            sb.append(':');
            ArrayList arrayList = linkedEntry.values;
            if (arrayList != null) {
                i = arrayList.size();
            } else {
                i = 0;
            }
            sb.append(i);
            sb.append("}, ");
        }
        if (z) {
            sb.delete(sb.length() - 2, sb.length());
        }
        sb.append(" )");
        return sb.toString();
    }
}
