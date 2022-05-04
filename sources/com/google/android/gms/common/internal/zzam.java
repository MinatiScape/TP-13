package com.google.android.gms.common.internal;

import com.android.wallpaper.util.LaunchUtils;
import java.util.ArrayList;
import java.util.List;
/* compiled from: Objects.java */
/* loaded from: classes.dex */
public final class zzam {
    public final /* synthetic */ int $r8$classId;
    public Object zza;
    public Object zzb;

    public zzam(Object obj) {
        this.$r8$classId = 0;
        LaunchUtils.zza(obj);
        this.zzb = obj;
        this.zza = new ArrayList();
    }

    public final String toString() {
        switch (this.$r8$classId) {
            case 0:
                StringBuilder sb = new StringBuilder(100);
                sb.append(this.zzb.getClass().getSimpleName());
                sb.append('{');
                int size = ((List) this.zza).size();
                for (int i = 0; i < size; i++) {
                    sb.append((String) ((List) this.zza).get(i));
                    if (i < size - 1) {
                        sb.append(", ");
                    }
                }
                sb.append('}');
                return sb.toString();
            default:
                return super.toString();
        }
    }

    public final void zza(String str, Object obj) {
        String valueOf = String.valueOf(obj);
        StringBuilder sb = new StringBuilder(valueOf.length() + str.length() + 1);
        sb.append(str);
        sb.append("=");
        sb.append(valueOf);
        ((List) this.zza).add(sb.toString());
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zzam(Object obj, int i) {
        this(obj);
        this.$r8$classId = 0;
    }
}
