package com.android.customization.model.color;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
@DebugMetadata(c = "com.android.customization.model.color.ColorProvider$loadPreset$2", f = "ColorProvider.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes.dex */
public final class ColorProvider$loadPreset$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    public int label;
    private /* synthetic */ CoroutineScope p$;
    public final /* synthetic */ ColorProvider this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ColorProvider$loadPreset$2(ColorProvider colorProvider, Continuation<? super ColorProvider$loadPreset$2> continuation) {
        super(2, continuation);
        this.this$0 = colorProvider;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        ColorProvider$loadPreset$2 colorProvider$loadPreset$2 = new ColorProvider$loadPreset$2(this.this$0, continuation);
        colorProvider$loadPreset$2.p$ = (CoroutineScope) obj;
        return colorProvider$loadPreset$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        ColorProvider$loadPreset$2 colorProvider$loadPreset$2 = new ColorProvider$loadPreset$2(this.this$0, continuation);
        colorProvider$loadPreset$2.p$ = coroutineScope;
        Unit unit = Unit.INSTANCE;
        colorProvider$loadPreset$2.invokeSuspend(unit);
        return unit;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:43:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0144  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0160  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0165  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0168  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x017d A[SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r15v1, types: [android.graphics.drawable.Drawable] */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r8v7 */
    /* JADX WARN: Type inference failed for: r8v8 */
    /* JADX WARN: Type inference failed for: r9v11, types: [android.graphics.drawable.ShapeDrawable] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @org.jetbrains.annotations.Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(@org.jetbrains.annotations.NotNull java.lang.Object r23) {
        /*
            Method dump skipped, instructions count: 450
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.customization.model.color.ColorProvider$loadPreset$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
