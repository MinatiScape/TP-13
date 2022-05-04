package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.options.AliasOptions;
import com.adobe.xmp.options.PropertyOptions;
import com.adobe.xmp.properties.XMPAliasInfo;
import java.util.HashMap;
import java.util.regex.Pattern;
/* loaded from: classes.dex */
public final class XMPSchemaRegistryImpl {
    public HashMap namespaceToPrefixMap = new HashMap();
    public HashMap prefixToNamespaceMap = new HashMap();
    public HashMap aliasMap = new HashMap();
    public Pattern p = Pattern.compile("[/*?\\[\\]]");

    public final synchronized String getNamespacePrefix(String namespaceURI) {
        return (String) this.namespaceToPrefixMap.get(namespaceURI);
    }

    public final synchronized void registerAlias(String aliasNS, String aliasProp, final String actualNS, final String actualProp, final AliasOptions aliasForm) throws XMPException {
        final AliasOptions aliasOptions;
        String str;
        String str2;
        ParameterAsserts.assertSchemaNS(aliasNS);
        ParameterAsserts.assertPropName(aliasProp);
        ParameterAsserts.assertSchemaNS(actualNS);
        ParameterAsserts.assertPropName(actualProp);
        if (aliasForm != null) {
            PropertyOptions propertyOptions = new PropertyOptions(aliasForm.options);
            XMPNodeUtils.verifySetOptions(propertyOptions);
            aliasOptions = new AliasOptions(propertyOptions.options);
        } else {
            aliasOptions = new AliasOptions();
        }
        if (this.p.matcher(aliasProp).find() || this.p.matcher(actualProp).find()) {
            throw new XMPException("Alias and actual property names must be simple", 102);
        }
        String namespacePrefix = getNamespacePrefix(aliasNS);
        final String namespacePrefix2 = getNamespacePrefix(actualNS);
        if (namespacePrefix == null) {
            throw new XMPException("Alias namespace is not registered", 101);
        } else if (namespacePrefix2 != null) {
            if (aliasProp.length() != 0) {
                str = namespacePrefix.concat(aliasProp);
            } else {
                str = new String(namespacePrefix);
            }
            if (!this.aliasMap.containsKey(str)) {
                HashMap hashMap = this.aliasMap;
                if (actualProp.length() != 0) {
                    str2 = namespacePrefix2.concat(actualProp);
                } else {
                    str2 = new String(namespacePrefix2);
                }
                if (!hashMap.containsKey(str2)) {
                    this.aliasMap.put(str, new XMPAliasInfo() { // from class: com.adobe.xmp.impl.XMPSchemaRegistryImpl.1
                        public final String toString() {
                            String str3 = namespacePrefix2;
                            String str4 = actualProp;
                            String str5 = actualNS;
                            String valueOf = String.valueOf(aliasOptions);
                            StringBuilder sb = new StringBuilder(valueOf.length() + ParseRDF$$ExternalSyntheticOutline0.m(str5, ParseRDF$$ExternalSyntheticOutline0.m(str4, ParseRDF$$ExternalSyntheticOutline0.m(str3, 14))));
                            sb.append(str3);
                            sb.append(str4);
                            sb.append(" NS(");
                            sb.append(str5);
                            sb.append("), FORM (");
                            sb.append(valueOf);
                            sb.append(")");
                            return sb.toString();
                        }

                        @Override // com.adobe.xmp.properties.XMPAliasInfo
                        public final AliasOptions getAliasForm() {
                            return aliasOptions;
                        }

                        @Override // com.adobe.xmp.properties.XMPAliasInfo
                        public final String getNamespace() {
                            return actualNS;
                        }

                        @Override // com.adobe.xmp.properties.XMPAliasInfo
                        public final String getPrefix() {
                            return namespacePrefix2;
                        }

                        @Override // com.adobe.xmp.properties.XMPAliasInfo
                        public final String getPropName() {
                            return actualProp;
                        }
                    });
                } else {
                    throw new XMPException("Actual property is already an alias, use the base property", 4);
                }
            } else {
                throw new XMPException("Alias is already existing", 4);
            }
        } else {
            throw new XMPException("Actual namespace is not registered", 101);
        }
    }

