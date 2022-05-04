package androidx.cardview.widget;

import androidx.cardview.widget.CardView;
/* loaded from: classes.dex */
public class CardViewApi21Impl implements CardViewImpl {
    public final RoundRectDrawable getCardBackground(CardViewDelegate cardView) {
        return (RoundRectDrawable) ((CardView.AnonymousClass1) cardView).mCardBackground;
    }

    public float getRadius(CardViewDelegate cardView) {
        return getCardBackground(cardView).mRadius;
    }
}
