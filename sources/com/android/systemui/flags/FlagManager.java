package com.android.systemui.flags;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.concurrent.futures.AbstractResolvableFuture;
import androidx.concurrent.futures.CallbackToFutureAdapter$Completer;
import androidx.concurrent.futures.CallbackToFutureAdapter$Resolver;
import androidx.concurrent.futures.CallbackToFutureAdapter$SafeFuture;
import com.android.systemui.flags.FlagListenable;
import com.android.systemui.flags.FlagManager;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import java.util.function.Predicate;
import kotlin.collections.CollectionsKt__IteratorsJVMKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref$BooleanRef;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: FlagManager.kt */
/* loaded from: classes.dex */
public final class FlagManager implements FlagListenable {
    @NotNull
    public static final String ACTION_GET_FLAGS = "com.android.systemui.action.GET_FLAGS";
    @NotNull
    public static final String ACTION_SET_FLAG = "com.android.systemui.action.SET_FLAG";
    @NotNull
    public static final Companion Companion = new Companion(null);
    @NotNull
    public static final String EXTRA_FLAGS = "flags";
    @NotNull
    public static final String EXTRA_ID = "id";
    @NotNull
    public static final String EXTRA_VALUE = "value";
    @NotNull
    public static final String FLAGS_PERMISSION = "com.android.systemui.permission.FLAGS";
    @NotNull
    public static final String RECEIVING_PACKAGE = "com.android.systemui";
    @NotNull
    private static final String SETTINGS_PREFIX = "systemui/flags";
    @Nullable
    private Consumer<Integer> clearCacheAction;
    @NotNull
    private final Context context;
    @NotNull
    private final Handler handler;
    @NotNull
    private final Set<PerFlagListener> listeners;
    @Nullable
    private Consumer<Boolean> onSettingsChangedAction;
    @NotNull
    private final FlagSettingsHelper settings;
    @NotNull
    private final ContentObserver settingsObserver;

    /* compiled from: FlagManager.kt */
    /* loaded from: classes.dex */
    public static final class PerFlagListener {
        private final int id;
        @NotNull
        private final FlagListenable.Listener listener;

        public static /* synthetic */ PerFlagListener copy$default(PerFlagListener perFlagListener, int i, FlagListenable.Listener listener, int i2, Object obj) {
            if ((i2 & 1) != 0) {
                i = perFlagListener.id;
            }
            if ((i2 & 2) != 0) {
                listener = perFlagListener.listener;
            }
            return perFlagListener.copy(i, listener);
        }

        public final int component1() {
            return this.id;
        }

        @NotNull
        public final FlagListenable.Listener component2() {
            return this.listener;
        }