    public final synchronized String registerNamespace(String namespaceURI, String suggestedPrefix) throws XMPException {
        ParameterAsserts.assertSchemaNS(namespaceURI);
        if (suggestedPrefix == null || suggestedPrefix.length() == 0) {
            throw new XMPException("Empty prefix", 4);
        }
        if (suggestedPrefix.charAt(suggestedPrefix.length() - 1) != ':') {
            StringBuilder sb = new StringBuilder(suggestedPrefix.length() + 1);
            sb.append(suggestedPrefix);
            sb.append(':');
            suggestedPrefix = sb.toString();
        }
        if (Utils.isXMLNameNS(suggestedPrefix.substring(0, suggestedPrefix.length() - 1))) {
            String str = (String) this.namespaceToPrefixMap.get(namespaceURI);
            String str2 = (String) this.prefixToNamespaceMap.get(suggestedPrefix);
            if (str != null) {
                return str;
            }
            if (str2 != null) {
                String str3 = suggestedPrefix;
                int i = 1;
                while (this.prefixToNamespaceMap.containsKey(str3)) {
                    String substring = suggestedPrefix.substring(0, suggestedPrefix.length() - 1);
                    StringBuilder sb2 = new StringBuilder(String.valueOf(substring).length() + 14);
                    sb2.append(substring);
                    sb2.append("_");
                    sb2.append(i);
                    sb2.append("_:");
                    str3 = sb2.toString();
                    i++;
                }
                suggestedPrefix = str3;
            }
            this.prefixToNamespaceMap.put(suggestedPrefix, namespaceURI);
            this.namespaceToPrefixMap.put(namespaceURI, suggestedPrefix);
            return suggestedPrefix;
        }
        throw new XMPException("The prefix is a bad XML name", 201);
    }

