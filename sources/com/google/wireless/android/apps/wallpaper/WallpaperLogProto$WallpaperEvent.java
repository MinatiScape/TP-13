package com.google.wireless.android.apps.wallpaper;

import com.android.systemui.shared.system.QuickStepContract;
import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.Internal;
import com.google.protobuf.MessageLiteOrBuilder;
import com.google.protobuf.Parser;
import com.google.protobuf.RawMessageInfo;
/* loaded from: classes.dex */
public final class WallpaperLogProto$WallpaperEvent extends GeneratedMessageLite<WallpaperLogProto$WallpaperEvent, Builder> implements MessageLiteOrBuilder {
    public static final int ACCENT_COLOR_HASH_FIELD_NUMBER = 7;
    public static final int ADAPTIVE_SHAPE_HASH_FIELD_NUMBER = 6;
    public static final int CATEGORY_COLLECTION_ID_FIELD_NUMBER = 4;
    public static final int CATEGORY_TITLE_FIELD_NUMBER = 3;
    public static final int CLOCKFACE_HASH_FIELD_NUMBER = 10;
    private static final WallpaperLogProto$WallpaperEvent DEFAULT_INSTANCE;
    public static final int FONT_TYPE_HASH_FIELD_NUMBER = 8;
    public static final int GRIDNAME_HASH_FIELD_NUMBER = 11;
    public static final int IS_CUSTOM_FIELD_NUMBER = 9;
    private static volatile Parser<WallpaperLogProto$WallpaperEvent> PARSER = null;
    public static final int TYPE_FIELD_NUMBER = 1;
    public static final int WALLPAPER_ID_FIELD_NUMBER = 5;
    public static final int WALLPAPER_PICKER_SNAPSHOT_FIELD_NUMBER = 12;
    public static final int WALLPAPER_SET_SOURCE_FIELD_NUMBER = 2;
    private int accentColorHash_;
    private int adaptiveShapeHash_;
    private int bitField0_;
    private int clockfaceHash_;
    private int fontTypeHash_;
    private int gridnameHash_;
    private boolean isCustom_;
    private int type_;
    private WallpaperPickerSnapshotProto$WallpaperPickerSnapshot wallpaperPickerSnapshot_;
    private int wallpaperSetSource_;
    private String categoryTitle_ = "";
    private String categoryCollectionId_ = "";
    private String wallpaperId_ = "";

    /* loaded from: classes.dex */
    public enum Type implements Internal.EnumLite {
        TYPE_UNSPECIFIED(0),
        APP_LAUNCHED(1),
        WALLPAPER_SET(2),
        DAILY_REFRESH_TURNED_ON(3),
        CATEGORY_SELECTED(4),
        INDIVIDUAL_WALLPAPER_SELECTED(5),
        CURRENT_THUMBNAIL_PREVIEWED(6),
        EXPLORE_CLICKED(7),
        BUILD_CASE_CLICKED(8),
        CLOCKFACE_SELECTED(9),
        CLOCKFACE_APPLIED(10),
        THEMEBUNDLE_SELECTED(11),
        THEMEBUNDLE_APPLIED(12),
        GRID_SELECTED(13),
        GRID_APPLIED(14),
        ONRESUME_WP_SUW(15),
        ONRESUME_STYLE_SUW(16),
        ONRESUME_WP(17),
        ONRESUME_STYLE(18),
        ONSTOP(19),
        LIVE_WALLPAPER_INFO_SELECT(20),
        LIVE_WALLPAPER_CUSTOMIZE_SELECT(21),
        SNAPSHOT(22);
        
        private final int value;

        /* loaded from: classes.dex */
        public static final class TypeVerifier implements Internal.EnumVerifier {
            public static final TypeVerifier INSTANCE = new TypeVerifier();

            @Override // com.google.protobuf.Internal.EnumVerifier
            public final boolean isInRange(int i) {
                if (Type.forNumber(i) != null) {
                    return true;
                }
                return false;
            }
        }

        Type(int i) {
            this.value = i;
        }

