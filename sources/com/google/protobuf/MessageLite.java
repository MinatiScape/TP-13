package com.google.protobuf;

import com.google.protobuf.GeneratedMessageLite;
import java.io.IOException;
/* loaded from: classes.dex */
public interface MessageLite extends MessageLiteOrBuilder {

    /* loaded from: classes.dex */
    public interface Builder extends MessageLiteOrBuilder, Cloneable {
    }

    int getSerializedSize();

    GeneratedMessageLite.Builder newBuilderForType$1();

    GeneratedMessageLite.Builder toBuilder$1();

    byte[] toByteArray();

    ByteString toByteString();

    void writeTo(CodedOutputStream codedOutputStream) throws IOException;
}
