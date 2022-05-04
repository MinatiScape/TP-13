package androidx.core.provider;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.support.v4.app.FragmentTabHost$SavedState$$ExternalSyntheticOutline0;
import android.util.Base64;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public final class FontRequest {
    public final List<List<byte[]>> mCertificates;
    public final String mIdentifier;
    public final String mProviderAuthority;
    public final String mProviderPackage;
    public final String mQuery;

    public FontRequest(String providerAuthority, String providerPackage, String query, List<List<byte[]>> certificates) {
        this.mProviderAuthority = providerAuthority;
        this.mProviderPackage = providerPackage;
        this.mQuery = query;
        Objects.requireNonNull(certificates);
        this.mCertificates = certificates;
        this.mIdentifier = providerAuthority + "-" + providerPackage + "-" + query;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("FontRequest {mProviderAuthority: ");
        m.append(this.mProviderAuthority);
        m.append(", mProviderPackage: ");
        m.append(this.mProviderPackage);
        m.append(", mQuery: ");
        m.append(this.mQuery);
        m.append(", mCertificates:");
        sb.append(m.toString());
        for (int i = 0; i < this.mCertificates.size(); i++) {
            sb.append(" [");
            List<byte[]> list = this.mCertificates.get(i);
            for (int i2 = 0; i2 < list.size(); i2++) {
                sb.append(" \"");
                sb.append(Base64.encodeToString(list.get(i2), 0));
                sb.append("\"");
            }
            sb.append(" ]");
        }
        return FragmentTabHost$SavedState$$ExternalSyntheticOutline0.m(sb, "}", "mCertificatesArray: 0");
    }
}
