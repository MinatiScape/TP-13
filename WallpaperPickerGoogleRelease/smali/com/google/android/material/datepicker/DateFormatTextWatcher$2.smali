.class public Lcom/google/android/material/datepicker/DateFormatTextWatcher$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic this$0:Lcom/google/android/material/datepicker/DateFormatTextWatcher;

.field public final synthetic val$milliseconds:J


# direct methods
.method public constructor <init>(Lcom/google/android/material/datepicker/DateFormatTextWatcher;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/datepicker/DateFormatTextWatcher$2;->this$0:Lcom/google/android/material/datepicker/DateFormatTextWatcher;

    iput-wide p2, p0, Lcom/google/android/material/datepicker/DateFormatTextWatcher$2;->val$milliseconds:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/datepicker/DateFormatTextWatcher$2;->this$0:Lcom/google/android/material/datepicker/DateFormatTextWatcher;

    .line 2
    iget-object v1, v0, Lcom/google/android/material/datepicker/DateFormatTextWatcher;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    .line 3
    iget-object v0, v0, Lcom/google/android/material/datepicker/DateFormatTextWatcher;->outOfRange:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    .line 4
    iget-wide v3, p0, Lcom/google/android/material/datepicker/DateFormatTextWatcher$2;->val$milliseconds:J

    invoke-static {v3, v4}, Lcom/google/android/material/datepicker/DateStrings;->getDateString(J)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 5
    invoke-virtual {v1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setError(Ljava/lang/CharSequence;)V

    .line 6
    iget-object p0, p0, Lcom/google/android/material/datepicker/DateFormatTextWatcher$2;->this$0:Lcom/google/android/material/datepicker/DateFormatTextWatcher;

    invoke-virtual {p0}, Lcom/google/android/material/datepicker/DateFormatTextWatcher;->onInvalidDate()V

    return-void
.end method
