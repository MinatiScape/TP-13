package androidx.core.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class NotificationCompat$Builder {
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

    @Deprecated
    public NotificationCompat$Builder(Context context) {
        Notification notification = new Notification();
        this.mNotification = notification;
        this.mContext = context;
        notification.when = System.currentTimeMillis();
        this.mNotification.audioStreamType = -1;
    }

    public static CharSequence limitCharSequenceLength(CharSequence cs) {
        return (cs != null && cs.length() > 5120) ? cs.subSequence(0, 5120) : cs;
    }

    public NotificationCompat$Builder setStyle(NotificationCompat$Style style) {
        if (this.mStyle != style) {
            this.mStyle = style;
            if (style.mBuilder != this) {
                style.mBuilder = this;
                setStyle(style);
            }
        }
        return this;
    }
}