    public final void registerStandardAliases() throws XMPException {
        AliasOptions aliasOptions = new AliasOptions();
        aliasOptions.setOption(1536, true);
        AliasOptions aliasOptions2 = new AliasOptions();
        aliasOptions2.setOption(7680, true);
        registerAlias("http://ns.adobe.com/xap/1.0/", "Author", "http://purl.org/dc/elements/1.1/", "creator", aliasOptions);
        registerAlias("http://ns.adobe.com/xap/1.0/", "Authors", "http://purl.org/dc/elements/1.1/", "creator", null);
        registerAlias("http://ns.adobe.com/xap/1.0/", "Description", "http://purl.org/dc/elements/1.1/", "description", null);
        registerAlias("http://ns.adobe.com/xap/1.0/", "Format", "http://purl.org/dc/elements/1.1/", "format", null);
        registerAlias("http://ns.adobe.com/xap/1.0/", "Keywords", "http://purl.org/dc/elements/1.1/", "subject", null);
        registerAlias("http://ns.adobe.com/xap/1.0/", "Locale", "http://purl.org/dc/elements/1.1/", "language", null);
        registerAlias("http://ns.adobe.com/xap/1.0/", "Title", "http://purl.org/dc/elements/1.1/", "title", null);
        registerAlias("http://ns.adobe.com/xap/1.0/rights/", "Copyright", "http://purl.org/dc/elements/1.1/", "rights", null);
        registerAlias("http://ns.adobe.com/pdf/1.3/", "Author", "http://purl.org/dc/elements/1.1/", "creator", aliasOptions);
        registerAlias("http://ns.adobe.com/pdf/1.3/", "BaseURL", "http://ns.adobe.com/xap/1.0/", "BaseURL", null);
        registerAlias("http://ns.adobe.com/pdf/1.3/", "CreationDate", "http://ns.adobe.com/xap/1.0/", "CreateDate", null);
        registerAlias("http://ns.adobe.com/pdf/1.3/", "Creator", "http://ns.adobe.com/xap/1.0/", "CreatorTool", null);
        registerAlias("http://ns.adobe.com/pdf/1.3/", "ModDate", "http://ns.adobe.com/xap/1.0/", "ModifyDate", null);
        registerAlias("http://ns.adobe.com/pdf/1.3/", "Subject", "http://purl.org/dc/elements/1.1/", "description", aliasOptions2);
        registerAlias("http://ns.adobe.com/pdf/1.3/", "Title", "http://purl.org/dc/elements/1.1/", "title", aliasOptions2);
        registerAlias("http://ns.adobe.com/photoshop/1.0/", "Author", "http://purl.org/dc/elements/1.1/", "creator", aliasOptions);
        registerAlias("http://ns.adobe.com/photoshop/1.0/", "Caption", "http://purl.org/dc/elements/1.1/", "description", aliasOptions2);
        registerAlias("http://ns.adobe.com/photoshop/1.0/", "Copyright", "http://purl.org/dc/elements/1.1/", "rights", aliasOptions2);
        registerAlias("http://ns.adobe.com/photoshop/1.0/", "Keywords", "http://purl.org/dc/elements/1.1/", "subject", null);
        registerAlias("http://ns.adobe.com/photoshop/1.0/", "Marked", "http://ns.adobe.com/xap/1.0/rights/", "Marked", null);
        registerAlias("http://ns.adobe.com/photoshop/1.0/", "Title", "http://purl.org/dc/elements/1.1/", "title", aliasOptions2);
        registerAlias("http://ns.adobe.com/photoshop/1.0/", "WebStatement", "http://ns.adobe.com/xap/1.0/rights/", "WebStatement", null);
        registerAlias("http://ns.adobe.com/tiff/1.0/", "Artist", "http://purl.org/dc/elements/1.1/", "creator", aliasOptions);
        registerAlias("http://ns.adobe.com/tiff/1.0/", "Copyright", "http://purl.org/dc/elements/1.1/", "rights", null);
        registerAlias("http://ns.adobe.com/tiff/1.0/", "DateTime", "http://ns.adobe.com/xap/1.0/", "ModifyDate", null);
        registerAlias("http://ns.adobe.com/tiff/1.0/", "ImageDescription", "http://purl.org/dc/elements/1.1/", "description", null);
        registerAlias("http://ns.adobe.com/tiff/1.0/", "Software", "http://ns.adobe.com/xap/1.0/", "CreatorTool", null);
        registerAlias("http://ns.adobe.com/png/1.0/", "Author", "http://purl.org/dc/elements/1.1/", "creator", aliasOptions);
        registerAlias("http://ns.adobe.com/png/1.0/", "Copyright", "http://purl.org/dc/elements/1.1/", "rights", aliasOptions2);
        registerAlias("http://ns.adobe.com/png/1.0/", "CreationTime", "http://ns.adobe.com/xap/1.0/", "CreateDate", null);
        registerAlias("http://ns.adobe.com/png/1.0/", "Description", "http://purl.org/dc/elements/1.1/", "description", aliasOptions2);
        registerAlias("http://ns.adobe.com/png/1.0/", "ModificationTime", "http://ns.adobe.com/xap/1.0/", "ModifyDate", null);
        registerAlias("http://ns.adobe.com/png/1.0/", "Software", "http://ns.adobe.com/xap/1.0/", "CreatorTool", null);
        registerAlias("http://ns.adobe.com/png/1.0/", "Title", "http://purl.org/dc/elements/1.1/", "title", aliasOptions2);
    }

