package com.google.common.base;

import androidx.cardview.R$style$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public final class Preconditions {
    public static String badPositionIndex(int index, int size, String desc) {
        if (index < 0) {
            return Strings.lenientFormat("%s (%s) must not be negative", desc, Integer.valueOf(index));
        }
        if (size >= 0) {
            return Strings.lenientFormat("%s (%s) must not be greater than size (%s)", desc, Integer.valueOf(index), Integer.valueOf(size));
        }
        throw new IllegalArgumentException(R$style$$ExternalSyntheticOutline0.m(26, "negative size: ", size));
    }

    public static void checkArgument(boolean expression) {
        if (!expression) {
            throw new IllegalArgumentException();
        }
    }

    public static void checkState(boolean expression, String errorMessage) {
        if (!expression) {
            throw new IllegalStateException(errorMessage);
        }
    }

    public static void checkArgument(boolean expression, String errorMessage) {
        if (!expression) {
            throw new IllegalArgumentException(errorMessage);
        }
    }

    public static void checkElementIndex(int index, int size) {
        String str;
        if (index < 0 || index >= size) {
            if (index < 0) {
                str = Strings.lenientFormat("%s (%s) must not be negative", "index", Integer.valueOf(index));
            } else if (size >= 0) {
                str = Strings.lenientFormat("%s (%s) must be less than size (%s)", "index", Integer.valueOf(index), Integer.valueOf(size));
            } else {
                throw new IllegalArgumentException(R$style$$ExternalSyntheticOutline0.m(26, "negative size: ", size));
            }
            throw new IndexOutOfBoundsException(str);
        }
    }

    public static void checkPositionIndex(int index, int size) {
        if (index < 0 || index > size) {
            throw new IndexOutOfBoundsException(badPositionIndex(index, size, "index"));
        }
    }

    public static void checkPositionIndexes(int start, int end, int size) {
        String str;
        if (start < 0 || end < start || end > size) {
            if (start < 0 || start > size) {
                str = badPositionIndex(start, size, "start index");
            } else if (end < 0 || end > size) {
                str = badPositionIndex(end, size, "end index");
            } else {
                str = Strings.lenientFormat("end index (%s) must not be less than start index (%s)", Integer.valueOf(end), Integer.valueOf(start));
            }
            throw new IndexOutOfBoundsException(str);
        }
    }

    public static void checkState(boolean b, String errorMessageTemplate, Object p1) {
        if (!b) {
            throw new IllegalStateException(Strings.lenientFormat(errorMessageTemplate, p1));
        }
    }

    public static void checkArgument(boolean b, String errorMessageTemplate, Object p1) {
        if (!b) {
            throw new IllegalArgumentException(Strings.lenientFormat(errorMessageTemplate, p1));
        }
    }
}