        public static Type forNumber(int i) {
            switch (i) {
                case 0:
                    return TYPE_UNSPECIFIED;
                case 1:
                    return APP_LAUNCHED;
                case 2:
                    return WALLPAPER_SET;
                case 3:
                    return DAILY_REFRESH_TURNED_ON;
                case 4:
                    return CATEGORY_SELECTED;
                case 5:
                    return INDIVIDUAL_WALLPAPER_SELECTED;
                case 6:
                    return CURRENT_THUMBNAIL_PREVIEWED;
                case 7:
                    return EXPLORE_CLICKED;
                case 8:
                    return BUILD_CASE_CLICKED;
                case 9:
                    return CLOCKFACE_SELECTED;
                case 10:
                    return CLOCKFACE_APPLIED;
                case 11:
                    return THEMEBUNDLE_SELECTED;
                case 12:
                    return THEMEBUNDLE_APPLIED;
                case 13:
                    return GRID_SELECTED;
                case 14:
                    return GRID_APPLIED;
                case 15:
                    return ONRESUME_WP_SUW;
                case 16:
                    return ONRESUME_STYLE_SUW;
                case 17:
                    return ONRESUME_WP;
                case 18:
                    return ONRESUME_STYLE;
                case 19:
                    return ONSTOP;
                case 20:
                    return LIVE_WALLPAPER_INFO_SELECT;
                case 21:
                    return LIVE_WALLPAPER_CUSTOMIZE_SELECT;
                case 22:
                    return SNAPSHOT;
                default:
                    return null;
            }
        }

        @Override // com.google.protobuf.Internal.EnumLite
        public final int getNumber() {
            return this.value;
        }
    }

    /* loaded from: classes.dex */
    public static final class Builder extends GeneratedMessageLite.Builder<WallpaperLogProto$WallpaperEvent, Builder> implements MessageLiteOrBuilder {
        public Builder() {
            super(WallpaperLogProto$WallpaperEvent.DEFAULT_INSTANCE);
        }

        public final void setType(Type type) {
            copyOnWrite();
            WallpaperLogProto$WallpaperEvent.m68$$Nest$msetType((WallpaperLogProto$WallpaperEvent) this.instance, type);
        }
    }

    /* loaded from: classes.dex */
    public enum WallpaperSetSource implements Internal.EnumLite {
        WALLPAPER_SET_SOURCE_UNSPECIFIED(0),
        MY_PHOTOS(1),
        ON_DEVICE(2),
        REMOTE(3);
        
        private final int value;

        /* loaded from: classes.dex */
        public static final class WallpaperSetSourceVerifier implements Internal.EnumVerifier {
            public static final WallpaperSetSourceVerifier INSTANCE = new WallpaperSetSourceVerifier();

            @Override // com.google.protobuf.Internal.EnumVerifier
            public final boolean isInRange(int i) {
                WallpaperSetSource wallpaperSetSource;
                if (i == 0) {
                    wallpaperSetSource = WallpaperSetSource.WALLPAPER_SET_SOURCE_UNSPECIFIED;
                } else if (i == 1) {
                    wallpaperSetSource = WallpaperSetSource.MY_PHOTOS;
                } else if (i == 2) {
                    wallpaperSetSource = WallpaperSetSource.ON_DEVICE;
                } else if (i != 3) {
                    wallpaperSetSource = null;
                } else {
                    wallpaperSetSource = WallpaperSetSource.REMOTE;
                }
                return wallpaperSetSource != null;
            }
        }

        WallpaperSetSource(int i) {
            this.value = i;
        }

        @Override // com.google.protobuf.Internal.EnumLite
        public final int getNumber() {
            return this.value;
        }
    }

    /* renamed from: -$$Nest$msetGridnameHash */
    public static void m67$$Nest$msetGridnameHash(WallpaperLogProto$WallpaperEvent wallpaperLogProto$WallpaperEvent, int i) {
        wallpaperLogProto$WallpaperEvent.bitField0_ |= QuickStepContract.SYSUI_STATE_SEARCH_DISABLED;
        wallpaperLogProto$WallpaperEvent.gridnameHash_ = i;
    }

    static {
        WallpaperLogProto$WallpaperEvent wallpaperLogProto$WallpaperEvent = new WallpaperLogProto$WallpaperEvent();
        DEFAULT_INSTANCE = wallpaperLogProto$WallpaperEvent;
        GeneratedMessageLite.registerDefaultInstance(WallpaperLogProto$WallpaperEvent.class, wallpaperLogProto$WallpaperEvent);
    }

