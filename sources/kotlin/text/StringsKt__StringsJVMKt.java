package kotlin.text;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: StringsJVM.kt */
/* loaded from: classes.dex */
public class StringsKt__StringsJVMKt extends StringsKt__StringNumberConversionsKt {
    public static final boolean regionMatches(@NotNull String str, @NotNull String other, int i, int i2, boolean z) {
        Intrinsics.checkNotNullParameter(str, "<this>");
        Intrinsics.checkNotNullParameter(other, "other");
        if (!z) {
            return str.regionMatches(0, other, i, i2);
        }
        return str.regionMatches(z, 0, other, i, i2);
    }

    public static void replace$default(String str) {
        Intrinsics.checkNotNullParameter(str, "<this>");
        int indexOf = StringsKt__StringsKt.indexOf(str, "/", 0, false);
        if (indexOf >= 0) {
            int length = (str.length() - 1) + 1;
            if (length >= 0) {
                StringBuilder sb = new StringBuilder(length);
                int i = 0;
                do {
                    sb.append((CharSequence) str, i, indexOf);
                    sb.append("-");
                    i = indexOf + 1;
                    if (indexOf >= str.length()) {
                        break;
                    }
                    indexOf = StringsKt__StringsKt.indexOf(str, "/", indexOf + 1, false);
                } while (indexOf > 0);
                sb.append((CharSequence) str, i, str.length());
                Intrinsics.checkNotNullExpressionValue(sb.toString(), "stringBuilder.append(this, i, length).toString()");
                return;
            }
            throw new OutOfMemoryError();
        }
    }
}
