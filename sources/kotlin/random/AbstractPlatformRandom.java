package kotlin.random;

import java.util.Random;
import org.jetbrains.annotations.NotNull;
/* compiled from: PlatformRandom.kt */
/* loaded from: classes.dex */
public abstract class AbstractPlatformRandom extends Random {
    @NotNull
    public abstract Random getImpl();

    @Override // kotlin.random.Random
    public final int nextInt() {
        return getImpl().nextInt();
    }
}
