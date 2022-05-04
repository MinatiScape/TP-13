package kotlin.jvm.internal;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: PackageReference.kt */
/* loaded from: classes.dex */
public final class PackageReference implements ClassBasedDeclarationContainer {
    @NotNull
    public final Class<?> jClass;

    public PackageReference(@NotNull Class jClass) {
        Intrinsics.checkNotNullParameter(jClass, "jClass");
        this.jClass = jClass;
    }

    public final boolean equals(@Nullable Object obj) {
        if (!(obj instanceof PackageReference) || !Intrinsics.areEqual(this.jClass, ((PackageReference) obj).jClass)) {
            return false;
        }
        return true;
    }

    public final int hashCode() {
        return this.jClass.hashCode();
    }

    @NotNull
    public final String toString() {
        return Intrinsics.stringPlus(this.jClass.toString(), " (Kotlin reflection is not available)");
    }

    @Override // kotlin.jvm.internal.ClassBasedDeclarationContainer
    @NotNull
    public final Class<?> getJClass() {
        return this.jClass;
    }
}
