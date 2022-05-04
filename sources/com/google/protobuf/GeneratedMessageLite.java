package com.google.protobuf;

import com.google.protobuf.AbstractMessageLite;
import com.google.protobuf.FieldSet;
import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.GeneratedMessageLite.Builder;
import com.google.protobuf.Internal;
import com.google.protobuf.MessageLite;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
/* loaded from: classes.dex */
public abstract class GeneratedMessageLite<MessageType extends GeneratedMessageLite<MessageType, BuilderType>, BuilderType extends Builder<MessageType, BuilderType>> extends AbstractMessageLite<MessageType, BuilderType> {
    private static Map<Object, GeneratedMessageLite<?, ?>> defaultInstanceMap = new ConcurrentHashMap();
    public UnknownFieldSetLite unknownFields = UnknownFieldSetLite.DEFAULT_INSTANCE;
    public int memoizedSerializedSize = -1;

    /* loaded from: classes.dex */
    public static abstract class Builder<MessageType extends GeneratedMessageLite<MessageType, BuilderType>, BuilderType extends Builder<MessageType, BuilderType>> extends AbstractMessageLite.Builder<MessageType, BuilderType> {
        public final MessageType defaultInstance;
        public MessageType instance;
        public boolean isBuilt = false;

        public static void mergeFromInstance(GeneratedMessageLite generatedMessageLite, GeneratedMessageLite generatedMessageLite2) {
            Protobuf protobuf = Protobuf.INSTANCE;
            protobuf.getClass();
            protobuf.schemaFor(generatedMessageLite.getClass()).mergeFrom(generatedMessageLite, generatedMessageLite2);
        }

        public final MessageType buildPartial() {
            if (this.isBuilt) {
                return this.instance;
            }
            MessageType messagetype = this.instance;
            messagetype.getClass();
            Protobuf protobuf = Protobuf.INSTANCE;
            protobuf.getClass();
            protobuf.schemaFor(messagetype.getClass()).makeImmutable(messagetype);
            this.isBuilt = true;
            return this.instance;
        }

        public final Object clone() throws CloneNotSupportedException {
            Builder builder = (Builder) this.defaultInstance.dynamicMethod(MethodToInvoke.NEW_BUILDER);
            MessageType buildPartial = buildPartial();
            builder.copyOnWrite();
            mergeFromInstance(builder.instance, buildPartial);
            return builder;
        }

        public final void copyOnWrite() {
            if (this.isBuilt) {
                MessageType messagetype = (MessageType) this.instance.dynamicMethod(MethodToInvoke.NEW_MUTABLE_INSTANCE);
                mergeFromInstance(messagetype, this.instance);
                this.instance = messagetype;
                this.isBuilt = false;
            }
        }

        public Builder(MessageType messagetype) {
            this.defaultInstance = messagetype;
            this.instance = (MessageType) messagetype.dynamicMethod(MethodToInvoke.NEW_MUTABLE_INSTANCE);
        }

        public final MessageType build() {
            MessageType buildPartial = buildPartial();
            if (buildPartial.isInitialized()) {
                return buildPartial;
            }
            throw new UninitializedMessageException();
        }

        @Override // com.google.protobuf.MessageLiteOrBuilder
        public final GeneratedMessageLite getDefaultInstanceForType$1() {
            return this.defaultInstance;
        }
    }

    /* loaded from: classes.dex */
    public static abstract class ExtendableMessage<MessageType extends ExtendableMessage<MessageType, BuilderType>, BuilderType> extends GeneratedMessageLite<MessageType, BuilderType> implements MessageLiteOrBuilder {
        public FieldSet<ExtensionDescriptor> extensions;

        public ExtendableMessage() {
            throw null;
        }
    }

    /* loaded from: classes.dex */
    public static final class ExtensionDescriptor implements FieldSet.FieldDescriptorLite<ExtensionDescriptor> {
        @Override // com.google.protobuf.FieldSet.FieldDescriptorLite
        public final void getLiteType() {
        }

        @Override // com.google.protobuf.FieldSet.FieldDescriptorLite
        public final void getNumber() {
        }

        @Override // com.google.protobuf.FieldSet.FieldDescriptorLite
        public final void isPacked() {
        }

        @Override // com.google.protobuf.FieldSet.FieldDescriptorLite
        public final void isRepeated() {
        }

        @Override // java.lang.Comparable
        public final int compareTo(Object obj) {
            ((ExtensionDescriptor) obj).getClass();
            return 0;
        }

        @Override // com.google.protobuf.FieldSet.FieldDescriptorLite
        public final Builder internalMergeFrom(MessageLite.Builder builder, MessageLite messageLite) {
            Builder builder2 = (Builder) builder;
            builder2.copyOnWrite();
            Builder.mergeFromInstance(builder2.instance, (GeneratedMessageLite) messageLite);
            return builder2;
        }

        @Override // com.google.protobuf.FieldSet.FieldDescriptorLite
        public final WireFormat$JavaType getLiteJavaType() {
            throw null;
        }
    }

    /* loaded from: classes.dex */
    public static class GeneratedExtension<ContainingType extends MessageLite, Type> extends ExtensionLite<ContainingType, Type> {
    }

    /* loaded from: classes.dex */
    public enum MethodToInvoke {
        GET_MEMOIZED_IS_INITIALIZED,
        SET_MEMOIZED_IS_INITIALIZED,
        BUILD_MESSAGE_INFO,
        NEW_MUTABLE_INSTANCE,
        NEW_BUILDER,
        GET_DEFAULT_INSTANCE,
        GET_PARSER
    }

    public abstract Object dynamicMethod(MethodToInvoke methodToInvoke);

    /* loaded from: classes.dex */
    public static class DefaultInstanceBasedParser<T extends GeneratedMessageLite<T, ?>> extends AbstractParser<T> {
        public final T defaultInstance;

