package com.bumptech.glide.load.data;

import android.content.ContentResolver;
import android.content.UriMatcher;
import android.net.Uri;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class StreamLocalUriFetcher extends LocalUriFetcher<InputStream> {
    public static final UriMatcher URI_MATCHER;

    static {
        UriMatcher uriMatcher = new UriMatcher(-1);
        URI_MATCHER = uriMatcher;
        uriMatcher.addURI("com.android.contacts", "contacts/lookup/*/#", 1);
        uriMatcher.addURI("com.android.contacts", "contacts/lookup/*", 1);
        uriMatcher.addURI("com.android.contacts", "contacts/#/photo", 2);
        uriMatcher.addURI("com.android.contacts", "contacts/#", 3);
        uriMatcher.addURI("com.android.contacts", "contacts/#/display_photo", 4);
        uriMatcher.addURI("com.android.contacts", "phone_lookup/*", 5);
    }

    @Override // com.bumptech.glide.load.data.LocalUriFetcher
    public final void close(InputStream inputStream) throws IOException {
        inputStream.close();
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0025 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0026  */
    @Override // com.bumptech.glide.load.data.LocalUriFetcher
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.InputStream loadResource(android.net.Uri r3, android.content.ContentResolver r4) throws java.io.FileNotFoundException {
        /*
            r2 = this;
            android.content.UriMatcher r2 = com.bumptech.glide.load.data.StreamLocalUriFetcher.URI_MATCHER
            int r2 = r2.match(r3)
            r0 = 1
            if (r2 == r0) goto L19
            r1 = 3
            if (r2 == r1) goto L14
            r1 = 5
            if (r2 == r1) goto L19
            java.io.InputStream r2 = r4.openInputStream(r3)
            goto L23
        L14:
            java.io.InputStream r2 = android.provider.ContactsContract.Contacts.openContactPhotoInputStream(r4, r3, r0)
            goto L23
        L19:
            android.net.Uri r2 = android.provider.ContactsContract.Contacts.lookupContact(r4, r3)
            if (r2 == 0) goto L3d
            java.io.InputStream r2 = android.provider.ContactsContract.Contacts.openContactPhotoInputStream(r4, r2, r0)
        L23:
            if (r2 == 0) goto L26
            return r2
        L26:
            java.io.FileNotFoundException r2 = new java.io.FileNotFoundException
            java.lang.StringBuilder r4 = new java.lang.StringBuilder
            r4.<init>()
            java.lang.String r0 = "InputStream is null for "
            r4.append(r0)
            r4.append(r3)
            java.lang.String r3 = r4.toString()
            r2.<init>(r3)
            throw r2
        L3d:
            java.io.FileNotFoundException r2 = new java.io.FileNotFoundException
            java.lang.String r3 = "Contact cannot be found"
            r2.<init>(r3)
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.data.StreamLocalUriFetcher.loadResource(android.net.Uri, android.content.ContentResolver):java.lang.Object");
    }

    public StreamLocalUriFetcher(ContentResolver contentResolver, Uri uri) {
        super(contentResolver, uri);
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final Class<InputStream> getDataClass() {
        return InputStream.class;
    }
}
