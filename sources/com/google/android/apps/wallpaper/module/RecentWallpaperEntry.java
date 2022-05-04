package com.google.android.apps.wallpaper.module;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: RecentWallpaperUtils.kt */
/* loaded from: classes.dex */
public final class RecentWallpaperEntry {
    @Nullable
    public final String actionUrl;
    @Nullable
    public final List<String> attributions;
    @Nullable
    public final String collectionId;
    @Nullable
    public final String component;
    @NotNull
    public final String id;
    @Nullable
    public final Integer placeHolderColor;

    public final int hashCode() {
        int hashCode = this.id.hashCode() * 31;
        String str = this.collectionId;
        int i = 0;
        int hashCode2 = (hashCode + (str == null ? 0 : str.hashCode())) * 31;
        List<String> list = this.attributions;
        int hashCode3 = (hashCode2 + (list == null ? 0 : list.hashCode())) * 31;
        String str2 = this.actionUrl;
        int hashCode4 = (hashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.component;
        int hashCode5 = (hashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Integer num = this.placeHolderColor;
        if (num != null) {
            i = num.hashCode();
        }
        return hashCode5 + i;
    }

    public final boolean equals(@Nullable Object obj) {
        if (obj instanceof RecentWallpaperEntry) {
            return Intrinsics.areEqual(this.id, ((RecentWallpaperEntry) obj).id);
        }
        return super.equals(obj);
    }

    @NotNull
    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("RecentWallpaperEntry(id=");
        m.append(this.id);
        m.append(", collectionId=");
        m.append((Object) this.collectionId);
        m.append(", attributions=");
        m.append(this.attributions);
        m.append(", actionUrl=");
        m.append((Object) this.actionUrl);
        m.append(", component=");
        m.append((Object) this.component);
        m.append(", placeHolderColor=");
        m.append(this.placeHolderColor);
        m.append(')');
        return m.toString();
    }

    public RecentWallpaperEntry(@NotNull String str, @Nullable String str2, @Nullable ArrayList arrayList, @Nullable String str3, @Nullable String str4, @Nullable Integer num) {
        this.id = str;
        this.collectionId = str2;
        this.attributions = arrayList;
        this.actionUrl = str3;
        this.component = str4;
        this.placeHolderColor = num;
    }
}