    public final void registerStandardNamespaces() throws XMPException {
        registerNamespace("http://www.w3.org/XML/1998/namespace", "xml");
        registerNamespace("http://www.w3.org/1999/02/22-rdf-syntax-ns#", "rdf");
        registerNamespace("http://purl.org/dc/elements/1.1/", "dc");
        registerNamespace("http://iptc.org/std/Iptc4xmpCore/1.0/xmlns/", "Iptc4xmpCore");
        registerNamespace("adobe:ns:meta/", "x");
        registerNamespace("http://ns.adobe.com/iX/1.0/", "iX");
        registerNamespace("http://ns.adobe.com/xap/1.0/", "xmp");
        registerNamespace("http://ns.adobe.com/xap/1.0/rights/", "xmpRights");
        registerNamespace("http://ns.adobe.com/xap/1.0/mm/", "xmpMM");
        registerNamespace("http://ns.adobe.com/xap/1.0/bj/", "xmpBJ");
        registerNamespace("http://ns.adobe.com/xmp/note/", "xmpNote");
        registerNamespace("http://ns.adobe.com/pdf/1.3/", "pdf");
        registerNamespace("http://ns.adobe.com/pdfx/1.3/", "pdfx");
        registerNamespace("http://www.npes.org/pdfx/ns/id/", "pdfxid");
        registerNamespace("http://www.aiim.org/pdfa/ns/schema#", "pdfaSchema");
        registerNamespace("http://www.aiim.org/pdfa/ns/property#", "pdfaProperty");
        registerNamespace("http://www.aiim.org/pdfa/ns/type#", "pdfaType");
        registerNamespace("http://www.aiim.org/pdfa/ns/field#", "pdfaField");
        registerNamespace("http://www.aiim.org/pdfa/ns/id/", "pdfaid");
        registerNamespace("http://www.aiim.org/pdfa/ns/extension/", "pdfaExtension");
        registerNamespace("http://ns.adobe.com/photoshop/1.0/", "photoshop");
        registerNamespace("http://ns.adobe.com/album/1.0/", "album");
        registerNamespace("http://ns.adobe.com/exif/1.0/", "exif");
        registerNamespace("http://ns.adobe.com/exif/1.0/aux/", "aux");
        registerNamespace("http://ns.adobe.com/tiff/1.0/", "tiff");
        registerNamespace("http://ns.adobe.com/png/1.0/", "png");
        registerNamespace("http://ns.adobe.com/jpeg/1.0/", "jpeg");
        registerNamespace("http://ns.adobe.com/jp2k/1.0/", "jp2k");
        registerNamespace("http://ns.adobe.com/camera-raw-settings/1.0/", "crs");
        registerNamespace("http://ns.adobe.com/StockPhoto/1.0/", "bmsp");
        registerNamespace("http://ns.adobe.com/creatorAtom/1.0/", "creatorAtom");
        registerNamespace("http://ns.adobe.com/asf/1.0/", "asf");
        registerNamespace("http://ns.adobe.com/xmp/wav/1.0/", "wav");
        registerNamespace("http://ns.adobe.com/xmp/1.0/DynamicMedia/", "xmpDM");
        registerNamespace("http://ns.adobe.com/xmp/transient/1.0/", "xmpx");
        registerNamespace("http://ns.adobe.com/xap/1.0/t/", "xmpT");
        registerNamespace("http://ns.adobe.com/xap/1.0/t/pg/", "xmpTPg");
        registerNamespace("http://ns.adobe.com/xap/1.0/g/", "xmpG");
        registerNamespace("http://ns.adobe.com/xap/1.0/g/img/", "xmpGImg");
        registerNamespace("http://ns.adobe.com/xap/1.0/sType/Font#", "stFNT");
        registerNamespace("http://ns.adobe.com/xap/1.0/sType/Dimensions#", "stDim");
        registerNamespace("http://ns.adobe.com/xap/1.0/sType/ResourceEvent#", "stEvt");
        registerNamespace("http://ns.adobe.com/xap/1.0/sType/ResourceRef#", "stRef");
        registerNamespace("http://ns.adobe.com/xap/1.0/sType/Version#", "stVer");
        registerNamespace("http://ns.adobe.com/xap/1.0/sType/Job#", "stJob");
        registerNamespace("http://ns.adobe.com/xap/1.0/sType/ManifestItem#", "stMfs");
        registerNamespace("http://ns.adobe.com/xmp/Identifier/qual/1.0/", "xmpidq");
    }

    public XMPSchemaRegistryImpl() {
        try {
            registerStandardNamespaces();
            registerStandardAliases();
        } catch (XMPException unused) {
            throw new RuntimeException("The XMPSchemaRegistry cannot be initialized!");
        }
    }
}
