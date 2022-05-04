package com.bumptech.glide.disklrucache;

import com.bumptech.glide.Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
/* loaded from: classes.dex */
public final class Util {
    public static final Charset US_ASCII = Charset.forName("US-ASCII");

    static {
        Charset.forName("UTF-8");
    }

    public static void deleteContents(File dir) throws IOException {
        File[] listFiles = dir.listFiles();
        if (listFiles != null) {
            for (File file : listFiles) {
                if (file.isDirectory()) {
                    deleteContents(file);
                }
                if (!file.delete()) {
                    String valueOf = String.valueOf(file);
                    throw new IOException(Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0.m(valueOf.length() + 23, "failed to delete file: ", valueOf));
                }
            }
            return;
        }
        String valueOf2 = String.valueOf(dir);
        throw new IOException(Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0.m(valueOf2.length() + 26, "not a readable directory: ", valueOf2));
    }
}
