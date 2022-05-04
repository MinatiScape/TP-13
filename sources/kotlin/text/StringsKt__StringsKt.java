package kotlin.text;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.collections.ArraysKt___ArraysKt;
import kotlin.collections.CollectionsKt__CollectionsKt;
import kotlin.collections.CollectionsKt__IteratorsJVMKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgression;
import kotlin.ranges.IntRange;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public class StringsKt__StringsKt extends StringsKt__StringsJVMKt {
    public static final int getLastIndex(@NotNull CharSequence lastIndex) {
        Intrinsics.checkNotNullParameter(lastIndex, "$this$lastIndex");
        return lastIndex.length() - 1;
    }

    public static final int indexOf(@NotNull CharSequence indexOf, @NotNull String string, int i, boolean z) {
        Intrinsics.checkNotNullParameter(indexOf, "$this$indexOf");
        Intrinsics.checkNotNullParameter(string, "string");
        if (z || !(indexOf instanceof String)) {
            return indexOf$StringsKt__StringsKt(indexOf, string, i, indexOf.length(), z, false);
        }
        return ((String) indexOf).indexOf(string, i);
    }

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
            if (i5 < 0 ? i3 >= i4 : i3 <= i4) {
                while (!regionMatchesImpl(charSequence2, 0, charSequence, i3, charSequence2.length(), z)) {
                    if (i3 != i4) {
                        i3 += i5;
                    }
                }
                return i3;
            }
        } else {
            int i6 = intProgression.first;
            int i7 = intProgression.last;
            int i8 = intProgression.step;
            if (i8 < 0 ? i6 >= i7 : i6 <= i7) {
                while (!StringsKt__StringsJVMKt.regionMatches((String) charSequence2, 0, (String) charSequence, i6, charSequence2.length(), z)) {
                    if (i6 != i7) {
                        i6 += i8;
                    }
                }
                return i6;
            }
        }
        return -1;
    }

    public static int indexOf$default(CharSequence charSequence, char c, int i, boolean z, int i2) {
        boolean z2;
        if ((i2 & 2) != 0) {
            i = 0;
        }
        if ((i2 & 4) != 0) {
            z = false;
        }
        if (!z) {
            return ((String) charSequence).indexOf(c, i);
        }
        char[] cArr = {c};
        if (!z) {
            return ((String) charSequence).indexOf(ArraysKt___ArraysKt.single(cArr), i);
        }
        if (i < 0) {
            i = 0;
        }
        int lastIndex = getLastIndex(charSequence);
        if (i <= lastIndex) {
            while (true) {
                char charAt = charSequence.charAt(i);
                int i3 = 0;
                while (true) {
                    if (i3 >= 1) {
                        z2 = false;
                        break;
                    } else if (CharsKt__CharKt.equals(cArr[i3], charAt, z)) {
                        z2 = true;
                        break;
                    } else {
                        i3++;
                    }
                }
                if (!z2) {
                    if (i == lastIndex) {
                        break;
                    }
                    i++;
                } else {
                    return i;
                }
            }
        }
        return -1;
    }

    public static int lastIndexOf$default(CharSequence lastIndexOf, String string, int i, boolean z, int i2) {
        if ((i2 & 2) != 0) {
            i = getLastIndex(lastIndexOf);
        }
        int i3 = i;
        if ((i2 & 4) != 0) {
            z = false;
        }
        boolean z2 = z;
        Intrinsics.checkNotNullParameter(lastIndexOf, "$this$lastIndexOf");
        Intrinsics.checkNotNullParameter(string, "string");
        if (z2 || !(lastIndexOf instanceof String)) {
            return indexOf$StringsKt__StringsKt(lastIndexOf, string, i3, 0, z2, true);
        }
        return ((String) lastIndexOf).lastIndexOf(string, i3);
    }

    public static final boolean regionMatchesImpl(@NotNull CharSequence regionMatchesImpl, int i, @NotNull CharSequence other, int i2, int i3, boolean z) {
        Intrinsics.checkNotNullParameter(regionMatchesImpl, "$this$regionMatchesImpl");
        Intrinsics.checkNotNullParameter(other, "other");
        if (i2 < 0 || i < 0 || i > regionMatchesImpl.length() - i3 || i2 > other.length() - i3) {
            return false;
        }
        for (int i4 = 0; i4 < i3; i4++) {
            if (!CharsKt__CharKt.equals(regionMatchesImpl.charAt(i + i4), other.charAt(i2 + i4), z)) {
                return false;
            }
        }
        return true;
    }

    public static List split$default(CharSequence split, String[] strArr, boolean z, int i, int i2) {
        int i3 = 0;
        if ((i2 & 2) != 0) {
            z = false;
        }
        if ((i2 & 4) != 0) {
            i = 0;
        }
        Intrinsics.checkNotNullParameter(split, "$this$split");
        int i4 = 10;
        boolean z2 = true;
        if (strArr.length == 1) {
            String str = strArr[0];
            if (!(str.length() == 0)) {
                if (i >= 0) {
                    int indexOf = indexOf(split, str, 0, z);
                    if (indexOf == -1 || i == 1) {
                        return CollectionsKt__CollectionsKt.listOf(split.toString());
                    }
                    if (i <= 0) {
                        z2 = false;
                    }
                    if (z2 && i <= 10) {
                        i4 = i;
                    }
                    ArrayList arrayList = new ArrayList(i4);
                    do {
                        arrayList.add(split.subSequence(i3, indexOf).toString());
                        i3 = str.length() + indexOf;
                        if (z2 && arrayList.size() == i - 1) {
                            break;
                        }
                        indexOf = indexOf(split, str, i3, z);
                    } while (indexOf != -1);
                    arrayList.add(split.subSequence(i3, split.length()).toString());
                    return arrayList;
                }
                throw new IllegalArgumentException(("Limit must be non-negative, but was " + i + '.').toString());
            }
        }
        if (i >= 0) {
            final DelimitedRangesSequence delimitedRangesSequence = new DelimitedRangesSequence(split, 0, i, new StringsKt__StringsKt$rangesDelimitedBy$4(ArraysKt___ArraysKt.asList(strArr), z));
            Iterable<T> sequencesKt___SequencesKt$asIterable$$inlined$Iterable$1 = new Iterable<T>() { // from class: kotlin.sequences.SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1
                @Override // java.lang.Iterable
                @NotNull
                public Iterator<T> iterator() {
                    return Sequence.this.iterator();
                }
            };
            ArrayList arrayList2 = new ArrayList(CollectionsKt__IteratorsJVMKt.collectionSizeOrDefault(sequencesKt___SequencesKt$asIterable$$inlined$Iterable$1, 10));
            Iterator it = sequencesKt___SequencesKt$asIterable$$inlined$Iterable$1.iterator();
            while (it.hasNext()) {
                IntRange range = (IntRange) it.next();
                Intrinsics.checkNotNullParameter(range, "range");
                arrayList2.add(split.subSequence(Integer.valueOf(range.first).intValue(), Integer.valueOf(range.last).intValue() + 1).toString());
            }
            return arrayList2;
        }
        throw new IllegalArgumentException(("Limit must be non-negative, but was " + i + '.').toString());
    }

    public static String substringAfter$default(String str, String str2, String str3, int i) {
        String missingDelimiterValue = (i & 2) != 0 ? str : null;
        Intrinsics.checkNotNullParameter(missingDelimiterValue, "missingDelimiterValue");
        int indexOf$default = indexOf$default((CharSequence) str, str2, 0, false, 6);
        if (indexOf$default == -1) {
            return missingDelimiterValue;
        }
        String substring = str.substring(str2.length() + indexOf$default, str.length());
        Intrinsics.checkNotNullExpressionValue(substring, "(this as java.lang.Strin…ing(startIndex, endIndex)");
        return substring;
    }

    public static String substringAfterLast$default(String substringAfterLast, char c, String str, int i) {
        String missingDelimiterValue = (i & 2) != 0 ? substringAfterLast : null;
        Intrinsics.checkNotNullParameter(substringAfterLast, "$this$substringAfterLast");
        Intrinsics.checkNotNullParameter(missingDelimiterValue, "missingDelimiterValue");
        int lastIndexOf = substringAfterLast.lastIndexOf(c, getLastIndex(substringAfterLast));
        if (lastIndexOf == -1) {
            return missingDelimiterValue;
        }
        String substring = substringAfterLast.substring(lastIndexOf + 1, substringAfterLast.length());
        Intrinsics.checkNotNullExpressionValue(substring, "(this as java.lang.Strin…ing(startIndex, endIndex)");
        return substring;
    }

    public static /* synthetic */ int indexOf$default(CharSequence charSequence, String str, int i, boolean z, int i2) {
        if ((i2 & 2) != 0) {
            i = 0;
        }
        if ((i2 & 4) != 0) {
            z = false;
        }
        return indexOf(charSequence, str, i, z);
    }
}
