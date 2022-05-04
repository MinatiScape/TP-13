package androidx.core.view.accessibility;

import android.view.View;
/* loaded from: classes.dex */
public interface AccessibilityViewCommand {

    /* loaded from: classes.dex */
    public static abstract class CommandArguments {
    }

    /* loaded from: classes.dex */
    public static final class MoveAtGranularityArguments extends CommandArguments {
        public MoveAtGranularityArguments() {
            throw null;
        }
    }

    /* loaded from: classes.dex */
    public static final class MoveHtmlArguments extends CommandArguments {
        public MoveHtmlArguments() {
            throw null;
        }
    }

    /* loaded from: classes.dex */
    public static final class MoveWindowArguments extends CommandArguments {
        public MoveWindowArguments() {
            throw null;
        }
    }

    /* loaded from: classes.dex */
    public static final class ScrollToPositionArguments extends CommandArguments {
        public ScrollToPositionArguments() {
            throw null;
        }
    }

    /* loaded from: classes.dex */
    public static final class SetProgressArguments extends CommandArguments {
        public SetProgressArguments() {
            throw null;
        }
    }

    /* loaded from: classes.dex */
    public static final class SetSelectionArguments extends CommandArguments {
        public SetSelectionArguments() {
            throw null;
        }
    }

    /* loaded from: classes.dex */
    public static final class SetTextArguments extends CommandArguments {
        public SetTextArguments() {
            throw null;
        }
    }

    boolean perform(View view);
}
