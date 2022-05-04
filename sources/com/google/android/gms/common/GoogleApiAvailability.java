package com.google.android.gms.common;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.FragmentManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Person;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Icon;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import androidx.collection.SimpleArrayMap;
import androidx.core.app.NotificationCompat$Action;
import androidx.core.app.NotificationCompat$BigTextStyle;
import androidx.core.app.NotificationCompat$Builder;
import androidx.core.app.NotificationCompat$Style;
import androidx.core.app.NotificationCompatJellybean;
import androidx.core.app.Person;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManagerImpl;
import com.android.systemui.shared.R;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzh;
import com.google.android.gms.common.util.zzi;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public final class GoogleApiAvailability extends GoogleApiAvailabilityLight {
    public static final Object zza = new Object();
    public static final GoogleApiAvailability zzb = new GoogleApiAvailability();

    @SuppressLint({"HandlerLeak"})
    /* loaded from: classes.dex */
    public class zza extends Handler {
        public final Context zza;

        /* JADX WARN: Illegal instructions before constructor call */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public zza(android.content.Context r2) {
            /*
                r0 = this;
                com.google.android.gms.common.GoogleApiAvailability.this = r1
                android.os.Looper r1 = android.os.Looper.myLooper()
                if (r1 != 0) goto Ld
                android.os.Looper r1 = android.os.Looper.getMainLooper()
                goto L11
            Ld:
                android.os.Looper r1 = android.os.Looper.myLooper()
            L11:
                r0.<init>(r1)
                android.content.Context r1 = r2.getApplicationContext()
                r0.zza = r1
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.common.GoogleApiAvailability.zza.<init>(com.google.android.gms.common.GoogleApiAvailability, android.content.Context):void");
        }

        @Override // android.os.Handler
        public final void handleMessage(Message message) {
            int i = message.what;
            if (i != 1) {
                StringBuilder sb = new StringBuilder(50);
                sb.append("Don't know how to handle this message: ");
                sb.append(i);
                Log.w("GoogleApiAvailability", sb.toString());
                return;
            }
            int isGooglePlayServicesAvailable = GoogleApiAvailability.this.isGooglePlayServicesAvailable(this.zza);
            if (GoogleApiAvailability.this.isUserResolvableError(isGooglePlayServicesAvailable)) {
                GoogleApiAvailability.this.showErrorNotification(this.zza, isGooglePlayServicesAvailable);
            }
        }
    }

    private final String zza() {
        synchronized (zza) {
        }
        return null;
    }

    @Override // com.google.android.gms.common.GoogleApiAvailabilityLight
    public final PendingIntent getErrorResolutionPendingIntent(Context context, int i, String str) {
        return super.getErrorResolutionPendingIntent(context, i, null);
    }

    public final String getErrorString(int i) {
        AtomicBoolean atomicBoolean = GooglePlayServicesUtilLight.zza;
        return ConnectionResult.zza(i);
    }

    public final int isGooglePlayServicesAvailable(Context context) {
        return GoogleApiAvailabilityLight.isGooglePlayServicesAvailable(context, GoogleApiAvailabilityLight.GOOGLE_PLAY_SERVICES_VERSION_CODE);
    }

    public final boolean isUserResolvableError(int i) {
        AtomicBoolean atomicBoolean = GooglePlayServicesUtilLight.zza;
        if (i == 1 || i == 2 || i == 3 || i == 9) {
            return true;
        }
        return false;
    }

    public final void showErrorDialogFragment(Activity activity, int i, DialogInterface.OnCancelListener onCancelListener) {
        AlertDialog alertDialog;
        AlertDialog.Builder builder;
        String str;
        zzh zzhVar = new zzh(super.getErrorResolutionIntent(activity, i, "d"), activity);
        if (i == 0) {
            alertDialog = null;
        } else {
            TypedValue typedValue = new TypedValue();
            activity.getTheme().resolveAttribute(16843529, typedValue, true);
            if ("Theme.Dialog.Alert".equals(activity.getResources().getResourceEntryName(typedValue.resourceId))) {
                builder = new AlertDialog.Builder(activity, 5);
            } else {
                builder = null;
            }
            if (builder == null) {
                builder = new AlertDialog.Builder(activity);
            }
            builder.setMessage(zzf.zzc(activity, i));
            if (onCancelListener != null) {
                builder.setOnCancelListener(onCancelListener);
            }
            Resources resources = activity.getResources();
            if (i == 1) {
                str = resources.getString(R.string.common_google_play_services_install_button);
            } else if (i == 2) {
                str = resources.getString(R.string.common_google_play_services_update_button);
            } else if (i != 3) {
                str = resources.getString(17039370);
            } else {
                str = resources.getString(R.string.common_google_play_services_enable_button);
            }
            if (str != null) {
                builder.setPositiveButton(str, zzhVar);
            }
            String zza2 = zzf.zza(activity, i);
            if (zza2 != null) {
                builder.setTitle(zza2);
            }
            alertDialog = builder.create();
        }
        if (alertDialog != null) {
            if (activity instanceof FragmentActivity) {
                FragmentManagerImpl supportFragmentManager = ((FragmentActivity) activity).getSupportFragmentManager();
                SupportErrorDialogFragment supportErrorDialogFragment = new SupportErrorDialogFragment();
                alertDialog.setOnCancelListener(null);
                alertDialog.setOnDismissListener(null);
                supportErrorDialogFragment.zza = alertDialog;
                if (onCancelListener != null) {
                    supportErrorDialogFragment.zzb = onCancelListener;
                }
                supportErrorDialogFragment.show(supportFragmentManager, "GooglePlayServicesErrorDialog");
                return;
            }
            FragmentManager fragmentManager = activity.getFragmentManager();
            ErrorDialogFragment errorDialogFragment = new ErrorDialogFragment();
            alertDialog.setOnCancelListener(null);
            alertDialog.setOnDismissListener(null);
            errorDialogFragment.zza = alertDialog;
            if (onCancelListener != null) {
                errorDialogFragment.zzb = onCancelListener;
            }
            errorDialogFragment.show(fragmentManager, "GooglePlayServicesErrorDialog");
        }
    }

    public final void showErrorNotification(Context context, int i) {
        zza(context, i, super.getErrorResolutionPendingIntent(context, i, "n"));
    }

    @Override // com.google.android.gms.common.GoogleApiAvailabilityLight
    public final Intent getErrorResolutionIntent(Context context, int i, String str) {
        return super.getErrorResolutionIntent(context, i, str);
    }

    @TargetApi(26)
    public final String zza(Context context, NotificationManager notificationManager) {
        String zza2 = zza();
        if (zza2 == null) {
            zza2 = "com.google.android.gms.availability";
            NotificationChannel notificationChannel = notificationManager.getNotificationChannel(zza2);
            SimpleArrayMap<String, String> simpleArrayMap = zzf.zza;
            String string = context.getResources().getString(R.string.common_google_play_services_notification_channel_name);
            if (notificationChannel == null) {
                notificationManager.createNotificationChannel(new NotificationChannel(zza2, string, 4));
            } else if (!string.equals(notificationChannel.getName())) {
                notificationChannel.setName(string);
                notificationManager.createNotificationChannel(notificationChannel);
            }
        }
        return zza2;
    }

    @TargetApi(20)
    public final void zza(Context context, int i, PendingIntent pendingIntent) {
        String str;
        String str2;
        int i2;
        Notification notification;
        int i3;
        Bundle bundle;
        if (i == 18) {
            new zza(context).sendEmptyMessageDelayed(1, 120000L);
        } else if (pendingIntent != null) {
            if (i == 6) {
                str = zzf.zza(context, "common_google_play_services_resolution_required_title");
            } else {
                str = zzf.zza(context, i);
            }
            if (str == null) {
                str = context.getResources().getString(R.string.common_google_play_services_notification_ticker);
            }
            if (i == 6) {
                str2 = zzf.zza(context, "common_google_play_services_resolution_required_text", zzf.zzb(context));
            } else {
                str2 = zzf.zzc(context, i);
            }
            Resources resources = context.getResources();
            NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
            boolean z = false;
            if (zzi.zzb(context)) {
                Notification.Builder addAction = new Notification.Builder(context).setSmallIcon(context.getApplicationInfo().icon).setPriority(2).setAutoCancel(true).setContentTitle(str).setStyle(new Notification.BigTextStyle().bigText(str2)).addAction(R.drawable.common_full_open_on_phone, resources.getString(R.string.common_open_on_phone), pendingIntent);
                addAction.setChannelId(zza(context, notificationManager));
                notification = addAction.build();
                i2 = 1;
            } else {
                NotificationCompat$Builder notificationCompat$Builder = new NotificationCompat$Builder(context);
                notificationCompat$Builder.mNotification.icon = 17301642;
                notificationCompat$Builder.mNotification.tickerText = NotificationCompat$Builder.limitCharSequenceLength(resources.getString(R.string.common_google_play_services_notification_ticker));
                long currentTimeMillis = System.currentTimeMillis();
                Notification notification2 = notificationCompat$Builder.mNotification;
                notification2.when = currentTimeMillis;
                notification2.flags |= 16;
                notificationCompat$Builder.mContentIntent = pendingIntent;
                notificationCompat$Builder.mContentTitle = NotificationCompat$Builder.limitCharSequenceLength(str);
                notificationCompat$Builder.mContentText = NotificationCompat$Builder.limitCharSequenceLength(str2);
                notificationCompat$Builder.mLocalOnly = true;
                NotificationCompat$BigTextStyle notificationCompat$BigTextStyle = new NotificationCompat$BigTextStyle();
                notificationCompat$BigTextStyle.mBigText = NotificationCompat$Builder.limitCharSequenceLength(str2);
                notificationCompat$Builder.setStyle(notificationCompat$BigTextStyle);
                notificationCompat$Builder.mChannelId = zza(context, notificationManager);
                new ArrayList();
                Bundle bundle2 = new Bundle();
                Notification.Builder builder = new Notification.Builder(notificationCompat$Builder.mContext, notificationCompat$Builder.mChannelId);
                Notification notification3 = notificationCompat$Builder.mNotification;
                builder.setWhen(notification3.when).setSmallIcon(notification3.icon, notification3.iconLevel).setContent(notification3.contentView).setTicker(notification3.tickerText, null).setVibrate(notification3.vibrate).setLights(notification3.ledARGB, notification3.ledOnMS, notification3.ledOffMS).setOngoing((notification3.flags & 2) != 0).setOnlyAlertOnce((notification3.flags & 8) != 0).setAutoCancel((notification3.flags & 16) != 0).setDefaults(notification3.defaults).setContentTitle(notificationCompat$Builder.mContentTitle).setContentText(notificationCompat$Builder.mContentText).setContentInfo(null).setContentIntent(notificationCompat$Builder.mContentIntent).setDeleteIntent(notification3.deleteIntent).setFullScreenIntent(null, (notification3.flags & 128) != 0).setLargeIcon((Bitmap) null).setNumber(0).setProgress(0, 0, false);
                builder.setSubText(null).setUsesChronometer(false).setPriority(0);
                Iterator<NotificationCompat$Action> it = notificationCompat$Builder.mActions.iterator();
                while (it.hasNext()) {
                    it.next().getClass();
                    Notification.Action.Builder builder2 = new Notification.Action.Builder((Icon) null, (CharSequence) null, (PendingIntent) null);
                    Bundle bundle3 = new Bundle();
                    bundle3.putBoolean("android.support.allowGeneratedReplies", false);
                    builder2.setAllowGeneratedReplies(false);
                    bundle3.putInt("android.support.action.semanticAction", 0);
                    builder2.setSemanticAction(0);
                    builder2.setContextual(false);
                    bundle3.putBoolean("android.support.action.showsUserInterface", false);
                    builder2.addExtras(bundle3);
                    builder.addAction(builder2.build());
                }
                Bundle bundle4 = notificationCompat$Builder.mExtras;
                if (bundle4 != null) {
                    bundle2.putAll(bundle4);
                }
                builder.setShowWhen(notificationCompat$Builder.mShowWhen);
                builder.setLocalOnly(notificationCompat$Builder.mLocalOnly).setGroup(null).setGroupSummary(false).setSortKey(null);
                builder.setCategory(null).setColor(0).setVisibility(0).setPublicVersion(null).setSound(notification3.sound, notification3.audioAttributes);
                ArrayList<String> arrayList = notificationCompat$Builder.mPeople;
                if (arrayList != null && !arrayList.isEmpty()) {
                    Iterator<String> it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        builder.addPerson(it2.next());
                    }
                }
                if (notificationCompat$Builder.mInvisibleActions.size() > 0) {
                    Bundle bundle5 = notificationCompat$Builder.getExtras().getBundle("android.car.EXTENSIONS");
                    if (bundle5 == null) {
                        bundle5 = new Bundle();
                    }
                    Bundle bundle6 = new Bundle(bundle5);
                    Bundle bundle7 = new Bundle();
                    int i4 = 0;
                    while (i4 < notificationCompat$Builder.mInvisibleActions.size()) {
                        String num = Integer.toString(i4);
                        Object obj = NotificationCompatJellybean.sExtrasLock;
                        Bundle bundle8 = new Bundle();
                        notificationCompat$Builder.mInvisibleActions.get(i4).getClass();
                        int i5 = z ? 1 : 0;
                        int i6 = z ? 1 : 0;
                        bundle8.putInt("icon", i5);
                        bundle8.putCharSequence("title", null);
                        bundle8.putParcelable("actionIntent", null);
                        Bundle bundle9 = new Bundle();
                        bundle9.putBoolean("android.support.allowGeneratedReplies", z);
                        bundle8.putBundle("extras", bundle9);
                        bundle8.putParcelableArray("remoteInputs", null);
                        bundle8.putBoolean("showsUserInterface", false);
                        bundle8.putInt("semanticAction", 0);
                        bundle7.putBundle(num, bundle8);
                        i4++;
                        z = false;
                    }
                    bundle5.putBundle("invisible_actions", bundle7);
                    bundle6.putBundle("invisible_actions", bundle7);
                    notificationCompat$Builder.getExtras().putBundle("android.car.EXTENSIONS", bundle5);
                    bundle2.putBundle("android.car.EXTENSIONS", bundle6);
                }
                builder.setExtras(notificationCompat$Builder.mExtras).setRemoteInputHistory(null);
                builder.setBadgeIconType(0).setSettingsText(null).setShortcutId(null).setTimeoutAfter(0L).setGroupAlertBehavior(0);
                if (!TextUtils.isEmpty(notificationCompat$Builder.mChannelId)) {
                    builder.setSound(null).setDefaults(0).setLights(0, 0, 0).setVibrate(null);
                }
                Iterator<Person> it3 = notificationCompat$Builder.mPersonList.iterator();
                while (it3.hasNext()) {
                    it3.next().getClass();
                    builder.addPerson(new Person.Builder().setName(null).setIcon(null).setUri(null).setKey(null).setBot(false).setImportant(false).build());
                }
                builder.setAllowSystemGeneratedContextualActions(notificationCompat$Builder.mAllowSystemGeneratedContextualActions);
                builder.setBubbleMetadata(null);
                NotificationCompat$Style notificationCompat$Style = notificationCompat$Builder.mStyle;
                if (notificationCompat$Style != null) {
                    new Notification.BigTextStyle(builder).setBigContentTitle(null).bigText(((NotificationCompat$BigTextStyle) notificationCompat$Style).mBigText);
                }
                Notification build = builder.build();
                if (notificationCompat$Style != null) {
                    notificationCompat$Builder.mStyle.getClass();
                }
                if (!(notificationCompat$Style == null || (bundle = build.extras) == null)) {
                    bundle.putString("androidx.core.app.extra.COMPAT_TEMPLATE", "androidx.core.app.NotificationCompat$BigTextStyle");
                }
                notification = build;
                i2 = 1;
            }
            if (i == i2 || i == 2 || i == 3) {
                i3 = 10436;
                GooglePlayServicesUtilLight.zza.set(false);
            } else {
                i3 = 39789;
            }
            notificationManager.notify(i3, notification);
        } else if (i == 6) {
            Log.w("GoogleApiAvailability", "Missing resolution for ConnectionResult.RESOLUTION_REQUIRED. Call GoogleApiAvailability#showErrorNotification(Context, ConnectionResult) instead.");
        }
    }
}
