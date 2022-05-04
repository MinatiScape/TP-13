package com.android.wallpaper.util;

import android.content.Context;
import android.util.Log;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.wallpaper.picker.ImagePreviewFragment;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.ExecutorService;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class DiskBasedLogger$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ DiskBasedLogger$$ExternalSyntheticLambda0(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                Context context = (Context) this.f$0;
                File file = new File(context.getFilesDir(), "logs.txt");
                if (!file.exists()) {
                    Log.w("DiskBasedLogger", "Disk-based log buffer doesn't exist, so there's nothing to clean up.");
                    return;
                }
                synchronized (DiskBasedLogger.S_LOCK) {
                    try {
                        try {
                            FileInputStream openFileInput = context.openFileInput("logs.txt");
                            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(openFileInput, StandardCharsets.UTF_8));
                            Calendar calendar = Calendar.getInstance();
                            calendar.add(5, -7);
                            Date time = calendar.getTime();
                            File file2 = new File(context.getFilesDir(), "temp_logs.txt");
                            try {
                                FileOutputStream openFileOutput = context.openFileOutput("temp_logs.txt", QuickStepContract.SYSUI_STATE_DIALOG_SHOWING);
                                DiskBasedLogger.copyLogsNewerThanDate(bufferedReader, openFileOutput, time);
                                try {
                                    openFileInput.close();
                                } catch (IOException unused) {
                                    Log.e("DiskBasedLogger", "couldn't close input stream for log file");
                                }
                                try {
                                    openFileOutput.close();
                                } catch (IOException unused2) {
                                    Log.e("DiskBasedLogger", "couldn't close output stream for temp log file");
                                }
                                if (file2.exists() && !file2.renameTo(file)) {
                                    Log.e("DiskBasedLogger", "couldn't rename temp logs file to final logs file");
                                }
                            } catch (IOException e) {
                                Log.e("DiskBasedLogger", "Unable to close output stream for disk-based log buffer", e);
                                return;
                            }
                        } catch (IOException e2) {
                            Log.e("DiskBasedLogger", "IO exception opening a buffered reader for the existing logs file", e2);
                            return;
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                }
                return;
            default:
                ExecutorService executorService = ImagePreviewFragment.sExecutor;
                ((ImagePreviewFragment) this.f$0).recalculateColors(true);
                return;
        }
    }
}
