package kotlin.jvm.internal;

import java.io.Serializable;
import org.jetbrains.annotations.NotNull;
/* compiled from: Lambda.kt */
/* loaded from: classes.dex */
public abstract class Lambda<R> implements FunctionBase<R>, Serializable {
    private final int arity;

    @NotNull
    public String toString() {
        Reflection.factory.getClass();
        String renderLambdaToString = ReflectionFactory.renderLambdaToString(this);
        Intrinsics.checkNotNullExpressionValue(renderLambdaToString, "renderLambdaToString(this)");
        return renderLambdaToString;
    }

    public Lambda(int i) {
        this.arity = i;
    }

    @Override // kotlin.jvm.internal.FunctionBase
    public int getArity() {
        return this.arity;
    }
}
