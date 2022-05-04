package kotlin.coroutines;

import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref$IntRef;
/* compiled from: CoroutineContextImpl.kt */
/* loaded from: classes.dex */
public final class CombinedContext$writeReplace$1 extends Lambda implements Function2<Unit, CoroutineContext.Element, Unit> {
    public final /* synthetic */ CoroutineContext[] $elements;
    public final /* synthetic */ Ref$IntRef $index;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CombinedContext$writeReplace$1(CoroutineContext[] coroutineContextArr, Ref$IntRef ref$IntRef) {
        super(2);
        this.$elements = coroutineContextArr;
        this.$index = ref$IntRef;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Unit invoke(Unit unit, CoroutineContext.Element element) {
        Unit noName_0 = unit;
        CoroutineContext.Element element2 = element;
        Intrinsics.checkNotNullParameter(noName_0, "$noName_0");
        Intrinsics.checkNotNullParameter(element2, "element");
        CoroutineContext[] coroutineContextArr = this.$elements;
        Ref$IntRef ref$IntRef = this.$index;
        int i = ref$IntRef.element;
        ref$IntRef.element = i + 1;
        coroutineContextArr[i] = element2;
        return Unit.INSTANCE;
    }
}
