package com.google.protobuf;
/* loaded from: classes.dex */
public final class RawMessageInfo implements MessageInfo {
    public final MessageLite defaultInstance;
    public final int flags;
    public final String info;
    public final Object[] objects;

    @Override // com.google.protobuf.MessageInfo
    public final ProtoSyntax getSyntax() {
        if ((this.flags & 1) == 1) {
            return ProtoSyntax.PROTO2;
        }
        return ProtoSyntax.PROTO3;
    }

    @Override // com.google.protobuf.MessageInfo
    public final boolean isMessageSetWireFormat() {
        if ((this.flags & 2) == 2) {
            return true;
        }
        return false;
    }

    public RawMessageInfo(GeneratedMessageLite generatedMessageLite, String str, Object[] objArr) {
        this.defaultInstance = generatedMessageLite;
        this.info = str;
        this.objects = objArr;
        char charAt = str.charAt(0);
        if (charAt < 55296) {
            this.flags = charAt;
            return;
        }
        int i = charAt & 8191;
        int i2 = 1;
        int i3 = 13;
        while (true) {
            int i4 = i2 + 1;
            char charAt2 = str.charAt(i2);
            if (charAt2 >= 55296) {
                i |= (charAt2 & 8191) << i3;
                i3 += 13;
                i2 = i4;
            } else {
                this.flags = i | (charAt2 << i3);
                return;
            }
        }
    }

    @Override // com.google.protobuf.MessageInfo
    public final MessageLite getDefaultInstance() {
        return this.defaultInstance;
    }
}
