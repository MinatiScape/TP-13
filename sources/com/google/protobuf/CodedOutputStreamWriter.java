package com.google.protobuf;

import java.io.IOException;
import java.nio.charset.Charset;
/* loaded from: classes.dex */
public final class CodedOutputStreamWriter {
    public final CodedOutputStream output;

    public final void writeBytes(int i, ByteString byteString) throws IOException {
        this.output.writeBytes(i, byteString);
    }

    public final void writeGroup(int i, Object obj, Schema schema) throws IOException {
        CodedOutputStream codedOutputStream = this.output;
        codedOutputStream.writeTag(i, 3);
        schema.writeTo((MessageLite) obj, codedOutputStream.wrapper);
        codedOutputStream.writeTag(i, 4);
    }

    public final void writeMessageSetItem(int i, Object obj) throws IOException {
        if (obj instanceof ByteString) {
            this.output.writeRawMessageSetExtension(i, (ByteString) obj);
        } else {
            this.output.writeMessageSetExtension(i, (MessageLite) obj);
        }
    }

    public CodedOutputStreamWriter(CodedOutputStream codedOutputStream) {
        Charset charset = Internal.UTF_8;
        if (codedOutputStream != null) {
            this.output = codedOutputStream;
            codedOutputStream.wrapper = this;
            return;
        }
        throw new NullPointerException("output");
    }
}
