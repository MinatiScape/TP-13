package androidx.cardview;

import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
/* loaded from: classes.dex */
public class R$color {
    public static int calculateInSampleSize(int i, int i2, int i3, int i4) {
        int i5 = i2 / 2;
        int i6 = i / 2;
        int i7 = 0;
        while ((i5 >> i7) >= i4 && (i6 >> i7) >= i3) {
            i7++;
        }
        return 1 << i7;
    }

    public static long generateHashCode(Bitmap bitmap) {
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        long j = ((527 + width) * 31) + height;
        for (int i = 0; i < width; i = (i * 2) + 1) {
            for (int i2 = 0; i2 < height; i2 = (i2 * 2) + 1) {
                j = (j * 31) + bitmap.getPixel(i, i2);
            }
        }
        return j;
    }

    public static String getCollectionId(Intent intent) {
        if (isDeepLink(intent)) {
            return intent.getData().getQueryParameter("collection_id");
        }
        return null;
    }

    public static boolean isDeepLink(Intent intent) {
        Uri data = intent.getData();
        return data != null && "https".equals(data.getScheme()) && data.getSchemeSpecificPart().startsWith("//g.co/wallpaper");
    }
}
