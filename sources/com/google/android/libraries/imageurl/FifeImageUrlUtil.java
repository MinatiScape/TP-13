package com.google.android.libraries.imageurl;

import android.net.Uri;
import com.google.photos.base.BaseImageUrlUtil;
import com.google.photos.base.ImageUrlOptionsStringBuilder;
import com.google.photos.base.ThinBaseImageUrlUtil;
import java.util.regex.Pattern;
/* loaded from: classes.dex */
public final class FifeImageUrlUtil extends BaseImageUrlUtil<Uri> {

    /* loaded from: classes.dex */
    public static class AndroidUriWrapper implements BaseImageUrlUtil.UriWrapper<Uri> {
        public final Uri uri;

        public final String getPath() {
            return this.uri.getPath();
        }

        public final String toString() {
            return this.uri.toString();
        }

        public AndroidUriWrapper(Uri uri) {
            this.uri = uri;
        }
    }

    /* loaded from: classes.dex */
    public static class Options extends ImageUrlOptionsStringBuilder {
    }

    public final Uri mergeOptions(Options options, Uri uri) throws InvalidUrlException {
        try {
            return changeImageUrlOptions(options, new AndroidUriWrapper(uri), false, true);
        } catch (BaseImageUrlUtil.InvalidUrlException e) {
            throw new InvalidUrlException(e);
        }
    }

    public static boolean isFifeHostedUri(Uri uri) {
        boolean z;
        String uri2 = uri.toString();
        Pattern pattern = ThinBaseImageUrlUtil.FIFE_HOSTED_IMAGE_URL_RE;
        if (uri2 != null) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            return ThinBaseImageUrlUtil.FIFE_HOSTED_IMAGE_URL_RE.matcher(uri2).find();
        }
        throw new IllegalArgumentException();
    }

    /* loaded from: classes.dex */
    public static class InvalidUrlException extends Exception {
        public InvalidUrlException(BaseImageUrlUtil.InvalidUrlException invalidUrlException) {
            super(invalidUrlException);
        }
    }
}
