package kotlin.coroutines;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
/* compiled from: CoroutineContextImpl.kt */
/* loaded from: classes.dex */
public final class CombinedContext$toString$1 extends Lambda implements Function2<String, CoroutineContext.Element, String> {
    public static final CombinedContext$toString$1 INSTANCE = new CombinedContext$toString$1();

    public CombinedContext$toString$1() {
        super(2);
    }

    @Override // kotlin.jvm.functions.Function2
    public final String invoke(String str, CoroutineContext.Element element) {
        boolean z;
        String acc = str;
        CoroutineContext.Element element2 = element;
        Intrinsics.checkNotNullParameter(acc, "acc");
        Intrinsics.checkNotNullParameter(element2, "element");
        if (acc.length() == 0) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            return element2.toString();
        }
        return acc + ", " + element2;
    }
}
