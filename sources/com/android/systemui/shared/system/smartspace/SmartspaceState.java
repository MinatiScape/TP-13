package com.android.systemui.shared.system.smartspace;

import android.graphics.Rect;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.PropertyReference1Impl;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: SmartspaceState.kt */
/* loaded from: classes.dex */
public final class SmartspaceState implements Parcelable {
    @NotNull
    public static final CREATOR CREATOR = new CREATOR(null);
    @NotNull
    private Rect boundsOnScreen;
    private int selectedPage;
    private boolean visibleOnScreen;

    /* compiled from: SmartspaceState.kt */
    /* loaded from: classes.dex */
    public static final class CREATOR implements Parcelable.Creator<SmartspaceState> {
        public /* synthetic */ CREATOR(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public SmartspaceState createFromParcel(@NotNull Parcel parcel) {
            Intrinsics.checkNotNullParameter(parcel, "parcel");
            return new SmartspaceState(parcel);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        @NotNull
        public SmartspaceState[] newArray(int i) {
            return new SmartspaceState[i];
        }

        private CREATOR() {
        }
    }

    public SmartspaceState() {
        this.boundsOnScreen = new Rect();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    /* compiled from: SmartspaceState.kt */
    /* renamed from: com.android.systemui.shared.system.smartspace.SmartspaceState$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public /* synthetic */ class AnonymousClass1 extends PropertyReference1Impl {
        public static final AnonymousClass1 INSTANCE = new AnonymousClass1();

        public AnonymousClass1() {
            super(JvmClassMappingKt.class, "javaClass", "getJavaClass(Ljava/lang/Object;)Ljava/lang/Class;", 1);
        }

        @Override // kotlin.jvm.internal.PropertyReference1Impl, kotlin.reflect.KProperty1
        @Nullable
        public Object get(@Nullable Object obj) {
            return obj.getClass();
        }
    }

    public final void setBoundsOnScreen(@NotNull Rect rect) {
        Intrinsics.checkNotNullParameter(rect, "<set-?>");
        this.boundsOnScreen = rect;
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("boundsOnScreen: ");
        m.append(this.boundsOnScreen);
        m.append(", selectedPage: ");
        m.append(this.selectedPage);
        m.append(", visibleOnScreen: ");
        m.append(this.visibleOnScreen);
        return m.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@Nullable Parcel parcel, int i) {
        if (parcel != null) {
            parcel.writeParcelable(this.boundsOnScreen, 0);
        }
        if (parcel != null) {
            parcel.writeInt(this.selectedPage);
        }
        if (parcel != null) {
            parcel.writeBoolean(this.visibleOnScreen);
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public SmartspaceState(@NotNull Parcel parcel) {
        this();
        Intrinsics.checkNotNullParameter(parcel, "parcel");
        Parcelable readParcelable = parcel.readParcelable(AnonymousClass1.INSTANCE.getClass().getClassLoader());
        Intrinsics.checkNotNullExpressionValue(readParcelable, "parcel.readParcelable(Re…ss.javaClass.classLoader)");
        this.boundsOnScreen = (Rect) readParcelable;
        this.selectedPage = parcel.readInt();
        this.visibleOnScreen = parcel.readBoolean();
    }

    public final void setSelectedPage(int i) {
        this.selectedPage = i;
    }

    public final void setVisibleOnScreen(boolean z) {
        this.visibleOnScreen = z;
    }

    @NotNull
    public final Rect getBoundsOnScreen() {
        return this.boundsOnScreen;
    }

    public final int getSelectedPage() {
        return this.selectedPage;
    }

    public final boolean getVisibleOnScreen() {
        return this.visibleOnScreen;
    }
}
