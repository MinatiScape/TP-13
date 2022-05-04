package com.davemorrissey.labs.subscaleview.decoder;

import java.lang.reflect.InvocationTargetException;
/* loaded from: classes.dex */
public final class CompatDecoderFactory<T> implements DecoderFactory<T> {
    public final Class<? extends T> clazz;

    @Override // com.davemorrissey.labs.subscaleview.decoder.DecoderFactory
    public final T make() throws IllegalAccessException, InstantiationException, NoSuchMethodException, InvocationTargetException {
        return this.clazz.newInstance();
    }

    public CompatDecoderFactory(Class<? extends T> cls) {
        this.clazz = cls;
    }
}
