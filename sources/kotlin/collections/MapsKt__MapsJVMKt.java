package kotlin.collections;
/* compiled from: MapsJVM.kt */
/* loaded from: classes.dex */
public class MapsKt__MapsJVMKt {
    public static final int mapCapacity(int i) {
        if (i < 0) {
            return i;
        }
        if (i < 3) {
            return i + 1;
        }
        if (i < 1073741824) {
            return (int) ((i / 0.75f) + 1.0f);
        }
        return Integer.MAX_VALUE;
    }
}
