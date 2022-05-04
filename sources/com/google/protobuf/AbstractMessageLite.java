package com.google.protobuf;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.google.protobuf.AbstractMessageLite;
import com.google.protobuf.AbstractMessageLite.Builder;
import com.google.protobuf.ByteString;
import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.Internal;
import com.google.protobuf.MessageLite;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;
/* loaded from: classes.dex */
public abstract class AbstractMessageLite<MessageType extends AbstractMessageLite<MessageType, BuilderType>, BuilderType extends Builder<MessageType, BuilderType>> implements MessageLite {
    public int memoizedHashCode = 0;

    /* loaded from: classes.dex */
    public static abstract class Builder<MessageType extends AbstractMessageLite<MessageType, BuilderType>, BuilderType extends Builder<MessageType, BuilderType>> implements MessageLite.Builder {
    }

    @Override // com.google.protobuf.MessageLite
    public final byte[] toByteArray() {
        try {
            GeneratedMessageLite generatedMessageLite = (GeneratedMessageLite) this;
            int serializedSize = generatedMessageLite.getSerializedSize();
            byte[] bArr = new byte[serializedSize];
            Logger logger = CodedOutputStream.logger;
            CodedOutputStream.ArrayEncoder arrayEncoder = new CodedOutputStream.ArrayEncoder(bArr, serializedSize);
            generatedMessageLite.writeTo(arrayEncoder);
            if (arrayEncoder.spaceLeft() == 0) {
                return bArr;
            }
            throw new IllegalStateException("Did not write as much data as expected.");
        } catch (IOException e) {
            throw new RuntimeException(getSerializingExceptionMessage("byte array"), e);
        }
    }

    @Override // com.google.protobuf.MessageLite
    public final ByteString toByteString() {
        try {
            GeneratedMessageLite generatedMessageLite = (GeneratedMessageLite) this;
            int serializedSize = generatedMessageLite.getSerializedSize();
            ByteString byteString = ByteString.EMPTY;
            byte[] bArr = new byte[serializedSize];
            Logger logger = CodedOutputStream.logger;
            CodedOutputStream.ArrayEncoder arrayEncoder = new CodedOutputStream.ArrayEncoder(bArr, serializedSize);
            generatedMessageLite.writeTo(arrayEncoder);
            if (arrayEncoder.spaceLeft() == 0) {
                return new ByteString.LiteralByteString(bArr);
            }
            throw new IllegalStateException("Did not write as much data as expected.");
        } catch (IOException e) {
            throw new RuntimeException(getSerializingExceptionMessage("ByteString"), e);
        }
    }

    public static void addAll(ArrayList arrayList, Internal.ProtobufList protobufList) {
        Charset charset = Internal.UTF_8;
        if (arrayList instanceof LazyStringList) {
            List<?> underlyingElements = ((LazyStringList) arrayList).getUnderlyingElements();
            LazyStringList lazyStringList = (LazyStringList) protobufList;
            int size = protobufList.size();
            for (Object obj : underlyingElements) {
                if (obj == null) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Element at index ");
                    m.append(lazyStringList.size() - size);
                    m.append(" is null.");
                    String sb = m.toString();
                    int size2 = lazyStringList.size();
                    while (true) {
                        size2--;
                        if (size2 < size) {
                            break;
                        }
                        lazyStringList.remove(size2);
                    }
                    throw new NullPointerException(sb);
                } else if (obj instanceof ByteString) {
                    lazyStringList.add((ByteString) obj);
                } else {
                    lazyStringList.add((LazyStringList) ((String) obj));
                }
            }
        } else if (arrayList instanceof PrimitiveNonBoxingCollection) {
            protobufList.addAll(arrayList);
        } else {
            if (protobufList instanceof ArrayList) {
                ((ArrayList) protobufList).ensureCapacity(arrayList.size() + protobufList.size());
            }
            int size3 = protobufList.size();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                if (next == null) {
                    StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Element at index ");
                    m2.append(protobufList.size() - size3);
                    m2.append(" is null.");
                    String sb2 = m2.toString();
                    int size4 = protobufList.size();
                    while (true) {
                        size4--;
                        if (size4 < size3) {
                            break;
                        }
                        protobufList.remove(size4);
                    }
                    throw new NullPointerException(sb2);
                }
                protobufList.add(next);
            }
        }
    }

    public int getMemoizedSerializedSize() {
        throw new UnsupportedOperationException();
    }

    public final String getSerializingExceptionMessage(String str) {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Serializing ");
        m.append(getClass().getName());
        m.append(" to a ");
        m.append(str);
        m.append(" threw an IOException (should never happen).");
        return m.toString();
    }

    public void setMemoizedSerializedSize(int i) {
        throw new UnsupportedOperationException();
    }
}
