package com.adobe.xmp.options;

import com.adobe.xmp.XMPException;
import com.android.systemui.shared.system.QuickStepContract;
/* loaded from: classes.dex */
public final class PropertyOptions extends Options {
    public PropertyOptions() {
    }

    @Override // com.adobe.xmp.options.Options
    public final int getValidOptions() {
        return -2147475470;
    }

    public PropertyOptions(int options) throws XMPException {
        super(options);
    }

    @Override // com.adobe.xmp.options.Options
    public final void assertConsistency(int options) throws XMPException {
        if ((options & 256) > 0 && (options & QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED) > 0) {
            throw new XMPException("IsStruct and IsArray options are mutually exclusive", 103);
        } else if ((options & 2) > 0 && (options & 768) > 0) {
            throw new XMPException("Structs and arrays can't have \"value\" options", 103);
        }
    }

    public final boolean getHasLanguage() {
        return getOption(64);
    }

    public final boolean isArray() {
        return getOption(QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED);
    }

    public final boolean isArrayAltText() {
        return getOption(QuickStepContract.SYSUI_STATE_TRACING_ENABLED);
    }

    public final boolean isCompositeProperty() {
        if ((this.options & 768) > 0) {
            return true;
        }
        return false;
    }

    public final void setStruct(boolean value) {
        setOption(256, value);
    }
}
