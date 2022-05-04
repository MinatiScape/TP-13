package com.google.protobuf;

import com.google.protobuf.GeneratedMessageLite;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.List;
import java.util.RandomAccess;
/* loaded from: classes.dex */
public final class Internal {
    public static final byte[] EMPTY_BYTE_ARRAY;
    public static final Charset UTF_8 = Charset.forName("UTF-8");

    /* loaded from: classes.dex */
    public interface EnumLite {
        int getNumber();
    }

    /* loaded from: classes.dex */
    public interface EnumVerifier {
        boolean isInRange(int i);
    }

    /* loaded from: classes.dex */
    public interface ProtobufList<E> extends List<E>, RandomAccess {
        boolean isModifiable();

        void makeImmutable();

        ProtobufList<E> mutableCopyWithCapacity(int i);
    }

    public static int hashLong(long j) {
        return (int) (j ^ (j >>> 32));
    }

    static {
        Charset.forName("ISO-8859-1");
        byte[] bArr = new byte[0];
        EMPTY_BYTE_ARRAY = bArr;
        ByteBuffer.wrap(bArr);
        if ((0 - 0) + 0 > Integer.MAX_VALUE) {
            try {
                throw InvalidProtocolBufferException.truncatedMessage();
            } catch (InvalidProtocolBufferException e) {
                throw new IllegalArgumentException(e);
            }
        }
    }

    public static GeneratedMessageLite mergeMessage(Object obj, Object obj2) {
        GeneratedMessageLite.Builder builder$1 = ((MessageLite) obj).toBuilder$1();
        MessageLite messageLite = (MessageLite) obj2;
        builder$1.getClass();
        if (builder$1.defaultInstance.getClass().isInstance(messageLite)) {
            builder$1.copyOnWrite();
            GeneratedMessageLite.Builder.mergeFromInstance(builder$1.instance, (GeneratedMessageLite) ((AbstractMessageLite) messageLite));
            return builder$1.buildPartial();
        }
        throw new IllegalArgumentException("mergeFrom(MessageLite) can only merge messages of the same type.");
    }
}
