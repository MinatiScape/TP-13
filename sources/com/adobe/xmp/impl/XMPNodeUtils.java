package com.adobe.xmp.impl;

import androidx.recyclerview.widget.RecyclerView;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMetaFactory;
import com.adobe.xmp.impl.xpath.XMPPath;
import com.adobe.xmp.impl.xpath.XMPPathSegment;
import com.adobe.xmp.options.PropertyOptions;
import com.android.systemui.shared.system.QuickStepContract;
import java.util.Iterator;
/* loaded from: classes.dex */
public class XMPNodeUtils {
    public static void appendLangItem(XMPNode arrayNode, String itemLang, String itemValue) throws XMPException {
        XMPNode xMPNode = new XMPNode("[]", itemValue, null);
        XMPNode xMPNode2 = new XMPNode("xml:lang", itemLang, null);
        xMPNode.addQualifier(xMPNode2);
        if (!"x-default".equals(xMPNode2.value)) {
            arrayNode.addChild(xMPNode);
        } else {
            arrayNode.addChild(1, xMPNode);
        }
    }

    public static void deleteNode(XMPNode node) {
        XMPNode xMPNode = node.parent;
        if (node.getOptions().getOption(32)) {
            xMPNode.removeQualifier(node);
        } else {
            xMPNode.removeChild(node);
        }
        if (!xMPNode.hasChildren() && xMPNode.getOptions().isSchemaNode()) {
            xMPNode.parent.removeChild(xMPNode);
        }
    }

    public static XMPNode findChildNode(XMPNode parent, String childName, boolean createNodes) throws XMPException {
        if (!parent.getOptions().isSchemaNode() && !parent.getOptions().isStruct()) {
            if (!parent.implicit) {
                throw new XMPException("Named children only allowed for schemas and structs", 102);
            } else if (parent.getOptions().isArray()) {
                throw new XMPException("Named children not allowed for arrays", 102);
            } else if (createNodes) {
                parent.getOptions().setOption(256, true);
            }
        }
        XMPNode find = parent.find(parent.getChildren(), childName);
        if (find != null || !createNodes) {
            return find;
        }
        XMPNode xMPNode = new XMPNode(childName, null, new PropertyOptions());
        xMPNode.implicit = true;
        parent.addChild(xMPNode);
        return xMPNode;
    }

    public static XMPNode findNode(XMPNode xmpTree, XMPPath xpath, boolean createNodes, PropertyOptions leafOptions) throws XMPException {
        XMPNode xMPNode;
        if (xpath.size() != 0) {
            XMPNode findSchemaNode = findSchemaNode(xmpTree, xpath.getSegment(0).name, null, createNodes);
            if (findSchemaNode == null) {
                return null;
            }
            if (findSchemaNode.implicit) {
                findSchemaNode.implicit = false;
                xMPNode = findSchemaNode;
            } else {
                xMPNode = null;
            }
            for (int i = 1; i < xpath.size(); i++) {
                try {
                    findSchemaNode = followXPathStep(findSchemaNode, xpath.getSegment(i), createNodes);
                    if (findSchemaNode == null) {
                        if (createNodes) {
                            deleteNode(xMPNode);
                        }
                        return null;
                    }
                    if (findSchemaNode.implicit) {
                        findSchemaNode.implicit = false;
                        if (i == 1 && xpath.getSegment(i).alias && xpath.getSegment(i).aliasForm != 0) {
                            findSchemaNode.getOptions().setOption(xpath.getSegment(i).aliasForm, true);
                        } else if (i < xpath.size() - 1 && xpath.getSegment(i).kind == 1 && !findSchemaNode.getOptions().isCompositeProperty()) {
                            findSchemaNode.getOptions().setOption(256, true);
                        }
                        if (xMPNode == null) {
                            xMPNode = findSchemaNode;
                        }
                    }
                } catch (XMPException e) {
                    if (xMPNode != null) {
                        deleteNode(xMPNode);
                    }
                    throw e;
                }
            }
            if (xMPNode != null) {
                findSchemaNode.getOptions().mergeWith(leafOptions);
                findSchemaNode.options = findSchemaNode.getOptions();
            }
            return findSchemaNode;
        }
        throw new XMPException("Empty XMPPath", 102);
    }

    public static XMPNode findSchemaNode(XMPNode tree, String namespaceURI, boolean createNodes) throws XMPException {
        return findSchemaNode(tree, namespaceURI, null, createNodes);
    }

