package kotlin.jvm.internal;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class PackageReference implements ClassBasedDeclarationContainer {
    @NotNull
    public final Class<?> jClass;

    public PackageReference(@NotNull Class<?> jClass, @NotNull String moduleName) {
        Intrinsics.checkNotNullParameter(jClass, "jClass");
        Intrinsics.checkNotNullParameter(moduleName, "moduleName");
        this.jClass = jClass;
    }

    public boolean equals(@Nullable Object obj) {
        return (obj instanceof PackageReference) && Intrinsics.areEqual(this.jClass, ((PackageReference) obj).jClass);
    }

    @Override // kotlin.jvm.internal.ClassBasedDeclarationContainer
    @NotNull
    public Class<?> getJClass() {
        return this.jClass;
    }

    public int hashCode() {
        return this.jClass.hashCode();
    }

    @NotNull
    public String toString() {
        return this.jClass.toString() + " (Kotlin reflection is not available)";
    }
}
