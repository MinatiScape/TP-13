package kotlinx.coroutines;
/* loaded from: classes.dex */
public final class SupervisorKt {
    public static CompletableJob SupervisorJob$default(Job job, int i) {
        return new SupervisorJobImpl(null);
    }
}
