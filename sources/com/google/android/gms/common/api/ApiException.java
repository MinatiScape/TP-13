package com.google.android.gms.common.api;
/* loaded from: classes.dex */
public class ApiException extends Exception {
    public final Status mStatus;

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public ApiException(com.google.android.gms.common.api.Status r5) {
        /*
            r4 = this;
            int r0 = r5.zzi
            java.lang.String r1 = r5.zzj
            if (r1 == 0) goto L7
            goto L9
        L7:
            java.lang.String r1 = ""
        L9:
            r2 = 13
            int r2 = com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0.m(r1, r2)
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>(r2)
            r3.append(r0)
            java.lang.String r0 = ": "
            r3.append(r0)
            r3.append(r1)
            java.lang.String r0 = r3.toString()
            r4.<init>(r0)
            r4.mStatus = r5
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.common.api.ApiException.<init>(com.google.android.gms.common.api.Status):void");
    }
}
