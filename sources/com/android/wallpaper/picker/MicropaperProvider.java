package com.android.wallpaper.picker;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import java.io.FileNotFoundException;
/* loaded from: classes.dex */
public class MicropaperProvider extends ContentProvider {
    @Override // android.content.ContentProvider
    public final boolean onCreate() {
        return true;
    }

    @Override // android.content.ContentProvider
    public final int delete(Uri uri, String str, String[] strArr) {
        throw new RuntimeException("delete method not implemented.");
    }

    @Override // android.content.ContentProvider
    public final String getType(Uri uri) {
        throw new RuntimeException("getType method not implemented.");
    }

    @Override // android.content.ContentProvider
    public final Uri insert(Uri uri, ContentValues contentValues) {
        throw new RuntimeException("insert method not implemented.");
    }

    @Override // android.content.ContentProvider
    public final Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        throw new RuntimeException("query method not implemented.");
    }

    @Override // android.content.ContentProvider
    public final int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        throw new RuntimeException("update method not implemented.");
    }

    @Override // android.content.ContentProvider
    public final ParcelFileDescriptor openFile(Uri uri, String str) throws FileNotFoundException {
        if (getCallingPackage().equals("com.google.pixel.dynamicwallpapers")) {
            return getContext().getContentResolver().openFileDescriptor(Uri.parse(uri.getLastPathSegment()), str);
        }
        throw new IllegalStateException("Cannot openFile() from arbitrary package.");
    }
}
