package com.android.volley;

import android.content.Intent;
/* loaded from: classes.dex */
public class AuthFailureError extends VolleyError {
    private Intent mResolutionIntent;

    public AuthFailureError() {
    }

    public AuthFailureError(NetworkResponse networkResponse) {
        super(networkResponse);
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        if (this.mResolutionIntent != null) {
            return "User needs to (re)enter credentials.";
        }
        return super.getMessage();
    }

    public AuthFailureError(String str) {
        super(str);
    }
}