    public static Builder newBuilder() {
        return (Builder) ((GeneratedMessageLite.Builder) DEFAULT_INSTANCE.dynamicMethod(GeneratedMessageLite.MethodToInvoke.NEW_BUILDER));
    }

    public final Type getType() {
        Type forNumber = Type.forNumber(this.type_);
        if (forNumber == null) {
            return Type.TYPE_UNSPECIFIED;
        }
        return forNumber;
    }

    /* renamed from: -$$Nest$msetCategoryCollectionId */
    public static void m66$$Nest$msetCategoryCollectionId(WallpaperLogProto$WallpaperEvent wallpaperLogProto$WallpaperEvent, String str) {
        wallpaperLogProto$WallpaperEvent.getClass();
        wallpaperLogProto$WallpaperEvent.bitField0_ |= 8;
        wallpaperLogProto$WallpaperEvent.categoryCollectionId_ = str;
    }

    /* renamed from: -$$Nest$msetType */
    public static void m68$$Nest$msetType(WallpaperLogProto$WallpaperEvent wallpaperLogProto$WallpaperEvent, Type type) {
        wallpaperLogProto$WallpaperEvent.getClass();
        type.getClass();
        wallpaperLogProto$WallpaperEvent.bitField0_ |= 1;
        wallpaperLogProto$WallpaperEvent.type_ = type.getNumber();
    }

    /* renamed from: -$$Nest$msetWallpaperId */
    public static void m69$$Nest$msetWallpaperId(WallpaperLogProto$WallpaperEvent wallpaperLogProto$WallpaperEvent, String str) {
        wallpaperLogProto$WallpaperEvent.getClass();
        wallpaperLogProto$WallpaperEvent.bitField0_ |= 16;
        wallpaperLogProto$WallpaperEvent.wallpaperId_ = str;
    }

    /* renamed from: -$$Nest$msetWallpaperPickerSnapshot */
    public static void m70$$Nest$msetWallpaperPickerSnapshot(WallpaperLogProto$WallpaperEvent wallpaperLogProto$WallpaperEvent, WallpaperPickerSnapshotProto$WallpaperPickerSnapshot wallpaperPickerSnapshotProto$WallpaperPickerSnapshot) {
        wallpaperLogProto$WallpaperEvent.getClass();
        wallpaperLogProto$WallpaperEvent.wallpaperPickerSnapshot_ = wallpaperPickerSnapshotProto$WallpaperPickerSnapshot;
        wallpaperLogProto$WallpaperEvent.bitField0_ |= QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED;
    }

    @Override // com.google.protobuf.GeneratedMessageLite
    public final Object dynamicMethod(GeneratedMessageLite.MethodToInvoke methodToInvoke) {
        switch (methodToInvoke.ordinal()) {
            case 0:
                return (byte) 1;
            case 1:
                return null;
            case 2:
                return new RawMessageInfo(DEFAULT_INSTANCE, "\u0001\f\u0000\u0001\u0001\f\f\u0000\u0000\u0000\u0001\f\u0000\u0002\f\u0001\u0003\b\u0002\u0004\b\u0003\u0005\b\u0004\u0006\u0004\u0005\u0007\u0004\u0006\b\u0004\u0007\t\u0007\b\n\u0004\t\u000b\u0004\n\f\t\u000b", new Object[]{"bitField0_", "type_", Type.TypeVerifier.INSTANCE, "wallpaperSetSource_", WallpaperSetSource.WallpaperSetSourceVerifier.INSTANCE, "categoryTitle_", "categoryCollectionId_", "wallpaperId_", "adaptiveShapeHash_", "accentColorHash_", "fontTypeHash_", "isCustom_", "clockfaceHash_", "gridnameHash_", "wallpaperPickerSnapshot_"});
            case 3:
                return new WallpaperLogProto$WallpaperEvent();
            case 4:
                return new Builder();
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                Parser<WallpaperLogProto$WallpaperEvent> parser = PARSER;
                if (parser == null) {
                    synchronized (WallpaperLogProto$WallpaperEvent.class) {
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
