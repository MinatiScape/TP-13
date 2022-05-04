package com.google.android.apps.wallpaper.module;

import android.content.Context;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.CategoryReceiver;
import com.android.wallpaper.model.WallpaperCategory;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.model.WallpaperReceiver;
import com.android.wallpaper.module.CurrentWallpaperInfoFactory;
import com.android.wallpaper.module.DefaultCurrentWallpaperInfoFactory;
import com.android.wallpaper.module.InjectorProvider;
import com.google.android.apps.wallpaper.module.WallpaperCategoryProvider;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.comparisons.ComparisonsKt___ComparisonsJvmKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.SafeContinuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.Dispatchers;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
@DebugMetadata(c = "com.google.android.apps.wallpaper.module.DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1", f = "DefaultGoogleWallpaperPreferences.kt", l = {R.styleable.AppCompatTheme_windowFixedHeightMajor, R.styleable.AppCompatTheme_windowFixedHeightMinor}, m = "invokeSuspend")
/* loaded from: classes.dex */
public final class DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super JSONArray>, Object> {
    public int label;
    private /* synthetic */ CoroutineScope p$;
    public final /* synthetic */ DefaultGoogleWallpaperPreferences this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1(DefaultGoogleWallpaperPreferences defaultGoogleWallpaperPreferences, Continuation<? super DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1> continuation) {
        super(2, continuation);
        this.this$0 = defaultGoogleWallpaperPreferences;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1 defaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1 = new DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1(this.this$0, continuation);
        defaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1.p$ = (CoroutineScope) obj;
        return defaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public Object invoke(CoroutineScope coroutineScope, Continuation<? super JSONArray> continuation) {
        DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1 defaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1 = new DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1(this.this$0, continuation);
        defaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1.p$ = coroutineScope;
        return defaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1.invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.COROUTINE_SUSPENDED;
        int i = this.label;
        if (i == 0) {
            ResultKt.throwOnFailure(obj);
            final Context mContext = this.this$0.mContext;
            Intrinsics.checkNotNullExpressionValue(mContext, "mContext");
            this.label = 1;
            final SafeContinuation safeContinuation = new SafeContinuation(IntrinsicsKt__IntrinsicsKt.intercepted(this));
            final ArrayList arrayList = new ArrayList();
            final HashMap hashMap = new HashMap();
            new WallpaperCategoryProvider.GoogleFetchCategoriesTask(new CategoryReceiver() { // from class: com.google.android.apps.wallpaper.module.RecentWallpaperUtils$generateDefaults$2$1
                @Override // com.android.wallpaper.model.CategoryReceiver
                public void doneFetchingCategories() {
                    List<WallpaperInfo> list = arrayList;
                    final HashMap<String, Category> hashMap2 = hashMap;
                    final Context context = mContext;
                    if (list.size() > 1) {
                        Comparator<T> recentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$$inlined$sortBy$1 = new Comparator<T>() { // from class: com.google.android.apps.wallpaper.module.RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$$inlined$sortBy$1
                            @Override // java.util.Comparator
                            public final int compare(T t, T t2) {
                                Category category = (Category) hashMap2.get(((WallpaperInfo) t).getCollectionId(context));
                                Integer num = null;
                                Integer valueOf = category == null ? null : Integer.valueOf(category.mPriority);
                                Category category2 = (Category) hashMap2.get(((WallpaperInfo) t2).getCollectionId(context));
                                if (category2 != null) {
                                    num = Integer.valueOf(category2.mPriority);
                                }
                                return ComparisonsKt___ComparisonsJvmKt.compareValues(valueOf, num);
                            }
                        };
                        if (list.size() > 1) {
                            Collections.sort(list, recentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$$inlined$sortBy$1);
                        }
                    }
                    CurrentWallpaperInfoFactory currentWallpaperFactory = InjectorProvider.getInjector().getCurrentWallpaperFactory(mContext);
                    final List<WallpaperInfo> list2 = arrayList;
                    final Continuation<List<? extends WallpaperInfo>> continuation = safeContinuation;
                    ((DefaultCurrentWallpaperInfoFactory) currentWallpaperFactory).createCurrentWallpaperInfos(new CurrentWallpaperInfoFactory.WallpaperInfoCallback() { // from class: com.google.android.apps.wallpaper.module.RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$2
                        @Override // com.android.wallpaper.module.CurrentWallpaperInfoFactory.WallpaperInfoCallback
                        public final void onWallpaperInfoCreated(WallpaperInfo homeWallpaper, @Nullable WallpaperInfo wallpaperInfo, int i2) {
                            if (!list2.contains(homeWallpaper)) {
                                List<WallpaperInfo> list3 = list2;
                                Intrinsics.checkNotNullExpressionValue(homeWallpaper, "homeWallpaper");
                                list3.add(0, homeWallpaper);
                            }
                            continuation.resumeWith(list2);
                        }
                    }, false);
                }

                @Override // com.android.wallpaper.model.CategoryReceiver
                public void onCategoryReceived(@Nullable Category category) {
                    if (category instanceof WallpaperCategory) {
                        WallpaperCategory wallpaperCategory = (WallpaperCategory) category;
                        hashMap.put(wallpaperCategory.mCollectionId, category);
                        Context context = mContext;
                        final List<WallpaperInfo> list = arrayList;
                        wallpaperCategory.fetchWallpapers(context, new WallpaperReceiver() { // from class: com.google.android.apps.wallpaper.module.RecentWallpaperUtils$generateDefaults$2$1$onCategoryReceived$1
                            @Override // com.android.wallpaper.model.WallpaperReceiver
                            public final void onWallpapersReceived(List<WallpaperInfo> it) {
                                List<WallpaperInfo> list2 = list;
                                Intrinsics.checkNotNullExpressionValue(it, "it");
                                list2.addAll(it);
                            }
                        }, true);
                    }
                }
            }, mContext, true).execute(new Void[0]);
            obj = safeContinuation.getOrThrow();
            if (obj == coroutineSingletons) {
                Intrinsics.checkNotNullParameter(this, "frame");
            }
            if (obj == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else if (i == 1) {
            ResultKt.throwOnFailure(obj);
        } else if (i == 2) {
            ResultKt.throwOnFailure(obj);
            JSONArray defaultRecents = (JSONArray) obj;
            DefaultGoogleWallpaperPreferences defaultGoogleWallpaperPreferences = this.this$0;
            Objects.requireNonNull(defaultGoogleWallpaperPreferences);
            Intrinsics.checkNotNullParameter(defaultRecents, "defaultRecents");
            defaultGoogleWallpaperPreferences.mNoBackupPrefs.edit().putString("default_recent_wallpapers", defaultRecents.toString()).apply();
            return defaultRecents;
        } else {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        Context mContext2 = this.this$0.mContext;
        Intrinsics.checkNotNullExpressionValue(mContext2, "mContext");
        HashSet hashSet = new HashSet();
        ArrayList arrayList2 = new ArrayList();
        for (Object obj2 : (List) obj) {
            if (hashSet.add(((WallpaperInfo) obj2).getWallpaperId())) {
                arrayList2.add(obj2);
            }
        }
        this.label = 2;
        Dispatchers dispatchers = Dispatchers.INSTANCE;
        obj = BuildersKt.withContext(Dispatchers.IO, new RecentWallpaperUtils$findAndFormatDefaultRecents$2(arrayList2, mContext2, null), this);
        if (obj == coroutineSingletons) {
            return coroutineSingletons;
        }
        JSONArray defaultRecents2 = (JSONArray) obj;
        DefaultGoogleWallpaperPreferences defaultGoogleWallpaperPreferences2 = this.this$0;
        Objects.requireNonNull(defaultGoogleWallpaperPreferences2);
        Intrinsics.checkNotNullParameter(defaultRecents2, "defaultRecents");
        defaultGoogleWallpaperPreferences2.mNoBackupPrefs.edit().putString("default_recent_wallpapers", defaultRecents2.toString()).apply();
        return defaultRecents2;
    }
}
