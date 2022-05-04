package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMetaFactory;
import com.adobe.xmp.options.PropertyOptions;
import com.adobe.xmp.properties.XMPAliasInfo;
import java.util.ArrayList;
import java.util.Iterator;
import org.w3c.dom.Attr;
import org.w3c.dom.Node;
/* loaded from: classes.dex */
public final class ParseRDF {
    public static void fixupQualifiedNode(XMPNode xmpParent) throws XMPException {
        int i;
        int i2 = 1;
        XMPNode child = xmpParent.getChild(1);
        if (child.getOptions().getHasLanguage()) {
            if (!xmpParent.getOptions().getHasLanguage()) {
                XMPNode qualifier = child.getQualifier(1);
                child.removeQualifier(qualifier);
                xmpParent.addQualifier(qualifier);
            } else {
                throw new XMPException("Redundant xml:lang for rdf:value element", 203);
            }
        }
        while (true) {
            ArrayList arrayList = child.qualifier;
            if (arrayList != null) {
                i = arrayList.size();
            } else {
                i = 0;
            }
            if (i2 > i) {
                break;
            }
            xmpParent.addQualifier(child.getQualifier(i2));
            i2++;
        }
        for (int i3 = 2; i3 <= xmpParent.getChildrenLength(); i3++) {
            xmpParent.addQualifier(xmpParent.getChild(i3));
        }
        xmpParent.hasValueChild = false;
        xmpParent.getOptions().setStruct(false);
        PropertyOptions options = xmpParent.getOptions();
        PropertyOptions options2 = child.getOptions();
        if (options2 != null) {
            int i4 = options2.options | options.options;
            options.assertOptionsValid(i4);
            options.options = i4;
        } else {
            options.getClass();
        }
        xmpParent.value = child.value;
        xmpParent.children = null;
        Iterator iterateChildren = child.iterateChildren();
        while (iterateChildren.hasNext()) {
            xmpParent.addChild((XMPNode) iterateChildren.next());
        }
    }

    public static void rdf_LiteralPropertyElement(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlNode, boolean isTopLevel) throws XMPException {
        XMPNode addChildNode = addChildNode(xmp, xmpParent, xmlNode, null, isTopLevel);
        for (int i = 0; i < xmlNode.getAttributes().getLength(); i++) {
            Node item = xmlNode.getAttributes().item(i);
            if (!"xmlns".equals(item.getPrefix()) && (item.getPrefix() != null || !"xmlns".equals(item.getNodeName()))) {
                String namespaceURI = item.getNamespaceURI();
                String localName = item.getLocalName();
                if ("xml:lang".equals(item.getNodeName())) {
                    addQualifierNode(addChildNode, "xml:lang", item.getNodeValue());
                } else if (!"http://www.w3.org/1999/02/22-rdf-syntax-ns#".equals(namespaceURI) || (!"ID".equals(localName) && !"datatype".equals(localName))) {
                    throw new XMPException("Invalid attribute for literal property element", 202);
                }
            }
        }
        String str = "";
        for (int i2 = 0; i2 < xmlNode.getChildNodes().getLength(); i2++) {
            Node item2 = xmlNode.getChildNodes().item(i2);
            if (item2.getNodeType() == 3) {
                String valueOf = String.valueOf(str);
                String valueOf2 = String.valueOf(item2.getNodeValue());
                if (valueOf2.length() != 0) {
                    str = valueOf.concat(valueOf2);
                } else {
                    str = new String(valueOf);
                }
            } else {
                throw new XMPException("Invalid child of literal property element", 202);
            }
        }
        addChildNode.value = str;
    }

    public static XMPNode addChildNode(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlNode, String value, boolean isTopLevel) throws XMPException {
        String str;
        XMPAliasInfo xMPAliasInfo;
        String str2;
        XMPSchemaRegistryImpl xMPSchemaRegistryImpl = XMPMetaFactory.schema;
        String namespaceURI = xmlNode.getNamespaceURI();
        if (namespaceURI != null) {
            if ("http://purl.org/dc/1.1/".equals(namespaceURI)) {
                namespaceURI = "http://purl.org/dc/elements/1.1/";
            }
            String namespacePrefix = xMPSchemaRegistryImpl.getNamespacePrefix(namespaceURI);
            if (namespacePrefix == null) {
                if (xmlNode.getPrefix() != null) {
                    str2 = xmlNode.getPrefix();
                } else {
                    str2 = "_dflt";
                }
                namespacePrefix = xMPSchemaRegistryImpl.registerNamespace(namespaceURI, str2);
            }
            String valueOf = String.valueOf(namespacePrefix);
            String valueOf2 = String.valueOf(xmlNode.getLocalName());
            if (valueOf2.length() != 0) {
                str = valueOf.concat(valueOf2);
            } else {
                str = new String(valueOf);
            }
            PropertyOptions propertyOptions = new PropertyOptions();
            boolean z = false;
            if (isTopLevel) {
                xmpParent = XMPNodeUtils.findSchemaNode(xmp.tree, namespaceURI, "_dflt", true);
                xmpParent.implicit = false;
                synchronized (xMPSchemaRegistryImpl) {
                    xMPAliasInfo = (XMPAliasInfo) xMPSchemaRegistryImpl.aliasMap.get(str);
                }
                if (xMPAliasInfo != null) {
                    xmp.tree.hasAliases = true;
                    xmpParent.hasAliases = true;
                    z = true;
                }
            }
            boolean equals = "rdf:li".equals(str);
            boolean equals2 = "rdf:value".equals(str);
            XMPNode xMPNode = new XMPNode(str, value, propertyOptions);
            xMPNode.alias = z;
            if (!equals2) {
                xmpParent.addChild(xMPNode);
            } else {
                xmpParent.addChild$1(xMPNode);
            }
            if (equals2) {
                if (isTopLevel || !xmpParent.getOptions().getOption(256)) {
                    throw new XMPException("Misplaced rdf:value element", 202);
                }
                xmpParent.hasValueChild = true;
            }
            if (equals) {
                if (xmpParent.getOptions().isArray()) {
                    xMPNode.name = "[]";
                } else {
                    throw new XMPException("Misplaced rdf:li element", 202);
                }
            }
            return xMPNode;
        }
        throw new XMPException("XML namespace required for all elements and attributes", 202);
    }

