package com.bumptech.glide.disklrucache;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
/* loaded from: classes.dex */
public final class Util {
    public static final Charset US_ASCII = Charset.forName("US-ASCII");

    static {
        Charset.forName("UTF-8");
    }

    public static void deleteContents(File file) throws IOException {
        File[] listFiles = file.listFiles();
        if (listFiles != null) {
            for (File file2 : listFiles) {
                if (file2.isDirectory()) {
                    deleteContents(file2);
                }
                if (!file2.delete()) {
                    throw new IOException("failed to delete file: " + file2);
                }
            }
            return;
        }
        throw new IOException("not a readable directory: " + file);
    }
}
