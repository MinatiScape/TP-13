package com.google.android.libraries.microvideo.xmp;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.impl.ParameterAsserts;
import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.adobe.xmp.impl.XMPMetaImpl;
import com.adobe.xmp.impl.XMPNode;
import com.adobe.xmp.impl.XMPNodeUtils;
import com.adobe.xmp.impl.xpath.XMPPath;
import com.adobe.xmp.impl.xpath.XMPPathParser;
/* loaded from: classes.dex */
public abstract class MicroVideoXmpContainerItem {
    public abstract int getLength();

    public abstract String getMime();

    public abstract int getPadding();

    public abstract String getSemantic();

    public static void requiredNonNullValue(String value, String description) throws XMPException {
        String str;
        if (value == null) {
            if (description.length() != 0) {
                str = "Missing value for ".concat(description);
            } else {
                str = new String("Missing value for ");
            }
            throw new XMPException(str, 5);
        }
    }

    public static String getStructField(XMPMetaImpl xMPMetaImpl, String str, String str2) throws XMPException {
        String str3;
        XMPMetaImpl.AnonymousClass2 r4;
        String valueOf = String.valueOf(str);
        if (str2.length() != 0) {
            XMPPath expandXPath = XMPPathParser.expandXPath("http://ns.google.com/photos/1.0/container/item/", str2);
            if (expandXPath.size() == 2) {
                String str4 = expandXPath.getSegment(1).name;
                StringBuilder sb = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(str4, 1));
                sb.append('/');
                sb.append(str4);
                String valueOf2 = String.valueOf(sb.toString());
                if (valueOf2.length() != 0) {
                    str3 = valueOf.concat(valueOf2);
                } else {
                    str3 = new String(valueOf);
                }
                ParameterAsserts.assertSchemaNS("http://ns.google.com/photos/1.0/container/");
                ParameterAsserts.assertPropName(str3);
                XMPNode findNode = XMPNodeUtils.findNode(xMPMetaImpl.tree, XMPPathParser.expandXPath("http://ns.google.com/photos/1.0/container/", str3), false, null);
                if (findNode != null) {
                    r4 = new XMPMetaImpl.AnonymousClass2(XMPMetaImpl.evaluateNodeValue(0, findNode));
                } else {
                    r4 = null;
                }
                if (r4 == null) {
                    return null;
                }
                return r4.val$value.toString();
            }
            throw new XMPException("The field name must be simple", 102);
        }
        throw new XMPException("Empty f name", 102);
    }
}
