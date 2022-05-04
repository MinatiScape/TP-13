package com.google.protobuf;

import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.io.Serializable;
/* JADX WARN: Init of enum ENUM can be incorrect */
/* JADX WARN: Init of enum INT can be incorrect */
/* loaded from: classes.dex */
public enum JavaType {
    VOID(Void.class, Void.class, null),
    INT(r1, Integer.class, 0),
    LONG(Long.TYPE, Long.class, 0L),
    FLOAT(Float.TYPE, Float.class, Float.valueOf((float) HingeAngleProviderKt.FULLY_CLOSED_DEGREES)),
    DOUBLE(Double.TYPE, Double.class, Double.valueOf(0.0d)),
    BOOLEAN(Boolean.TYPE, Boolean.class, Boolean.FALSE),
    STRING(String.class, String.class, ""),
    BYTE_STRING(ByteString.class, ByteString.class, ByteString.EMPTY),
    ENUM(r1, Integer.class, null),
    MESSAGE(Object.class, Object.class, null);
    
    private final Class<?> boxedType;
    private final Object defaultDefault;
    private final Class<?> type;

    static {
        Class cls = Integer.TYPE;
    }

    JavaType(Class cls, Class cls2, Serializable serializable) {
        this.type = cls;
        this.boxedType = cls2;
        this.defaultDefault = serializable;
    }

    public final Class<?> getBoxedType() {
        return this.boxedType;
    }
}
