package com.android.volley.toolbox;

import android.util.Log;
import com.android.volley.Cache;
import com.android.volley.NetworkResponse;
import com.android.volley.VolleyLog;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
/* loaded from: classes.dex */
public final class HttpHeaderParser {
    public static Cache.Entry parseCacheHeaders(NetworkResponse networkResponse) {
        long j;
        long j2;
        long j3;
        boolean z;
        long j4;
        long j5;
        long j6;
        long j7;
        long j8;
        long currentTimeMillis = System.currentTimeMillis();
        Map<String, String> map = networkResponse.headers;
        if (map == null) {
            return null;
        }
        String str = map.get("Date");
        if (str != null) {
            j = parseDateAsEpoch(str);
        } else {
            j = 0;
        }
        String str2 = map.get("Cache-Control");
        int i = 0;
        if (str2 != null) {
            String[] split = str2.split(",", 0);
            z = false;
            j3 = 0;
            j2 = 0;
            while (i < split.length) {
                String trim = split[i].trim();
                if (trim.equals("no-cache") || trim.equals("no-store")) {
                    return null;
                }
                if (trim.startsWith("max-age=")) {
                    try {
                        j3 = Long.parseLong(trim.substring(8));
                    } catch (Exception unused) {
                    }
                } else if (trim.startsWith("stale-while-revalidate=")) {
                    j2 = Long.parseLong(trim.substring(23));
                } else if (trim.equals("must-revalidate") || trim.equals("proxy-revalidate")) {
                    z = true;
                }
                i++;
            }
            i = 1;
        } else {
            z = false;
            j3 = 0;
            j2 = 0;
        }
        String str3 = map.get("Expires");
        if (str3 != null) {
            j4 = parseDateAsEpoch(str3);
        } else {
            j4 = 0;
        }
        String str4 = map.get("Last-Modified");
        if (str4 != null) {
            j5 = parseDateAsEpoch(str4);
        } else {
            j5 = 0;
        }
        String str5 = map.get("ETag");
        if (i != 0) {
            j7 = currentTimeMillis + (j3 * 1000);
            if (z) {
                j8 = j7;
            } else {
                j8 = (j2 * 1000) + j7;
            }
            j6 = j8;
        } else {
            j6 = 0;
            if (j <= 0 || j4 < j) {
                j7 = 0;
            } else {
                j7 = currentTimeMillis + (j4 - j);
                j6 = j7;
            }
        }
        Cache.Entry entry = new Cache.Entry();
        entry.data = networkResponse.data;
        entry.etag = str5;
        entry.softTtl = j7;
        entry.ttl = j6;
        entry.serverDate = j;
        entry.lastModified = j5;
        entry.responseHeaders = map;
        entry.allResponseHeaders = networkResponse.allHeaders;
        return entry;
    }

    public static long parseDateAsEpoch(String str) {
        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss zzz", Locale.US);
            simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
            return simpleDateFormat.parse(str).getTime();
        } catch (ParseException e) {
            if ("0".equals(str) || "-1".equals(str)) {
                VolleyLog.v("Unable to parse dateStr: %s, falling back to 0", str);
                return 0L;
            }
            Log.e("Volley", VolleyLog.buildMessage("Unable to parse dateStr: %s, falling back to 0", str), e);
            return 0L;
        }
    }
}
