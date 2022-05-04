package com.google.common.collect;

import com.google.common.math.IntMath;
/* loaded from: classes.dex */
public final class Hashing {
    public static int closedTableSize(int i) {
        int max = Math.max(i, 2);
        int highestOneBit = Integer.highestOneBit(max);
        if (max <= ((int) (1.0d * highestOneBit))) {
            return highestOneBit;
        }
        int i2 = highestOneBit << 1;
        if (i2 > 0) {
            return i2;
        }
        return IntMath.MAX_SIGNED_POWER_OF_TWO;
    }

    public static int smear(int hashCode) {
        return (int) (Integer.rotateLeft((int) (hashCode * (-862048943)), 15) * 461845907);
    }

    public static int smearedHash(Object o) {
        int i;
        if (o == null) {
            i = 0;
        } else {
            i = o.hashCode();
        }
        return smear(i);
    }
}
