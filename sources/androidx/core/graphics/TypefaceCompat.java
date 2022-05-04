package androidx.core.graphics;

import android.content.res.Resources;
import android.graphics.Typeface;
import android.graphics.fonts.Font;
import android.graphics.fonts.FontFamily;
import androidx.collection.LruCache;
import androidx.core.content.res.ResourcesCompat;
import com.google.android.gms.common.util.zzh;
/* loaded from: classes.dex */
public final class TypefaceCompat {
    public static final TypefaceCompatApi29Impl sTypefaceCompatImpl = new TypefaceCompatApi29Impl();
    public static final LruCache<String, Typeface> sTypefaceCache = new LruCache<>(16);

    /* loaded from: classes.dex */
    public static class ResourcesCallbackAdapter extends zzh {
        public ResourcesCompat.FontCallback mFontCallback;

        public ResourcesCallbackAdapter(ResourcesCompat.FontCallback fontCallback) {
            this.mFontCallback = fontCallback;
        }
    }

    public static void clearCache() {
        sTypefaceCache.trimToSize(-1);
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0025, code lost:
        if (r0.equals(r5) == false) goto L13;
     */
    /* JADX WARN: Type inference failed for: r13v3, types: [androidx.core.provider.FontRequestWorker$3] */
    /* JADX WARN: Type inference failed for: r9v11, types: [androidx.core.provider.FontRequestWorker$4] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static android.graphics.Typeface createFromResourcesFamilyXml(final android.content.Context r8, androidx.core.content.res.FontResourcesParserCompat.FamilyResourceEntry r9, android.content.res.Resources r10, int r11, final int r12, androidx.core.content.res.ResourcesCompat.FontCallback r13, boolean r14) {
        /*
            Method dump skipped, instructions count: 465
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.core.graphics.TypefaceCompat.createFromResourcesFamilyXml(android.content.Context, androidx.core.content.res.FontResourcesParserCompat$FamilyResourceEntry, android.content.res.Resources, int, int, androidx.core.content.res.ResourcesCompat$FontCallback, boolean):android.graphics.Typeface");
    }

    public static Typeface createFromResourcesFontFile(Resources resources, int i, int i2) {
        Typeface typeface;
        sTypefaceCompatImpl.getClass();
        try {
            Font build = new Font.Builder(resources, i).build();
            typeface = new Typeface.CustomFallbackBuilder(new FontFamily.Builder(build).build()).setStyle(build.getStyle()).build();
        } catch (Exception unused) {
            typeface = null;
        }
        if (typeface != null) {
            sTypefaceCache.put(createResourceUid(resources, i, i2), typeface);
        }
        return typeface;
    }

    public static String createResourceUid(Resources resources, int i, int i2) {
        return resources.getResourcePackageName(i) + "-" + i + "-" + i2;
    }
}
