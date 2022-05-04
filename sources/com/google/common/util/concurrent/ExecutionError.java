package com.google.common.util.concurrent;
/* loaded from: classes.dex */
public class ExecutionError extends Error {
    private static final long serialVersionUID = 0;

    public ExecutionError() {
    }

    public ExecutionError(String message) {
        super(message);
    }

    public ExecutionError(Error cause) {
        super(cause);
    }
}
