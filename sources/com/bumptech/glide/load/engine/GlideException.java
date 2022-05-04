package com.bumptech.glide.load.engine;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
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
    private Exception exception;
    private Key key;

    public GlideException(String str) {
        this(str, Collections.emptyList());
    }

    @Override // java.lang.Throwable
    public final Throwable fillInStackTrace() {
        return this;
    }

    @Override // java.lang.Throwable
    public final void printStackTrace() {
        printStackTrace((Appendable) System.err);
    }

    /* loaded from: classes.dex */
    public static final class IndentedAppendable implements Appendable {
        public final Appendable appendable;
        public boolean printedNewLine = true;

        @Override // java.lang.Appendable
        public final Appendable append(char c) throws IOException {
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

        public IndentedAppendable(Appendable appendable) {
            this.appendable = appendable;
        }

        @Override // java.lang.Appendable
        public final Appendable append(CharSequence charSequence) throws IOException {
            if (charSequence == null) {
                charSequence = "";
            }
            append(charSequence, 0, charSequence.length());
            return this;
        }

        @Override // java.lang.Appendable
        public final Appendable append(CharSequence charSequence, int i, int i2) throws IOException {
            if (charSequence == null) {
                charSequence = "";
            }
            boolean z = false;
            if (this.printedNewLine) {
                this.printedNewLine = false;
                this.appendable.append("  ");
            }
            if (charSequence.length() > 0 && charSequence.charAt(i2 - 1) == '\n') {
                z = true;
            }
            this.printedNewLine = z;
            this.appendable.append(charSequence, i, i2);
            return this;
        }
    }

    public GlideException(String str, List<Throwable> list) {
        this.detailMessage = str;
        setStackTrace(EMPTY_ELEMENTS);
        this.causes = list;
    }

    public static void addRootCauses(Throwable th, ArrayList arrayList) {
        if (th instanceof GlideException) {
            for (Throwable th2 : ((GlideException) th).causes) {
                addRootCauses(th2, arrayList);
            }
            return;
        }
        arrayList.add(th);
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        String str;
        String str2;
        StringBuilder sb = new StringBuilder(71);
        sb.append(this.detailMessage);
        String str3 = "";
        if (this.dataClass != null) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(", ");
            m.append(this.dataClass);
            str = m.toString();
        } else {
            str = str3;
        }
        sb.append(str);
        if (this.dataSource != null) {
            StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(", ");
            m2.append(this.dataSource);
            str2 = m2.toString();
        } else {
            str2 = str3;
        }
        sb.append(str2);
        if (this.key != null) {
            StringBuilder m3 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(", ");
            m3.append(this.key);
            str3 = m3.toString();
        }
        sb.append(str3);
        ArrayList arrayList = new ArrayList();
        addRootCauses(this, arrayList);
        if (arrayList.isEmpty()) {
            return sb.toString();
        }
        if (arrayList.size() == 1) {
            sb.append("\nThere was 1 root cause:");
        } else {
            sb.append("\nThere were ");
            sb.append(arrayList.size());
            sb.append(" root causes:");
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

    public final void logRootCauses() {
        ArrayList arrayList = new ArrayList();
        addRootCauses(this, arrayList);
        int size = arrayList.size();
        int i = 0;
        while (i < size) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Root cause (");
            int i2 = i + 1;
            m.append(i2);
            m.append(" of ");
            m.append(size);
            m.append(")");
            Log.i("Glide", m.toString(), (Throwable) arrayList.get(i));
            i = i2;
        }
    }

    public final void setLoggingDetails(Key key, DataSource dataSource, Class<?> cls) {
        this.key = key;
        this.dataSource = dataSource;
        this.dataClass = cls;
    }

    public static void appendCauses(List list, IndentedAppendable indentedAppendable) {
        try {
            appendCausesWrapped(list, indentedAppendable);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void appendCausesWrapped(List list, IndentedAppendable indentedAppendable) throws IOException {
        int size = list.size();
        int i = 0;
        while (i < size) {
            indentedAppendable.append("Cause (");
            int i2 = i + 1;
            indentedAppendable.append(String.valueOf(i2));
            indentedAppendable.append(" of ");
            indentedAppendable.append(String.valueOf(size));
            indentedAppendable.append("): ");
            Throwable th = (Throwable) list.get(i);
            if (th instanceof GlideException) {
                ((GlideException) th).printStackTrace(indentedAppendable);
            } else {
                appendExceptionMessage(th, indentedAppendable);
            }
            i = i2;
        }
    }

    public static void appendExceptionMessage(Throwable th, Appendable appendable) {
        try {
            appendable.append(th.getClass().toString()).append(": ").append(th.getMessage()).append('\n');
        } catch (IOException unused) {
            throw new RuntimeException(th);
        }
    }

    @Override // java.lang.Throwable
    public final void printStackTrace(PrintStream printStream) {
        printStackTrace((Appendable) printStream);
    }

    @Override // java.lang.Throwable
    public final void printStackTrace(PrintWriter printWriter) {
        printStackTrace((Appendable) printWriter);
    }

    public final void printStackTrace(Appendable appendable) {
        appendExceptionMessage(this, appendable);
        appendCauses(this.causes, new IndentedAppendable(appendable));
    }

    public final void setOrigin(RuntimeException runtimeException) {
        this.exception = runtimeException;
    }
}
