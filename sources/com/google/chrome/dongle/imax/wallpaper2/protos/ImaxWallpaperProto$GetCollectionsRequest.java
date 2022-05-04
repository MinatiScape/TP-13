package com.google.chrome.dongle.imax.wallpaper2.protos;

import com.google.protobuf.AbstractMessageLite;
import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.Internal;
import com.google.protobuf.MessageLiteOrBuilder;
import com.google.protobuf.Parser;
import com.google.protobuf.ProtobufArrayList;
import com.google.protobuf.RawMessageInfo;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class ImaxWallpaperProto$GetCollectionsRequest extends GeneratedMessageLite<ImaxWallpaperProto$GetCollectionsRequest, Builder> implements MessageLiteOrBuilder {
    private static final ImaxWallpaperProto$GetCollectionsRequest DEFAULT_INSTANCE;
    public static final int FILTERING_LABEL_FIELD_NUMBER = 3;
    public static final int LANGUAGE_FIELD_NUMBER = 1;
    private static volatile Parser<ImaxWallpaperProto$GetCollectionsRequest> PARSER = null;
    public static final int REGION_FIELD_NUMBER = 2;
    private int bitField0_;
    private String language_ = "";
    private String region_ = "";
    private Internal.ProtobufList<String> filteringLabel_ = ProtobufArrayList.EMPTY_LIST;

    /* loaded from: classes.dex */
    public static final class Builder extends GeneratedMessageLite.Builder<ImaxWallpaperProto$GetCollectionsRequest, Builder> implements MessageLiteOrBuilder {
        public Builder() {
            super(ImaxWallpaperProto$GetCollectionsRequest.DEFAULT_INSTANCE);
        }
    }

    /* renamed from: -$$Nest$maddAllFilteringLabel  reason: not valid java name */
    public static void m42$$Nest$maddAllFilteringLabel(ImaxWallpaperProto$GetCollectionsRequest imaxWallpaperProto$GetCollectionsRequest, ArrayList arrayList) {
        if (!imaxWallpaperProto$GetCollectionsRequest.filteringLabel_.isModifiable()) {
            imaxWallpaperProto$GetCollectionsRequest.filteringLabel_ = GeneratedMessageLite.mutableCopy(imaxWallpaperProto$GetCollectionsRequest.filteringLabel_);
        }
        AbstractMessageLite.addAll(arrayList, imaxWallpaperProto$GetCollectionsRequest.filteringLabel_);
    }

    static {
        ImaxWallpaperProto$GetCollectionsRequest imaxWallpaperProto$GetCollectionsRequest = new ImaxWallpaperProto$GetCollectionsRequest();
        DEFAULT_INSTANCE = imaxWallpaperProto$GetCollectionsRequest;
        GeneratedMessageLite.registerDefaultInstance(ImaxWallpaperProto$GetCollectionsRequest.class, imaxWallpaperProto$GetCollectionsRequest);
    }

    public static Builder newBuilder() {
        return (Builder) ((GeneratedMessageLite.Builder) DEFAULT_INSTANCE.dynamicMethod(GeneratedMessageLite.MethodToInvoke.NEW_BUILDER));
    }

    /* renamed from: -$$Nest$msetLanguage  reason: not valid java name */
    public static void m43$$Nest$msetLanguage(ImaxWallpaperProto$GetCollectionsRequest imaxWallpaperProto$GetCollectionsRequest, String str) {
        imaxWallpaperProto$GetCollectionsRequest.getClass();
        str.getClass();
        imaxWallpaperProto$GetCollectionsRequest.bitField0_ |= 1;
        imaxWallpaperProto$GetCollectionsRequest.language_ = str;
    }

    @Override // com.google.protobuf.GeneratedMessageLite
    public final Object dynamicMethod(GeneratedMessageLite.MethodToInvoke methodToInvoke) {
        switch (methodToInvoke.ordinal()) {
            case 0:
                return (byte) 1;
            case 1:
                return null;
            case 2:
                return new RawMessageInfo(DEFAULT_INSTANCE, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0001\u0000\u0001\b\u0000\u0002\b\u0001\u0003\u001a", new Object[]{"bitField0_", "language_", "region_", "filteringLabel_"});
            case 3:
                return new ImaxWallpaperProto$GetCollectionsRequest();
            case 4:
                return new Builder();
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                Parser<ImaxWallpaperProto$GetCollectionsRequest> parser = PARSER;
                if (parser == null) {
                    synchronized (ImaxWallpaperProto$GetCollectionsRequest.class) {
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
}
