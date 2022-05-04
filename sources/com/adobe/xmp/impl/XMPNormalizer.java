package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.options.PropertyOptions;
import com.android.systemui.shared.system.QuickStepContract;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
/* loaded from: classes.dex */
public class XMPNormalizer {
    public static Map dcArrayForms = new HashMap();

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

    public static void compareAliasedSubtrees(XMPNode aliasNode, XMPNode baseNode, boolean outerCall) throws XMPException {
        if (!aliasNode.value.equals(baseNode.value) || aliasNode.getChildrenLength() != baseNode.getChildrenLength()) {
            throw new XMPException("Mismatch between alias and base nodes", 203);
        } else if (outerCall || (aliasNode.name.equals(baseNode.name) && aliasNode.getOptions().equals(baseNode.getOptions()) && aliasNode.getQualifierLength() == baseNode.getQualifierLength())) {
            Iterator iterateChildren = aliasNode.iterateChildren();
            Iterator iterateChildren2 = baseNode.iterateChildren();
            while (iterateChildren.hasNext() && iterateChildren2.hasNext()) {
                compareAliasedSubtrees((XMPNode) iterateChildren.next(), (XMPNode) iterateChildren2.next(), false);
            }
            Iterator iterateQualifier = aliasNode.iterateQualifier();
            Iterator iterateQualifier2 = baseNode.iterateQualifier();
            while (iterateQualifier.hasNext() && iterateQualifier2.hasNext()) {
                compareAliasedSubtrees((XMPNode) iterateQualifier.next(), (XMPNode) iterateQualifier2.next(), false);
            }
        } else {
            throw new XMPException("Mismatch between alias and base nodes", 203);
        }
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
