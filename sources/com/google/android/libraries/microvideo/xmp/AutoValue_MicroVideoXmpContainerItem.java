package com.google.android.libraries.microvideo.xmp;

import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public final class AutoValue_MicroVideoXmpContainerItem extends MicroVideoXmpContainerItem {
    public final int length;
    public final String mime;
    public final int padding;
    public final String semantic;

    public final boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof MicroVideoXmpContainerItem)) {
            return false;
        }
        MicroVideoXmpContainerItem microVideoXmpContainerItem = (MicroVideoXmpContainerItem) o;
        return this.mime.equals(microVideoXmpContainerItem.getMime()) && this.semantic.equals(microVideoXmpContainerItem.getSemantic()) && this.length == microVideoXmpContainerItem.getLength() && this.padding == microVideoXmpContainerItem.getPadding();
    }

    public final int hashCode() {
        return this.padding ^ ((((((this.mime.hashCode() ^ 1000003) * 1000003) ^ this.semantic.hashCode()) * 1000003) ^ this.length) * 1000003);
    }

    public final String toString() {
        String str = this.mime;
        String str2 = this.semantic;
        int i = this.length;
        int i2 = this.padding;
        StringBuilder sb = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(str2, ParseRDF$$ExternalSyntheticOutline0.m(str, 85)));
        sb.append("MicroVideoXmpContainerItem{mime=");
        sb.append(str);
        sb.append(", semantic=");
        sb.append(str2);
        sb.append(", length=");
        sb.append(i);
        sb.append(", padding=");
        sb.append(i2);
        sb.append("}");
        return sb.toString();
    }

    public AutoValue_MicroVideoXmpContainerItem(String str, String str2, int i, int i2) {
        this.mime = str;
        this.semantic = str2;
        this.length = i;
        this.padding = i2;
    }

    @Override // com.google.android.libraries.microvideo.xmp.MicroVideoXmpContainerItem
    public final int getLength() {
        return this.length;
    }

    @Override // com.google.android.libraries.microvideo.xmp.MicroVideoXmpContainerItem
    public final String getMime() {
        return this.mime;
    }

    @Override // com.google.android.libraries.microvideo.xmp.MicroVideoXmpContainerItem
    public final int getPadding() {
        return this.padding;
    }

    @Override // com.google.android.libraries.microvideo.xmp.MicroVideoXmpContainerItem
    public final String getSemantic() {
        return this.semantic;
    }
}
