package com.adobe.xmp.impl.xpath;
/* loaded from: classes.dex */
public final class XMPPathSegment {
    public boolean alias;
    public int aliasForm;
    public int kind;
    public String name;

    public final String toString() {
        switch (this.kind) {
            case 1:
            case 2:
            case 3:
            case 4:
                return this.name;
            case 5:
            case 6:
                return this.name;
            default:
                return this.name;
        }
    }

    public XMPPathSegment(String name, int kind) {
        this.name = name;
        this.kind = kind;
    }
}
