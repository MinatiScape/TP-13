package com.google.common.collect;

import com.google.common.math.IntMath;
/* loaded from: classes.dex */
public final class Hashing {
    public static int closedTableSize(int expectedEntries, double loadFactor) {
        int max = Math.max(expectedEntries, 2);
        int highestOneBit = Integer.highestOneBit(max);
        if (max <= ((int) (loadFactor * highestOneBit))) {
            return highestOneBit;
        }
        int i = highestOneBit << 1;
        return i > 0 ? i : IntMath.MAX_SIGNED_POWER_OF_TWO;
    }

    public static boolean needsResizing(int size, int tableSize, double loadFactor) {
        return ((double) size) > loadFactor * ((double) tableSize) && tableSize < 1073741824;
    }

    public static int smear(int hashCode) {
        return (int) (Integer.rotateLeft((int) (hashCode * (-862048943)), 15) * 461845907);
    }

    public static int smearedHash(Object o) {
        return smear(o == null ? 0 : o.hashCode());
    }
}
