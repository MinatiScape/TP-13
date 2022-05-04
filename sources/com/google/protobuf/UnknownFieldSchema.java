package com.google.protobuf;

import java.io.IOException;
/* loaded from: classes.dex */
public abstract class UnknownFieldSchema<T, B> {
    public abstract void addVarint(B b, int i, long j);

    public abstract UnknownFieldSetLite getFromMessage(Object obj);

    public abstract int getSerializedSize(T t);

    public abstract int getSerializedSizeAsMessageSet(T t);

    public abstract void makeImmutable(Object obj);

    public abstract UnknownFieldSetLite merge(Object obj, Object obj2);

    public abstract UnknownFieldSetLite newBuilder();

    public abstract void setToMessage(Object obj, T t);

    public abstract void writeAsMessageSetTo(Object obj, CodedOutputStreamWriter codedOutputStreamWriter) throws IOException;

    public abstract void writeTo(Object obj, CodedOutputStreamWriter codedOutputStreamWriter) throws IOException;
}
