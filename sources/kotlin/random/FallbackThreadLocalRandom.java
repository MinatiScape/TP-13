package kotlin.random;

import java.util.Random;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: PlatformRandom.kt */
/* loaded from: classes.dex */
public final class FallbackThreadLocalRandom extends AbstractPlatformRandom {
    @NotNull
    public final FallbackThreadLocalRandom$implStorage$1 implStorage = new ThreadLocal<Random>() { // from class: kotlin.random.FallbackThreadLocalRandom$implStorage$1
        @Override // java.lang.ThreadLocal
        public final Random initialValue() {
            return new Random();
        }
    };

    @Override // kotlin.random.AbstractPlatformRandom
    @NotNull
    public final Random getImpl() {
        Random random = get();
        Intrinsics.checkNotNullExpressionValue(random, "implStorage.get()");
        return random;
    }
}
