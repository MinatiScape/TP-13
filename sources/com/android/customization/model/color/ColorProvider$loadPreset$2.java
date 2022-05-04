package com.android.customization.model.color;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: ColorProvider.kt */
@DebugMetadata(c = "com.android.customization.model.color.ColorProvider$loadPreset$2", f = "ColorProvider.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes.dex */
public final class ColorProvider$loadPreset$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    public int label;
    public final /* synthetic */ ColorProvider this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ColorProvider$loadPreset$2(ColorProvider colorProvider, Continuation<? super ColorProvider$loadPreset$2> continuation) {
        super(continuation);
        this.this$0 = colorProvider;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new ColorProvider$loadPreset$2(this.this$0, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        Unit unit = Unit.INSTANCE;
        ((ColorProvider$loadPreset$2) create(coroutineScope, continuation)).invokeSuspend(unit);
        return unit;
    }

    /* JADX WARN: Removed duplicated region for block: B:63:0x01a3  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x01ab  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01c9  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01ce  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01d1  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01e5 A[SYNTHETIC] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @org.jetbrains.annotations.Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(@org.jetbrains.annotations.NotNull java.lang.Object r22) {
        /*
            Method dump skipped, instructions count: 582
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.customization.model.color.ColorProvider$loadPreset$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
