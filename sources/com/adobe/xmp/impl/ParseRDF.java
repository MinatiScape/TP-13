package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMetaFactory;
import com.adobe.xmp.XMPSchemaRegistry;
import com.adobe.xmp.options.PropertyOptions;
import java.util.Iterator;
import org.w3c.dom.Attr;
import org.w3c.dom.Node;
/* loaded from: classes.dex */
public class ParseRDF {
    public static XMPNode addChildNode(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlNode, String value, boolean isTopLevel) throws XMPException {
        XMPSchemaRegistry xMPSchemaRegistry = XMPMetaFactory.schema;
        String namespaceURI = xmlNode.getNamespaceURI();
        if (namespaceURI != null) {
            if ("http://purl.org/dc/1.1/".equals(namespaceURI)) {
                namespaceURI = "http://purl.org/dc/elements/1.1/";
            }
            XMPSchemaRegistryImpl xMPSchemaRegistryImpl = (XMPSchemaRegistryImpl) xMPSchemaRegistry;
            String namespacePrefix = xMPSchemaRegistryImpl.getNamespacePrefix(namespaceURI);
            if (namespacePrefix == null) {
                namespacePrefix = xMPSchemaRegistryImpl.registerNamespace(namespaceURI, xmlNode.getPrefix() != null ? xmlNode.getPrefix() : "_dflt");
            }
            String valueOf = String.valueOf(namespacePrefix);
            String valueOf2 = String.valueOf(xmlNode.getLocalName());
            String concat = valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
            PropertyOptions propertyOptions = new PropertyOptions();
            boolean z = false;
            if (isTopLevel) {
                xmpParent = XMPNodeUtils.findSchemaNode(xmp.tree, namespaceURI, "_dflt", true);
                xmpParent.implicit = false;
                if (xMPSchemaRegistryImpl.findAlias(concat) != null) {
                    xmp.tree.hasAliases = true;
                    xmpParent.hasAliases = true;
                    z = true;
                }
            }
            boolean equals = "rdf:li".equals(concat);
            boolean equals2 = "rdf:value".equals(concat);
            XMPNode xMPNode = new XMPNode(concat, value, propertyOptions);
            xMPNode.alias = z;
            if (!equals2) {
                xmpParent.addChild(xMPNode);
            } else {
                xmpParent.addChild(1, xMPNode);
            }
            if (equals2) {
                if (isTopLevel || !xmpParent.getOptions().isStruct()) {
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

    public static XMPNode addQualifierNode(XMPNode xmpParent, String name, String value) throws XMPException {
        if ("xml:lang".equals(name)) {
            value = Utils.normalizeLangValue(value);
        }
        XMPNode xMPNode = new XMPNode(name, value, null);
        xmpParent.addQualifier(xMPNode);
        return xMPNode;
    }

    public static void fixupQualifiedNode(XMPNode xmpParent) throws XMPException {
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
        for (int i = 1; i <= child.getQualifierLength(); i++) {
            xmpParent.addQualifier(child.getQualifier(i));
        }
        for (int i2 = 2; i2 <= xmpParent.getChildrenLength(); i2++) {
            xmpParent.addQualifier(xmpParent.getChild(i2));
        }
        xmpParent.hasValueChild = false;
        xmpParent.getOptions().setOption(256, false);
        xmpParent.getOptions().mergeWith(child.getOptions());
        xmpParent.value = child.value;
        xmpParent.children = null;
        Iterator iterateChildren = child.iterateChildren();
        while (iterateChildren.hasNext()) {
            xmpParent.addChild((XMPNode) iterateChildren.next());
        }
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
        return "bagID".equals(localName) ? 12 : 0;
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

    /* JADX WARN: Removed duplicated region for block: B:61:0x00f0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void rdf_EmptyPropertyElement(com.adobe.xmp.impl.XMPMetaImpl r16, com.adobe.xmp.impl.XMPNode r17, org.w3c.dom.Node r18, boolean r19) throws com.adobe.xmp.XMPException {
        /*
            Method dump skipped, instructions count: 364
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.ParseRDF.rdf_EmptyPropertyElement(com.adobe.xmp.impl.XMPMetaImpl, com.adobe.xmp.impl.XMPNode, org.w3c.dom.Node, boolean):void");
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
                str = valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
            } else {
                throw new XMPException("Invalid child of literal property element", 202);
            }
        }
        addChildNode.value = str;
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

    /* JADX WARN: Removed duplicated region for block: B:227:0x03ef A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void rdf_PropertyElementList(com.adobe.xmp.impl.XMPMetaImpl r16, com.adobe.xmp.impl.XMPNode r17, org.w3c.dom.Node r18, boolean r19) throws com.adobe.xmp.XMPException {
        /*
            Method dump skipped, instructions count: 1028
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.adobe.xmp.impl.ParseRDF.rdf_PropertyElementList(com.adobe.xmp.impl.XMPMetaImpl, com.adobe.xmp.impl.XMPNode, org.w3c.dom.Node, boolean):void");
    }
}
