package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.impl.xpath.XMPPathParser;
/* loaded from: classes.dex */
public final class XMPMetaImpl implements XMPMeta {
    public XMPNode tree;

    /* renamed from: com.adobe.xmp.impl.XMPMetaImpl$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass2 {
        public final /* synthetic */ Object val$value;

        public AnonymousClass2(Object obj) {
            this.val$value = obj;
        }

        public final String toString() {
            return this.val$value.toString();
        }
    }

    public XMPMetaImpl() {
        this.tree = new XMPNode(null, null, null);
    }

    /* JADX WARN: Code restructure failed: missing block: B:56:0x00d2, code lost:
        if (java.lang.Integer.parseInt(r7) != 0) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x00f3, code lost:
        if ("yes".equals(r7) == false) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x00f6, code lost:
        r0 = false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Object evaluateNodeValue(int r6, final com.adobe.xmp.impl.XMPNode r7) throws com.adobe.xmp.XMPException {
        /*
            Method dump skipped, instructions count: 280
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.XMPMetaImpl.evaluateNodeValue(int, com.adobe.xmp.impl.XMPNode):java.lang.Object");
    }

    public final Object clone() {
        return new XMPMetaImpl((XMPNode) this.tree.clone());
    }

    public final Integer getPropertyInteger(String str) throws XMPException {
        ParameterAsserts.assertSchemaNS("http://ns.google.com/photos/1.0/camera/");
        ParameterAsserts.assertPropName(str);
        Object obj = null;
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath("http://ns.google.com/photos/1.0/camera/", str), false, null);
        if (findNode != null) {
            if (!findNode.getOptions().isCompositeProperty()) {
                obj = evaluateNodeValue(2, findNode);
            } else {
                throw new XMPException("Property must be simple when a value type is requested", 102);
            }
        }
        return (Integer) obj;
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x01e2, code lost:
        if (r8 == r2) goto L105;
     */
    /* JADX WARN: Code restructure failed: missing block: B:101:0x01e4, code lost:
        if (r8 == null) goto L105;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x01ee, code lost:
        if (r8.value.equals(r2.value) == false) goto L105;
     */
    /* JADX WARN: Code restructure failed: missing block: B:104:0x01f0, code lost:
        r8.value = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x01f2, code lost:
        r2.value = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x01f5, code lost:
        r2 = r1.iterateChildren();
     */
    /* JADX WARN: Code restructure failed: missing block: B:108:0x01fd, code lost:
        if (r2.hasNext() == false) goto L151;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x01ff, code lost:
        r4 = (com.adobe.xmp.impl.XMPNode) r2.next();
     */
    /* JADX WARN: Code restructure failed: missing block: B:110:0x0205, code lost:
        if (r4 == r8) goto L154;
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x0207, code lost:
        r5 = r4.value;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x0209, code lost:
        if (r8 == null) goto L114;
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x020b, code lost:
        r9 = r8.value;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x020e, code lost:
        r9 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:0x0213, code lost:
        if (r5.equals(r9) != false) goto L152;
     */
    /* JADX WARN: Code restructure failed: missing block: B:117:0x0216, code lost:
        r4.value = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x0219, code lost:
        if (r8 == null) goto L124;
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x021b, code lost:
        r8.value = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x021e, code lost:
        com.adobe.xmp.impl.XMPNodeUtils.appendLangItem(r1, "x-default", r21);
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x0221, code lost:
        if (r9 != false) goto L123;
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x0223, code lost:
        com.adobe.xmp.impl.XMPNodeUtils.appendLangItem(r1, r4, r21);
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x0226, code lost:
        r6 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:124:0x0227, code lost:
        if (r6 != false) goto L157;
     */
    /* JADX WARN: Code restructure failed: missing block: B:126:0x022d, code lost:
        if (r1.getChildrenLength() != 1) goto L158;
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x022f, code lost:
        com.adobe.xmp.impl.XMPNodeUtils.appendLangItem(r1, "x-default", r21);
     */
    /* JADX WARN: Code restructure failed: missing block: B:128:0x0232, code lost:
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:130:0x023a, code lost:
        throw new com.adobe.xmp.XMPException("Localized text array is not alt-text", 102);
     */
    /* JADX WARN: Code restructure failed: missing block: B:157:?, code lost:
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:158:?, code lost:
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0099, code lost:
        if (r8 == null) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x009f, code lost:
        if (r1.getChildrenLength() <= 1) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00a1, code lost:
        ((java.util.ArrayList) r1.getChildren()).remove(r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x00b0, code lost:
        if (r1.children.isEmpty() == false) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00b2, code lost:
        r1.children = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00b4, code lost:
        r1.addChild$1(r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00bf, code lost:
        if (r1.getOptions().isArrayAltText() == false) goto L129;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00c6, code lost:
        if (r1.hasChildren() != false) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00c8, code lost:
        r2 = new java.lang.Object[]{new java.lang.Integer(0), null};
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00d5, code lost:
        r12 = r1.iterateChildren();
        r16 = null;
        r17 = null;
        r11 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00e2, code lost:
        if (r12.hasNext() == false) goto L138;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00e4, code lost:
        r14 = (com.adobe.xmp.impl.XMPNode) r12.next();
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00f4, code lost:
        if (r14.getOptions().isCompositeProperty() != false) goto L142;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00fa, code lost:
        if (r14.hasQualifier() == false) goto L143;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0106, code lost:
        if ("xml:lang".equals(r14.getQualifier(1).name) == false) goto L140;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0108, code lost:
        r15 = r14.getQualifier(1).value;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0112, code lost:
        if (r4.equals(r15) == false) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0114, code lost:
        r2 = new java.lang.Object[]{new java.lang.Integer(1), r14};
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0120, code lost:
        if (r2 == null) goto L137;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0126, code lost:
        if (r15.startsWith(r2) == false) goto L139;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0128, code lost:
        if (r16 != null) goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x012a, code lost:
        r16 = r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x012c, code lost:
        r11 = r11 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0133, code lost:
        if ("x-default".equals(r15) == false) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0135, code lost:
        r17 = r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x013f, code lost:
        throw new com.adobe.xmp.XMPException("Alt-text array item has no language qualifier", 102);
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0147, code lost:
        throw new com.adobe.xmp.XMPException("Alt-text array item is not simple", 102);
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0148, code lost:
        if (r11 != 1) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x014a, code lost:
        r2 = new java.lang.Object[]{new java.lang.Integer(2), r16};
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0156, code lost:
        if (r11 <= 1) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0158, code lost:
        r2 = new java.lang.Object[]{new java.lang.Integer(3), r16};
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0165, code lost:
        if (r17 == null) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x0167, code lost:
        r2 = new java.lang.Object[]{new java.lang.Integer(4), r17};
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x0174, code lost:
        r2 = new java.lang.Object[]{new java.lang.Integer(5), r1.getChild(1)};
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x0184, code lost:
        r5 = ((java.lang.Integer) r2[0]).intValue();
        r2 = (com.adobe.xmp.impl.XMPNode) r2[1];
        r9 = "x-default".equals(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x0194, code lost:
        if (r5 == 0) goto L120;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x0196, code lost:
        if (r5 == 1) goto L98;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x0198, code lost:
        if (r5 == 2) goto L91;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x019b, code lost:
        if (r5 == 3) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x019e, code lost:
        if (r5 == 4) goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x01a1, code lost:
        if (r5 != 5) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x01a3, code lost:
        com.adobe.xmp.impl.XMPNodeUtils.appendLangItem(r1, r4, r21);
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x01a6, code lost:
        if (r9 == false) goto L124;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x01b3, code lost:
        throw new com.adobe.xmp.XMPException("Unexpected result from ChooseLocalizedText", 9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x01b4, code lost:
        if (r8 == null) goto L88;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x01ba, code lost:
        if (r1.getChildrenLength() != 1) goto L88;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x01bc, code lost:
        r8.value = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x01be, code lost:
        com.adobe.xmp.impl.XMPNodeUtils.appendLangItem(r1, r4, r21);
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x01c3, code lost:
        com.adobe.xmp.impl.XMPNodeUtils.appendLangItem(r1, r4, r21);
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x01c6, code lost:
        if (r9 == false) goto L124;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x01c9, code lost:
        if (r6 == false) goto L97;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x01cb, code lost:
        if (r8 == r2) goto L97;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x01cd, code lost:
        if (r8 == null) goto L97;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x01d7, code lost:
        if (r8.value.equals(r2.value) == false) goto L97;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x01d9, code lost:
        r8.value = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x01db, code lost:
        r2.value = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x01de, code lost:
        if (r9 != false) goto L106;
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x01e0, code lost:
        if (r6 == false) goto L105;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void setLocalizedText(java.lang.String r21) throws com.adobe.xmp.XMPException {
        /*
            Method dump skipped, instructions count: 579
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.XMPMetaImpl.setLocalizedText(java.lang.String):void");
    }

    public XMPMetaImpl(XMPNode tree) {
        this.tree = tree;
    }
}
