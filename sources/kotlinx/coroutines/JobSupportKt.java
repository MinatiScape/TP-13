package kotlinx.coroutines;

import kotlinx.coroutines.internal.Symbol;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: JobSupport.kt */
/* loaded from: classes.dex */
public final class JobSupportKt {
    @NotNull
    public static final Symbol COMPLETING_ALREADY = new Symbol("COMPLETING_ALREADY");
    @NotNull
    public static final Symbol COMPLETING_WAITING_CHILDREN = new Symbol("COMPLETING_WAITING_CHILDREN");
    @NotNull
    public static final Symbol COMPLETING_RETRY = new Symbol("COMPLETING_RETRY");
    @NotNull
    public static final Symbol TOO_LATE_TO_CANCEL = new Symbol("TOO_LATE_TO_CANCEL");
    @NotNull
    public static final Symbol SEALED = new Symbol("SEALED");
    @NotNull
    public static final Empty EMPTY_NEW = new Empty(false);
    @NotNull
    public static final Empty EMPTY_ACTIVE = new Empty(true);

    @Nullable
    public static final Object unboxState(@Nullable Object obj) {
        IncompleteStateBox incompleteStateBox;
        Incomplete incomplete;
        if (obj instanceof IncompleteStateBox) {
            incompleteStateBox = (IncompleteStateBox) obj;
        } else {
            incompleteStateBox = null;
        }
        if (incompleteStateBox == null || (incomplete = incompleteStateBox.state) == null) {
            return obj;
        }
        return incomplete;
    }
}
