package com.android.wallpaper.module;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import com.android.volley.VolleyError;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.CategoryProvider;
import com.android.wallpaper.model.CategoryReceiver;
import com.android.wallpaper.network.ServerFetcher;
import com.google.android.apps.common.volley.request.ProtoRequest;
import com.google.android.apps.wallpaper.backdrop.BackdropFetcher;
import com.google.android.apps.wallpaper.module.WallpaperCategoryProvider;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$Collection;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$GetCollectionsRequest;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$GetCollectionsResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
/* loaded from: classes.dex */
public class DefaultCategoryProvider implements CategoryProvider {
    public static List<Category> sSystemCategories;
    public final Context mAppContext;
    public boolean mFetchedCategories;
    public Locale mLocale;
    public NetworkStatusNotifier mNetworkStatusNotifier;
    public ArrayList<Category> mCategories = new ArrayList<>();
    public int mNetworkStatus = -1;

    /* loaded from: classes.dex */
    public static class FetchCategoriesTask extends AsyncTask<Void, Category, Void> {
        public static final /* synthetic */ int $r8$clinit = 0;
        public final Context mAppContext;
        public PartnerProvider mPartnerProvider;
        public CategoryReceiver mReceiver;

        public FetchCategoriesTask(CategoryReceiver categoryReceiver, Context context) {
            this.mReceiver = categoryReceiver;
            this.mAppContext = context.getApplicationContext();
        }

        @Override // android.os.AsyncTask
        public void onPostExecute(Void r1) {
            this.mReceiver.doneFetchingCategories();
        }

        @Override // android.os.AsyncTask
        public void onProgressUpdate(Category[] categoryArr) {
            Category[] categoryArr2 = categoryArr;
            super.onProgressUpdate(categoryArr2);
            for (Category category : categoryArr2) {
                if (category != null) {
                    this.mReceiver.onCategoryReceived(category);
                }
            }
        }
    }

    public DefaultCategoryProvider(Context context) {
        this.mAppContext = context.getApplicationContext();
        this.mNetworkStatusNotifier = InjectorProvider.getInjector().getNetworkStatusNotifier(context);
    }

