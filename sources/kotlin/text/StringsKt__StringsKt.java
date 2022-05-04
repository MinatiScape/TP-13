package kotlin.text;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import kotlin.collections.ArraysUtilJVM;
import kotlin.collections.CollectionsKt__IteratorsJVMKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgression;
import kotlin.ranges.IntRange;
import org.jetbrains.annotations.NotNull;
/* compiled from: Strings.kt */
/* loaded from: classes.dex */
public class StringsKt__StringsKt extends StringsKt__StringsJVMKt {
    public static final int indexOf$StringsKt__StringsKt(CharSequence charSequence, CharSequence charSequence2, int i, int i2, boolean z, boolean z2) {
        IntProgression intProgression;
        if (!z2) {
            if (i < 0) {
                i = 0;
            }
            int length = charSequence.length();
            if (i2 > length) {
                i2 = length;
            }
            intProgression = new IntRange(i, i2);
        } else {
            int lastIndex = getLastIndex(charSequence);
            if (i > lastIndex) {
                i = lastIndex;
            }
            if (i2 < 0) {
                i2 = 0;
            }
            intProgression = new IntProgression(i, i2, -1);
        }
        if (!(charSequence instanceof String) || !(charSequence2 instanceof String)) {
            int i3 = intProgression.first;
            int i4 = intProgression.last;
            int i5 = intProgression.step;
            if ((i5 > 0 && i3 <= i4) || (i5 < 0 && i4 <= i3)) {
                while (true) {
                    int i6 = i3 + i5;
                    if (regionMatchesImpl(charSequence2, charSequence, i3, charSequence2.length(), z)) {
                        return i3;
                    }
                    if (i3 == i4) {
                        break;
                    }
                    i3 = i6;
                }
            }
        } else {
            int i7 = intProgression.first;
            int i8 = intProgression.last;
            int i9 = intProgression.step;
            if ((i9 > 0 && i7 <= i8) || (i9 < 0 && i8 <= i7)) {
                while (true) {
                    int i10 = i7 + i9;
                    if (StringsKt__StringsJVMKt.regionMatches((String) charSequence2, (String) charSequence, i7, charSequence2.length(), z)) {
                        return i7;
                    }
                    if (i7 == i8) {
                        break;
                    }
                    i7 = i10;
                }
            }
        }
        return -1;
    }

    public static String substringAfter$default(String str, String str2) {
        int indexOf = indexOf(str, str2, 0, false);
        if (indexOf == -1) {
            return str;
        }
        String substring = str.substring(str2.length() + indexOf, str.length());
        Intrinsics.checkNotNullExpressionValue(substring, "this as java.lang.String…ing(startIndex, endIndex)");
        return substring;
    }

    public static final int getLastIndex(@NotNull CharSequence charSequence) {
        Intrinsics.checkNotNullParameter(charSequence, "<this>");
        return charSequence.length() - 1;
    }

    public static final int indexOf(@NotNull CharSequence charSequence, @NotNull String string, int i, boolean z) {
        Intrinsics.checkNotNullParameter(charSequence, "<this>");
        Intrinsics.checkNotNullParameter(string, "string");
        if (z || !(charSequence instanceof String)) {
            return indexOf$StringsKt__StringsKt(charSequence, string, i, charSequence.length(), z, false);
        }
        return ((String) charSequence).indexOf(string, i);
    }

    public static int indexOf$default(String str, char c, int i, int i2) {
        if ((i2 & 2) != 0) {
            i = 0;
        }
        return str.indexOf(c, i);
    }

    public static final boolean regionMatchesImpl(@NotNull CharSequence charSequence, @NotNull CharSequence other, int i, int i2, boolean z) {
        Intrinsics.checkNotNullParameter(charSequence, "<this>");
        Intrinsics.checkNotNullParameter(other, "other");
        if (i < 0 || charSequence.length() - i2 < 0 || i > other.length() - i2) {
            return false;
        }
        int i3 = 0;
        while (i3 < i2) {
            int i4 = i3 + 1;
            if (!CharsKt__CharKt.equals(charSequence.charAt(0 + i3), other.charAt(i3 + i), z)) {
                return false;
            }
            i3 = i4;
        }
        return true;
    }

    public static List split$default(String str, String[] strArr) {
        boolean z;
        Intrinsics.checkNotNullParameter(str, "<this>");
        if (strArr.length == 1) {
            String str2 = strArr[0];
            if (str2.length() == 0) {
                z = true;
            } else {
                z = false;
            }
            if (!z) {
                int indexOf = indexOf(str, str2, 0, false);
                if (indexOf == -1) {
                    return ArraysUtilJVM.listOf(str.toString());
                }
                ArrayList arrayList = new ArrayList(10);
                int i = 0;
                do {
                    arrayList.add(str.subSequence(i, indexOf).toString());
                    i = str2.length() + indexOf;
                    indexOf = indexOf(str, str2, i, false);
                } while (indexOf != -1);
                arrayList.add(str.subSequence(i, str.length()).toString());
                return arrayList;
            }
        }
        List asList = Arrays.asList(strArr);
        Intrinsics.checkNotNullExpressionValue(asList, "asList(this)");
        final DelimitedRangesSequence delimitedRangesSequence = new DelimitedRangesSequence(str, 0, 0, new StringsKt__StringsKt$rangesDelimitedBy$2(asList, false));
        Iterable<Object> sequencesKt___SequencesKt$asIterable$$inlined$Iterable$1 = new Iterable<Object>() { // from class: kotlin.sequences.SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1
            @Override // java.lang.Iterable
            @NotNull
            public final Iterator<Object> iterator() {
                return delimitedRangesSequence.iterator();
            }
        };
        ArrayList arrayList2 = new ArrayList(CollectionsKt__IteratorsJVMKt.collectionSizeOrDefault(sequencesKt___SequencesKt$asIterable$$inlined$Iterable$1));
        Iterator<Object> it = sequencesKt___SequencesKt$asIterable$$inlined$Iterable$1.iterator();
        while (it.hasNext()) {
            IntRange range = (IntRange) it.next();
            Intrinsics.checkNotNullParameter(range, "range");
            arrayList2.add(str.subSequence(Integer.valueOf(range.first).intValue(), Integer.valueOf(range.last).intValue() + 1).toString());
        }
        return arrayList2;
    }

    public static String substringAfterLast$default(String missingDelimiterValue) {
        Intrinsics.checkNotNullParameter(missingDelimiterValue, "<this>");
        Intrinsics.checkNotNullParameter(missingDelimiterValue, "missingDelimiterValue");
        int lastIndexOf = missingDelimiterValue.lastIndexOf(46, getLastIndex(missingDelimiterValue));
        if (lastIndexOf == -1) {
            return missingDelimiterValue;
        }
        String substring = missingDelimiterValue.substring(lastIndexOf + 1, missingDelimiterValue.length());
        Intrinsics.checkNotNullExpressionValue(substring, "this as java.lang.String…ing(startIndex, endIndex)");
        return substring;
    }
}
