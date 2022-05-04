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
public final class StringFlagSerializer extends FlagSerializer<String> {
    @NotNull
    public static final StringFlagSerializer INSTANCE = new StringFlagSerializer();

    /* compiled from: FlagSerializer.kt */
    /* renamed from: com.android.systemui.flags.StringFlagSerializer$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public /* synthetic */ class AnonymousClass1 extends AdaptedFunctionReference implements Function3<JSONObject, String, Object, Unit> {
        public static final AnonymousClass1 INSTANCE = new AnonymousClass1();

        public AnonymousClass1() {
            super(3, JSONObject.class, "put", "put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;", 8);
        }

        @Override // kotlin.jvm.functions.Function3
        public /* bridge */ /* synthetic */ Unit invoke(JSONObject jSONObject, String str, Object obj) {
            invoke2(jSONObject, str, obj);
            return Unit.INSTANCE;
        }

        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2(@NotNull JSONObject p0, String str, Object obj) {
            Intrinsics.checkNotNullParameter(p0, "p0");
            StringFlagSerializer._init_$put(p0, str, obj);
        }
    }

    /* compiled from: FlagSerializer.kt */
    /* renamed from: com.android.systemui.flags.StringFlagSerializer$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public /* synthetic */ class AnonymousClass2 extends FunctionReferenceImpl implements Function2<JSONObject, String, String> {
        public static final AnonymousClass2 INSTANCE = new AnonymousClass2();

        public AnonymousClass2() {
            super(2, JSONObject.class, "getString", "getString(Ljava/lang/String;)Ljava/lang/String;", 0);
        }

        public final String invoke(@NotNull JSONObject p0, String str) {
            Intrinsics.checkNotNullParameter(p0, "p0");
            return p0.getString(str);
        }
    }

    private StringFlagSerializer() {
        super("string", AnonymousClass1.INSTANCE, AnonymousClass2.INSTANCE);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final /* synthetic */ void _init_$put(JSONObject jSONObject, String str, Object obj) {
        jSONObject.put(str, obj);
    }
}
