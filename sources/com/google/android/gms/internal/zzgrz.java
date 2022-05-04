package com.google.android.gms.internal;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
/* compiled from: MessageNano.java */
/* loaded from: classes.dex */
public abstract class zzgrz {
    public volatile int zzaz = -1;

    public zzgrz clone() throws CloneNotSupportedException {
        return (zzgrz) super.clone();
    }

    public int computeSerializedSize() {
        return 0;
    }

    public final String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        try {
            zzgsa.zza(null, this, new StringBuffer(), stringBuffer);
            return stringBuffer.toString();
        } catch (IllegalAccessException e) {
            String valueOf = String.valueOf(e.getMessage());
            if (valueOf.length() != 0) {
                return "Error printing proto: ".concat(valueOf);
            }
            return new String("Error printing proto: ");
        } catch (InvocationTargetException e2) {
            String valueOf2 = String.valueOf(e2.getMessage());
            if (valueOf2.length() != 0) {
                return "Error printing proto: ".concat(valueOf2);
            }
            return new String("Error printing proto: ");
        }
    }

    public static final byte[] toByteArray(zzgrt zzgrtVar) {
        int serializedSize = zzgrtVar.getSerializedSize();
        byte[] bArr = new byte[serializedSize];
        try {
            zzgrr zzgrrVar = new zzgrr(bArr, serializedSize);
            zzgrtVar.writeTo(zzgrrVar);
            if (zzgrrVar.zza.remaining() == 0) {
                return bArr;
            }
            throw new IllegalStateException(String.format("Did not write as much data as expected, %s bytes remaining.", Integer.valueOf(zzgrrVar.zza.remaining())));
        } catch (IOException e) {
            throw new RuntimeException("Serializing to a byte array threw an IOException (should never happen).", e);
        }
    }

    public final int getSerializedSize() {
        int computeSerializedSize = computeSerializedSize();
        this.zzaz = computeSerializedSize;
        return computeSerializedSize;
    }
}
