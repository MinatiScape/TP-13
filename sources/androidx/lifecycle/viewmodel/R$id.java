package androidx.lifecycle.viewmodel;

import android.os.Build;
import java.util.Locale;
/* loaded from: classes.dex */
public class R$id {
    public static boolean isDateInputKeyboardMissingSeparatorCharacters() {
        String str = Build.MANUFACTURER;
        Locale locale = Locale.ENGLISH;
        return str.toLowerCase(locale).equals("lge") || str.toLowerCase(locale).equals("samsung");
    }

    public static final int mod(int i, int i2) {
        int i3 = i % i2;
        return i3 >= 0 ? i3 : i3 + i2;
    }
}
