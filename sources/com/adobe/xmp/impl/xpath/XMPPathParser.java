package com.adobe.xmp.impl.xpath;

import androidx.recyclerview.widget.RecyclerView;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMetaFactory;
import com.adobe.xmp.impl.Utils;
import com.adobe.xmp.impl.XMPSchemaRegistryImpl;
import com.adobe.xmp.properties.XMPAliasInfo;
import com.android.systemui.shared.system.QuickStepContract;
/* loaded from: classes.dex */
public final class XMPPathParser {
    public static XMPPath expandXPath(String schemaNS, String path) throws XMPException {
        XMPAliasInfo xMPAliasInfo;
        int i;
        XMPPathSegment xMPPathSegment;
        boolean z;
        char c;
        String str;
        String str2;
        int i2;
        XMPPathSegment xMPPathSegment2;
        XMPPath xMPPath = new XMPPath();
        int i3 = 0;
        while (i3 < path.length() && "/[*".indexOf(path.charAt(i3)) < 0) {
            i3++;
        }
        if (i3 != 0) {
            String verifyXPathRoot = verifyXPathRoot(schemaNS, path.substring(0, i3));
            XMPSchemaRegistryImpl xMPSchemaRegistryImpl = XMPMetaFactory.schema;
            synchronized (xMPSchemaRegistryImpl) {
                xMPAliasInfo = (XMPAliasInfo) xMPSchemaRegistryImpl.aliasMap.get(verifyXPathRoot);
            }
            if (xMPAliasInfo == null) {
                xMPPath.add(new XMPPathSegment(schemaNS, RecyclerView.UNDEFINED_DURATION));
                xMPPath.add(new XMPPathSegment(verifyXPathRoot, 1));
            } else {
                xMPPath.add(new XMPPathSegment(xMPAliasInfo.getNamespace(), RecyclerView.UNDEFINED_DURATION));
                XMPPathSegment xMPPathSegment3 = new XMPPathSegment(verifyXPathRoot(xMPAliasInfo.getNamespace(), xMPAliasInfo.getPropName()), 1);
                xMPPathSegment3.alias = true;
                xMPPathSegment3.aliasForm = xMPAliasInfo.getAliasForm().options;
                xMPPath.add(xMPPathSegment3);
                if (xMPAliasInfo.getAliasForm().getOption(QuickStepContract.SYSUI_STATE_TRACING_ENABLED)) {
                    XMPPathSegment xMPPathSegment4 = new XMPPathSegment("[?xml:lang='x-default']", 5);
                    xMPPathSegment4.alias = true;
                    xMPPathSegment4.aliasForm = xMPAliasInfo.getAliasForm().options;
                    xMPPath.add(xMPPathSegment4);
                } else if (xMPAliasInfo.getAliasForm().getOption(QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED)) {
                    XMPPathSegment xMPPathSegment5 = new XMPPathSegment("[1]", 3);
                    xMPPathSegment5.alias = true;
                    xMPPathSegment5.aliasForm = xMPAliasInfo.getAliasForm().options;
                    xMPPath.add(xMPPathSegment5);
                }
            }
            int i4 = 0;
            int i5 = 0;
            while (i3 < path.length()) {
                if (path.charAt(i3) == '/' && (i3 = i3 + 1) >= path.length()) {
                    throw new XMPException("Empty XMPPath segment", 102);
                } else if (path.charAt(i3) != '*' || ((i3 = i3 + 1) < path.length() && path.charAt(i3) == '[')) {
                    if (path.charAt(i3) != '[') {
                        i4 = i3;
                        while (i4 < path.length() && "/[*".indexOf(path.charAt(i4)) < 0) {
                            i4++;
                        }
                        if (i4 != i3) {
                            xMPPathSegment = new XMPPathSegment(path.substring(i3, i4), 1);
                            i = i3;
                            i3 = i4;
                        } else {
                            throw new XMPException("Empty XMPPath segment", 102);
                        }
                    } else {
                        i = i3 + 1;
                        if ('0' > path.charAt(i) || path.charAt(i) > '9') {
                            int i6 = i;
                            while (i6 < path.length() && path.charAt(i6) != ']' && path.charAt(i6) != '=') {
                                i6++;
                            }
                            if (i6 >= path.length()) {
                                throw new XMPException("Missing ']' or '=' for array index", 102);
                            } else if (path.charAt(i6) != ']') {
                                int i7 = i6 + 1;
                                char charAt = path.charAt(i7);
                                if (charAt == '\'' || charAt == '\"') {
                                    int i8 = i7 + 1;
                                    while (i8 < path.length()) {
                                        if (path.charAt(i8) == charAt) {
                                            int i9 = i8 + 1;
                                            if (i9 >= path.length() || path.charAt(i9) != charAt) {
                                                break;
                                            }
                                            i8 = i9;
                                        }
                                        i8++;
                                    }
                                    if (i8 < path.length()) {
                                        xMPPathSegment = new XMPPathSegment(null, 6);
                                        int i10 = i6;
                                        i2 = i8 + 1;
                                        i4 = i10;
                                        if (i2 < path.length() || path.charAt(i2) != ']') {
                                            throw new XMPException("Missing ']' for array index", 102);
                                        }
                                        int i11 = i2 + 1;
                                        xMPPathSegment.name = path.substring(i3, i11);
                                        i3 = i11;
                                    } else {
                                        throw new XMPException("No terminating quote for array selector", 102);
                                    }
                                } else {
                                    throw new XMPException("Invalid quote in array selector", 102);
                                }
                            } else if ("[last()".equals(path.substring(i3, i6))) {
                                i = i6;
                                xMPPathSegment2 = new XMPPathSegment(null, 4);
                            } else {
                                throw new XMPException("Invalid non-numeric array index", 102);
                            }
                        } else {
                            while (i < path.length() && '0' <= path.charAt(i) && path.charAt(i) <= '9') {
                                i++;
                            }
                            xMPPathSegment2 = new XMPPathSegment(null, 3);
                        }
                        int i12 = i5;
                        xMPPathSegment = xMPPathSegment2;
                        i2 = i;
                        i = i12;
                        if (i2 < path.length()) {
                        }
                        throw new XMPException("Missing ']' for array index", 102);
                    }
                    int i13 = xMPPathSegment.kind;
                    if (i13 == 1) {
                        if (xMPPathSegment.name.charAt(0) == '@') {
                            String valueOf = String.valueOf(xMPPathSegment.name.substring(1));
                            if (valueOf.length() != 0) {
                                str2 = "?".concat(valueOf);
                            } else {
                                str2 = new String("?");
                            }
                            xMPPathSegment.name = str2;
                            if (!"?xml:lang".equals(str2)) {
                                throw new XMPException("Only xml:lang allowed with '@'", 102);
                            }
                        }
                        if (xMPPathSegment.name.charAt(0) == '?') {
                            i++;
                            xMPPathSegment.kind = 2;
                        }
                        verifyQualName(path.substring(i, i4));
                        z = false;
                    } else {
                        z = false;
                        if (i13 == 6) {
                            if (xMPPathSegment.name.charAt(1) == '@') {
                                String valueOf2 = String.valueOf(xMPPathSegment.name.substring(2));
                                if (valueOf2.length() != 0) {
                                    str = "[?".concat(valueOf2);
                                } else {
                                    str = new String("[?");
                                }
                                xMPPathSegment.name = str;
                                if (!str.startsWith("[?xml:lang=")) {
                                    throw new XMPException("Only xml:lang allowed with '@'", 102);
                                }
                            }
                            if (xMPPathSegment.name.charAt(1) == '?') {
                                i++;
                                c = 5;
                                xMPPathSegment.kind = 5;
                                verifyQualName(path.substring(i, i4));
                                xMPPath.add(xMPPathSegment);
                                i5 = i;
                            }
                        }
                    }
                    c = 5;
                    xMPPath.add(xMPPathSegment);
                    i5 = i;
                } else {
                    throw new XMPException("Missing '[' after '*'", 102);
                }
            }
            return xMPPath;
        }
        throw new XMPException("Empty initial XMPPath step", 102);
    }

