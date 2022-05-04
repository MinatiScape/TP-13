package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.impl.xpath.XMPPathParser;
/* loaded from: classes.dex */
public class XMPMetaImpl implements XMPMeta {
    public XMPNode tree;

    /* renamed from: com.adobe.xmp.impl.XMPMetaImpl$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass2 {
        public final /* synthetic */ Object val$value;

        public AnonymousClass2(Object obj, XMPNode xMPNode) {
            this.val$value = obj;
        }

        public String toString() {
            return this.val$value.toString();
        }
    }

    public XMPMetaImpl() {
        this.tree = new XMPNode(null, null, null);
    }

    public Object clone() {
        return new XMPMetaImpl((XMPNode) this.tree.clone());
    }

    /* JADX WARN: Code restructure failed: missing block: B:56:0x00d4, code lost:
        if (java.lang.Integer.parseInt(r5) != 0) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x00f5, code lost:
        if ("yes".equals(r5) == false) goto L65;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object evaluateNodeValue(int r6, final com.adobe.xmp.impl.XMPNode r7) throws com.adobe.xmp.XMPException {
        /*
            Method dump skipped, instructions count: 282
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.XMPMetaImpl.evaluateNodeValue(int, com.adobe.xmp.impl.XMPNode):java.lang.Object");
    }

    public Integer getPropertyInteger(String schemaNS, String propName) throws XMPException {
        ParameterAsserts.assertSchemaNS(schemaNS);
        ParameterAsserts.assertPropName(propName);
        Object obj = null;
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(schemaNS, propName), false, null);
        if (findNode != null) {
            if (!findNode.getOptions().isCompositeProperty()) {
                obj = evaluateNodeValue(2, findNode);
            } else {
                throw new XMPException("Property must be simple when a value type is requested", 102);
            }
        }
        return (Integer) obj;
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x009a, code lost:
        throw new com.adobe.xmp.XMPException("Language qualifier must be first", 102);
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x019a, code lost:
        if (r5 != false) goto L124;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x01ba, code lost:
        if (r5 != false) goto L124;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void setLocalizedText(java.lang.String r20, java.lang.String r21, java.lang.String r22, java.lang.String r23, java.lang.String r24, com.adobe.xmp.options.PropertyOptions r25) throws com.adobe.xmp.XMPException {
        /*
            Method dump skipped, instructions count: 585
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.XMPMetaImpl.setLocalizedText(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, com.adobe.xmp.options.PropertyOptions):void");
    }

    public XMPMetaImpl(XMPNode tree) {
        this.tree = tree;
    }
}
