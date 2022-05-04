package com.google.android.libraries.microvideo;

import android.util.Log;
import androidx.appcompat.app.LayoutIncludeDetector;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.impl.ParameterAsserts;
import com.adobe.xmp.impl.XMPMetaImpl;
import com.adobe.xmp.impl.XMPNode;
import com.adobe.xmp.impl.XMPNodeUtils;
import com.adobe.xmp.impl.xpath.XMPPathParser;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.gms.common.zze;
import com.google.android.libraries.microvideo.xmp.AutoValue_MicroVideoXmpContainerItem;
import com.google.android.libraries.microvideo.xmp.MicroVideoXmpContainer;
import com.google.android.libraries.microvideo.xmp.MicroVideoXmpContainerItem;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public final class MicrovideoXmpMetadata {

    /* loaded from: classes.dex */
    public interface ThrowableSupplier<T, E extends Throwable> {
        T get() throws Throwable;
    }

    public static int getFileFormatVersion(final XMPMetaImpl xmpMeta) throws XMPException {
        Object obj;
        int i = 0;
        ThrowableSupplier[] throwableSupplierArr = {new ThrowableSupplier(xmpMeta) { // from class: com.google.android.libraries.microvideo.MicrovideoXmpMetadata$$Lambda$6
            public final XMPMeta arg$1;

            {
                this.arg$1 = xmpMeta;
            }

            @Override // com.google.android.libraries.microvideo.MicrovideoXmpMetadata.ThrowableSupplier
            public final Object get() {
                Integer propertyInteger = ((XMPMetaImpl) this.arg$1).getPropertyInteger("MotionPhoto");
                if (propertyInteger == null || propertyInteger.intValue() <= 0) {
                    return null;
                }
                return 2;
            }
        }, new ThrowableSupplier(xmpMeta) { // from class: com.google.android.libraries.microvideo.MicrovideoXmpMetadata$$Lambda$7
            public final XMPMeta arg$1;

            {
                this.arg$1 = xmpMeta;
            }

            @Override // com.google.android.libraries.microvideo.MicrovideoXmpMetadata.ThrowableSupplier
            public final Object get() {
                Integer propertyInteger = ((XMPMetaImpl) this.arg$1).getPropertyInteger("MicroVideo");
                if (propertyInteger == null || propertyInteger.intValue() <= 0) {
                    return null;
                }
                return 1;
            }
        }, zze.$instance};
        while (true) {
            if (i >= 3) {
                obj = null;
                break;
            }
            obj = throwableSupplierArr[i].get();
            if (obj != null) {
                break;
            }
            i++;
        }
        return ((Integer) obj).intValue();
    }

    public static void requiredValueMissing(String description) throws XMPException {
        String str;
        if (description.length() != 0) {
            str = "Property value missing for ".concat(description);
        } else {
            str = new String("Property value missing for ");
        }
        throw new XMPException(str, 5);
    }

    public static int getMicrovideoPayloadLength(XMPMetaImpl xmpMeta) throws XMPException {
        int i;
        List<MicroVideoXmpContainerItem> unmodifiableList;
        String str;
        String str2;
        Object obj = null;
        int i2 = 0;
        boolean z = true;
        if (getFileFormatVersion(xmpMeta) == 1) {
            ThrowableSupplier[] throwableSupplierArr = {new LayoutIncludeDetector(xmpMeta), LaunchUtils.$instance};
            while (true) {
                if (i2 >= 2) {
                    break;
                }
                Object obj2 = throwableSupplierArr[i2].get();
                if (obj2 != null) {
                    obj = obj2;
                    break;
                }
                i2++;
            }
            return ((Integer) obj).intValue();
        } else if (getFileFormatVersion(xmpMeta) != 1) {
            ParameterAsserts.assertSchemaNS("http://ns.google.com/photos/1.0/container/");
            XMPNode findNode = XMPNodeUtils.findNode(xmpMeta.tree, XMPPathParser.expandXPath("http://ns.google.com/photos/1.0/container/", "Directory"), false, null);
            if (findNode == null) {
                i = 0;
            } else if (findNode.getOptions().isArray()) {
                i = findNode.getChildrenLength();
            } else {
                throw new XMPException("The named property is not an array", 102);
            }
            MicroVideoXmpContainer microVideoXmpContainer = new MicroVideoXmpContainer();
            for (int i3 = 1; i3 <= i; i3++) {
                if (i3 > 0) {
                    StringBuilder sb = new StringBuilder(22);
                    sb.append("Directory");
                    sb.append('[');
                    sb.append(i3);
                    sb.append(']');
                    str = sb.toString();
                } else if (i3 == -1) {
                    str = "Directory".concat("[last()]");
                } else {
                    throw new XMPException("Array index must be larger than zero", 104);
                }
                String structField = MicroVideoXmpContainerItem.getStructField(xmpMeta, str, "Mime");
                MicroVideoXmpContainerItem.requiredNonNullValue(structField, "Mime");
                String structField2 = MicroVideoXmpContainerItem.getStructField(xmpMeta, str, "Semantic");
                MicroVideoXmpContainerItem.requiredNonNullValue(structField2, "Semantic");
                String structField3 = MicroVideoXmpContainerItem.getStructField(xmpMeta, str, "Length");
                String str3 = "0";
                if (structField3 == null) {
                    structField3 = str3;
                }
                String structField4 = MicroVideoXmpContainerItem.getStructField(xmpMeta, str, "Padding");
                if (structField4 != null) {
                    str3 = structField4;
                }
                Integer valueOf = Integer.valueOf(Integer.parseInt(structField3));
                Integer valueOf2 = Integer.valueOf(Integer.parseInt(str3));
                String str4 = "";
                if (valueOf == null) {
                    str4 = str4.concat(" length");
                }
                if (valueOf2 == null) {
                    str4 = String.valueOf(str4).concat(" padding");
                }
                if (!str4.isEmpty()) {
                    if (str4.length() != 0) {
                        str2 = "Missing required properties:".concat(str4);
                    } else {
                        str2 = new String("Missing required properties:");
                    }
                    throw new IllegalStateException(str2);
                }
                AutoValue_MicroVideoXmpContainerItem autoValue_MicroVideoXmpContainerItem = new AutoValue_MicroVideoXmpContainerItem(structField, structField2, valueOf.intValue(), valueOf2.intValue());
                synchronized (microVideoXmpContainer) {
                    microVideoXmpContainer.items.add(autoValue_MicroVideoXmpContainerItem);
                }
            }
            synchronized (microVideoXmpContainer) {
                unmodifiableList = Collections.unmodifiableList(microVideoXmpContainer.items);
            }
            int i4 = 0;
            for (MicroVideoXmpContainerItem microVideoXmpContainerItem : unmodifiableList) {
                if (z) {
                    String str5 = "";
                    if (!microVideoXmpContainerItem.getSemantic().contentEquals("Primary")) {
                        str5 = str5.concat("First container item must be primary.\n");
                        Log.w("MVXmpMetadata", "Badly formatted file. First container item is not primary");
                    }
                    if (microVideoXmpContainerItem.getLength() > 0) {
                        String.valueOf(str5).concat("First container item must have length of 0.\n");
                        int length = microVideoXmpContainerItem.getLength();
                        StringBuilder sb2 = new StringBuilder(59);
                        sb2.append("First container length expected to be 0. Found: ");
                        sb2.append(length);
                        Log.w("MVXmpMetadata", sb2.toString());
                    }
                    i4 += microVideoXmpContainerItem.getPadding();
                    z = false;
                } else {
                    String str6 = "";
                    if (microVideoXmpContainerItem.getSemantic().contentEquals("Primary")) {
                        str6 = str6.concat("Secondary container items must not be primary.\n");
                        Log.w("MVXmpMetadata", "Badly formatted file. Only first container item should be primary");
                    }
                    if (microVideoXmpContainerItem.getPadding() > 0) {
                        String.valueOf(str6).concat("Secondary container items must have 0 padding.\n");
                        Log.w("MVXmpMetadata", "Badly formatted file. Only primary container items may have padding.");
                    }
                    i4 += microVideoXmpContainerItem.getPadding() + microVideoXmpContainerItem.getLength();
                }
            }
            return i4;
        } else {
            throw new XMPException("V1 format does not have a container", 5);
        }
    }
}
