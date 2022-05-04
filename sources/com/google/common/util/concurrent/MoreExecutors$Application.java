package com.google.common.util.concurrent;
/* loaded from: classes.dex */
public class MoreExecutors$Application {
    public void addShutdownHook(Thread hook) {
        Runtime.getRuntime().addShutdownHook(hook);
    }
}
