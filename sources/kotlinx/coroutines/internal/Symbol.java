package kotlinx.coroutines.internal;

import org.jetbrains.annotations.NotNull;
/* compiled from: Symbol.kt */
/* loaded from: classes.dex */
public final class Symbol {
    @NotNull
    public final String symbol;

    @NotNull
    public final String toString() {
        return '<' + this.symbol + '>';
    }

    public Symbol(@NotNull String str) {
        this.symbol = str;
    }
}
