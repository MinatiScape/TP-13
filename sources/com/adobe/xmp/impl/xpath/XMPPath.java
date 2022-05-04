package com.adobe.xmp.impl.xpath;

import java.util.ArrayList;
/* loaded from: classes.dex */
public final class XMPPath {
    public ArrayList segments = new ArrayList(5);

    public final void add(XMPPathSegment segment) {
        this.segments.add(segment);
    }

    public final XMPPathSegment getSegment(int index) {
        return (XMPPathSegment) this.segments.get(index);
    }

    public final int size() {
        return this.segments.size();
    }

    public final String toString() {
        int i;
        StringBuffer stringBuffer = new StringBuffer();
        for (int i2 = 1; i2 < size(); i2++) {
            stringBuffer.append(getSegment(i2));
            if (i2 < size() - 1 && ((i = getSegment(i2 + 1).kind) == 1 || i == 2)) {
                stringBuffer.append('/');
            }
        }
        return stringBuffer.toString();
    }
}
