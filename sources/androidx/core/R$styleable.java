package androidx.core;

import android.text.Editable;
import android.text.Selection;
import android.view.KeyEvent;
import androidx.emoji2.text.EmojiSpan;
import com.android.systemui.shared.R;
/* loaded from: classes.dex */
public final class R$styleable {
    public static final int[] ColorStateListItem = {16843173, 16843551, 16844359, R.attr.alpha, R.attr.lStar};
    public static final int[] FontFamily = {R.attr.fontProviderAuthority, R.attr.fontProviderCerts, R.attr.fontProviderFetchStrategy, R.attr.fontProviderFetchTimeout, R.attr.fontProviderPackage, R.attr.fontProviderQuery, R.attr.fontProviderSystemFontFamily};
    public static final int[] FontFamilyFont = {16844082, 16844083, 16844095, 16844143, 16844144, R.attr.font, R.attr.fontStyle, R.attr.fontVariationSettings, R.attr.fontWeight, R.attr.ttcIndex};
    public static final int[] GradientColor = {16843165, 16843166, 16843169, 16843170, 16843171, 16843172, 16843265, 16843275, 16844048, 16844049, 16844050, 16844051};
    public static final int[] GradientColorItem = {16843173, 16844052};
    public static final int[] RowStyle = {R.attr.actionDividerHeight, R.attr.bottomDividerEndPadding, R.attr.bottomDividerStartPadding, R.attr.contentEndPadding, R.attr.contentStartPadding, R.attr.disableRecyclerViewItemAnimator, R.attr.endItemEndPadding, R.attr.endItemStartPadding, R.attr.iconSize, R.attr.imageSize, R.attr.progressBarEndPadding, R.attr.progressBarInlineWidth, R.attr.progressBarStartPadding, R.attr.seekBarInlineWidth, R.attr.subContentEndPadding, R.attr.subContentStartPadding, R.attr.subtitleColor, R.attr.textActionPadding, R.attr.tintColor, R.attr.titleColor, R.attr.titleEndPadding, R.attr.titleItemEndPadding, R.attr.titleItemStartPadding, R.attr.titleStartPadding};
    public static final int[] SliceView = {R.attr.expandToAvailableHeight, R.attr.gridBottomPadding, R.attr.gridSubtitleSize, R.attr.gridTextVerticalPadding, R.attr.gridTitleSize, R.attr.gridTopPadding, R.attr.headerSubtitleSize, R.attr.headerTextVerticalPadding, R.attr.headerTitleSize, R.attr.hideHeaderRow, R.attr.imageCornerRadius, R.attr.rowInlineRangeHeight, R.attr.rowMaxHeight, R.attr.rowMinHeight, R.attr.rowRangeHeight, R.attr.rowRangeSingleTextHeight, R.attr.rowStyle, R.attr.subtitleColor, R.attr.subtitleSize, R.attr.textVerticalPadding, R.attr.tintColor, R.attr.titleColor, R.attr.titleSize};

    public static boolean delete(Editable editable, KeyEvent keyEvent, boolean z) {
        boolean z2;
        EmojiSpan[] emojiSpanArr;
        if (!KeyEvent.metaStateHasNoModifiers(keyEvent.getMetaState())) {
            return false;
        }
        int selectionStart = Selection.getSelectionStart(editable);
        int selectionEnd = Selection.getSelectionEnd(editable);
        if (selectionStart == -1 || selectionEnd == -1 || selectionStart != selectionEnd) {
            z2 = true;
        } else {
            z2 = false;
        }
        if (!z2 && (emojiSpanArr = (EmojiSpan[]) editable.getSpans(selectionStart, selectionEnd, EmojiSpan.class)) != null && emojiSpanArr.length > 0) {
            for (EmojiSpan emojiSpan : emojiSpanArr) {
                int spanStart = editable.getSpanStart(emojiSpan);
                int spanEnd = editable.getSpanEnd(emojiSpan);
                if ((z && spanStart == selectionStart) || ((!z && spanEnd == selectionStart) || (selectionStart > spanStart && selectionStart < spanEnd))) {
                    editable.delete(spanStart, spanEnd);
                    return true;
                }
            }
        }
        return false;
    }
}