    public void fetchCategories(final CategoryReceiver categoryReceiver, boolean z) {
        if (z || !this.mFetchedCategories) {
            if (z) {
                this.mCategories.clear();
                this.mFetchedCategories = false;
            }
            this.mNetworkStatus = ((DefaultNetworkStatusNotifier) this.mNetworkStatusNotifier).getNetworkStatus();
            this.mLocale = getLocale();
            final WallpaperCategoryProvider wallpaperCategoryProvider = (WallpaperCategoryProvider) this;
            final int[] iArr = {0};
            final CategoryReceiver categoryReceiver2 = new CategoryReceiver() { // from class: com.google.android.apps.wallpaper.module.WallpaperCategoryProvider.1
                @Override // com.android.wallpaper.model.CategoryReceiver
                public void doneFetchingCategories() {
                    int[] iArr2 = iArr;
                    iArr2[0] = iArr2[0] + 1;
                    if (iArr2[0] == 2) {
                        categoryReceiver.doneFetchingCategories();
                    }
                    WallpaperCategoryProvider.this.mFetchedCategories = true;
                }

                @Override // com.android.wallpaper.model.CategoryReceiver
                public void onCategoryReceived(Category category) {
                    categoryReceiver.onCategoryReceived(category);
                    int indexOf = WallpaperCategoryProvider.this.mCategories.indexOf(category);
                    if (indexOf >= 0) {
                        WallpaperCategoryProvider.this.mCategories.set(indexOf, category);
                    } else {
                        WallpaperCategoryProvider.this.mCategories.add(category);
                    }
                }
            };
            new WallpaperCategoryProvider.GoogleFetchCategoriesTask(categoryReceiver2, wallpaperCategoryProvider.mAppContext, z).execute(new Void[0]);
            final Context context = wallpaperCategoryProvider.mAppContext;
            Injector injector = InjectorProvider.getInjector();
            if (((DefaultNetworkStatusNotifier) injector.getNetworkStatusNotifier(context)).getNetworkStatus() == 0) {
                categoryReceiver2.doneFetchingCategories();
                return;
            }
            ServerFetcher serverFetcher = ((GoogleWallpapersInjector) injector).getServerFetcher(context);
            ServerFetcher.ResultsCallback<ImaxWallpaperProto$Collection> resultsCallback = new ServerFetcher.ResultsCallback<ImaxWallpaperProto$Collection>() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropCategory.1
                @Override // com.android.wallpaper.network.ServerFetcher.ResultsCallback
                public void onError(VolleyError volleyError) {
                    Log.e("BackdropCategory", "Unable to fetch Backdrop wallpaper categories", volleyError);
                    categoryReceiver2.doneFetchingCategories();
                }

                @Override // com.android.wallpaper.network.ServerFetcher.ResultsCallback
                public void onSuccess(List<ImaxWallpaperProto$Collection> list) {
                    for (ImaxWallpaperProto$Collection imaxWallpaperProto$Collection : list) {
                        BackdropCategory backdropCategory = new BackdropCategory(imaxWallpaperProto$Collection, r1);
                        categoryReceiver2.onCategoryReceived(backdropCategory);
                        backdropCategory.fetchWallpapers(context, null, false);
                    }
                    categoryReceiver2.doneFetchingCategories();
                }
            };
            BackdropFetcher backdropFetcher = (BackdropFetcher) serverFetcher;
            Objects.requireNonNull(backdropFetcher);
            ProtoRequest.Builder builder = new ProtoRequest.Builder();
            ProtoRequest.Callback<ImaxWallpaperProto$GetCollectionsResponse> callback = new ProtoRequest.Callback<ImaxWallpaperProto$GetCollectionsResponse>(backdropFetcher, resultsCallback) { // from class: com.google.android.apps.wallpaper.backdrop.BackdropFetcher.1
                public final /* synthetic */ ServerFetcher.ResultsCallback val$collectionsCallback;

                {
                    this.val$collectionsCallback = resultsCallback;
                }

                @Override // com.android.volley.Response.ErrorListener
                public void onErrorResponse(VolleyError volleyError) {
                    this.val$collectionsCallback.onError(volleyError);
                }

                @Override // com.android.volley.Response.Listener
                public void onResponse(Object obj) {
                    this.val$collectionsCallback.onSuccess(((ImaxWallpaperProto$GetCollectionsResponse) obj).getCollectionsList());
                }
            };
            ImaxWallpaperProto$GetCollectionsRequest.Builder newBuilder = ImaxWallpaperProto$GetCollectionsRequest.newBuilder();
            String language = backdropFetcher.getLanguage();
            newBuilder.copyOnWrite();
            ImaxWallpaperProto$GetCollectionsRequest.access$4400((ImaxWallpaperProto$GetCollectionsRequest) newBuilder.instance, language);
            List<String> filteringLabelList = backdropFetcher.getFilteringLabelList(context);
            newBuilder.copyOnWrite();
            ImaxWallpaperProto$GetCollectionsRequest.access$5200((ImaxWallpaperProto$GetCollectionsRequest) newBuilder.instance, filteringLabelList);
            builder.url = "https://clients3.google.com/cast/chromecast/home/wallpaper/collections?rt=b";
            builder.requestMethod = 1;
            builder.requestBody = newBuilder.build();
            builder.callback = callback;
            builder.responseParser = ImaxWallpaperProto$GetCollectionsResponse.parser();
            builder.headers.put("Accept", "application/x-protobuf");
            backdropFetcher.mRequester.addToRequestQueue(new ProtoRequest(builder));
            return;
        }
        Iterator<Category> it = this.mCategories.iterator();
        while (it.hasNext()) {
            categoryReceiver.onCategoryReceived(it.next());
        }
        categoryReceiver.doneFetchingCategories();
    }

    public Category getCategory(int i) {
        if (this.mFetchedCategories) {
            return this.mCategories.get(i);
        }
        throw new IllegalStateException("Categories are not available");
    }

    public final Locale getLocale() {
        return this.mAppContext.getResources().getConfiguration().getLocales().get(0);
    }

    public boolean resetIfNeeded() {
        if (this.mNetworkStatus == ((DefaultNetworkStatusNotifier) this.mNetworkStatusNotifier).getNetworkStatus() && this.mLocale == getLocale()) {
            return false;
        }
        this.mCategories.clear();
        this.mFetchedCategories = false;
        return true;
    }

    public Category getCategory(String str) {
        for (int i = 0; i < this.mCategories.size(); i++) {
            Category category = this.mCategories.get(i);
            if (category.mCollectionId.equals(str)) {
                return category;
            }
        }
        return null;
    }
}
