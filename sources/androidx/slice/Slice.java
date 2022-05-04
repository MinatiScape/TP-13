package androidx.slice;

import android.net.Uri;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.core.graphics.drawable.IconCompat;
import androidx.versionedparcelable.CustomVersionedParcelable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public final class Slice extends CustomVersionedParcelable {
    public static final String[] NO_HINTS = new String[0];
    public static final SliceItem[] NO_ITEMS = new SliceItem[0];
    public String[] mHints;
    public SliceItem[] mItems;
    public SliceSpec mSpec;
    public String mUri;

    public Slice(ArrayList<SliceItem> items, String[] hints, Uri uri, SliceSpec spec) {
        this.mSpec = null;
        this.mItems = NO_ITEMS;
        this.mHints = NO_HINTS;
        this.mUri = null;
        this.mHints = hints;
        this.mItems = (SliceItem[]) items.toArray(new SliceItem[items.size()]);
        this.mUri = uri.toString();
        this.mSpec = spec;
    }

    public static void appendHints(StringBuilder sb, String[] hints) {
        if (!(hints == null || hints.length == 0)) {
            sb.append('(');
            int length = hints.length - 1;
            for (int i = 0; i < length; i++) {
                sb.append(hints[i]);
                sb.append(", ");
            }
            sb.append(hints[length]);
            sb.append(")");
        }
    }

    public static boolean isValidIcon(IconCompat icon) {
        if (icon.mType != 2 || icon.getResId() != 0) {
            return true;
        }
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Failed to add icon, invalid resource id: ");
        m.append(icon.getResId());
        throw new IllegalArgumentException(m.toString());
    }

    public List<SliceItem> getItems() {
        return Arrays.asList(this.mItems);
    }

    public Uri getUri() {
        return Uri.parse(this.mUri);
    }

    public String toString() {
        return toString("");
    }

    public String toString(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent);
        sb.append("Slice ");
        String[] strArr = this.mHints;
        if (strArr.length > 0) {
            appendHints(sb, strArr);
            sb.append(' ');
        }
        sb.append('[');
        sb.append(this.mUri);
        sb.append("] {\n");
        String str = indent + "  ";
        int i = 0;
        while (true) {
            SliceItem[] sliceItemArr = this.mItems;
            if (i < sliceItemArr.length) {
                sb.append(sliceItemArr[i].toString(str));
                i++;
            } else {
                sb.append(indent);
                sb.append('}');
                return sb.toString();
            }
        }
    }

    public Slice() {
        this.mSpec = null;
        this.mItems = NO_ITEMS;
        this.mHints = NO_HINTS;
        this.mUri = null;
    }
}
