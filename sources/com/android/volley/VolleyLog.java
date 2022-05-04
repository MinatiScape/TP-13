package com.android.volley;

import android.os.SystemClock;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;
/* loaded from: classes.dex */
public final class VolleyLog {
    public static boolean DEBUG = Log.isLoggable("Volley", 2);
    public static final String CLASS_NAME = VolleyLog.class.getName();

    /* loaded from: classes.dex */
    public static class MarkerLog {
        public static final boolean ENABLED = VolleyLog.DEBUG;
        public final ArrayList mMarkers = new ArrayList();
        public boolean mFinished = false;

        public final synchronized void add(String str, long j) {
            if (!this.mFinished) {
                this.mMarkers.add(new Marker(str, j, SystemClock.elapsedRealtime()));
            } else {
                throw new IllegalStateException("Marker added to finished log");
            }
        }

        public final synchronized void finish(String str) {
            this.mFinished = true;
            long totalDuration = getTotalDuration();
            if (totalDuration > 0) {
                long j = ((Marker) this.mMarkers.get(0)).time;
                VolleyLog.d("(%-4d ms) %s", Long.valueOf(totalDuration), str);
                Iterator it = this.mMarkers.iterator();
                while (it.hasNext()) {
                    Marker marker = (Marker) it.next();
                    long j2 = marker.time;
                    VolleyLog.d("(+%-4d) [%2d] %s", Long.valueOf(j2 - j), Long.valueOf(marker.thread), marker.name);
                    j = j2;
                }
            }
        }

        /* loaded from: classes.dex */
        public static class Marker {
            public final String name;
            public final long thread;
            public final long time;

            public Marker(String str, long j, long j2) {
                this.name = str;
                this.thread = j;
                this.time = j2;
            }
        }

        public final void finalize() throws Throwable {
            if (!this.mFinished) {
                finish("Request on the loose");
                VolleyLog.e("Marker log finalized without finish() - uncaught exit point for request", new Object[0]);
            }
        }

        public final long getTotalDuration() {
            if (this.mMarkers.size() == 0) {
                return 0L;
            }
            long j = ((Marker) this.mMarkers.get(0)).time;
            ArrayList arrayList = this.mMarkers;
            return ((Marker) arrayList.get(arrayList.size() - 1)).time - j;
        }
    }

    public VolleyLog() {
        throw null;
    }

    public static String buildMessage(String str, Object... objArr) {
        String str2;
        String format = String.format(Locale.US, str, objArr);
        StackTraceElement[] stackTrace = new Throwable().fillInStackTrace().getStackTrace();
        int i = 2;
        while (true) {
            if (i >= stackTrace.length) {
                str2 = "<unknown>";
                break;
            } else if (!stackTrace[i].getClassName().equals(CLASS_NAME)) {
                String className = stackTrace[i].getClassName();
                String substring = className.substring(className.lastIndexOf(46) + 1);
                str2 = substring.substring(substring.lastIndexOf(36) + 1) + "." + stackTrace[i].getMethodName();
                break;
            } else {
                i++;
            }
        }
        return String.format(Locale.US, "[%d] %s: %s", Long.valueOf(Thread.currentThread().getId()), str2, format);
    }

    public static void v(String str, Object... objArr) {
        if (DEBUG) {
            Log.v("Volley", buildMessage(str, objArr));
        }
    }

    public static void d(String str, Object... objArr) {
        Log.d("Volley", buildMessage(str, objArr));
    }

    public static void e(String str, Object... objArr) {
        Log.e("Volley", buildMessage(str, objArr));
    }
}