    public static void verifyQualName(String qualName) throws XMPException {
        String str;
        int indexOf = qualName.indexOf(58);
        if (indexOf > 0) {
            String substring = qualName.substring(0, indexOf);
            if (Utils.isXMLNameNS(substring)) {
                XMPSchemaRegistryImpl xMPSchemaRegistryImpl = XMPMetaFactory.schema;
                synchronized (xMPSchemaRegistryImpl) {
                    if (!substring.endsWith(":")) {
                        substring = substring.concat(":");
                    }
                    str = (String) xMPSchemaRegistryImpl.prefixToNamespaceMap.get(substring);
                }
                if (str == null) {
                    throw new XMPException("Unknown namespace prefix for qualified name", 102);
                }
                return;
            }
        }
        throw new XMPException("Ill-formed qualified name", 102);
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x001c, code lost:
        if (r0 == false) goto L23;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void verifySimpleXMLName(java.lang.String r6) throws com.adobe.xmp.XMPException {
        /*
            boolean[] r0 = com.adobe.xmp.impl.Utils.xmlNameStartChars
            int r0 = r6.length()
            r1 = 255(0xff, float:3.57E-43)
            r2 = 0
            r3 = 1
            if (r0 <= 0) goto L1f
            char r0 = r6.charAt(r2)
            if (r0 > r1) goto L1b
            boolean[] r4 = com.adobe.xmp.impl.Utils.xmlNameStartChars
            boolean r0 = r4[r0]
            if (r0 == 0) goto L19
            goto L1b
        L19:
            r0 = r2
            goto L1c
        L1b:
            r0 = r3
        L1c:
            if (r0 != 0) goto L1f
            goto L3d
        L1f:
            r0 = r3
        L20:
            int r4 = r6.length()
            if (r0 >= r4) goto L3c
            char r4 = r6.charAt(r0)
            if (r4 > r1) goto L35
            boolean[] r5 = com.adobe.xmp.impl.Utils.xmlNameChars
            boolean r4 = r5[r4]
            if (r4 == 0) goto L33
            goto L35
        L33:
            r4 = r2
            goto L36
        L35:
            r4 = r3
        L36:
            if (r4 != 0) goto L39
            goto L3d
        L39:
            int r0 = r0 + 1
            goto L20
        L3c:
            r2 = r3
        L3d:
            if (r2 == 0) goto L40
            return
        L40:
            com.adobe.xmp.XMPException r6 = new com.adobe.xmp.XMPException
            r0 = 102(0x66, float:1.43E-43)
            java.lang.String r1 = "Bad XML name"
            r6.<init>(r1, r0)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.xpath.XMPPathParser.verifySimpleXMLName(java.lang.String):void");
    }

    public static String verifyXPathRoot(String schemaNS, String rootProp) throws XMPException {
        if (schemaNS == null || schemaNS.length() == 0) {
            throw new XMPException("Schema namespace URI is required", 101);
        } else if (rootProp.charAt(0) == '?' || rootProp.charAt(0) == '@') {
            throw new XMPException("Top level name must not be a qualifier", 102);
        } else if (rootProp.indexOf(47) >= 0 || rootProp.indexOf(91) >= 0) {
            throw new XMPException("Top level name must be simple", 102);
        } else {
            String namespacePrefix = XMPMetaFactory.schema.getNamespacePrefix(schemaNS);
            if (namespacePrefix != null) {
                int indexOf = rootProp.indexOf(58);
                if (indexOf < 0) {
                    verifySimpleXMLName(rootProp);
                    if (rootProp.length() != 0) {
                        return namespacePrefix.concat(rootProp);
                    }
                    return new String(namespacePrefix);
                }
                verifySimpleXMLName(rootProp.substring(0, indexOf));
                verifySimpleXMLName(rootProp.substring(indexOf));
                String substring = rootProp.substring(0, indexOf + 1);
                String namespacePrefix2 = XMPMetaFactory.schema.getNamespacePrefix(schemaNS);
                if (namespacePrefix2 == null) {
                    throw new XMPException("Unknown schema namespace prefix", 101);
                } else if (substring.equals(namespacePrefix2)) {
                    return rootProp;
                } else {
                    throw new XMPException("Schema namespace URI and prefix mismatch", 101);
                }
            } else {
                throw new XMPException("Unregistered schema namespace URI", 101);
            }
        }
    }
}
