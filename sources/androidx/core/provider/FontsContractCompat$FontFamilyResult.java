package androidx.core.provider;
/* loaded from: classes.dex */
public class FontsContractCompat$FontFamilyResult {
    public final FontsContractCompat$FontInfo[] mFonts;
    public final int mStatusCode;

    @Deprecated
    public FontsContractCompat$FontFamilyResult(int statusCode, FontsContractCompat$FontInfo[] fonts) {
        this.mStatusCode = statusCode;
        this.mFonts = fonts;
    }
}
