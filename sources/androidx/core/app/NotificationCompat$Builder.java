package androidx.core.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class NotificationCompat$Builder {
    public PendingIntent mContentIntent;
    public CharSequence mContentText;
    public CharSequence mContentTitle;
    public Context mContext;
    public Bundle mExtras;
    public Notification mNotification;
    public NotificationCompat$Style mStyle;
    public ArrayList<NotificationCompat$Action> mActions = new ArrayList<>();
    public ArrayList<Person> mPersonList = new ArrayList<>();
    public ArrayList<NotificationCompat$Action> mInvisibleActions = new ArrayList<>();
    public boolean mShowWhen = true;
    public boolean mLocalOnly = false;
    public String mChannelId = null;
    @Deprecated
    public ArrayList<String> mPeople = new ArrayList<>();
    public boolean mAllowSystemGeneratedContextualActions = true;

    public static CharSequence limitCharSequenceLength(String str) {
        if (str == null) {
            return str;
        }
        if (str.length() > 5120) {
            return str.subSequence(0, 5120);
        }
        return str;
    }

    public final Bundle getExtras() {
        if (this.mExtras == null) {
            this.mExtras = new Bundle();
        }
        return this.mExtras;
    }

    public final void setStyle(NotificationCompat$BigTextStyle notificationCompat$BigTextStyle) {
        if (this.mStyle != notificationCompat$BigTextStyle) {
            this.mStyle = notificationCompat$BigTextStyle;
            if (notificationCompat$BigTextStyle.mBuilder != this) {
                notificationCompat$BigTextStyle.mBuilder = this;
                setStyle(notificationCompat$BigTextStyle);
            }
        }
    }

    @Deprecated
    public NotificationCompat$Builder(Context context) {
        Notification notification = new Notification();
        this.mNotification = notification;
        this.mContext = context;
        notification.when = System.currentTimeMillis();
        this.mNotification.audioStreamType = -1;
    }
}
