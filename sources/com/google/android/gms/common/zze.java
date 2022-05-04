package com.google.android.gms.common;

import android.content.Context;
import com.google.android.libraries.microvideo.MicrovideoXmpMetadata;
/* compiled from: GoogleCertificates.java */
/* loaded from: classes.dex */
public final class zze implements MicrovideoXmpMetadata.ThrowableSupplier {
    public static final zze $instance = new zze();
    public static Context zzc;

    @Override // com.google.android.libraries.microvideo.MicrovideoXmpMetadata.ThrowableSupplier
    public Object get() {
        MicrovideoXmpMetadata.requiredValueMissing("determining file format version");
        throw null;
    }
}
