package com.google.common.util.concurrent;

import java.lang.Thread;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
/* loaded from: classes.dex */
final class UncaughtExceptionHandlers$Exiter implements Thread.UncaughtExceptionHandler {
    public static final Logger logger = Logger.getLogger(UncaughtExceptionHandlers$Exiter.class.getName());

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public final void uncaughtException(Thread t, Throwable e) {
        try {
            logger.logp(Level.SEVERE, "com.google.common.util.concurrent.UncaughtExceptionHandlers$Exiter", "uncaughtException", String.format(Locale.ROOT, "Caught an exception in %s.  Shutting down.", t), e);
            throw null;
        } catch (Throwable th) {
            System.err.println(e.getMessage());
            System.err.println(th.getMessage());
            throw null;
        }
    }
}
