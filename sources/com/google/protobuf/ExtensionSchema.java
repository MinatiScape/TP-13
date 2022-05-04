package com.google.protobuf;

import com.google.protobuf.FieldSet;
import com.google.protobuf.FieldSet.FieldDescriptorLite;
import com.google.protobuf.GeneratedMessageLite;
import java.io.IOException;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class ExtensionSchema<T extends FieldSet.FieldDescriptorLite<T>> {
    public abstract void extensionNumber(Map.Entry entry);

    public abstract GeneratedMessageLite.GeneratedExtension findExtensionByNumber(ExtensionRegistryLite extensionRegistryLite, MessageLite messageLite, int i);

    public abstract FieldSet<T> getExtensions(Object obj);

    public abstract FieldSet<T> getMutableExtensions(Object obj);

    public abstract boolean hasExtensions(MessageLite messageLite);

    public abstract void makeImmutable(Object obj);

    public abstract void serializeExtension(Map.Entry entry) throws IOException;
}
