package com.google.android.gms.internal;
/* loaded from: classes.dex */
public final /* synthetic */ class zzfiv implements zzfiy {
    public final String zza;

    public zzfiv(String str) {
        this.zza = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x0083 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // com.google.android.gms.internal.zzfiy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object zza() {
        /*
            r8 = this;
            java.lang.Class<com.google.android.gms.internal.zzfib> r0 = com.google.android.gms.internal.zzfib.class
            java.lang.String r8 = r8.zza
            android.content.Context r1 = com.google.android.gms.internal.zzfis.zzc
            android.content.ContentResolver r1 = r1.getContentResolver()
            android.net.Uri r2 = com.google.android.gms.internal.zzfib.zzc
            monitor-enter(r0)
            com.google.android.gms.internal.zzfib.zza(r1)     // Catch: java.lang.Throwable -> L9c
            java.lang.Object r2 = com.google.android.gms.internal.zzfib.zzk     // Catch: java.lang.Throwable -> L9c
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L9c
            java.util.HashMap<java.lang.String, java.lang.Boolean> r3 = com.google.android.gms.internal.zzfib.zzg
            java.lang.Boolean r4 = java.lang.Boolean.FALSE
            monitor-enter(r0)
            boolean r5 = r3.containsKey(r8)     // Catch: java.lang.Throwable -> L99
            if (r5 == 0) goto L28
            java.lang.Object r5 = r3.get(r8)     // Catch: java.lang.Throwable -> L99
            if (r5 == 0) goto L25
            goto L26
        L25:
            r5 = r4
        L26:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L99
            goto L2a
        L28:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L99
            r5 = 0
        L2a:
            java.lang.Boolean r5 = (java.lang.Boolean) r5
            if (r5 == 0) goto L33
            boolean r8 = r5.booleanValue()
            goto L91
        L33:
            java.lang.String r1 = com.google.android.gms.internal.zzfib.zza(r1, r8)
            r6 = 0
            if (r1 == 0) goto L81
            java.lang.String r7 = ""
            boolean r7 = r1.equals(r7)
            if (r7 == 0) goto L43
            goto L81
        L43:
            java.util.regex.Pattern r7 = com.google.android.gms.internal.zzfib.zza
            java.util.regex.Matcher r7 = r7.matcher(r1)
            boolean r7 = r7.matches()
            if (r7 == 0) goto L54
            r1 = 1
            java.lang.Boolean r4 = java.lang.Boolean.TRUE
            r6 = r1
            goto L82
        L54:
            java.util.regex.Pattern r7 = com.google.android.gms.internal.zzfib.zzb
            java.util.regex.Matcher r7 = r7.matcher(r1)
            boolean r7 = r7.matches()
            if (r7 == 0) goto L61
            goto L82
        L61:
            java.lang.StringBuilder r4 = new java.lang.StringBuilder
            java.lang.String r7 = "attempt to read gservices key "
            r4.<init>(r7)
            r4.append(r8)
            java.lang.String r7 = " (value \""
            r4.append(r7)
            r4.append(r1)
            java.lang.String r1 = "\") as boolean"
            r4.append(r1)
            java.lang.String r1 = r4.toString()
            java.lang.String r4 = "Gservices"
            android.util.Log.w(r4, r1)
        L81:
            r4 = r5
        L82:
            monitor-enter(r0)
            java.lang.Object r1 = com.google.android.gms.internal.zzfib.zzk     // Catch: java.lang.Throwable -> L96
            if (r2 != r1) goto L8f
            r3.put(r8, r4)     // Catch: java.lang.Throwable -> L96
            java.util.HashMap<java.lang.String, java.lang.String> r1 = com.google.android.gms.internal.zzfib.zzf     // Catch: java.lang.Throwable -> L96
            r1.remove(r8)     // Catch: java.lang.Throwable -> L96
        L8f:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L96
            r8 = r6
        L91:
            java.lang.Boolean r8 = java.lang.Boolean.valueOf(r8)
            return r8
        L96:
            r8 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L96
            throw r8
        L99:
            r8 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L99
            throw r8
        L9c:
            r8 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L9c
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzfiv.zza():java.lang.Object");
    }
}
