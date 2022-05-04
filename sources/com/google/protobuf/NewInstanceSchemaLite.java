package com.google.protobuf;

import com.google.protobuf.GeneratedMessageLite;
/* loaded from: classes.dex */
public final class NewInstanceSchemaLite implements NewInstanceSchema {
    @Override // com.google.protobuf.NewInstanceSchema
    public final Object newInstance(MessageLite messageLite) {
        return ((GeneratedMessageLite) messageLite).dynamicMethod(GeneratedMessageLite.MethodToInvoke.NEW_MUTABLE_INSTANCE);
    }
}
