package com.google.protobuf;
/* loaded from: classes.dex */
public abstract class CodedInputStream {
    public static int decodeZigZag32(int i) {
        return (-(i & 1)) ^ (i >>> 1);
    }

    public static long decodeZigZag64(long j) {
        return (-(j & 1)) ^ (j >>> 1);
    }
}
