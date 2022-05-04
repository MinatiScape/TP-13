package com.adobe.xmp.impl;

import androidx.recyclerview.widget.RecyclerView;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.options.PropertyOptions;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public final class XMPNode implements Comparable {
    public boolean alias;
    public ArrayList children;
    public boolean hasAliases;
    public boolean hasValueChild;
    public boolean implicit;
    public String name;
    public PropertyOptions options;
    public XMPNode parent;
    public ArrayList qualifier;
    public String value;

    public XMPNode() {
        throw null;
    }

    public XMPNode(String name, String value, PropertyOptions options) {
        this.children = null;
        this.qualifier = null;
        this.name = name;
        this.value = value;
        this.options = options;
    }

    public final XMPNode getQualifier(int index) {
        return (XMPNode) getQualifier().get(index - 1);
    }

    public static XMPNode find(List list, String expr) {
        if (list == null) {
            return null;
        }
        Iterator it = list.iterator();
        while (it.hasNext()) {
            XMPNode xMPNode = (XMPNode) it.next();
            if (xMPNode.name.equals(expr)) {
                return xMPNode;
            }
        }
        return null;
    }

    public final void addChild(XMPNode node) throws XMPException {
        assertChildNotExisting(node.name);
        node.parent = this;
        getChildren().add(node);
    }

    public final void addChild$1(XMPNode xMPNode) throws XMPException {
        assertChildNotExisting(xMPNode.name);
        xMPNode.parent = this;
        ((ArrayList) getChildren()).add(0, xMPNode);
    }

    public final void addQualifier(XMPNode qualNode) throws XMPException {
        String str = qualNode.name;
        if ("[]".equals(str) || find(this.qualifier, str) == null) {
            qualNode.parent = this;
            qualNode.getOptions().setOption(32, true);
            getOptions().setOption(16, true);
            if ("xml:lang".equals(qualNode.name)) {
                this.options.setOption(64, true);
                ((ArrayList) getQualifier()).add(0, qualNode);
            } else if ("rdf:type".equals(qualNode.name)) {
                this.options.setOption(128, true);
                ((ArrayList) getQualifier()).add(this.options.getHasLanguage() ? 1 : 0, qualNode);
            } else {
                ((ArrayList) getQualifier()).add(qualNode);
            }
        } else {
            throw new XMPException(XMPNode$$ExternalSyntheticOutline0.m(ParseRDF$$ExternalSyntheticOutline0.m(str, 22), "Duplicate '", str, "' qualifier"), 203);
        }
    }

    public final void assertChildNotExisting(String childName) throws XMPException {
        if (!"[]".equals(childName) && find(getChildren(), childName) != null) {
            throw new XMPException(XMPNode$$ExternalSyntheticOutline0.m(ParseRDF$$ExternalSyntheticOutline0.m(childName, 35), "Duplicate property or field node '", childName, "'"), 203);
        }
    }

    public final Object clone() {
        PropertyOptions propertyOptions;
        try {
            propertyOptions = new PropertyOptions(getOptions().options);
        } catch (XMPException unused) {
            propertyOptions = new PropertyOptions();
        }
        XMPNode xMPNode = new XMPNode(this.name, this.value, propertyOptions);
        try {
            Iterator iterateChildren = iterateChildren();
            while (iterateChildren.hasNext()) {
                xMPNode.addChild((XMPNode) ((XMPNode) iterateChildren.next()).clone());
            }
            Iterator iterateQualifier = iterateQualifier();
            while (iterateQualifier.hasNext()) {
                xMPNode.addQualifier((XMPNode) ((XMPNode) iterateQualifier.next()).clone());
            }
        } catch (XMPException unused2) {
        }
        return xMPNode;
    }

    public final List getChildren() {
        if (this.children == null) {
            this.children = new ArrayList(0);
        }
        return this.children;
    }

    public final int getChildrenLength() {
        ArrayList arrayList = this.children;
        if (arrayList != null) {
            return arrayList.size();
        }
        return 0;
    }

    public final PropertyOptions getOptions() {
        if (this.options == null) {
            this.options = new PropertyOptions();
        }
        return this.options;
    }

    public final List getQualifier() {
        if (this.qualifier == null) {
            this.qualifier = new ArrayList(0);
        }
        return this.qualifier;
    }

    public final boolean hasChildren() {
        ArrayList arrayList = this.children;
        if (arrayList == null || arrayList.size() <= 0) {
            return false;
        }
        return true;
    }

    public final boolean hasQualifier() {
        ArrayList arrayList = this.qualifier;
        if (arrayList == null || arrayList.size() <= 0) {
            return false;
        }
        return true;
    }

    public final Iterator iterateChildren() {
        if (this.children != null) {
            return ((ArrayList) getChildren()).iterator();
        }
        return Collections.EMPTY_LIST.listIterator();
    }

    public final Iterator iterateQualifier() {
        if (this.qualifier == null) {
            return Collections.EMPTY_LIST.iterator();
        }
        final Iterator it = ((ArrayList) getQualifier()).iterator();
        return new Iterator() { // from class: com.adobe.xmp.impl.XMPNode.1
            @Override // java.util.Iterator
            public final boolean hasNext() {
                return it.hasNext();
            }

            @Override // java.util.Iterator
            public final Object next() {
                return it.next();
            }

            @Override // java.util.Iterator
            public final void remove() {
                throw new UnsupportedOperationException("remove() is not allowed due to the internal contraints");
            }
        };
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object xmpNode) {
        if (getOptions().getOption(RecyclerView.UNDEFINED_DURATION)) {
            return this.value.compareTo(((XMPNode) xmpNode).value);
        }
        return this.name.compareTo(((XMPNode) xmpNode).name);
    }

    public final XMPNode getChild(int index) {
        return (XMPNode) getChildren().get(index - 1);
    }

    public final void removeQualifier(XMPNode qualNode) {
        PropertyOptions options = getOptions();
        if ("xml:lang".equals(qualNode.name)) {
            options.setOption(64, false);
        } else if ("rdf:type".equals(qualNode.name)) {
            options.setOption(128, false);
        }
        ((ArrayList) getQualifier()).remove(qualNode);
        if (this.qualifier.isEmpty()) {
            options.setOption(16, false);
            this.qualifier = null;
        }
    }
}
