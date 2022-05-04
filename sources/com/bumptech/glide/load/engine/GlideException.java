package com.bumptech.glide.load.engine;

import com.bumptech.glide.Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Key;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public final class GlideException extends Exception {
    public static final StackTraceElement[] EMPTY_ELEMENTS = new StackTraceElement[0];
    private static final long serialVersionUID = 1;
    private final List<Throwable> causes;
    private Class<?> dataClass;
    private DataSource dataSource;
    private String detailMessage;
    private Key key;

    public GlideException(String message) {
        List<Throwable> emptyList = Collections.emptyList();
        this.detailMessage = message;
        setStackTrace(EMPTY_ELEMENTS);
        this.causes = emptyList;
    }

    public static void appendCauses(List<Throwable> causes, Appendable appendable) {
        try {
            appendCausesWrapped(causes, appendable);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void appendCausesWrapped(List<Throwable> causes, Appendable appendable) throws IOException {
        int size = causes.size();
        int i = 0;
        while (i < size) {
            int i2 = i + 1;
            appendable.append("Cause (").append(String.valueOf(i2)).append(" of ").append(String.valueOf(size)).append("): ");
            Throwable th = causes.get(i);
            if (th instanceof GlideException) {
                ((GlideException) th).printStackTrace(appendable);
            } else {
                appendExceptionMessage(th, appendable);
            }
            i = i2;
        }
    }

    public static void appendExceptionMessage(Throwable t, Appendable appendable) {
        try {
            appendable.append(t.getClass().toString()).append(": ").append(t.getMessage()).append('\n');
        } catch (IOException unused) {
            throw new RuntimeException(t);
        }
    }

    public final void addRootCauses(Throwable throwable, List<Throwable> rootCauses) {
        if (throwable instanceof GlideException) {
            for (Throwable th : ((GlideException) throwable).causes) {
                addRootCauses(th, rootCauses);
            }
            return;
        }
        rootCauses.add(throwable);
    }

    @Override // java.lang.Throwable
    public Throwable fillInStackTrace() {
        return this;
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        String str;
        String str2;
        StringBuilder sb = new StringBuilder(71);
        sb.append(this.detailMessage);
        Class<?> cls = this.dataClass;
        String str3 = "";
        if (cls != null) {
            String valueOf = String.valueOf(cls);
            str = Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0.m(valueOf.length() + 2, ", ", valueOf);
        } else {
            str = str3;
        }
        sb.append(str);
        DataSource dataSource = this.dataSource;
        if (dataSource != null) {
            String valueOf2 = String.valueOf(dataSource);
            str2 = Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0.m(valueOf2.length() + 2, ", ", valueOf2);
        } else {
            str2 = str3;
        }
        sb.append(str2);
        Key key = this.key;
        if (key != null) {
            String valueOf3 = String.valueOf(key);
            str3 = Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0.m(valueOf3.length() + 2, ", ", valueOf3);
        }
        sb.append(str3);
        ArrayList arrayList = new ArrayList();
        addRootCauses(this, arrayList);
        if (arrayList.isEmpty()) {
            return sb.toString();
        }
        if (arrayList.size() == 1) {
            sb.append("\nThere was 1 cause:");
        } else {
            sb.append("\nThere were ");
            sb.append(arrayList.size());
            sb.append(" causes:");
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Throwable th = (Throwable) it.next();
            sb.append('\n');
            sb.append(th.getClass().getName());
            sb.append('(');
            sb.append(th.getMessage());
            sb.append(')');
        }
        sb.append("\n call GlideException#logRootCauses(String) for more detail");
        return sb.toString();
    }

    @Override // java.lang.Throwable
    public void printStackTrace() {
        printStackTrace((Appendable) System.err);
    }

    public void setLoggingDetails(Key key, DataSource dataSource) {
        this.key = key;
        this.dataSource = dataSource;
        this.dataClass = null;
    }

    @Override // java.lang.Throwable
    public void printStackTrace(PrintStream err) {
        printStackTrace((Appendable) err);
    }

    @Override // java.lang.Throwable
    public void printStackTrace(PrintWriter err) {
        printStackTrace((Appendable) err);
    }

    public void setLoggingDetails(Key key, DataSource dataSource, Class<?> dataClass) {
        this.key = key;
        this.dataSource = dataSource;
        this.dataClass = dataClass;
    }

    /* loaded from: classes.dex */
    public static final class IndentedAppendable implements Appendable {
        public final Appendable appendable;
        public boolean printedNewLine = true;

        public IndentedAppendable(Appendable appendable) {
            this.appendable = appendable;
        }

        @Override // java.lang.Appendable
        public Appendable append(char c) throws IOException {
            boolean z = false;
            if (this.printedNewLine) {
                this.printedNewLine = false;
                this.appendable.append("  ");
            }
            if (c == '\n') {
                z = true;
            }
            this.printedNewLine = z;
            this.appendable.append(c);
            return this;
        }

        @Override // java.lang.Appendable
        public Appendable append(CharSequence charSequence) throws IOException {
            if (charSequence == null) {
                charSequence = "";
            }
            append(charSequence, 0, charSequence.length());
            return this;
        }

        @Override // java.lang.Appendable
        public Appendable append(CharSequence charSequence, int start, int end) throws IOException {
            if (charSequence == null) {
                charSequence = "";
            }
            boolean z = false;
            if (this.printedNewLine) {
                this.printedNewLine = false;
                this.appendable.append("  ");
            }
            if (charSequence.length() > 0 && charSequence.charAt(end - 1) == '\n') {
                z = true;
            }
            this.printedNewLine = z;
            this.appendable.append(charSequence, start, end);
            return this;
        }
    }

    public final void printStackTrace(Appendable appendable) {
        appendExceptionMessage(this, appendable);
        appendCauses(this.causes, new IndentedAppendable(appendable));
    }

    public GlideException(String detailMessage, Throwable cause) {
        List<Throwable> singletonList = Collections.singletonList(cause);
        this.detailMessage = detailMessage;
        setStackTrace(EMPTY_ELEMENTS);
        this.causes = singletonList;
    }

    public GlideException(String detailMessage, List<Throwable> causes) {
        this.detailMessage = detailMessage;
        setStackTrace(EMPTY_ELEMENTS);
        this.causes = causes;
    }
}
