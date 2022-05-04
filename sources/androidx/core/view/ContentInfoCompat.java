package androidx.core.view;

import android.content.ClipData;
import android.net.Uri;
import android.os.Bundle;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.support.v4.app.FragmentTabHost$SavedState$$ExternalSyntheticOutline0;
import java.util.Locale;
import java.util.Objects;
/* loaded from: classes.dex */
public final class ContentInfoCompat {
    public final ClipData mClip;
    public final Bundle mExtras;
    public final int mFlags;
    public final Uri mLinkUri;
    public final int mSource;

    /* loaded from: classes.dex */
    public static final class Builder {
        public ClipData mClip;
        public Bundle mExtras;
        public int mFlags;
        public Uri mLinkUri;
        public int mSource;

        public Builder(ClipData clip, int source) {
            this.mClip = clip;
            this.mSource = source;
        }
    }

    public ContentInfoCompat(Builder b) {
        ClipData clipData = b.mClip;
        Objects.requireNonNull(clipData);
        this.mClip = clipData;
        int i = b.mSource;
        if (i < 0) {
            throw new IllegalArgumentException(String.format(Locale.US, "%s is out of range of [%d, %d] (too low)", "source", 0, 3));
        } else if (i <= 3) {
            this.mSource = i;
            int i2 = b.mFlags;
            if ((i2 & 1) == i2) {
                this.mFlags = i2;
                this.mLinkUri = b.mLinkUri;
                this.mExtras = b.mExtras;
                return;
            }
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Requested flags 0x");
            m.append(Integer.toHexString(i2));
            m.append(", but only 0x");
            m.append(Integer.toHexString(1));
            m.append(" are allowed");
            throw new IllegalArgumentException(m.toString());
        } else {
            throw new IllegalArgumentException(String.format(Locale.US, "%s is out of range of [%d, %d] (too high)", "source", 0, 3));
        }
    }

    public String toString() {
        String str;
        String str2;
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("ContentInfoCompat{clip=");
        m.append(this.mClip.getDescription());
        m.append(", source=");
        int i = this.mSource;
        if (i == 0) {
            str = "SOURCE_APP";
        } else if (i == 1) {
            str = "SOURCE_CLIPBOARD";
        } else if (i != 2) {
            str = i != 3 ? String.valueOf(i) : "SOURCE_DRAG_AND_DROP";
        } else {
            str = "SOURCE_INPUT_METHOD";
        }
        m.append(str);
        m.append(", flags=");
        int i2 = this.mFlags;
        m.append((i2 & 1) != 0 ? "FLAG_CONVERT_TO_PLAIN_TEXT" : String.valueOf(i2));
        String str3 = "";
        if (this.mLinkUri == null) {
            str2 = str3;
        } else {
            StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(", hasLinkUri(");
            m2.append(this.mLinkUri.toString().length());
            m2.append(")");
            str2 = m2.toString();
        }
        m.append(str2);
        if (this.mExtras != null) {
            str3 = ", hasExtras";
        }
        return FragmentTabHost$SavedState$$ExternalSyntheticOutline0.m(m, str3, "}");
    }
}
