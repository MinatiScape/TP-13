package com.android.systemui.flags;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.provider.Settings;
import androidx.concurrent.futures.CallbackToFutureAdapter$Completer;
import androidx.concurrent.futures.CallbackToFutureAdapter$Resolver;
import androidx.concurrent.futures.CallbackToFutureAdapter$SafeFuture;
import com.android.systemui.flags.FlagReader;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final class FlagManager implements FlagReader {
    @NotNull
    public static final String ACTION_GET_FLAGS = "com.android.systemui.action.GET_FLAGS";
    @NotNull
    public static final String ACTION_SET_FLAG = "com.android.systemui.action.SET_FLAG";
    @NotNull
    public static final Companion Companion = new Companion(null);
    @NotNull
    public static final String FIELD_FLAGS = "flags";
    @NotNull
    public static final String FIELD_ID = "id";
    @NotNull
    public static final String FIELD_TYPE = "type";
    @NotNull
    public static final String FIELD_VALUE = "value";
    @NotNull
    public static final String FLAGS_PERMISSION = "com.android.systemui.permission.FLAGS";
    @NotNull
    public static final String RECEIVING_PACKAGE = "com.android.systemui";
    @NotNull
    private static final String SETTINGS_PREFIX = "systemui/flags";
    @NotNull
    public static final String TYPE_BOOLEAN = "boolean";
    @NotNull
    private final Context context;
    @NotNull
    private final Handler handler;
    @NotNull
    private final Set<FlagReader.Listener> listeners = new LinkedHashSet();
    @NotNull
    private final ContentObserver settingsObserver = new SettingsObserver(this);

    /* loaded from: classes.dex */
    public static final class Companion {
        private Companion() {
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    /* loaded from: classes.dex */
    public final class SettingsObserver extends ContentObserver {
        public final /* synthetic */ FlagManager this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public SettingsObserver(FlagManager this$0) {
            super(this$0.handler);
            Intrinsics.checkNotNullParameter(this$0, "this$0");
            this.this$0 = this$0;
        }

        @Override // android.database.ContentObserver
        public void onChange(boolean z, @Nullable Uri uri) {
            if (uri != null) {
                List<String> pathSegments = uri.getPathSegments();
                String idStr = pathSegments.get(pathSegments.size() - 1);
                try {
                    Intrinsics.checkNotNullExpressionValue(idStr, "idStr");
                    int parseInt = Integer.parseInt(idStr);
                    for (FlagReader.Listener listener : this.this$0.listeners) {
                        listener.onFlagChanged(parseInt);
                    }
                } catch (NumberFormatException unused) {
                }
            }
        }
    }

    public FlagManager(@NotNull Context context, @NotNull Handler handler) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(handler, "handler");
        this.context = context;
        this.handler = handler;
    }

    private final boolean assertType(JSONObject jSONObject, String str) {
        try {
            return Intrinsics.areEqual(jSONObject.getString("type"), TYPE_BOOLEAN);
        } catch (JSONException unused) {
            return false;
        }
    }

    private final Intent createIntent(int i) {
        Intent intent = new Intent(ACTION_SET_FLAG);
        intent.setPackage(RECEIVING_PACKAGE);
        intent.putExtra(FIELD_ID, i);
        return intent;
    }

    @Override // com.android.systemui.flags.FlagReader
    public void addListener(@NotNull FlagReader.Listener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        synchronized (this.listeners) {
            boolean isEmpty = this.listeners.isEmpty();
            this.listeners.add(listener);
            if (isEmpty) {
                this.context.getContentResolver().registerContentObserver(Settings.Secure.getUriFor(SETTINGS_PREFIX), true, this.settingsObserver);
            }
        }
    }

    public final void eraseFlag(int i) {
        this.context.sendBroadcast(createIntent(i));
    }

    @NotNull
    public final ListenableFuture<Collection<Flag<?>>> getFlagsFuture() {
        final Intent intent = new Intent(ACTION_GET_FLAGS);
        intent.setPackage(RECEIVING_PACKAGE);
        CallbackToFutureAdapter$Resolver<Object> flagManager$getFlagsFuture$1 = new CallbackToFutureAdapter$Resolver<Object>() { // from class: com.android.systemui.flags.FlagManager$getFlagsFuture$1
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter$Resolver
            @Nullable
            public final Object attachCompleter(@NotNull final CallbackToFutureAdapter$Completer<Object> completer) {
                Context context;
                Intrinsics.checkNotNullParameter(completer, "completer");
                context = FlagManager.this.context;
                context.sendOrderedBroadcast(intent, null, new BroadcastReceiver() { // from class: com.android.systemui.flags.FlagManager$getFlagsFuture$1.1
                    @Override // android.content.BroadcastReceiver
                    public void onReceive(@NotNull Context context2, @NotNull Intent intent2) {
                        Intrinsics.checkNotNullParameter(context2, "context");
                        Intrinsics.checkNotNullParameter(intent2, "intent");
                        boolean z = false;
                        Bundle resultExtras = getResultExtras(false);
                        ArrayList parcelableArrayList = resultExtras == null ? null : resultExtras.getParcelableArrayList(FlagManager.FIELD_FLAGS);
                        if (parcelableArrayList != null) {
                            CallbackToFutureAdapter$Completer<Object> callbackToFutureAdapter$Completer = completer;
                            callbackToFutureAdapter$Completer.attemptedSetting = true;
                            CallbackToFutureAdapter$SafeFuture<Object> callbackToFutureAdapter$SafeFuture = callbackToFutureAdapter$Completer.future;
                            if (callbackToFutureAdapter$SafeFuture != null && callbackToFutureAdapter$SafeFuture.delegate.set(parcelableArrayList)) {
                                z = true;
                            }
                            if (z) {
                                callbackToFutureAdapter$Completer.tag = null;
                                callbackToFutureAdapter$Completer.future = null;
                                callbackToFutureAdapter$Completer.cancellationFuture = null;
                                return;
                            }
                            return;
                        }
                        CallbackToFutureAdapter$Completer<Object> callbackToFutureAdapter$Completer2 = completer;
                        NoFlagResultsException noFlagResultsException = new NoFlagResultsException();
                        callbackToFutureAdapter$Completer2.attemptedSetting = true;
                        CallbackToFutureAdapter$SafeFuture<Object> callbackToFutureAdapter$SafeFuture2 = callbackToFutureAdapter$Completer2.future;
                        if (callbackToFutureAdapter$SafeFuture2 != null && callbackToFutureAdapter$SafeFuture2.delegate.setException(noFlagResultsException)) {
                            z = true;
                        }
                        if (z) {
                            callbackToFutureAdapter$Completer2.tag = null;
                            callbackToFutureAdapter$Completer2.future = null;
                            callbackToFutureAdapter$Completer2.cancellationFuture = null;
                        }
                    }
                }, null, -1, "extra data", null);
                return "QueryingFlags";
            }
        };
        CallbackToFutureAdapter$Completer<Object> callbackToFutureAdapter$Completer = new CallbackToFutureAdapter$Completer<>();
        CallbackToFutureAdapter$SafeFuture<T> callbackToFutureAdapter$SafeFuture = new CallbackToFutureAdapter$SafeFuture<>(callbackToFutureAdapter$Completer);
        callbackToFutureAdapter$Completer.future = callbackToFutureAdapter$SafeFuture;
        callbackToFutureAdapter$Completer.tag = flagManager$getFlagsFuture$1.getClass();
        try {
            Object attachCompleter = flagManager$getFlagsFuture$1.attachCompleter(callbackToFutureAdapter$Completer);
            if (attachCompleter != null) {
                callbackToFutureAdapter$Completer.tag = attachCompleter;
            }
        } catch (Exception e) {
            callbackToFutureAdapter$SafeFuture.delegate.setException(e);
        }
        return callbackToFutureAdapter$SafeFuture;
    }

    @Override // com.android.systemui.flags.FlagReader
    public boolean isEnabled(@NotNull BooleanFlag booleanFlag) {
        return FlagReader.DefaultImpls.isEnabled(this, booleanFlag);
    }

    @NotNull
    public final String keyToSettingsPrefix(int i) {
        return Intrinsics.stringPlus("systemui/flags/", Integer.valueOf(i));
    }

    @Override // com.android.systemui.flags.FlagReader
    public void removeListener(@NotNull FlagReader.Listener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        synchronized (this.listeners) {
            boolean z = !this.listeners.isEmpty();
            this.listeners.remove(listener);
            if (z && this.listeners.isEmpty()) {
                this.context.getContentResolver().unregisterContentObserver(this.settingsObserver);
            }
        }
    }

    public final void setFlagValue(int i, boolean z) {
        Intent createIntent = createIntent(i);
        createIntent.putExtra(FIELD_VALUE, z);
        this.context.sendBroadcast(createIntent);
    }

    @Override // com.android.systemui.flags.FlagReader
    public boolean isEnabled(int i, boolean z) {
        Boolean isEnabled = isEnabled(i);
        return isEnabled == null ? z : isEnabled.booleanValue();
    }

    @Nullable
    public final Boolean isEnabled(int i) {
        String string = Settings.Secure.getString(this.context.getContentResolver(), keyToSettingsPrefix(i));
        if (string != null) {
            if (!(string.length() == 0)) {
                try {
                    JSONObject jSONObject = new JSONObject(string);
                    if (!assertType(jSONObject, TYPE_BOOLEAN)) {
                        return null;
                    }
                    return Boolean.valueOf(jSONObject.getBoolean(FIELD_VALUE));
                } catch (JSONException unused) {
                    throw new InvalidFlagStorageException();
                }
            }
        }
        return null;
    }
}
