package androidx.core.provider;

import android.net.Uri;
import java.util.Objects;
/* loaded from: classes.dex */
public class FontsContractCompat$FontInfo {
    public final boolean mItalic;
    public final int mResultCode;
    public final int mTtcIndex;
    public final Uri mUri;
    public final int mWeight;

    @Deprecated
    public FontsContractCompat$FontInfo(Uri uri, int ttcIndex, int weight, boolean italic, int resultCode) {
        Objects.requireNonNull(uri);
        this.mUri = uri;
        this.mTtcIndex = ttcIndex;
        this.mWeight = weight;
        this.mItalic = italic;
        this.mResultCode = resultCode;
    }
}
