package com.google.android.gms.internal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public final class zzgrw implements Cloneable {
    public Object zzb;
    public List<zzgsb> zzc = new ArrayList();

    public final boolean equals(Object obj) {
        List<zzgsb> list;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzgrw)) {
            return false;
        }
        zzgrw zzgrwVar = (zzgrw) obj;
        if (this.zzb == null || zzgrwVar.zzb == null) {
            List<zzgsb> list2 = this.zzc;
            if (list2 != null && (list = zzgrwVar.zzc) != null) {
                return list2.equals(list);
            }
            try {
                return Arrays.equals(zzb(), zzgrwVar.zzb());
            } catch (IOException e) {
                throw new IllegalStateException(e);
            }
        } else {
            Objects.requireNonNull(null);
            throw null;
        }
    }

    public final int hashCode() {
        try {
            return Arrays.hashCode(zzb()) + 527;
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    public final int zza() {
        if (this.zzb == null) {
            Iterator<zzgsb> it = this.zzc.iterator();
            if (!it.hasNext()) {
                return 0;
            }
            Objects.requireNonNull(it.next());
            throw null;
        }
        Objects.requireNonNull(null);
        throw null;
    }

    public final byte[] zzb() throws IOException {
        zza();
        byte[] bArr = new byte[0];
        zza(new zzgrr(bArr, 0, 0));
        return bArr;
    }

    /* renamed from: zzc */
    public final zzgrw clone() {
        zzgrw zzgrwVar = new zzgrw();
        try {
            List<zzgsb> list = this.zzc;
            if (list == null) {
                zzgrwVar.zzc = null;
            } else {
                zzgrwVar.zzc.addAll(list);
            }
            Object obj = this.zzb;
            if (obj != null) {
                if (obj instanceof zzgrz) {
                    zzgrwVar.zzb = (zzgrz) ((zzgrz) obj).clone();
                } else if (obj instanceof byte[]) {
                    zzgrwVar.zzb = ((byte[]) obj).clone();
                } else {
                    int i = 0;
                    if (obj instanceof byte[][]) {
                        byte[][] bArr = (byte[][]) obj;
                        byte[][] bArr2 = new byte[bArr.length];
                        zzgrwVar.zzb = bArr2;
                        while (i < bArr.length) {
                            bArr2[i] = (byte[]) bArr[i].clone();
                            i++;
                        }
                    } else if (obj instanceof boolean[]) {
                        zzgrwVar.zzb = ((boolean[]) obj).clone();
                    } else if (obj instanceof int[]) {
                        zzgrwVar.zzb = ((int[]) obj).clone();
                    } else if (obj instanceof long[]) {
                        zzgrwVar.zzb = ((long[]) obj).clone();
                    } else if (obj instanceof float[]) {
                        zzgrwVar.zzb = ((float[]) obj).clone();
                    } else if (obj instanceof double[]) {
                        zzgrwVar.zzb = ((double[]) obj).clone();
                    } else if (obj instanceof zzgrz[]) {
                        zzgrz[] zzgrzVarArr = (zzgrz[]) obj;
                        zzgrz[] zzgrzVarArr2 = new zzgrz[zzgrzVarArr.length];
                        zzgrwVar.zzb = zzgrzVarArr2;
                        while (i < zzgrzVarArr.length) {
                            zzgrzVarArr2[i] = (zzgrz) zzgrzVarArr[i].clone();
                            i++;
                        }
                    }
                }
            }
            return zzgrwVar;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public final void zza(zzgrr zzgrrVar) throws IOException {
        if (this.zzb == null) {
            Iterator<zzgsb> it = this.zzc.iterator();
            if (it.hasNext()) {
                Objects.requireNonNull(it.next());
                zzgrrVar.zzc(0);
                zzgrrVar.zzd((byte[]) null);
                throw null;
            }
            return;
        }
        Objects.requireNonNull(null);
        throw null;
    }
}
