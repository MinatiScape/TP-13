package com.google.protobuf;

import com.google.protobuf.ExtensionRegistryLite;
import com.google.protobuf.GeneratedMessageLite;
import java.io.IOException;
import java.util.Map;
/* loaded from: classes.dex */
public final class ExtensionSchemaLite extends ExtensionSchema<GeneratedMessageLite.ExtensionDescriptor> {
    @Override // com.google.protobuf.ExtensionSchema
    public final GeneratedMessageLite.GeneratedExtension findExtensionByNumber(ExtensionRegistryLite extensionRegistryLite, MessageLite messageLite, int i) {
        return extensionRegistryLite.extensionsByNumber.get(new ExtensionRegistryLite.ObjectIntPair(messageLite, i));
    }

    @Override // com.google.protobuf.ExtensionSchema
    public final FieldSet<GeneratedMessageLite.ExtensionDescriptor> getExtensions(Object obj) {
        return ((GeneratedMessageLite.ExtendableMessage) obj).extensions;
    }

    @Override // com.google.protobuf.ExtensionSchema
    public final FieldSet<GeneratedMessageLite.ExtensionDescriptor> getMutableExtensions(Object obj) {
        GeneratedMessageLite.ExtendableMessage extendableMessage = (GeneratedMessageLite.ExtendableMessage) obj;
        FieldSet<GeneratedMessageLite.ExtensionDescriptor> fieldSet = extendableMessage.extensions;
        if (fieldSet.isImmutable) {
            extendableMessage.extensions = fieldSet.clone();
        }
        return extendableMessage.extensions;
    }

    @Override // com.google.protobuf.ExtensionSchema
    public final void makeImmutable(Object obj) {
        FieldSet<GeneratedMessageLite.ExtensionDescriptor> fieldSet = ((GeneratedMessageLite.ExtendableMessage) obj).extensions;
        if (!fieldSet.isImmutable) {
            fieldSet.fields.makeImmutable();
            fieldSet.isImmutable = true;
        }
    }

    @Override // com.google.protobuf.ExtensionSchema
    public final void extensionNumber(Map.Entry entry) {
        ((GeneratedMessageLite.ExtensionDescriptor) entry.getKey()).getClass();
    }

    @Override // com.google.protobuf.ExtensionSchema
    public final void serializeExtension(Map.Entry entry) throws IOException {
        ((GeneratedMessageLite.ExtensionDescriptor) entry.getKey()).getClass();
        throw null;
    }

    @Override // com.google.protobuf.ExtensionSchema
    public final boolean hasExtensions(MessageLite messageLite) {
        return messageLite instanceof GeneratedMessageLite.ExtendableMessage;
    }
}
