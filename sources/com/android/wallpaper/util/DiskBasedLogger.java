package com.android.wallpaper.util;

import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;
import com.android.systemui.shared.system.QuickStepContract;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public final class DiskBasedLogger {
    public static Handler sHandler;
    public static HandlerThread sLoggerThread;
    public static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("EEE MMM dd HH:mm:ss.SSS z yyyy", Locale.US);
    public static final Object S_LOCK = new Object();
    public static final long THREAD_TIMEOUT_MILLIS = TimeUnit.MILLISECONDS.convert(2, TimeUnit.MINUTES);
    public static final AnonymousClass1 THREAD_CLEANUP_RUNNABLE = new Runnable() { // from class: com.android.wallpaper.util.DiskBasedLogger.1
        @Override // java.lang.Runnable
        public final void run() {
            HandlerThread handlerThread = DiskBasedLogger.sLoggerThread;
            if (handlerThread != null && handlerThread.isAlive()) {
                if (!DiskBasedLogger.sLoggerThread.quitSafely()) {
                    Log.e("DiskBasedLogger", "Unable to quit disk-based logger HandlerThread");
                }
                DiskBasedLogger.sLoggerThread = null;
                DiskBasedLogger.sHandler = null;
            }
        }
    };

    public static void copyLogsNewerThanDate(BufferedReader bufferedReader, FileOutputStream fileOutputStream, Date date) {
        try {
            String readLine = bufferedReader.readLine();
            while (readLine != null) {
                try {
                    if (DATE_FORMAT.parse(readLine.split("/")[0]).after(date)) {
                        fileOutputStream.write(readLine.getBytes(StandardCharsets.UTF_8));
                        fileOutputStream.write("\n".getBytes(StandardCharsets.UTF_8));
                    }
                    readLine = bufferedReader.readLine();
                } catch (ParseException e) {
                    Log.e("DiskBasedLogger", "Error parsing date from previous logs", e);
                    return;
                }
            }
        } catch (IOException e2) {
            Log.e("DiskBasedLogger", "IO exception while reading line from buffered reader", e2);
        }
    }

    public static Handler getLoggerThreadHandler() {
        Handler handler;
        synchronized (S_LOCK) {
            if (sLoggerThread == null) {
                HandlerThread handlerThread = new HandlerThread("DiskBasedLoggerThread", 10);
                sLoggerThread = handlerThread;
                handlerThread.start();
                sHandler = new Handler(sLoggerThread.getLooper());
            } else {
                sHandler.removeCallbacks(THREAD_CLEANUP_RUNNABLE);
            }
            sHandler.postDelayed(THREAD_CLEANUP_RUNNABLE, THREAD_TIMEOUT_MILLIS);
            handler = sHandler;
        }
        return handler;
    }

    public static void e(final String str, final String str2, final Context context) {
        Log.e(str, str2);
        String str3 = Build.TYPE;
        if (str3.equals("eng") || str3.equals("userdebug")) {
            Handler loggerThreadHandler = getLoggerThreadHandler();
            if (loggerThreadHandler == null) {
                Log.e("DiskBasedLogger", "Something went wrong creating the logger thread handler, quitting this logging operation");
            } else {
                loggerThreadHandler.post(new Runnable() { // from class: com.android.wallpaper.util.DiskBasedLogger$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        Context context2 = context;
                        String str4 = str;
                        String str5 = str2;
                        File file = new File(context2.getFilesDir(), "logs.txt");
                        String str6 = DiskBasedLogger.DATE_FORMAT.format(Calendar.getInstance().getTime()) + "/E " + str4 + ": " + str5 + "\n";
                        synchronized (DiskBasedLogger.S_LOCK) {
                            try {
                                FileOutputStream openFileOutput = context2.openFileOutput(file.getName(), QuickStepContract.SYSUI_STATE_DIALOG_SHOWING);
                                openFileOutput.write(str6.getBytes(StandardCharsets.UTF_8));
                                openFileOutput.close();
                            } catch (IOException e) {
                                Log.e("DiskBasedLogger", "Unable to close output stream for disk-based log buffer", e);
                            }
                        }
                    }
                });
            }
        }
    }

    public static Handler getHandler() {
        return sHandler;
    }
}
