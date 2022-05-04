package com.google.android.libraries.microvideo.xmp;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import com.adobe.xmp.impl.ParameterAsserts;
import com.adobe.xmp.impl.XMPMetaImpl;
import com.adobe.xmp.impl.XMPNode;
import com.adobe.xmp.impl.XMPNodeUtils;
import com.adobe.xmp.impl.xpath.XMPPath;
import com.adobe.xmp.impl.xpath.XMPPathParser;
import java.util.Objects;
/* loaded from: classes.dex */
public abstract class MicroVideoXmpContainerItem {
    public static String getStructField(XMPMeta xmpMeta, String schemaNs, String structName, String fieldNs, String fieldName) throws XMPException {
        String valueOf = String.valueOf(structName);
        if (fieldNs.length() == 0) {
            throw new XMPException("Empty field namespace URI", 101);
        } else if (fieldName.length() != 0) {
            XMPPath expandXPath = XMPPathParser.expandXPath(fieldNs, fieldName);
            if (expandXPath.size() == 2) {
                String str = expandXPath.getSegment(1).name;
                StringBuilder sb = new StringBuilder(XMPPathFactory$$ExternalSyntheticOutline0.m(str, 1));
                sb.append('/');
                sb.append(str);
                String valueOf2 = String.valueOf(sb.toString());
                String concat = valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
                XMPMetaImpl xMPMetaImpl = (XMPMetaImpl) xmpMeta;
                Objects.requireNonNull(xMPMetaImpl);
                ParameterAsserts.assertSchemaNS(schemaNs);
                ParameterAsserts.assertPropName(concat);
                XMPNode findNode = XMPNodeUtils.findNode(xMPMetaImpl.tree, XMPPathParser.expandXPath(schemaNs, concat), false, null);
                XMPMetaImpl.AnonymousClass2 r4 = findNode != null ? new XMPMetaImpl.AnonymousClass2(xMPMetaImpl.evaluateNodeValue(0, findNode), findNode) : null;
                if (r4 == null) {
                    return null;
                }
                return r4.val$value.toString();
            }
            throw new XMPException("The field name must be simple", 102);
        } else {
            throw new XMPException("Empty f name", 102);
        }
    }

    public static <T> T requiredNonNullValue(T value, String description) throws XMPException {
        if (value != null) {
            return value;
        }
        throw new XMPException(description.length() != 0 ? "Missing value for ".concat(description) : new String("Missing value for "), 5);
    }

    public abstract int getLength();

    public abstract String getMime();

    public abstract int getPadding();

    public abstract String getSemantic();
}
