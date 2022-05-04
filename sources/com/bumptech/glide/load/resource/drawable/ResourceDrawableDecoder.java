package com.bumptech.glide.load.resource.drawable;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import java.io.IOException;
import java.util.List;
/* loaded from: classes.dex */
public final class ResourceDrawableDecoder implements ResourceDecoder<Uri, Drawable> {
    public final Context context;

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final /* bridge */ /* synthetic */ Resource<Drawable> decode(Uri uri, int i, int i2, Options options) throws IOException {
        return decode(uri);
    }

    public final Resource decode(Uri uri) {
        Context context;
        int i;
        String authority = uri.getAuthority();
        if (authority.equals(this.context.getPackageName())) {
            context = this.context;
        } else {
            try {
                context = this.context.createPackageContext(authority, 0);
            } catch (PackageManager.NameNotFoundException e) {
                if (authority.contains(this.context.getPackageName())) {
                    context = this.context;
                } else {
                    throw new IllegalArgumentException("Failed to obtain context or unrecognized Uri format for: " + uri, e);
                }
            }
        }
        List<String> pathSegments = uri.getPathSegments();
        if (pathSegments.size() == 2) {
            List<String> pathSegments2 = uri.getPathSegments();
            String authority2 = uri.getAuthority();
            String str = pathSegments2.get(0);
            String str2 = pathSegments2.get(1);
            i = context.getResources().getIdentifier(str2, str, authority2);
            if (i == 0) {
                i = Resources.getSystem().getIdentifier(str2, str, "android");
            }
            if (i == 0) {
                throw new IllegalArgumentException("Failed to find resource id for: " + uri);
            }
        } else if (pathSegments.size() == 1) {
            try {
                i = Integer.parseInt(uri.getPathSegments().get(0));
            } catch (NumberFormatException e2) {
                throw new IllegalArgumentException("Unrecognized Uri format: " + uri, e2);
            }
        } else {
            throw new IllegalArgumentException("Unrecognized Uri format: " + uri);
        }
        Drawable drawable = DrawableDecoderCompat.getDrawable(this.context, context, i, null);
        if (drawable != null) {
            return new NonOwnedDrawableResource(drawable);
        }
        return null;
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final boolean handles(Uri uri, Options options) throws IOException {
        return uri.getScheme().equals("android.resource");
    }

    public ResourceDrawableDecoder(Context context) {
        this.context = context.getApplicationContext();
    }
}