        @NotNull
        public final PerFlagListener copy(int i, @NotNull FlagListenable.Listener listener) {
            Intrinsics.checkNotNullParameter(listener, "listener");
            return new PerFlagListener(i, listener);
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof PerFlagListener)) {
                return false;
            }
            PerFlagListener perFlagListener = (PerFlagListener) obj;
            return this.id == perFlagListener.id && Intrinsics.areEqual(this.listener, perFlagListener.listener);
        }

        public int hashCode() {
            return this.listener.hashCode() + (Integer.hashCode(this.id) * 31);
        }

        public PerFlagListener(int i, @NotNull FlagListenable.Listener listener) {
            Intrinsics.checkNotNullParameter(listener, "listener");
            this.id = i;
            this.listener = listener;
        }

        @NotNull
        public String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("PerFlagListener(id=");
            m.append(this.id);
            m.append(", listener=");
            m.append(this.listener);
            m.append(')');
            return m.toString();
        }

        public final int getId() {
            return this.id;
        }

        @NotNull
        public final FlagListenable.Listener getListener() {
            return this.listener;
        }
    }

    /* compiled from: FlagManager.kt */
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
                    Consumer<Integer> clearCacheAction = this.this$0.getClearCacheAction();
                    if (clearCacheAction != null) {
                        clearCacheAction.accept(Integer.valueOf(parseInt));
                    }
                    FlagManager flagManager = this.this$0;
                    flagManager.dispatchListenersAndMaybeRestart(parseInt, flagManager.getOnSettingsChangedAction());
                } catch (NumberFormatException unused) {
                }
            }
        }
    }

    public FlagManager(@NotNull Context context, @NotNull FlagSettingsHelper settings, @NotNull Handler handler) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(settings, "settings");
        Intrinsics.checkNotNullParameter(handler, "handler");
        this.context = context;
        this.settings = settings;
        this.handler = handler;
        this.listeners = new LinkedHashSet();
        this.settingsObserver = new SettingsObserver(this);
    }

    private final Intent createIntent(int i) {
        Intent intent = new Intent(ACTION_SET_FLAG);
        intent.setPackage(RECEIVING_PACKAGE);
        intent.putExtra(EXTRA_ID, i);
        return intent;
    }

    @Override // com.android.systemui.flags.FlagListenable
    public void addListener(@NotNull Flag<?> flag, @NotNull FlagListenable.Listener listener) {
        Intrinsics.checkNotNullParameter(flag, "flag");
        Intrinsics.checkNotNullParameter(listener, "listener");
        synchronized (this.listeners) {
            boolean isEmpty = this.listeners.isEmpty();
            this.listeners.add(new PerFlagListener(flag.getId(), listener));
            if (isEmpty) {
                this.settings.registerContentObserver(SETTINGS_PREFIX, true, this.settingsObserver);
            }
        }
    }

    public final void dispatchListenersAndMaybeRestart(final int i, @Nullable Consumer<Boolean> consumer) {
        ArrayList arrayList;
        FlagListenable.Listener listener;
        synchronized (this.listeners) {
            Set<PerFlagListener> set = this.listeners;
            arrayList = new ArrayList();
            for (PerFlagListener perFlagListener : set) {
                if (perFlagListener.getId() == i) {
                    listener = perFlagListener.getListener();
                } else {
                    listener = null;
                }
                if (listener != null) {
                    arrayList.add(listener);
                }
            }
        }
        if (!arrayList.isEmpty()) {
            ArrayList arrayList2 = new ArrayList(CollectionsKt__IteratorsJVMKt.collectionSizeOrDefault(arrayList));
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                final Ref$BooleanRef ref$BooleanRef = new Ref$BooleanRef();
                ((FlagListenable.Listener) it.next()).onFlagChanged(new FlagListenable.FlagEvent(i, ref$BooleanRef) { // from class: com.android.systemui.flags.FlagManager$dispatchListenersAndMaybeRestart$suppressRestartList$1$event$1
                    public final /* synthetic */ Ref$BooleanRef $didRequestNoRestart;
                    public final /* synthetic */ int $id;
                    private final int flagId;

                    {
                        this.$id = i;
                        this.$didRequestNoRestart = ref$BooleanRef;
                        this.flagId = i;
                    }

                    @Override // com.android.systemui.flags.FlagListenable.FlagEvent
                    public void requestNoRestart() {
                        this.$didRequestNoRestart.element = true;
                    }

                    @Override // com.android.systemui.flags.FlagListenable.FlagEvent
                    public int getFlagId() {
                        return this.flagId;
                    }
                });
                arrayList2.add(Boolean.valueOf(ref$BooleanRef.element));
            }
            boolean z = true;
            if (!arrayList2.isEmpty()) {
                Iterator it2 = arrayList2.iterator();
                while (true) {
                    if (it2.hasNext()) {
                        if (!((Boolean) it2.next()).booleanValue()) {
                            z = false;
                            break;
                        }
                    } else {
                        break;
                    }
                }
            }
            if (consumer != null) {
                consumer.accept(Boolean.valueOf(z));
            }
        } else if (consumer != null) {
            consumer.accept(Boolean.FALSE);
        }
    }

    @NotNull
    public final ListenableFuture<Collection<Flag<?>>> getFlagsFuture() {
        final Intent intent = new Intent(ACTION_GET_FLAGS);
        intent.setPackage(RECEIVING_PACKAGE);
        CallbackToFutureAdapter$Resolver flagManager$getFlagsFuture$1 = new CallbackToFutureAdapter$Resolver() { // from class: com.android.systemui.flags.FlagManager$getFlagsFuture$1
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter$Resolver
            @Nullable
            public final Object attachCompleter(@NotNull final CallbackToFutureAdapter$Completer<Object> completer) {
                Context context;
                Intrinsics.checkNotNullParameter(completer, "completer");
                context = FlagManager.this.context;
                context.sendOrderedBroadcast(intent, null, new BroadcastReceiver() { // from class: com.android.systemui.flags.FlagManager$getFlagsFuture$1.1
                    @Override // android.content.BroadcastReceiver
                    public void onReceive(@NotNull Context context2, @NotNull Intent intent2) {
                        ArrayList arrayList;
                        boolean z;
                        boolean z2;
                        Intrinsics.checkNotNullParameter(context2, "context");
                        Intrinsics.checkNotNullParameter(intent2, "intent");
                        boolean z3 = false;
                        Bundle resultExtras = getResultExtras(false);
                        if (resultExtras == null) {
                            arrayList = null;
                        } else {
                            arrayList = resultExtras.getParcelableArrayList(FlagManager.EXTRA_FLAGS);
                        }
                        if (arrayList != null) {
                            CallbackToFutureAdapter$Completer<Object> callbackToFutureAdapter$Completer = completer;
                            callbackToFutureAdapter$Completer.attemptedSetting = true;
                            CallbackToFutureAdapter$SafeFuture<Object> callbackToFutureAdapter$SafeFuture = callbackToFutureAdapter$Completer.future;
                            if (callbackToFutureAdapter$SafeFuture != null) {
                                CallbackToFutureAdapter$SafeFuture.AnonymousClass1 r2 = callbackToFutureAdapter$SafeFuture.delegate;
                                r2.getClass();
                                if (AbstractResolvableFuture.ATOMIC_HELPER.casValue(r2, null, arrayList)) {
                                    AbstractResolvableFuture.complete(r2);
                                    z2 = true;
                                } else {
                                    z2 = false;
                                }
                                if (z2) {
                                    z3 = true;
                                }
                            }
                            if (z3) {
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
                        if (callbackToFutureAdapter$SafeFuture2 != null) {
                            CallbackToFutureAdapter$SafeFuture.AnonymousClass1 r22 = callbackToFutureAdapter$SafeFuture2.delegate;
                            r22.getClass();
                            if (AbstractResolvableFuture.ATOMIC_HELPER.casValue(r22, null, new AbstractResolvableFuture.Failure(noFlagResultsException))) {
                                AbstractResolvableFuture.complete(r22);
                                z = true;
                            } else {
                                z = false;
                            }
                            if (z) {
                                z3 = true;
                            }
                        }
                        if (z3) {
                            callbackToFutureAdapter$Completer2.tag = null;
                            callbackToFutureAdapter$Completer2.future = null;
                            callbackToFutureAdapter$Completer2.cancellationFuture = null;
                        }
                    }
                }, null, -1, "extra data", null);
                return "QueryingFlags";
            }
        };
        CallbackToFutureAdapter$Completer callbackToFutureAdapter$Completer = new CallbackToFutureAdapter$Completer();
        CallbackToFutureAdapter$SafeFuture<T> callbackToFutureAdapter$SafeFuture = new CallbackToFutureAdapter$SafeFuture<>(callbackToFutureAdapter$Completer);
        callbackToFutureAdapter$Completer.future = callbackToFutureAdapter$SafeFuture;
        callbackToFutureAdapter$Completer.tag = FlagManager$getFlagsFuture$1.class;
        try {
            Object attachCompleter = flagManager$getFlagsFuture$1.attachCompleter(callbackToFutureAdapter$Completer);
            if (attachCompleter != null) {
                callbackToFutureAdapter$Completer.tag = attachCompleter;
            }
        } catch (Exception e) {
            CallbackToFutureAdapter$SafeFuture.AnonymousClass1 r1 = callbackToFutureAdapter$SafeFuture.delegate;
            r1.getClass();
            if (AbstractResolvableFuture.ATOMIC_HELPER.casValue(r1, null, new AbstractResolvableFuture.Failure(e))) {
                AbstractResolvableFuture.complete(r1);
            }
        }
        return callbackToFutureAdapter$SafeFuture;
    }

    @Nullable
    public final Boolean isEnabled(int i) {
        return (Boolean) readFlagValue(i, BooleanFlagSerializer.INSTANCE);
    }

    @Nullable
    public final <T> T readFlagValue(int i, @NotNull FlagSerializer<T> serializer) {
        Intrinsics.checkNotNullParameter(serializer, "serializer");
        return serializer.fromSettingsData(this.settings.getString(idToSettingsKey(i)));
    }

    @Override // com.android.systemui.flags.FlagListenable
    public void removeListener(@NotNull final FlagListenable.Listener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        synchronized (this.listeners) {
            if (!this.listeners.isEmpty()) {
                this.listeners.removeIf(new Predicate() { // from class: com.android.systemui.flags.FlagManager$removeListener$1$1
                    public final boolean test(@NotNull FlagManager.PerFlagListener it) {
                        Intrinsics.checkNotNullParameter(it, "it");
                        return Intrinsics.areEqual(it.getListener(), FlagListenable.Listener.this);
                    }
                });
                if (this.listeners.isEmpty()) {
                    this.settings.unregisterContentObserver(this.settingsObserver);
                }
            }
        }
    }

    public final void eraseFlag(int i) {
        this.context.sendBroadcast(createIntent(i));
    }

    @NotNull
    public final String idToSettingsKey(int i) {
        return Intrinsics.stringPlus("systemui/flags/", Integer.valueOf(i));
    }

    public final void setFlagValue(int i, boolean z) {
        Intent createIntent = createIntent(i);
        createIntent.putExtra(EXTRA_VALUE, z);
        this.context.sendBroadcast(createIntent);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public FlagManager(@org.jetbrains.annotations.NotNull android.content.Context r4, @org.jetbrains.annotations.NotNull android.os.Handler r5) {
        /*
            r3 = this;
            java.lang.String r0 = "context"
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r4, r0)
            java.lang.String r0 = "handler"
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r5, r0)
            com.android.systemui.flags.FlagSettingsHelper r0 = new com.android.systemui.flags.FlagSettingsHelper
            android.content.ContentResolver r1 = r4.getContentResolver()
            java.lang.String r2 = "context.contentResolver"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r1, r2)
            r0.<init>(r1)
            r3.<init>(r4, r0, r5)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.systemui.flags.FlagManager.<init>(android.content.Context, android.os.Handler):void");
    }

    public final void setClearCacheAction(@Nullable Consumer<Integer> consumer) {
        this.clearCacheAction = consumer;
    }

    public final void setOnSettingsChangedAction(@Nullable Consumer<Boolean> consumer) {
        this.onSettingsChangedAction = consumer;
    }

    /* compiled from: FlagManager.kt */
    /* loaded from: classes.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    @Nullable
    public final Consumer<Integer> getClearCacheAction() {
        return this.clearCacheAction;
    }

    @Nullable
    public final Consumer<Boolean> getOnSettingsChangedAction() {
        return this.onSettingsChangedAction;
    }
}
