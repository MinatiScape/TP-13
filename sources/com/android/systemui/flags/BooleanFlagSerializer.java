package com.android.systemui.flags;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.AdaptedFunctionReference;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONObject;
/* compiled from: FlagSerializer.kt */
/* loaded from: classes.dex */
public final class BooleanFlagSerializer extends FlagSerializer<Boolean> {
    @NotNull
    public static final BooleanFlagSerializer INSTANCE = new BooleanFlagSerializer();

    /* compiled from: FlagSerializer.kt */
    /* renamed from: com.android.systemui.flags.BooleanFlagSerializer$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public /* synthetic */ class AnonymousClass1 extends AdaptedFunctionReference implements Function3<JSONObject, String, Boolean, Unit> {
        public static final AnonymousClass1 INSTANCE = new AnonymousClass1();

        public AnonymousClass1() {
            super(3, JSONObject.class, "put", "put(Ljava/lang/String;Z)Lorg/json/JSONObject;", 8);
        }

        @Override // kotlin.jvm.functions.Function3
        public /* bridge */ /* synthetic */ Unit invoke(JSONObject jSONObject, String str, Boolean bool) {
            invoke(jSONObject, str, bool.booleanValue());
            return Unit.INSTANCE;
        }

        public final void invoke(@NotNull JSONObject p0, String str, boolean z) {
            Intrinsics.checkNotNullParameter(p0, "p0");
            BooleanFlagSerializer._init_$put(p0, str, z);
        }
    }

    /* compiled from: FlagSerializer.kt */
    /* renamed from: com.android.systemui.flags.BooleanFlagSerializer$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public /* synthetic */ class AnonymousClass2 extends FunctionReferenceImpl implements Function2<JSONObject, String, Boolean> {
        public static final AnonymousClass2 INSTANCE = new AnonymousClass2();

        public AnonymousClass2() {
            super(2, JSONObject.class, "getBoolean", "getBoolean(Ljava/lang/String;)Z", 0);
        }

        @NotNull
        public final Boolean invoke(@NotNull JSONObject p0, String str) {
            Intrinsics.checkNotNullParameter(p0, "p0");
            return Boolean.valueOf(p0.getBoolean(str));
        }
    }

    private BooleanFlagSerializer() {
        super("boolean", AnonymousClass1.INSTANCE, AnonymousClass2.INSTANCE);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final /* synthetic */ void _init_$put(JSONObject jSONObject, String str, boolean z) {
        jSONObject.put(str, z);
    }
}