    public static XMPNode followXPathStep(XMPNode parentNode, XMPPathSegment nextStep, boolean createNodes) throws XMPException {
        int i;
        int i2 = nextStep.kind;
        if (i2 == 1) {
            return findChildNode(parentNode, nextStep.name, createNodes);
        }
        if (i2 == 2) {
            String substring = nextStep.name.substring(1);
            XMPNode find = parentNode.find(parentNode.qualifier, substring);
            if (find != null || !createNodes) {
                return find;
            }
            XMPNode xMPNode = new XMPNode(substring, null, null);
            xMPNode.implicit = true;
            parentNode.addQualifier(xMPNode);
            return xMPNode;
        } else if (parentNode.getOptions().isArray()) {
            if (i2 == 3) {
                String str = nextStep.name;
                try {
                    i = Integer.parseInt(str.substring(1, str.length() - 1));
                    if (i < 1) {
                        throw new XMPException("Array index must be larger than zero", 102);
                    } else if (createNodes && i == parentNode.getChildrenLength() + 1) {
                        XMPNode xMPNode2 = new XMPNode("[]", null, null);
                        xMPNode2.implicit = true;
                        parentNode.addChild(xMPNode2);
                    }
                } catch (NumberFormatException unused) {
                    throw new XMPException("Array index not digits.", 102);
                }
            } else if (i2 == 4) {
                i = parentNode.getChildrenLength();
            } else {
                int i3 = -1;
                if (i2 == 6) {
                    String[] splitNameAndValue = Utils.splitNameAndValue(nextStep.name);
                    String str2 = splitNameAndValue[0];
                    String str3 = splitNameAndValue[1];
                    for (int i4 = 1; i4 <= parentNode.getChildrenLength() && i3 < 0; i4++) {
                        XMPNode child = parentNode.getChild(i4);
                        if (child.getOptions().isStruct()) {
                            int i5 = 1;
                            while (true) {
                                if (i5 <= child.getChildrenLength()) {
                                    XMPNode child2 = child.getChild(i5);
                                    if (str2.equals(child2.name) && str3.equals(child2.value)) {
                                        i3 = i4;
                                        break;
                                    }
                                    i5++;
                                }
                            }
                        } else {
                            throw new XMPException("Field selector must be used on array of struct", 102);
                        }
                    }
                } else if (i2 == 5) {
                    String[] splitNameAndValue2 = Utils.splitNameAndValue(nextStep.name);
                    String str4 = splitNameAndValue2[0];
                    String str5 = splitNameAndValue2[1];
                    int i6 = nextStep.aliasForm;
                    if ("xml:lang".equals(str4)) {
                        int lookupLanguageItem = lookupLanguageItem(parentNode, Utils.normalizeLangValue(str5));
                        if (lookupLanguageItem >= 0 || (i6 & QuickStepContract.SYSUI_STATE_TRACING_ENABLED) <= 0) {
                            i = lookupLanguageItem;
                        } else {
                            XMPNode xMPNode3 = new XMPNode("[]", null, null);
                            xMPNode3.addQualifier(new XMPNode("xml:lang", "x-default", null));
                            parentNode.addChild(1, xMPNode3);
                            i = 1;
                        }
                    } else {
                        i = 1;
                        loop2: while (i < parentNode.getChildrenLength()) {
                            Iterator iterateQualifier = parentNode.getChild(i).iterateQualifier();
                            while (iterateQualifier.hasNext()) {
                                XMPNode xMPNode4 = (XMPNode) iterateQualifier.next();
                                if (str4.equals(xMPNode4.name) && str5.equals(xMPNode4.value)) {
                                    break loop2;
                                }
                            }
                            i++;
                        }
                    }
                } else {
                    throw new XMPException("Unknown array indexing step in FollowXPathStep", 9);
                }
                i = i3;
            }
            if (1 > i || i > parentNode.getChildrenLength()) {
                return null;
            }
            return parentNode.getChild(i);
        } else {
            throw new XMPException("Indexing applied to non-array", 102);
        }
    }

    public static int lookupLanguageItem(XMPNode arrayNode, String language) throws XMPException {
        if (arrayNode.getOptions().isArray()) {
            for (int i = 1; i <= arrayNode.getChildrenLength(); i++) {
                XMPNode child = arrayNode.getChild(i);
                if (child.hasQualifier() && "xml:lang".equals(child.getQualifier(1).name) && language.equals(child.getQualifier(1).value)) {
                    return i;
                }
            }
            return -1;
        }
        throw new XMPException("Language item must be used on array", 102);
    }

    public static PropertyOptions verifySetOptions(PropertyOptions options, Object itemValue) throws XMPException {
        if (options.isArrayAltText()) {
            options.setOption(QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED, true);
        }
        if (options.isArrayAlternate()) {
            options.setOption(QuickStepContract.SYSUI_STATE_SEARCH_DISABLED, true);
        }
        if (options.getOption(QuickStepContract.SYSUI_STATE_SEARCH_DISABLED)) {
            options.setOption(QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED, true);
        }
        options.isCompositeProperty();
        options.assertConsistency(options.options);
        return options;
    }

    public static XMPNode findSchemaNode(XMPNode tree, String namespaceURI, String suggestedPrefix, boolean createNodes) throws XMPException {
        XMPNode find = tree.find(tree.getChildren(), namespaceURI);
        if (find == null && createNodes) {
            PropertyOptions propertyOptions = new PropertyOptions();
            propertyOptions.setOption(RecyclerView.UNDEFINED_DURATION, true);
            find = new XMPNode(namespaceURI, null, propertyOptions);
            find.implicit = true;
            String namespacePrefix = ((XMPSchemaRegistryImpl) XMPMetaFactory.schema).getNamespacePrefix(namespaceURI);
            if (namespacePrefix == null) {
                if (suggestedPrefix == null || suggestedPrefix.length() == 0) {
                    throw new XMPException("Unregistered schema namespace URI", 101);
                }
                namespacePrefix = ((XMPSchemaRegistryImpl) XMPMetaFactory.schema).registerNamespace(namespaceURI, suggestedPrefix);
            }
            find.value = namespacePrefix;
            tree.addChild(find);
        }
        return find;
    }
}
