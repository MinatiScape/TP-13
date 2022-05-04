package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
/* loaded from: classes.dex */
public final class ParameterAsserts {
    public static void assertNotNull(Object param) throws XMPException {
        if (param == null) {
            throw new XMPException("Parameter must not be null", 4);
        } else if ((param instanceof String) && ((String) param).length() == 0) {
            throw new XMPException("Parameter must not be null or empty", 4);
        }
    }

    public static void assertPropName(String propName) throws XMPException {
        if (propName == null || propName.length() == 0) {
            throw new XMPException("Empty property name", 4);
        }
    }

    public static void assertSchemaNS(String schemaNS) throws XMPException {
        if (schemaNS == null || schemaNS.length() == 0) {
            throw new XMPException("Empty schema namespace URI", 4);
        }
    }
}
