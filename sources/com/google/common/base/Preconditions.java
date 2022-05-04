package com.google.common.base;

import androidx.fragment.R$id$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public final class Preconditions {
    public static String badPositionIndex(int index, int size, String desc) {
        if (index < 0) {
            return Strings.lenientFormat("%s (%s) must not be negative", desc, Integer.valueOf(index));
        }
        if (size >= 0) {
            return Strings.lenientFormat("%s (%s) must not be greater than size (%s)", desc, Integer.valueOf(index), Integer.valueOf(size));
        }
        throw new IllegalArgumentException(R$id$$ExternalSyntheticOutline0.m(26, "negative size: ", size));
    }

    public static void checkArgument(boolean expression) {
        if (!expression) {
            throw new IllegalArgumentException();
        }
    }

    public static int checkElementIndex(int index, int size) {
        String str;
        if (index >= 0 && index < size) {
            return index;
        }
        if (index < 0) {
            str = Strings.lenientFormat("%s (%s) must not be negative", "index", Integer.valueOf(index));
        } else if (size >= 0) {
            str = Strings.lenientFormat("%s (%s) must be less than size (%s)", "index", Integer.valueOf(index), Integer.valueOf(size));
        } else {
            throw new IllegalArgumentException(R$id$$ExternalSyntheticOutline0.m(26, "negative size: ", size));
        }
        throw new IndexOutOfBoundsException(str);
    }

    public static int checkPositionIndex(int index, int size) {
        if (index >= 0 && index <= size) {
            return index;
        }
        throw new IndexOutOfBoundsException(badPositionIndex(index, size, "index"));
    }

    public static void checkPositionIndexes(int start, int end, int size) {
        String str;
        if (start < 0 || end < start || end > size) {
            if (start < 0 || start > size) {
                str = badPositionIndex(start, size, "start index");
            } else {
                str = (end < 0 || end > size) ? badPositionIndex(end, size, "end index") : Strings.lenientFormat("end index (%s) must not be less than start index (%s)", Integer.valueOf(end), Integer.valueOf(start));
            }
            throw new IndexOutOfBoundsException(str);
        }
    }

    public static void checkState(boolean expression, Object errorMessage) {
        if (!expression) {
            throw new IllegalStateException(String.valueOf(errorMessage));
        }
    }

    public static void checkArgument(boolean expression, Object errorMessage) {
        if (!expression) {
            throw new IllegalArgumentException(String.valueOf(errorMessage));
        }
    }

    public static void checkState(boolean b, String errorMessageTemplate, int p1) {
        if (!b) {
            throw new IllegalStateException(Strings.lenientFormat(errorMessageTemplate, Integer.valueOf(p1)));
        }
    }

    public static void checkArgument(boolean b, String errorMessageTemplate, char p1) {
        if (!b) {
            throw new IllegalArgumentException(Strings.lenientFormat(errorMessageTemplate, Character.valueOf(p1)));
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
