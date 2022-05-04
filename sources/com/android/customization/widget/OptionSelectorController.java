package com.android.customization.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.widget.TextView;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.RecyclerViewAccessibilityDelegate;
import com.android.customization.model.CustomizationManager;
import com.android.customization.model.CustomizationOption;
import com.android.customization.widget.OptionSelectorController;
import com.android.internal.util.Preconditions;
import com.android.systemui.shared.R;
import com.android.wallpaper.widget.GridPaddingDecoration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public final class OptionSelectorController<T extends CustomizationOption<T>> {
    public AnonymousClass1 mAdapter;
    public T mAppliedOption;
    public final int mCheckmarkStyle;
    public final RecyclerView mContainer;
    public float mLinearLayoutHorizontalDisplayOptionsMax;
    public final HashSet mListeners = new HashSet();
    public final List<T> mOptions;
    public T mSelectedOption;
    public final boolean mUseGrid;

    /* renamed from: com.android.customization.widget.OptionSelectorController$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 extends RecyclerView.Adapter<TileViewHolder> {
        public final /* synthetic */ CustomizationManager val$manager;

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final void onBindViewHolder(TileViewHolder tileViewHolder, int i) {
            TileViewHolder tileViewHolder2 = tileViewHolder;
            final T t = OptionSelectorController.this.mOptions.get(i);
            if (t.isActive(this.val$manager)) {
                OptionSelectorController optionSelectorController = OptionSelectorController.this;
                optionSelectorController.mAppliedOption = t;
                if (optionSelectorController.mSelectedOption == null) {
                    optionSelectorController.mSelectedOption = t;
                }
            }
            TextView textView = tileViewHolder2.labelView;
            if (textView != null) {
                textView.setText(t.getTitle());
            }
            tileViewHolder2.itemView.setActivated(t.equals(OptionSelectorController.this.mSelectedOption));
            t.bindThumbnailTile(tileViewHolder2.tileView);
            tileViewHolder2.itemView.setOnClickListener(new View.OnClickListener() { // from class: com.android.customization.widget.OptionSelectorController$1$$ExternalSyntheticLambda0
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    OptionSelectorController.AnonymousClass1 r1 = OptionSelectorController.AnonymousClass1.this;
                    OptionSelectorController.this.setSelectedOption(t);
                }
            });
            Resources resources = OptionSelectorController.this.mContainer.getContext().getResources();
            OptionSelectorController optionSelectorController2 = OptionSelectorController.this;
            if (optionSelectorController2.mCheckmarkStyle != 1 || !t.equals(optionSelectorController2.mAppliedOption)) {
                OptionSelectorController optionSelectorController3 = OptionSelectorController.this;
                int i2 = optionSelectorController3.mCheckmarkStyle;
                int i3 = R.drawable.check_circle_grey_large;
                if (i2 != 2 || !t.equals(optionSelectorController3.mAppliedOption)) {
                    OptionSelectorController optionSelectorController4 = OptionSelectorController.this;
                    if (optionSelectorController4.mCheckmarkStyle == 3 && t.equals(optionSelectorController4.mAppliedOption)) {
                        if (!t.equals(OptionSelectorController.this.mSelectedOption)) {
                            i3 = R.drawable.check_circle_grey_large_not_select;
                        }
                        drawCheckmark(t, tileViewHolder2, resources.getDrawable(i3, OptionSelectorController.this.mContainer.getContext().getTheme()), 17, resources.getDimensionPixelSize(R.dimen.center_check_size), 0, t.equals(OptionSelectorController.this.mSelectedOption));
                    } else if (t.equals(OptionSelectorController.this.mAppliedOption)) {
                        tileViewHolder2.setContentDescription(OptionSelectorController.this.mContainer.getContext(), t, R.string.option_previewed_description);
                    } else {
                        OptionSelectorController optionSelectorController5 = OptionSelectorController.this;
                        int i4 = optionSelectorController5.mCheckmarkStyle;
                        if (i4 != 0) {
                            if (i4 == 3) {
                                if (t.equals(optionSelectorController5.mSelectedOption)) {
                                    tileViewHolder2.setContentDescription(OptionSelectorController.this.mContainer.getContext(), t, R.string.option_previewed_description);
                                } else {
                                    tileViewHolder2.setContentDescription(OptionSelectorController.this.mContainer.getContext(), t, R.string.option_change_applied_previewed_description);
                                }
                            }
                            tileViewHolder2.tileView.setForeground(null);
                        }
                    }
                } else {
                    drawCheckmark(t, tileViewHolder2, resources.getDrawable(R.drawable.check_circle_grey_large, OptionSelectorController.this.mContainer.getContext().getTheme()), 17, resources.getDimensionPixelSize(R.dimen.center_check_size), 0, true);
                }
            } else {
                drawCheckmark(t, tileViewHolder2, resources.getDrawable(R.drawable.check_circle_accent_24dp, OptionSelectorController.this.mContainer.getContext().getTheme()), 85, resources.getDimensionPixelSize(R.dimen.check_size), resources.getDimensionPixelOffset(R.dimen.check_offset), true);
            }
        }

        public AnonymousClass1(CustomizationManager customizationManager) {
            this.val$manager = customizationManager;
        }

        public final void drawCheckmark(CustomizationOption<?> customizationOption, TileViewHolder tileViewHolder, Drawable drawable, int i, int i2, int i3, boolean z) {
            Drawable foreground = tileViewHolder.tileView.getForeground();
            Drawable[] drawableArr = {foreground, drawable};
            if (foreground == null) {
                drawableArr = new Drawable[]{drawable};
            }
            LayerDrawable layerDrawable = new LayerDrawable(drawableArr);
            int length = drawableArr.length - 1;
            layerDrawable.setLayerGravity(length, i);
            layerDrawable.setLayerWidth(length, i2);
            layerDrawable.setLayerHeight(length, i2);
            layerDrawable.setLayerInsetBottom(length, i3);
            layerDrawable.setLayerInsetRight(length, i3);
            tileViewHolder.tileView.setForeground(layerDrawable);
            if (z) {
                tileViewHolder.setContentDescription(OptionSelectorController.this.mContainer.getContext(), customizationOption, R.string.option_applied_previewed_description);
            } else {
                tileViewHolder.setContentDescription(OptionSelectorController.this.mContainer.getContext(), customizationOption, R.string.option_applied_description);
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final int getItemCount() {
            return OptionSelectorController.this.mOptions.size();
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final int getItemViewType(int i) {
            return OptionSelectorController.this.mOptions.get(i).getLayoutResId();
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final RecyclerView.ViewHolder onCreateViewHolder(RecyclerView recyclerView, int i) {
            return new TileViewHolder(LayoutInflater.from(recyclerView.getContext()).inflate(i, (ViewGroup) recyclerView, false));
        }
    }

    /* loaded from: classes.dex */
    public interface OptionSelectedListener {
        void onOptionSelected(CustomizationOption customizationOption);
    }

    /* loaded from: classes.dex */
    public class OptionSelectorAccessibilityDelegate extends RecyclerViewAccessibilityDelegate {
        public OptionSelectorAccessibilityDelegate(RecyclerView recyclerView) {
            super(recyclerView);
        }

        @Override // androidx.core.view.AccessibilityDelegateCompat
        public final boolean onRequestSendAccessibilityEvent(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
            int i;
            if (OptionSelectorController.this.mContainer.getLayoutManager() != null && OptionSelectorController.this.mContainer.getLayoutManager().canScrollHorizontally() && accessibilityEvent.getEventType() == 32768) {
                int childLayoutPosition = OptionSelectorController.this.mContainer.getChildLayoutPosition(view);
                int dimensionPixelOffset = (OptionSelectorController.this.mContainer.getContext().getResources().getDimensionPixelOffset(R.dimen.option_tile_margin_horizontal) * 2) + OptionSelectorController.this.mContainer.getContext().getResources().getDimensionPixelOffset(R.dimen.option_tile_width);
                LinearLayoutManager linearLayoutManager = (LinearLayoutManager) OptionSelectorController.this.mContainer.getLayoutManager();
                int i2 = -1;
                View findOneVisibleChild = linearLayoutManager.findOneVisibleChild(linearLayoutManager.getChildCount() - 1, -1, true, false);
                if (findOneVisibleChild == null) {
                    i = -1;
                } else {
                    i = RecyclerView.LayoutManager.getPosition(findOneVisibleChild);
                }
                if (childLayoutPosition >= i) {
                    OptionSelectorController.this.mContainer.scrollBy(dimensionPixelOffset, 0);
                } else {
                    LinearLayoutManager linearLayoutManager2 = (LinearLayoutManager) OptionSelectorController.this.mContainer.getLayoutManager();
                    View findOneVisibleChild2 = linearLayoutManager2.findOneVisibleChild(0, linearLayoutManager2.getChildCount(), true, false);
                    if (findOneVisibleChild2 != null) {
                        i2 = RecyclerView.LayoutManager.getPosition(findOneVisibleChild2);
                    }
                    if (childLayoutPosition <= i2 && childLayoutPosition != 0) {
                        OptionSelectorController.this.mContainer.scrollBy(-dimensionPixelOffset, 0);
                    }
                }
            }
            return super.onRequestSendAccessibilityEvent(viewGroup, view, accessibilityEvent);
        }
    }

    /* loaded from: classes.dex */
    public static final class ItemEndHorizontalSpaceItemDecoration extends RecyclerView.ItemDecoration {
        public final boolean mDirectionLTR;
        public final int mHorizontalSpacePx;

        public ItemEndHorizontalSpaceItemDecoration(Context context, int i) {
            boolean z;
            if (context.getResources().getConfiguration().getLayoutDirection() == 0) {
                z = true;
            } else {
                z = false;
            }
            this.mDirectionLTR = z;
            this.mHorizontalSpacePx = i;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.ItemDecoration
        public final void getItemOffsets(Rect rect, View view, RecyclerView recyclerView) {
            if (recyclerView.getAdapter() != null && recyclerView.getChildAdapterPosition(view) != ((RecyclerView.Adapter) Preconditions.checkNotNull(recyclerView.getAdapter())).getItemCount() - 1) {
                if (this.mDirectionLTR) {
                    rect.right = this.mHorizontalSpacePx;
                } else {
                    rect.left = this.mHorizontalSpacePx;
                }
            }
        }
    }

    /* loaded from: classes.dex */
    public static class TileViewHolder extends RecyclerView.ViewHolder {
        public TextView labelView;
        public View tileView;
        public CharSequence title = null;

        public TileViewHolder(View view) {
            super(view);
            this.labelView = (TextView) view.findViewById(R.id.option_label);
            this.tileView = view.findViewById(R.id.option_tile);
        }

        public final void setContentDescription(Context context, CustomizationOption<?> customizationOption, int i) {
            View view;
            String title = customizationOption.getTitle();
            this.title = title;
            if (TextUtils.isEmpty(title) && (view = this.tileView) != null) {
                this.title = view.getContentDescription();
            }
            String string = context.getString(i, this.title);
            TextView textView = this.labelView;
            if (textView == null || TextUtils.isEmpty(textView.getText())) {
                View view2 = this.tileView;
                if (view2 != null) {
                    view2.setAccessibilityPaneTitle(string);
                    this.tileView.setContentDescription(string);
                    return;
                }
                return;
            }
            this.labelView.setAccessibilityPaneTitle(string);
            this.labelView.setContentDescription(string);
        }
    }

    public final void initOptions(CustomizationManager<T> customizationManager) {
        this.mContainer.setAccessibilityDelegateCompat(new OptionSelectorAccessibilityDelegate(this.mContainer));
        this.mAdapter = new AnonymousClass1(customizationManager);
        Resources resources = this.mContainer.getContext().getResources();
        if (this.mUseGrid) {
            RecyclerView recyclerView = this.mContainer;
            recyclerView.getContext();
            recyclerView.setLayoutManager(new GridLayoutManager(resources.getInteger(R.integer.options_grid_num_columns)));
        } else {
            RecyclerView recyclerView2 = this.mContainer;
            recyclerView2.getContext();
            recyclerView2.setLayoutManager(new LinearLayoutManager(0));
        }
        this.mContainer.setAdapter(this.mAdapter);
        this.mContainer.measure(0, 0);
        int dimensionPixelSize = resources.getDimensionPixelSize(R.dimen.options_container_width);
        if (dimensionPixelSize == 0) {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            ((WindowManager) this.mContainer.getContext().getSystemService(WindowManager.class)).getDefaultDisplay().getMetrics(displayMetrics);
            dimensionPixelSize = displayMetrics.widthPixels;
        }
        int measuredWidth = this.mContainer.getMeasuredWidth();
        int dimensionPixelOffset = resources.getDimensionPixelOffset(R.dimen.option_tile_width);
        if (this.mUseGrid) {
            int integer = resources.getInteger(R.integer.options_grid_num_columns);
            while (dimensionPixelSize - (dimensionPixelOffset * integer) < 0) {
                integer--;
            }
            if (this.mContainer.getLayoutManager() != null) {
                ((GridLayoutManager) this.mContainer.getLayoutManager()).setSpanCount(integer);
            }
            if (this.mContainer.getItemDecorationCount() == 0) {
                RecyclerView recyclerView3 = this.mContainer;
                recyclerView3.addItemDecoration(new GridPaddingDecoration(recyclerView3.getContext().getResources().getDimensionPixelSize(R.dimen.option_tile_grid_padding_horizontal), 0));
                return;
            }
            return;
        }
        int i = dimensionPixelSize - measuredWidth;
        if (i >= 0) {
            this.mContainer.setOverScrollMode(2);
        }
        float f = this.mLinearLayoutHorizontalDisplayOptionsMax;
        if (this.mAdapter.getItemCount() >= f) {
            int round = ((dimensionPixelSize - Math.round(dimensionPixelOffset * f)) - this.mContainer.getPaddingLeft()) / ((int) this.mLinearLayoutHorizontalDisplayOptionsMax);
            if (round <= 0) {
                round = resources.getDimensionPixelOffset(R.dimen.option_tile_margin_horizontal);
            }
            RecyclerView recyclerView4 = this.mContainer;
            recyclerView4.addItemDecoration(new ItemEndHorizontalSpaceItemDecoration(recyclerView4.getContext(), round));
            return;
        }
        this.mContainer.addItemDecoration(new HorizontalSpacerItemDecoration((i / (this.mAdapter.getItemCount() + 1)) / 2));
    }

    public final void setSelectedOption(T t) {
        if (this.mOptions.contains(t)) {
            T t2 = this.mSelectedOption;
            this.mSelectedOption = t;
            this.mAdapter.notifyItemChanged(this.mOptions.indexOf(t));
            if (t2 != null) {
                this.mAdapter.notifyItemChanged(this.mOptions.indexOf(t2));
            }
            if (!this.mListeners.isEmpty()) {
                T t3 = this.mSelectedOption;
                Iterator it = new HashSet(this.mListeners).iterator();
                while (it.hasNext()) {
                    ((OptionSelectedListener) it.next()).onOptionSelected(t3);
                }
                return;
            }
            return;
        }
        throw new IllegalArgumentException("Invalid option");
    }

    public OptionSelectorController(RecyclerView recyclerView, List<T> list, boolean z, int i) {
        this.mContainer = recyclerView;
        this.mOptions = list;
        this.mUseGrid = z;
        this.mCheckmarkStyle = i;
        TypedValue typedValue = new TypedValue();
        recyclerView.getResources().getValue(R.dimen.linear_layout_horizontal_display_options_max, typedValue, true);
        this.mLinearLayoutHorizontalDisplayOptionsMax = typedValue.getFloat();
    }
}
