package com.google.common.base;

import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public enum StandardSystemProperty {
    /* JADX INFO: Fake field, exist only in values array */
    JAVA_VERSION("java.version"),
    /* JADX INFO: Fake field, exist only in values array */
    JAVA_VENDOR("java.vendor"),
    /* JADX INFO: Fake field, exist only in values array */
    JAVA_VENDOR_URL("java.vendor.url"),
    /* JADX INFO: Fake field, exist only in values array */
    JAVA_HOME("java.home"),
    /* JADX INFO: Fake field, exist only in values array */
    JAVA_VM_SPECIFICATION_VERSION("java.vm.specification.version"),
    /* JADX INFO: Fake field, exist only in values array */
    JAVA_VM_SPECIFICATION_VENDOR("java.vm.specification.vendor"),
    /* JADX INFO: Fake field, exist only in values array */
    JAVA_VM_SPECIFICATION_NAME("java.vm.specification.name"),
    /* JADX INFO: Fake field, exist only in values array */
    JAVA_VM_VERSION("java.vm.version"),
    /* JADX INFO: Fake field, exist only in values array */
    JAVA_VM_VENDOR("java.vm.vendor"),
    /* JADX INFO: Fake field, exist only in values array */
    JAVA_VM_NAME("java.vm.name"),
    /* JADX INFO: Fake field, exist only in values array */
    JAVA_SPECIFICATION_VERSION("java.specification.version"),
    /* JADX INFO: Fake field, exist only in values array */
    JAVA_SPECIFICATION_VENDOR("java.specification.vendor"),
    /* JADX INFO: Fake field, exist only in values array */
    FILE_SEPARATOR("java.specification.name"),
    /* JADX INFO: Fake field, exist only in values array */
    OS_VERSION("java.class.version"),
    JAVA_CLASS_PATH("java.class.path"),
    /* JADX INFO: Fake field, exist only in values array */
    OS_VERSION("java.library.path"),
    /* JADX INFO: Fake field, exist only in values array */
    FILE_SEPARATOR("java.io.tmpdir"),
    /* JADX INFO: Fake field, exist only in values array */
    OS_VERSION("java.compiler"),
    /* JADX INFO: Fake field, exist only in values array */
    FILE_SEPARATOR("java.ext.dirs"),
    /* JADX INFO: Fake field, exist only in values array */
    OS_VERSION("os.name"),
    /* JADX INFO: Fake field, exist only in values array */
    FILE_SEPARATOR("os.arch"),
    /* JADX INFO: Fake field, exist only in values array */
    OS_VERSION("os.version"),
    /* JADX INFO: Fake field, exist only in values array */
    FILE_SEPARATOR("file.separator"),
    PATH_SEPARATOR("path.separator"),
    /* JADX INFO: Fake field, exist only in values array */
    LINE_SEPARATOR("line.separator"),
    /* JADX INFO: Fake field, exist only in values array */
    USER_NAME("user.name"),
    /* JADX INFO: Fake field, exist only in values array */
    USER_HOME("user.home"),
    /* JADX INFO: Fake field, exist only in values array */
    USER_DIR("user.dir");
    
    private final String key;

    @Override // java.lang.Enum
    public final String toString() {
        String str = this.key;
        String value = value();
        return XMPNode$$ExternalSyntheticOutline0.m(ParseRDF$$ExternalSyntheticOutline0.m(value, ParseRDF$$ExternalSyntheticOutline0.m(str, 1)), str, "=", value);
    }

    public final String value() {
        return System.getProperty(this.key);
    }

    StandardSystemProperty(String key) {
        this.key = key;
    }
}
