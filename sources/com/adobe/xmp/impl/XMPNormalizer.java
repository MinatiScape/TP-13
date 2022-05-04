package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.options.PropertyOptions;
import com.android.systemui.shared.system.QuickStepContract;
import java.util.HashMap;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class XMPNormalizer {
    public static HashMap dcArrayForms = new HashMap();

    static {
        PropertyOptions propertyOptions = new PropertyOptions();
        propertyOptions.setOption(QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED, true);
        dcArrayForms.put("dc:contributor", propertyOptions);
        dcArrayForms.put("dc:language", propertyOptions);
        dcArrayForms.put("dc:publisher", propertyOptions);
        dcArrayForms.put("dc:relation", propertyOptions);
        dcArrayForms.put("dc:subject", propertyOptions);
        dcArrayForms.put("dc:type", propertyOptions);
        PropertyOptions propertyOptions2 = new PropertyOptions();
        propertyOptions2.setOption(QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED, true);
        propertyOptions2.setOption(QuickStepContract.SYSUI_STATE_SEARCH_DISABLED, true);
        dcArrayForms.put("dc:creator", propertyOptions2);
        dcArrayForms.put("dc:date", propertyOptions2);
        PropertyOptions propertyOptions3 = new PropertyOptions();
        propertyOptions3.setOption(QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED, true);
        propertyOptions3.setOption(QuickStepContract.SYSUI_STATE_SEARCH_DISABLED, true);
        propertyOptions3.setOption(QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED, true);
        propertyOptions3.setOption(QuickStepContract.SYSUI_STATE_TRACING_ENABLED, true);
        dcArrayForms.put("dc:description", propertyOptions3);
        dcArrayForms.put("dc:rights", propertyOptions3);
        dcArrayForms.put("dc:title", propertyOptions3);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0047, code lost:
        if (r6 == r3) goto L23;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void compareAliasedSubtrees(com.adobe.xmp.impl.XMPNode r4, com.adobe.xmp.impl.XMPNode r5, boolean r6) throws com.adobe.xmp.XMPException {
        /*
            java.lang.String r0 = r4.value
            java.lang.String r1 = r5.value
            boolean r0 = r0.equals(r1)
            r1 = 203(0xcb, float:2.84E-43)
            java.lang.String r2 = "Mismatch between alias and base nodes"
            if (r0 == 0) goto L99
            int r0 = r4.getChildrenLength()
            int r3 = r5.getChildrenLength()
            if (r0 != r3) goto L99
            r0 = 0
            if (r6 != 0) goto L50
            java.lang.String r6 = r4.name
            java.lang.String r3 = r5.name
            boolean r6 = r6.equals(r3)
            if (r6 == 0) goto L4a
            com.adobe.xmp.options.PropertyOptions r6 = r4.getOptions()
            com.adobe.xmp.options.PropertyOptions r3 = r5.getOptions()
            boolean r6 = r6.equals(r3)
            if (r6 == 0) goto L4a
            java.util.ArrayList r6 = r4.qualifier
            if (r6 == 0) goto L3c
            int r6 = r6.size()
            goto L3d
        L3c:
            r6 = r0
        L3d:
            java.util.ArrayList r3 = r5.qualifier
            if (r3 == 0) goto L46
            int r3 = r3.size()
            goto L47
        L46:
            r3 = r0
        L47:
            if (r6 != r3) goto L4a
            goto L50
        L4a:
            com.adobe.xmp.XMPException r4 = new com.adobe.xmp.XMPException
            r4.<init>(r2, r1)
            throw r4
        L50:
            java.util.Iterator r6 = r4.iterateChildren()
            java.util.Iterator r1 = r5.iterateChildren()
        L58:
            boolean r2 = r6.hasNext()
            if (r2 == 0) goto L74
            boolean r2 = r1.hasNext()
            if (r2 == 0) goto L74
            java.lang.Object r2 = r6.next()
            com.adobe.xmp.impl.XMPNode r2 = (com.adobe.xmp.impl.XMPNode) r2
            java.lang.Object r3 = r1.next()
            com.adobe.xmp.impl.XMPNode r3 = (com.adobe.xmp.impl.XMPNode) r3
            compareAliasedSubtrees(r2, r3, r0)
            goto L58
        L74:
            java.util.Iterator r4 = r4.iterateQualifier()
            java.util.Iterator r5 = r5.iterateQualifier()
        L7c:
            boolean r6 = r4.hasNext()
            if (r6 == 0) goto L98
            boolean r6 = r5.hasNext()
            if (r6 == 0) goto L98
            java.lang.Object r6 = r4.next()
            com.adobe.xmp.impl.XMPNode r6 = (com.adobe.xmp.impl.XMPNode) r6
            java.lang.Object r1 = r5.next()
            com.adobe.xmp.impl.XMPNode r1 = (com.adobe.xmp.impl.XMPNode) r1
            compareAliasedSubtrees(r6, r1, r0)
            goto L7c
        L98:
            return
        L99:
            com.adobe.xmp.XMPException r4 = new com.adobe.xmp.XMPException
            r4.<init>(r2, r1)
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.XMPNormalizer.compareAliasedSubtrees(com.adobe.xmp.impl.XMPNode, com.adobe.xmp.impl.XMPNode, boolean):void");
    }

    public static void repairAltText(XMPNode arrayNode) throws XMPException {
        if (arrayNode.getOptions().isArray()) {
            PropertyOptions options = arrayNode.getOptions();
            options.setOption(QuickStepContract.SYSUI_STATE_SEARCH_DISABLED, true);
            options.setOption(QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED, true);
            options.setOption(QuickStepContract.SYSUI_STATE_TRACING_ENABLED, true);
            Iterator iterateChildren = arrayNode.iterateChildren();
            while (iterateChildren.hasNext()) {
                XMPNode xMPNode = (XMPNode) iterateChildren.next();
                if (xMPNode.getOptions().isCompositeProperty()) {
                    iterateChildren.remove();
                } else if (!xMPNode.getOptions().getHasLanguage()) {
                    String str = xMPNode.value;
                    if (str == null || str.length() == 0) {
                        iterateChildren.remove();
                    } else {
                        xMPNode.addQualifier(new XMPNode("xml:lang", "x-repair", null));
                    }
                }
            }
        }
    }

    public static void transplantArrayItemAlias(Iterator propertyIt, XMPNode childNode, XMPNode baseArray) throws XMPException {
        if (baseArray.getOptions().isArrayAltText()) {
            if (!childNode.getOptions().getHasLanguage()) {
                childNode.addQualifier(new XMPNode("xml:lang", "x-default", null));
            } else {
                throw new XMPException("Alias to x-default already has a language qualifier", 203);
            }
        }
        propertyIt.remove();
        childNode.name = "[]";
        baseArray.addChild(childNode);
    }
}
