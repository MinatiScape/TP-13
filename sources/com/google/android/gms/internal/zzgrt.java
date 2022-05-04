package com.google.android.gms.internal;

import com.google.android.gms.internal.zzgrt;
import java.io.IOException;
/* loaded from: classes.dex */
public abstract class zzgrt<M extends zzgrt<M>> extends zzgrz {
    public zzgrv zzay;

    @Override // com.google.android.gms.internal.zzgrz
    public M clone() throws CloneNotSupportedException {
        M m = (M) super.clone();
        Object obj = zzgrx.zzb;
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null) {
            m.zzay = (zzgrv) zzgrvVar.clone();
        }
        return m;
    }

    @Override // com.google.android.gms.internal.zzgrz
    public int computeSerializedSize() {
        if (this.zzay != null) {
            int i = 0;
            while (true) {
                zzgrv zzgrvVar = this.zzay;
                if (i >= zzgrvVar.zze) {
                    break;
                }
                zzgrvVar.zzd[i].zza();
                i++;
            }
        }
        return 0;
    }

    @Override // com.google.android.gms.internal.zzgrz
    public void writeTo(zzgrr zzgrrVar) throws IOException {
        if (this.zzay != null) {
            int i = 0;
            while (true) {
                zzgrv zzgrvVar = this.zzay;
                if (i < zzgrvVar.zze) {
                    zzgrvVar.zzd[i].zza(zzgrrVar);
                    i++;
                } else {
                    return;
                }
            }
        }
    }
}