    public static void addQualifierNode(XMPNode xmpParent, String name, String value) throws XMPException {
        if ("xml:lang".equals(name)) {
            value = Utils.normalizeLangValue(value);
        }
        xmpParent.addQualifier(new XMPNode(name, value, null));
    }

    /* JADX WARN: Removed duplicated region for block: B:61:0x00ee  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void rdf_EmptyPropertyElement(com.adobe.xmp.impl.XMPMetaImpl r16, com.adobe.xmp.impl.XMPNode r17, org.w3c.dom.Node r18, boolean r19) throws com.adobe.xmp.XMPException {
        /*
            Method dump skipped, instructions count: 362
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.ParseRDF.rdf_EmptyPropertyElement(com.adobe.xmp.impl.XMPMetaImpl, com.adobe.xmp.impl.XMPNode, org.w3c.dom.Node, boolean):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:226:0x03ee A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void rdf_PropertyElementList(com.adobe.xmp.impl.XMPMetaImpl r16, com.adobe.xmp.impl.XMPNode r17, org.w3c.dom.Node r18, boolean r19) throws com.adobe.xmp.XMPException {
        /*
            Method dump skipped, instructions count: 1027
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.ParseRDF.rdf_PropertyElementList(com.adobe.xmp.impl.XMPMetaImpl, com.adobe.xmp.impl.XMPNode, org.w3c.dom.Node, boolean):void");
    }

    public static int getRDFTermKind(Node node) {
        String localName = node.getLocalName();
        String namespaceURI = node.getNamespaceURI();
        if (namespaceURI == null && (("about".equals(localName) || "ID".equals(localName)) && (node instanceof Attr) && "http://www.w3.org/1999/02/22-rdf-syntax-ns#".equals(((Attr) node).getOwnerElement().getNamespaceURI()))) {
            namespaceURI = "http://www.w3.org/1999/02/22-rdf-syntax-ns#";
        }
        if (!"http://www.w3.org/1999/02/22-rdf-syntax-ns#".equals(namespaceURI)) {
            return 0;
        }
        if ("li".equals(localName)) {
            return 9;
        }
        if ("parseType".equals(localName)) {
            return 4;
        }
        if ("Description".equals(localName)) {
            return 8;
        }
        if ("about".equals(localName)) {
            return 3;
        }
        if ("resource".equals(localName)) {
            return 5;
        }
        if ("RDF".equals(localName)) {
            return 1;
        }
        if ("ID".equals(localName)) {
            return 2;
        }
        if ("nodeID".equals(localName)) {
            return 6;
        }
        if ("datatype".equals(localName)) {
            return 7;
        }
        if ("aboutEach".equals(localName)) {
            return 10;
        }
        if ("aboutEachPrefix".equals(localName)) {
            return 11;
        }
        if ("bagID".equals(localName)) {
            return 12;
        }
        return 0;
    }

    public static boolean isWhitespaceNode(Node node) {
        if (node.getNodeType() != 3) {
            return false;
        }
        String nodeValue = node.getNodeValue();
        for (int i = 0; i < nodeValue.length(); i++) {
            if (!Character.isWhitespace(nodeValue.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static void rdf_NodeElement(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlNode, boolean isTopLevel) throws XMPException {
        int rDFTermKind = getRDFTermKind(xmlNode);
        if (rDFTermKind != 8 && rDFTermKind != 0) {
            throw new XMPException("Node element must be rdf:Description or typed node", 202);
        } else if (!isTopLevel || rDFTermKind != 0) {
            int i = 0;
            for (int i2 = 0; i2 < xmlNode.getAttributes().getLength(); i2++) {
                Node item = xmlNode.getAttributes().item(i2);
                if (!"xmlns".equals(item.getPrefix()) && (item.getPrefix() != null || !"xmlns".equals(item.getNodeName()))) {
                    int rDFTermKind2 = getRDFTermKind(item);
                    if (rDFTermKind2 == 0) {
                        addChildNode(xmp, xmpParent, item, item.getNodeValue(), isTopLevel);
                    } else if (rDFTermKind2 != 6 && rDFTermKind2 != 2 && rDFTermKind2 != 3) {
                        throw new XMPException("Invalid nodeElement attribute", 202);
                    } else if (i <= 0) {
                        i++;
                        if (isTopLevel && rDFTermKind2 == 3) {
                            String str = xmpParent.name;
                            if (str == null || str.length() <= 0) {
                                xmpParent.name = item.getNodeValue();
                            } else if (!xmpParent.name.equals(item.getNodeValue())) {
                                throw new XMPException("Mismatched top level rdf:about values", 203);
                            }
                        }
                    } else {
                        throw new XMPException("Mutally exclusive about, ID, nodeID attributes", 202);
                    }
                }
            }
            rdf_PropertyElementList(xmp, xmpParent, xmlNode, isTopLevel);
        } else {
            throw new XMPException("Top level typed node not allowed", 203);
        }
    }
}
