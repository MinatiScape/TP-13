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
public final class ImaxWallpaperProto$GetImageFromCollectionRequest extends GeneratedMessageLite<ImaxWallpaperProto$GetImageFromCollectionRequest, Builder> implements MessageLiteOrBuilder {
    public static final int COLLECTION_IDS_FIELD_NUMBER = 1;
    private static final ImaxWallpaperProto$GetImageFromCollectionRequest DEFAULT_INSTANCE;
    public static final int FILTERING_LABEL_FIELD_NUMBER = 5;
    public static final int LANGUAGE_FIELD_NUMBER = 3;
    private static volatile Parser<ImaxWallpaperProto$GetImageFromCollectionRequest> PARSER = null;
    public static final int REGION_FIELD_NUMBER = 4;
    public static final int RESUME_TOKEN_FIELD_NUMBER = 2;
    private int bitField0_;
    private Internal.ProtobufList<String> collectionIds_;
    private Internal.ProtobufList<String> filteringLabel_;
    private String resumeToken_ = "";
    private String language_ = "";
    private String region_ = "";

    /* loaded from: classes.dex */
    public static final class Builder extends GeneratedMessageLite.Builder<ImaxWallpaperProto$GetImageFromCollectionRequest, Builder> implements MessageLiteOrBuilder {
        public Builder() {
            super(ImaxWallpaperProto$GetImageFromCollectionRequest.DEFAULT_INSTANCE);
        }
    }

    /* renamed from: -$$Nest$maddAllFilteringLabel */
    public static void m46$$Nest$maddAllFilteringLabel(ImaxWallpaperProto$GetImageFromCollectionRequest imaxWallpaperProto$GetImageFromCollectionRequest, ArrayList arrayList) {
        if (!imaxWallpaperProto$GetImageFromCollectionRequest.filteringLabel_.isModifiable()) {
            imaxWallpaperProto$GetImageFromCollectionRequest.filteringLabel_ = GeneratedMessageLite.mutableCopy(imaxWallpaperProto$GetImageFromCollectionRequest.filteringLabel_);
        }
        AbstractMessageLite.addAll(arrayList, imaxWallpaperProto$GetImageFromCollectionRequest.filteringLabel_);
    }

    static {
        ImaxWallpaperProto$GetImageFromCollectionRequest imaxWallpaperProto$GetImageFromCollectionRequest = new ImaxWallpaperProto$GetImageFromCollectionRequest();
        DEFAULT_INSTANCE = imaxWallpaperProto$GetImageFromCollectionRequest;
        GeneratedMessageLite.registerDefaultInstance(ImaxWallpaperProto$GetImageFromCollectionRequest.class, imaxWallpaperProto$GetImageFromCollectionRequest);
    }

    public static Builder newBuilder() {
        return (Builder) ((GeneratedMessageLite.Builder) DEFAULT_INSTANCE.dynamicMethod(GeneratedMessageLite.MethodToInvoke.NEW_BUILDER));
    }

    /* renamed from: -$$Nest$maddCollectionIds */
    public static void m47$$Nest$maddCollectionIds(ImaxWallpaperProto$GetImageFromCollectionRequest imaxWallpaperProto$GetImageFromCollectionRequest, String str) {
        imaxWallpaperProto$GetImageFromCollectionRequest.getClass();
        str.getClass();
        if (!imaxWallpaperProto$GetImageFromCollectionRequest.collectionIds_.isModifiable()) {
            imaxWallpaperProto$GetImageFromCollectionRequest.collectionIds_ = GeneratedMessageLite.mutableCopy(imaxWallpaperProto$GetImageFromCollectionRequest.collectionIds_);
        }
        imaxWallpaperProto$GetImageFromCollectionRequest.collectionIds_.add(str);
    }

    /* renamed from: -$$Nest$msetLanguage */
    public static void m48$$Nest$msetLanguage(ImaxWallpaperProto$GetImageFromCollectionRequest imaxWallpaperProto$GetImageFromCollectionRequest, String str) {
        imaxWallpaperProto$GetImageFromCollectionRequest.getClass();
        str.getClass();
        imaxWallpaperProto$GetImageFromCollectionRequest.bitField0_ |= 2;
        imaxWallpaperProto$GetImageFromCollectionRequest.language_ = str;
    }

    /* renamed from: -$$Nest$msetResumeToken */
    public static void m49$$Nest$msetResumeToken(ImaxWallpaperProto$GetImageFromCollectionRequest imaxWallpaperProto$GetImageFromCollectionRequest, String str) {
        imaxWallpaperProto$GetImageFromCollectionRequest.getClass();
        str.getClass();
        imaxWallpaperProto$GetImageFromCollectionRequest.bitField0_ |= 1;
        imaxWallpaperProto$GetImageFromCollectionRequest.resumeToken_ = str;
    }

    public ImaxWallpaperProto$GetImageFromCollectionRequest() {
        ProtobufArrayList<Object> protobufArrayList = ProtobufArrayList.EMPTY_LIST;
        this.collectionIds_ = protobufArrayList;
        this.filteringLabel_ = protobufArrayList;
    }

    @Override // com.google.protobuf.GeneratedMessageLite
    public final Object dynamicMethod(GeneratedMessageLite.MethodToInvoke methodToInvoke) {
        switch (methodToInvoke.ordinal()) {
            case 0:
                return (byte) 1;
            case 1:
                return null;
            case 2:
                return new RawMessageInfo(DEFAULT_INSTANCE, "\u0001\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0002\u0000\u0001\u001a\u0002\b\u0000\u0003\b\u0001\u0004\b\u0002\u0005\u001a", new Object[]{"bitField0_", "collectionIds_", "resumeToken_", "language_", "region_", "filteringLabel_"});
            case 3:
                return new ImaxWallpaperProto$GetImageFromCollectionRequest();
            case 4:
                return new Builder();
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                Parser<ImaxWallpaperProto$GetImageFromCollectionRequest> parser = PARSER;
                if (parser == null) {
                    synchronized (ImaxWallpaperProto$GetImageFromCollectionRequest.class) {
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
