package com.google.chrome.dongle.imax.wallpaper2.protos;

import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.Internal;
import com.google.protobuf.MessageLiteOrBuilder;
import com.google.protobuf.Parser;
import com.google.protobuf.ProtobufArrayList;
import com.google.protobuf.RawMessageInfo;
/* loaded from: classes.dex */
public final class ImaxWallpaperProto$Image extends GeneratedMessageLite<ImaxWallpaperProto$Image, Builder> implements MessageLiteOrBuilder {
    public static final int ACTION_URL_FIELD_NUMBER = 3;
    public static final int ASSET_ID_FIELD_NUMBER = 1;
    public static final int ATTRIBUTION_FIELD_NUMBER = 4;
    private static final ImaxWallpaperProto$Image DEFAULT_INSTANCE;
    public static final int IMAGE_URL_FIELD_NUMBER = 2;
    private static volatile Parser<ImaxWallpaperProto$Image> PARSER = null;
    public static final int TYPE_FIELD_NUMBER = 5;
    private long assetId_;
    private int bitField0_;
    private int type_;
    private String imageUrl_ = "";
    private String actionUrl_ = "";
    private Internal.ProtobufList<ImaxWallpaperProto$Attribution> attribution_ = ProtobufArrayList.EMPTY_LIST;

    /* loaded from: classes.dex */
    public enum ActionType implements Internal.EnumLite {
        UNKNOWN(0),
        EXPLORE(1),
        LIVE_CASE(2);
        
        private final int value;

        /* loaded from: classes.dex */
        public static final class ActionTypeVerifier implements Internal.EnumVerifier {
            public static final ActionTypeVerifier INSTANCE = new ActionTypeVerifier();

            @Override // com.google.protobuf.Internal.EnumVerifier
            public final boolean isInRange(int i) {
                if (ActionType.forNumber(i) != null) {
                    return true;
                }
                return false;
            }
        }

        public static ActionType forNumber(int i) {
            if (i == 0) {
                return UNKNOWN;
            }
            if (i == 1) {
                return EXPLORE;
            }
            if (i != 2) {
                return null;
            }
            return LIVE_CASE;
        }

        ActionType(int i) {
            this.value = i;
        }

        @Override // com.google.protobuf.Internal.EnumLite
        public final int getNumber() {
            return this.value;
        }
    }

    /* loaded from: classes.dex */
    public static final class Builder extends GeneratedMessageLite.Builder<ImaxWallpaperProto$Image, Builder> implements MessageLiteOrBuilder {
        public Builder() {
            super(ImaxWallpaperProto$Image.DEFAULT_INSTANCE);
        }
    }

    static {
        ImaxWallpaperProto$Image imaxWallpaperProto$Image = new ImaxWallpaperProto$Image();
        DEFAULT_INSTANCE = imaxWallpaperProto$Image;
        GeneratedMessageLite.registerDefaultInstance(ImaxWallpaperProto$Image.class, imaxWallpaperProto$Image);
    }

    public final ActionType getType() {
        ActionType forNumber = ActionType.forNumber(this.type_);
        if (forNumber == null) {
            return ActionType.UNKNOWN;
        }
        return forNumber;
    }

    @Override // com.google.protobuf.GeneratedMessageLite
    public final Object dynamicMethod(GeneratedMessageLite.MethodToInvoke methodToInvoke) {
        switch (methodToInvoke.ordinal()) {
            case 0:
                return (byte) 1;
            case 1:
                return null;
            case 2:
                return new RawMessageInfo(DEFAULT_INSTANCE, "\u0001\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0001\u0000\u0001\u0005\u0000\u0002\b\u0001\u0003\b\u0002\u0004\u001b\u0005\f\u0003", new Object[]{"bitField0_", "assetId_", "imageUrl_", "actionUrl_", "attribution_", ImaxWallpaperProto$Attribution.class, "type_", ActionType.ActionTypeVerifier.INSTANCE});
            case 3:
                return new ImaxWallpaperProto$Image();
            case 4:
                return new Builder();
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                Parser<ImaxWallpaperProto$Image> parser = PARSER;
                if (parser == null) {
                    synchronized (ImaxWallpaperProto$Image.class) {
                        parser = PARSER;
                        if (parser == null) {
                            parser = new GeneratedMessageLite.DefaultInstanceBasedParser<>(DEFAULT_INSTANCE);
                            PARSER = parser;
                        }
                    }
                }
                return parser;
            default:
                throw new UnsupportedOperationException();
        }
    }

    public static ImaxWallpaperProto$Image getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public final String getActionUrl() {
        return this.actionUrl_;
    }

    public final long getAssetId() {
        return this.assetId_;
    }

    public final Internal.ProtobufList getAttributionList() {
        return this.attribution_;
    }

    public final String getImageUrl() {
        return this.imageUrl_;
    }
}
