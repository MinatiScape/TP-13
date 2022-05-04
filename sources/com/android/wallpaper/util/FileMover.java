package com.android.wallpaper.util;

import android.content.Context;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
/* loaded from: classes.dex */
public final class FileMover {
    public static void moveFileBetweenContexts(Context context, Context context2) throws IOException {
        if (context.getFileStreamPath("rotating_wallpaper.jpg").exists()) {
            FileInputStream openFileInput = context.openFileInput("rotating_wallpaper.jpg");
            try {
                FileOutputStream openFileOutput = context2.openFileOutput("rotating_wallpaper.jpg", 0);
                FileChannel channel = openFileInput.getChannel();
                channel.transferTo(0L, channel.size(), openFileOutput.getChannel());
                openFileOutput.flush();
                context.deleteFile("rotating_wallpaper.jpg");
                openFileOutput.close();
                openFileInput.close();
                context2.getFileStreamPath("rotating_wallpaper.jpg");
            } catch (Throwable th) {
                if (openFileInput != null) {
                    try {
                        openFileInput.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                }
                throw th;
            }
        }
    }
}
