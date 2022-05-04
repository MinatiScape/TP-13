package androidx.appcompat.app;

import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.impl.XMPMetaImpl;
import com.google.android.libraries.microvideo.MicrovideoXmpMetadata;
/* loaded from: classes.dex */
public final class LayoutIncludeDetector implements MicrovideoXmpMetadata.ThrowableSupplier {
    public final Cloneable mXmlParserStack;

    public /* synthetic */ LayoutIncludeDetector(XMPMetaImpl xMPMetaImpl) {
        this.mXmlParserStack = xMPMetaImpl;
    }

    @Override // com.google.android.libraries.microvideo.MicrovideoXmpMetadata.ThrowableSupplier
    public final Object get() {
        return ((XMPMetaImpl) ((XMPMeta) this.mXmlParserStack)).getPropertyInteger("MicroVideoOffset");
    }
}
