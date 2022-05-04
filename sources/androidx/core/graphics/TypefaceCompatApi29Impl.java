package androidx.core.graphics;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.graphics.fonts.Font;
import android.graphics.fonts.FontFamily;
import android.graphics.fonts.FontStyle;
import androidx.core.content.res.FontResourcesParserCompat;
import java.io.IOException;
/* loaded from: classes.dex */
public class TypefaceCompatApi29Impl extends TypefaceCompatBaseImpl {
    @Override // androidx.core.graphics.TypefaceCompatBaseImpl
    public Typeface createFromFontFamilyFilesResourceEntry(Context context, FontResourcesParserCompat.FontFamilyFilesResourceEntry familyEntry, Resources resources, int style) {
        try {
            FontResourcesParserCompat.FontFileResourceEntry[] fontFileResourceEntryArr = familyEntry.mEntries;
            int length = fontFileResourceEntryArr.length;
            int i = 0;
            FontFamily.Builder builder = null;
            int i2 = 0;
            while (true) {
                int i3 = 1;
                if (i2 >= length) {
                    break;
                }
                FontResourcesParserCompat.FontFileResourceEntry fontFileResourceEntry = fontFileResourceEntryArr[i2];
                try {
                    Font.Builder weight = new Font.Builder(resources, fontFileResourceEntry.mResourceId).setWeight(fontFileResourceEntry.mWeight);
                    if (!fontFileResourceEntry.mItalic) {
                        i3 = 0;
                    }
                    Font build = weight.setSlant(i3).setTtcIndex(fontFileResourceEntry.mTtcIndex).setFontVariationSettings(fontFileResourceEntry.mVariationSettings).build();
                    if (builder == null) {
                        builder = new FontFamily.Builder(build);
                    } else {
                        builder.addFont(build);
                    }
                } catch (IOException unused) {
                }
                i2++;
            }
            if (builder == null) {
                return null;
            }
            int i4 = (style & 1) != 0 ? 700 : 400;
            if ((style & 2) != 0) {
                i = 1;
            }
            return new Typeface.CustomFallbackBuilder(builder.build()).setStyle(new FontStyle(i4, i)).build();
        } catch (Exception unused2) {
            return null;
        }
    }
}