        public DefaultInstanceBasedParser(T t) {
            this.defaultInstance = t;
        }
    }

    public static <T extends GeneratedMessageLite<?, ?>> T getDefaultInstance(Class<T> cls) {
        T t = defaultInstanceMap.get(cls);
        if (t == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                t = defaultInstanceMap.get(cls);
            } catch (ClassNotFoundException e) {
                throw new IllegalStateException("Class initialization cannot fail.", e);
            }
        }
        if (t == null) {
            t = (T) ((GeneratedMessageLite) UnsafeUtil.allocateInstance(cls)).dynamicMethod(MethodToInvoke.GET_DEFAULT_INSTANCE);
            if (t != null) {
                defaultInstanceMap.put(cls, t);
            } else {
                throw new IllegalStateException();
            }
        }
        return (T) t;
    }

    public static <T extends GeneratedMessageLite<?, ?>> void registerDefaultInstance(Class<T> cls, T t) {
        defaultInstanceMap.put(cls, t);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!((GeneratedMessageLite) dynamicMethod(MethodToInvoke.GET_DEFAULT_INSTANCE)).getClass().isInstance(obj)) {
            return false;
        }
        Protobuf protobuf = Protobuf.INSTANCE;
        protobuf.getClass();
        return protobuf.schemaFor(getClass()).equals(this, (GeneratedMessageLite) obj);
    }

    @Override // com.google.protobuf.MessageLiteOrBuilder
    public final GeneratedMessageLite getDefaultInstanceForType$1() {
        return (GeneratedMessageLite) dynamicMethod(MethodToInvoke.GET_DEFAULT_INSTANCE);
    }

    @Override // com.google.protobuf.MessageLite
    public final int getSerializedSize() {
        if (this.memoizedSerializedSize == -1) {
            Protobuf protobuf = Protobuf.INSTANCE;
            protobuf.getClass();
            this.memoizedSerializedSize = protobuf.schemaFor(getClass()).getSerializedSize(this);
        }
        return this.memoizedSerializedSize;
    }

    public final int hashCode() {
        int i = this.memoizedHashCode;
        if (i != 0) {
            return i;
        }
        Protobuf protobuf = Protobuf.INSTANCE;
        protobuf.getClass();
        int hashCode = protobuf.schemaFor(getClass()).hashCode(this);
        this.memoizedHashCode = hashCode;
        return hashCode;
    }

    @Override // com.google.protobuf.MessageLiteOrBuilder
    public final boolean isInitialized() {
        byte byteValue = ((Byte) dynamicMethod(MethodToInvoke.GET_MEMOIZED_IS_INITIALIZED)).byteValue();
        if (byteValue == 1) {
            return true;
        }
        if (byteValue == 0) {
            return false;
        }
        Protobuf protobuf = Protobuf.INSTANCE;
        protobuf.getClass();
        boolean isInitialized = protobuf.schemaFor(getClass()).isInitialized(this);
        dynamicMethod(MethodToInvoke.SET_MEMOIZED_IS_INITIALIZED);
        return isInitialized;
    }

    @Override // com.google.protobuf.MessageLite
    public final Builder newBuilderForType$1() {
        return (Builder) dynamicMethod(MethodToInvoke.NEW_BUILDER);
    }

    @Override // com.google.protobuf.MessageLite
    public final Builder toBuilder$1() {
        Builder builder = (Builder) dynamicMethod(MethodToInvoke.NEW_BUILDER);
        builder.copyOnWrite();
        Builder.mergeFromInstance(builder.instance, this);
        return builder;
    }

    @Override // com.google.protobuf.MessageLite
    public final void writeTo(CodedOutputStream codedOutputStream) throws IOException {
        Protobuf protobuf = Protobuf.INSTANCE;
        protobuf.getClass();
        Schema schemaFor = protobuf.schemaFor(getClass());
        CodedOutputStreamWriter codedOutputStreamWriter = codedOutputStream.wrapper;
        if (codedOutputStreamWriter == null) {
            codedOutputStreamWriter = new CodedOutputStreamWriter(codedOutputStream);
        }
        schemaFor.writeTo(this, codedOutputStreamWriter);
    }

    public static Object invokeOrDie(Method method, Object obj, Object... objArr) {
        try {
            return method.invoke(obj, objArr);
        } catch (IllegalAccessException e) {
            throw new RuntimeException("Couldn't use Java reflection to implement protocol message reflection.", e);
        } catch (InvocationTargetException e2) {
            Throwable cause = e2.getCause();
            if (cause instanceof RuntimeException) {
                throw ((RuntimeException) cause);
            } else if (cause instanceof Error) {
                throw ((Error) cause);
            } else {
                throw new RuntimeException("Unexpected exception thrown by generated accessor method.", cause);
            }
        }
    }

    public static <E> Internal.ProtobufList<E> mutableCopy(Internal.ProtobufList<E> protobufList) {
        int i;
        int size = protobufList.size();
        if (size == 0) {
            i = 10;
        } else {
            i = size * 2;
        }
        return protobufList.mutableCopyWithCapacity(i);
    }

    public final String toString() {
        String obj = super.toString();
        StringBuilder sb = new StringBuilder();
        sb.append("# ");
        sb.append(obj);
        MessageLiteToString.reflectivePrintWithIndent(this, sb, 0);
        return sb.toString();
    }

    @Override // com.google.protobuf.AbstractMessageLite
    public final void setMemoizedSerializedSize(int i) {
        this.memoizedSerializedSize = i;
    }

    @Override // com.google.protobuf.AbstractMessageLite
    public final int getMemoizedSerializedSize() {
        return this.memoizedSerializedSize;
    }
}
