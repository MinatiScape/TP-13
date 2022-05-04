package kotlin.random;

import java.io.Serializable;
import kotlin.internal.PlatformImplementationsKt;
import org.jetbrains.annotations.NotNull;
/* compiled from: Random.kt */
/* loaded from: classes.dex */
public abstract class Random {
    @NotNull
    public static final Default Default = new Default(0);
    @NotNull
    public static final Random defaultRandom = PlatformImplementationsKt.IMPLEMENTATIONS.defaultPlatformRandom();

    /* compiled from: Random.kt */
    /* loaded from: classes.dex */
    public static final class Default extends Random implements Serializable {
        private Default() {
        }

        public /* synthetic */ Default(int i) {
            this();
        }

        @Override // kotlin.random.Random
        public final int nextInt() {
            return Random.defaultRandom.nextInt();
        }

        /* compiled from: Random.kt */
        /* loaded from: classes.dex */
        public static final class Serialized implements Serializable {
            @NotNull
            public static final Serialized INSTANCE = new Serialized();
            private static final long serialVersionUID = 0;

            private Serialized() {
            }

            private final Object readResolve() {
                return Random.Default;
            }
        }

        private final Object writeReplace() {
            return Serialized.INSTANCE;
        }
    }

    public abstract int nextInt();
}
