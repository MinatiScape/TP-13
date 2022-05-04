.class public Landroidx/fragment/app/DefaultSpecialEffectsController;
.super Landroidx/fragment/app/SpecialEffectsController;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;,
        Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;,
        Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/fragment/app/SpecialEffectsController;-><init>(Landroid/view/ViewGroup;)V

    return-void
.end method


# virtual methods
.method public captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    instance-of v0, p2, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    .line 2
    check-cast p2, Landroid/view/ViewGroup;

    .line 3
    invoke-virtual {p2}, Landroid/view/ViewGroup;->isTransitionGroup()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 5
    :cond_0
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_3

    .line 6
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 7
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_1

    .line 8
    invoke-virtual {p0, p1, v2}, Landroidx/fragment/app/DefaultSpecialEffectsController;->captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 9
    :cond_2
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_1
    return-void
.end method

.method public executeOperations(Ljava/util/List;Z)V
    .locals 38
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            ">;Z)V"
        }
    .end annotation

    move-object/from16 v7, p0

    move/from16 v6, p2

    .line 1
    sget-object v8, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->GONE:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    sget-object v9, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->VISIBLE:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 2
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v10, v1

    move-object v11, v2

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 3
    iget-object v4, v1, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 4
    iget-object v4, v4, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    invoke-static {v4}, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->from(Landroid/view/View;)Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    move-result-object v4

    .line 5
    iget-object v5, v1, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFinalState:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 6
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-eqz v5, :cond_2

    if-eq v5, v3, :cond_1

    if-eq v5, v2, :cond_2

    const/4 v2, 0x3

    if-eq v5, v2, :cond_2

    goto :goto_0

    :cond_1
    if-eq v4, v9, :cond_0

    move-object v11, v1

    goto :goto_0

    :cond_2
    if-ne v4, v9, :cond_0

    if-nez v10, :cond_0

    move-object v10, v1

    goto :goto_0

    .line 7
    :cond_3
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 8
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 9
    new-instance v14, Ljava/util/ArrayList;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 10
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 11
    new-instance v2, Landroidx/core/os/CancellationSignal;

    invoke-direct {v2}, Landroidx/core/os/CancellationSignal;-><init>()V

    .line 12
    invoke-virtual {v1}, Landroidx/fragment/app/SpecialEffectsController$Operation;->onStart()V

    .line 13
    iget-object v4, v1, Landroidx/fragment/app/SpecialEffectsController$Operation;->mSpecialEffectsSignals:Ljava/util/HashSet;

    invoke-virtual {v4, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 14
    new-instance v4, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;

    invoke-direct {v4, v1, v2}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;-><init>(Landroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/core/os/CancellationSignal;)V

    invoke-virtual {v12, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    new-instance v2, Landroidx/core/os/CancellationSignal;

    invoke-direct {v2}, Landroidx/core/os/CancellationSignal;-><init>()V

    .line 16
    invoke-virtual {v1}, Landroidx/fragment/app/SpecialEffectsController$Operation;->onStart()V

    .line 17
    iget-object v4, v1, Landroidx/fragment/app/SpecialEffectsController$Operation;->mSpecialEffectsSignals:Ljava/util/HashSet;

    invoke-virtual {v4, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 18
    new-instance v4, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    if-eqz v6, :cond_4

    if-ne v1, v10, :cond_5

    goto :goto_2

    :cond_4
    if-ne v1, v11, :cond_5

    :goto_2
    move v5, v3

    goto :goto_3

    :cond_5
    const/4 v5, 0x0

    .line 19
    :goto_3
    invoke-direct {v4, v1, v2, v6, v5}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;-><init>(Landroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/core/os/CancellationSignal;ZZ)V

    .line 20
    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    new-instance v2, Landroidx/fragment/app/DefaultSpecialEffectsController$1;

    invoke-direct {v2, v7, v14, v1}, Landroidx/fragment/app/DefaultSpecialEffectsController$1;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Ljava/util/List;Landroidx/fragment/app/SpecialEffectsController$Operation;)V

    .line 22
    iget-object v1, v1, Landroidx/fragment/app/SpecialEffectsController$Operation;->mCompletionListeners:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 23
    :cond_6
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 24
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    move-object v5, v1

    :cond_7
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .line 25
    invoke-virtual {v1}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->isVisibilityUnchanged()Z

    move-result v2

    if-eqz v2, :cond_8

    goto :goto_4

    .line 26
    :cond_8
    iget-object v2, v1, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->mTransition:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getHandlingImpl(Ljava/lang/Object;)Landroidx/fragment/app/FragmentTransitionImpl;

    move-result-object v2

    .line 27
    iget-object v3, v1, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->mSharedElementTransition:Ljava/lang/Object;

    .line 28
    invoke-virtual {v1, v3}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getHandlingImpl(Ljava/lang/Object;)Landroidx/fragment/app/FragmentTransitionImpl;

    move-result-object v3

    const-string v4, " returned Transition "

    const-string v16, "Mixing framework transitions and AndroidX transitions is not allowed. Fragment "

    if-eqz v2, :cond_a

    if-eqz v3, :cond_a

    if-ne v2, v3, :cond_9

    goto :goto_5

    .line 29
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static/range {v16 .. v16}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 30
    iget-object v3, v1, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->mOperation:Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 31
    iget-object v3, v3, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->mTransition:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " which uses a different Transition  type than its shared element transition "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->mSharedElementTransition:Ljava/lang/Object;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    :goto_5
    if-eqz v2, :cond_b

    goto :goto_6

    :cond_b
    move-object v2, v3

    :goto_6
    if-nez v5, :cond_c

    move-object v5, v2

    goto :goto_4

    :cond_c
    if-eqz v2, :cond_7

    if-ne v5, v2, :cond_d

    goto :goto_4

    .line 33
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static/range {v16 .. v16}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 34
    iget-object v3, v1, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->mOperation:Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 35
    iget-object v3, v3, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    iget-object v1, v1, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->mTransition:Ljava/lang/Object;

    .line 38
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " which uses a different Transition  type than other Fragments."

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    if-nez v5, :cond_10

    .line 39
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .line 40
    iget-object v2, v1, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->mOperation:Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 41
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v15, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    invoke-virtual {v1}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->completeSpecialEffect()V

    goto :goto_7

    :cond_f
    const/4 v0, 0x0

    const/4 v1, 0x1

    move v9, v1

    move-object/from16 v27, v12

    move-object/from16 v25, v14

    move-object v14, v8

    move-object v8, v15

    goto/16 :goto_1c

    .line 43
    :cond_10
    new-instance v4, Landroid/view/View;

    .line 44
    iget-object v0, v7, Landroidx/fragment/app/SpecialEffectsController;->mContainer:Landroid/view/ViewGroup;

    .line 45
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v4, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 46
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 47
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 48
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 49
    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    .line 50
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v24

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 p1, v3

    move-object/from16 v27, v12

    move-object/from16 v25, v14

    move-object/from16 v3, v16

    move-object/from16 v14, v17

    move/from16 v26, v18

    move-object/from16 v16, v4

    move-object v4, v10

    move-object v12, v11

    :goto_8
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_24

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v28, v14

    move-object/from16 v14, v17

    check-cast v14, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .line 51
    iget-object v14, v14, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->mSharedElementTransition:Ljava/lang/Object;

    if-eqz v14, :cond_11

    const/16 v17, 0x1

    goto :goto_9

    :cond_11
    const/16 v17, 0x0

    :goto_9
    if-eqz v17, :cond_23

    if-eqz v4, :cond_23

    if-eqz v12, :cond_23

    .line 52
    invoke-virtual {v5, v14}, Landroidx/fragment/app/FragmentTransitionImpl;->cloneTransition(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 53
    invoke-virtual {v5, v3}, Landroidx/fragment/app/FragmentTransitionImpl;->wrapTransitionInSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .line 54
    iget-object v3, v12, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 55
    iget-object v3, v3, Landroidx/fragment/app/Fragment;->mAnimationInfo:Landroidx/fragment/app/Fragment$AnimationInfo;

    if-eqz v3, :cond_12

    iget-object v3, v3, Landroidx/fragment/app/Fragment$AnimationInfo;->mSharedElementSourceNames:Ljava/util/ArrayList;

    if-nez v3, :cond_13

    .line 56
    :cond_12
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    :cond_13
    move-object/from16 v17, v5

    .line 57
    iget-object v5, v4, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 58
    iget-object v5, v5, Landroidx/fragment/app/Fragment;->mAnimationInfo:Landroidx/fragment/app/Fragment$AnimationInfo;

    if-eqz v5, :cond_14

    iget-object v5, v5, Landroidx/fragment/app/Fragment$AnimationInfo;->mSharedElementSourceNames:Ljava/util/ArrayList;

    if-nez v5, :cond_15

    .line 59
    :cond_14
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    :cond_15
    move-object/from16 v29, v9

    .line 60
    iget-object v9, v4, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 61
    iget-object v9, v9, Landroidx/fragment/app/Fragment;->mAnimationInfo:Landroidx/fragment/app/Fragment$AnimationInfo;

    if-eqz v9, :cond_16

    iget-object v9, v9, Landroidx/fragment/app/Fragment$AnimationInfo;->mSharedElementTargetNames:Ljava/util/ArrayList;

    if-nez v9, :cond_17

    .line 62
    :cond_16
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    :cond_17
    const/16 v18, 0x0

    move-object/from16 v30, v8

    move-object/from16 v31, v13

    move/from16 v8, v18

    .line 63
    :goto_a
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v8, v13, :cond_19

    .line 64
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v13

    move-object/from16 v18, v9

    const/4 v9, -0x1

    if-eq v13, v9, :cond_18

    .line 65
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v3, v13, v9}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_18
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v9, v18

    goto :goto_a

    .line 66
    :cond_19
    iget-object v5, v12, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 67
    iget-object v5, v5, Landroidx/fragment/app/Fragment;->mAnimationInfo:Landroidx/fragment/app/Fragment$AnimationInfo;

    if-eqz v5, :cond_1a

    iget-object v5, v5, Landroidx/fragment/app/Fragment$AnimationInfo;->mSharedElementTargetNames:Ljava/util/ArrayList;

    if-nez v5, :cond_1b

    .line 68
    :cond_1a
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    :cond_1b
    move-object v8, v5

    if-nez v6, :cond_1c

    .line 69
    iget-object v5, v4, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 70
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->getExitTransitionCallback()V

    .line 71
    iget-object v5, v12, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 72
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->getEnterTransitionCallback()V

    goto :goto_b

    .line 73
    :cond_1c
    iget-object v5, v4, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 74
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->getEnterTransitionCallback()V

    .line 75
    iget-object v5, v12, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 76
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->getExitTransitionCallback()V

    .line 77
    :goto_b
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v9, 0x0

    :goto_c
    if-ge v9, v5, :cond_1d

    .line 78
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 79
    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    move/from16 v19, v5

    move-object/from16 v5, v18

    check-cast v5, Ljava/lang/String;

    .line 80
    invoke-virtual {v0, v13, v5}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v9, v9, 0x1

    move/from16 v5, v19

    goto :goto_c

    .line 81
    :cond_1d
    new-instance v9, Landroidx/collection/ArrayMap;

    invoke-direct {v9}, Landroidx/collection/ArrayMap;-><init>()V

    .line 82
    iget-object v5, v4, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 83
    iget-object v5, v5, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v7, v9, v5}, Landroidx/fragment/app/DefaultSpecialEffectsController;->findNamedViews(Ljava/util/Map;Landroid/view/View;)V

    .line 84
    invoke-virtual {v9, v3}, Landroidx/collection/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    .line 85
    invoke-virtual {v9}, Landroidx/collection/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroidx/collection/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    .line 86
    new-instance v13, Landroidx/collection/ArrayMap;

    invoke-direct {v13}, Landroidx/collection/ArrayMap;-><init>()V

    .line 87
    iget-object v5, v12, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 88
    iget-object v5, v5, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v7, v13, v5}, Landroidx/fragment/app/DefaultSpecialEffectsController;->findNamedViews(Ljava/util/Map;Landroid/view/View;)V

    .line 89
    invoke-virtual {v13, v8}, Landroidx/collection/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    .line 90
    invoke-virtual {v0}, Landroidx/collection/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-virtual {v13, v5}, Landroidx/collection/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    .line 91
    invoke-static {v0, v13}, Landroidx/fragment/app/FragmentTransition;->retainValues(Landroidx/collection/ArrayMap;Landroidx/collection/ArrayMap;)V

    .line 92
    invoke-virtual {v0}, Landroidx/collection/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-virtual {v7, v9, v5}, Landroidx/fragment/app/DefaultSpecialEffectsController;->retainMatchingViews(Landroidx/collection/ArrayMap;Ljava/util/Collection;)V

    .line 93
    invoke-virtual {v0}, Landroidx/collection/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-virtual {v7, v13, v5}, Landroidx/fragment/app/DefaultSpecialEffectsController;->retainMatchingViews(Landroidx/collection/ArrayMap;Ljava/util/Collection;)V

    .line 94
    invoke-virtual {v0}, Landroidx/collection/SimpleArrayMap;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1e

    .line 95
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 96
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    const/4 v3, 0x0

    move-object/from16 v5, p1

    move-object/from16 v32, v0

    move-object v6, v2

    move-object v9, v10

    move-object v0, v12

    move-object v8, v15

    move-object/from16 v10, v17

    move-object v12, v1

    move-object/from16 v1, v16

    goto/16 :goto_11

    .line 97
    :cond_1e
    iget-object v5, v12, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    iget-object v4, v4, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    const/4 v12, 0x1

    .line 98
    invoke-static {v5, v4, v6, v9, v12}, Landroidx/fragment/app/FragmentTransition;->callSharedElementStartEnd(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLandroidx/collection/ArrayMap;Z)V

    .line 99
    iget-object v5, v7, Landroidx/fragment/app/SpecialEffectsController;->mContainer:Landroid/view/ViewGroup;

    .line 100
    new-instance v4, Landroidx/fragment/app/DefaultSpecialEffectsController$6;

    move-object/from16 v32, v0

    move-object v0, v4

    move-object v12, v1

    move-object/from16 v1, p0

    move-object v6, v2

    move-object v2, v11

    move-object/from16 v33, v11

    move-object/from16 v11, p1

    move-object/from16 p1, v3

    move-object v3, v10

    move-object/from16 v34, v10

    move-object/from16 v35, v15

    move-object/from16 v10, v16

    move-object v15, v4

    move/from16 v4, p2

    move-object/from16 v36, v10

    move-object/from16 v37, v11

    move-object/from16 v10, v17

    move-object v11, v5

    move-object v5, v13

    invoke-direct/range {v0 .. v5}, Landroidx/fragment/app/DefaultSpecialEffectsController$6;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/fragment/app/SpecialEffectsController$Operation;ZLandroidx/collection/ArrayMap;)V

    invoke-static {v11, v15}, Landroidx/core/view/OneShotPreDrawListener;->add(Landroid/view/View;Ljava/lang/Runnable;)Landroidx/core/view/OneShotPreDrawListener;

    .line 101
    invoke-virtual {v9}, Landroidx/collection/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Landroidx/collection/ArrayMap$ValueCollection;

    invoke-virtual {v0}, Landroidx/collection/ArrayMap$ValueCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d
    move-object v1, v0

    check-cast v1, Landroidx/collection/IndexBasedArrayIterator;

    invoke-virtual {v1}, Landroidx/collection/IndexBasedArrayIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-virtual {v1}, Landroidx/collection/IndexBasedArrayIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 102
    invoke-virtual {v7, v6, v1}, Landroidx/fragment/app/DefaultSpecialEffectsController;->captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V

    goto :goto_d

    .line 103
    :cond_1f
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_20

    const/4 v0, 0x0

    move-object/from16 v3, p1

    .line 104
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 105
    invoke-virtual {v9, v0}, Landroidx/collection/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 106
    invoke-virtual {v10, v14, v0}, Landroidx/fragment/app/FragmentTransitionImpl;->setEpicenter(Ljava/lang/Object;Landroid/view/View;)V

    goto :goto_e

    :cond_20
    move-object/from16 v0, v28

    .line 107
    :goto_e
    invoke-virtual {v13}, Landroidx/collection/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Landroidx/collection/ArrayMap$ValueCollection;

    invoke-virtual {v1}, Landroidx/collection/ArrayMap$ValueCollection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    move-object v2, v1

    check-cast v2, Landroidx/collection/IndexBasedArrayIterator;

    invoke-virtual {v2}, Landroidx/collection/IndexBasedArrayIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-virtual {v2}, Landroidx/collection/IndexBasedArrayIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 108
    invoke-virtual {v7, v12, v2}, Landroidx/fragment/app/DefaultSpecialEffectsController;->captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V

    goto :goto_f

    .line 109
    :cond_21
    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_22

    const/4 v1, 0x0

    .line 110
    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 111
    invoke-virtual {v13, v1}, Landroidx/collection/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-eqz v1, :cond_22

    .line 112
    iget-object v2, v7, Landroidx/fragment/app/SpecialEffectsController;->mContainer:Landroid/view/ViewGroup;

    .line 113
    new-instance v3, Landroidx/fragment/app/DefaultSpecialEffectsController$7;

    move-object/from16 v5, v37

    invoke-direct {v3, v7, v10, v1, v5}, Landroidx/fragment/app/DefaultSpecialEffectsController$7;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroidx/fragment/app/FragmentTransitionImpl;Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-static {v2, v3}, Landroidx/core/view/OneShotPreDrawListener;->add(Landroid/view/View;Ljava/lang/Runnable;)Landroidx/core/view/OneShotPreDrawListener;

    move-object/from16 v1, v36

    const/16 v26, 0x1

    goto :goto_10

    :cond_22
    move-object/from16 v5, v37

    move-object/from16 v1, v36

    .line 114
    :goto_10
    invoke-virtual {v10, v14, v1, v6}, Landroidx/fragment/app/FragmentTransitionImpl;->setSharedElementTargets(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v16, v10

    move-object/from16 v17, v14

    move-object/from16 v22, v14

    move-object/from16 v23, v12

    .line 115
    invoke-virtual/range {v16 .. v23}, Landroidx/fragment/app/FragmentTransitionImpl;->scheduleRemoveTargets(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 116
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v9, v34

    move-object/from16 v8, v35

    invoke-virtual {v8, v9, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v11, v33

    .line 117
    invoke-virtual {v8, v11, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v4, v9

    move-object v3, v14

    move-object v14, v0

    move-object v0, v11

    goto :goto_12

    :cond_23
    move-object/from16 v32, v0

    move-object v6, v2

    move-object/from16 v30, v8

    move-object/from16 v29, v9

    move-object v9, v10

    move-object v0, v12

    move-object/from16 v31, v13

    move-object v8, v15

    move-object v12, v1

    move-object v10, v5

    move-object/from16 v1, v16

    move-object/from16 v5, p1

    :goto_11
    move-object/from16 v14, v28

    :goto_12
    move-object/from16 v16, v1

    move-object/from16 p1, v5

    move-object v2, v6

    move-object v15, v8

    move-object v5, v10

    move-object v1, v12

    move-object/from16 v8, v30

    move-object/from16 v13, v31

    move/from16 v6, p2

    move-object v12, v0

    move-object v10, v9

    move-object/from16 v9, v29

    move-object/from16 v0, v32

    goto/16 :goto_8

    :cond_24
    move-object/from16 v32, v0

    move-object v6, v2

    move-object v10, v5

    move-object/from16 v30, v8

    move-object/from16 v29, v9

    move-object v0, v12

    move-object/from16 v31, v13

    move-object/from16 v28, v14

    move-object v8, v15

    move-object/from16 v5, p1

    move-object v12, v1

    move-object/from16 v1, v16

    .line 118
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 119
    invoke-virtual/range {v31 .. v31}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_13
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_31

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v2, v16

    check-cast v2, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .line 120
    invoke-virtual {v2}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->isVisibilityUnchanged()Z

    move-result v16

    if-eqz v16, :cond_25

    move-object/from16 p2, v13

    .line 121
    iget-object v13, v2, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->mOperation:Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-object/from16 v33, v11

    .line 122
    sget-object v11, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v8, v13, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    invoke-virtual {v2}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->completeSpecialEffect()V

    move-object v2, v0

    move-object/from16 v16, v1

    move-object/from16 v24, v3

    move-object v3, v14

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v14, v30

    goto/16 :goto_19

    :cond_25
    move-object/from16 v33, v11

    move-object/from16 p2, v13

    .line 124
    iget-object v11, v2, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->mTransition:Ljava/lang/Object;

    .line 125
    invoke-virtual {v10, v11}, Landroidx/fragment/app/FragmentTransitionImpl;->cloneTransition(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 126
    iget-object v13, v2, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->mOperation:Landroidx/fragment/app/SpecialEffectsController$Operation;

    if-eqz v3, :cond_27

    if-eq v13, v4, :cond_26

    if-ne v13, v0, :cond_27

    :cond_26
    const/4 v0, 0x1

    goto :goto_14

    :cond_27
    const/4 v0, 0x0

    :goto_14
    if-nez v11, :cond_29

    if-nez v0, :cond_28

    .line 127
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v8, v13, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    invoke-virtual {v2}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->completeSpecialEffect()V

    :cond_28
    move-object/from16 v16, v1

    move-object/from16 v24, v3

    move-object v2, v14

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v14, v30

    goto/16 :goto_18

    :cond_29
    move-object/from16 v24, v3

    .line 129
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v34, v14

    .line 130
    iget-object v14, v13, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 131
    iget-object v14, v14, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 132
    invoke-virtual {v7, v3, v14}, Landroidx/fragment/app/DefaultSpecialEffectsController;->captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V

    if-eqz v0, :cond_2b

    if-ne v13, v4, :cond_2a

    .line 133
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    goto :goto_15

    .line 134
    :cond_2a
    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 135
    :cond_2b
    :goto_15
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 136
    invoke-virtual {v10, v11, v1}, Landroidx/fragment/app/FragmentTransitionImpl;->addTarget(Ljava/lang/Object;Landroid/view/View;)V

    move-object/from16 v16, v1

    move-object/from16 v14, v30

    goto :goto_16

    .line 137
    :cond_2c
    invoke-virtual {v10, v11, v3}, Landroidx/fragment/app/FragmentTransitionImpl;->addTargets(Ljava/lang/Object;Ljava/util/ArrayList;)V

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v16, v10

    move-object/from16 v17, v11

    move-object/from16 v18, v11

    move-object/from16 v19, v3

    .line 138
    invoke-virtual/range {v16 .. v23}, Landroidx/fragment/app/FragmentTransitionImpl;->scheduleRemoveTargets(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 139
    iget-object v0, v13, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFinalState:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    move-object/from16 v14, v30

    if-ne v0, v14, :cond_2d

    .line 140
    iget-object v0, v13, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 141
    iget-object v0, v0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 142
    invoke-virtual {v10, v11, v0, v3}, Landroidx/fragment/app/FragmentTransitionImpl;->scheduleHideFragmentView(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 143
    iget-object v0, v7, Landroidx/fragment/app/SpecialEffectsController;->mContainer:Landroid/view/ViewGroup;

    move-object/from16 v16, v1

    .line 144
    new-instance v1, Landroidx/fragment/app/DefaultSpecialEffectsController$8;

    invoke-direct {v1, v7, v3}, Landroidx/fragment/app/DefaultSpecialEffectsController$8;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Ljava/util/ArrayList;)V

    invoke-static {v0, v1}, Landroidx/core/view/OneShotPreDrawListener;->add(Landroid/view/View;Ljava/lang/Runnable;)Landroidx/core/view/OneShotPreDrawListener;

    goto :goto_16

    :cond_2d
    move-object/from16 v16, v1

    .line 145
    :goto_16
    iget-object v0, v13, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFinalState:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    move-object/from16 v1, v29

    if-ne v0, v1, :cond_2f

    .line 146
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    if-eqz v26, :cond_2e

    .line 147
    invoke-virtual {v10, v11, v5}, Landroidx/fragment/app/FragmentTransitionImpl;->setEpicenter(Ljava/lang/Object;Landroid/graphics/Rect;)V

    :cond_2e
    move-object/from16 v0, v28

    goto :goto_17

    :cond_2f
    move-object/from16 v0, v28

    .line 148
    invoke-virtual {v10, v11, v0}, Landroidx/fragment/app/FragmentTransitionImpl;->setEpicenter(Ljava/lang/Object;Landroid/view/View;)V

    .line 149
    :goto_17
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v8, v13, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    iget-boolean v2, v2, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->mOverlapAllowed:Z

    if-eqz v2, :cond_30

    const/4 v2, 0x0

    .line 151
    invoke-virtual {v10, v15, v11, v2}, Landroidx/fragment/app/FragmentTransitionImpl;->mergeTransitionsTogether(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    move-object/from16 v2, v34

    goto :goto_18

    :cond_30
    const/4 v2, 0x0

    move-object/from16 v3, v34

    .line 152
    invoke-virtual {v10, v3, v11, v2}, Landroidx/fragment/app/FragmentTransitionImpl;->mergeTransitionsTogether(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    :goto_18
    move-object v3, v2

    move-object/from16 v2, v33

    :goto_19
    move-object/from16 v13, p2

    move-object/from16 v28, v0

    move-object/from16 v29, v1

    move-object v0, v2

    move-object/from16 v30, v14

    move-object/from16 v1, v16

    move-object/from16 v11, v33

    move-object v14, v3

    move-object/from16 v3, v24

    goto/16 :goto_13

    :cond_31
    move-object v2, v3

    move-object/from16 v33, v11

    move-object v3, v14

    move-object/from16 v14, v30

    .line 153
    invoke-virtual {v10, v15, v3, v2}, Landroidx/fragment/app/FragmentTransitionImpl;->mergeTransitionsInSequence(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 154
    invoke-virtual/range {v31 .. v31}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_37

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .line 155
    invoke-virtual {v3}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->isVisibilityUnchanged()Z

    move-result v5

    if-eqz v5, :cond_32

    goto :goto_1a

    .line 156
    :cond_32
    iget-object v5, v3, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->mTransition:Ljava/lang/Object;

    .line 157
    iget-object v11, v3, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->mOperation:Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-object/from16 v13, v33

    if-eqz v2, :cond_34

    if-eq v11, v4, :cond_33

    if-ne v11, v13, :cond_34

    :cond_33
    const/4 v15, 0x1

    goto :goto_1b

    :cond_34
    const/4 v15, 0x0

    :goto_1b
    if-nez v5, :cond_35

    if-eqz v15, :cond_36

    .line 158
    :cond_35
    iget-object v5, v11, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 159
    iget-object v11, v3, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->mSignal:Landroidx/core/os/CancellationSignal;

    .line 160
    new-instance v15, Landroidx/fragment/app/DefaultSpecialEffectsController$9;

    invoke-direct {v15, v7, v3}, Landroidx/fragment/app/DefaultSpecialEffectsController$9;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;)V

    .line 161
    invoke-virtual {v10, v5, v0, v11, v15}, Landroidx/fragment/app/FragmentTransitionImpl;->setListenerForTransitionEnd(Landroidx/fragment/app/Fragment;Ljava/lang/Object;Landroidx/core/os/CancellationSignal;Ljava/lang/Runnable;)V

    :cond_36
    move-object/from16 v33, v13

    goto :goto_1a

    :cond_37
    const/4 v1, 0x4

    .line 162
    invoke-static {v9, v1}, Landroidx/fragment/app/FragmentTransition;->setViewVisibility(Ljava/util/ArrayList;I)V

    .line 163
    invoke-virtual {v10, v12}, Landroidx/fragment/app/FragmentTransitionImpl;->prepareSetNameOverridesReordered(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v20

    .line 164
    iget-object v1, v7, Landroidx/fragment/app/SpecialEffectsController;->mContainer:Landroid/view/ViewGroup;

    .line 165
    invoke-virtual {v10, v1, v0}, Landroidx/fragment/app/FragmentTransitionImpl;->beginDelayedTransition(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    .line 166
    iget-object v0, v7, Landroidx/fragment/app/SpecialEffectsController;->mContainer:Landroid/view/ViewGroup;

    move-object/from16 v16, v10

    move-object/from16 v17, v0

    move-object/from16 v18, v6

    move-object/from16 v19, v12

    move-object/from16 v21, v32

    .line 167
    invoke-virtual/range {v16 .. v21}, Landroidx/fragment/app/FragmentTransitionImpl;->setNameOverridesReordered(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/Map;)V

    const/4 v0, 0x0

    .line 168
    invoke-static {v9, v0}, Landroidx/fragment/app/FragmentTransition;->setViewVisibility(Ljava/util/ArrayList;I)V

    .line 169
    invoke-virtual {v10, v2, v6, v12}, Landroidx/fragment/app/FragmentTransitionImpl;->swapSharedElementTargets(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    const/4 v9, 0x1

    .line 170
    :goto_1c
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v8, v1}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v10

    .line 171
    iget-object v11, v7, Landroidx/fragment/app/SpecialEffectsController;->mContainer:Landroid/view/ViewGroup;

    .line 172
    invoke-virtual {v11}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v12

    .line 173
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 174
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_1d
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "FragmentManager"

    if-eqz v1, :cond_3f

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;

    .line 175
    invoke-virtual {v6}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->isVisibilityUnchanged()Z

    move-result v1

    if-eqz v1, :cond_38

    .line 176
    invoke-virtual {v6}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->completeSpecialEffect()V

    goto :goto_1e

    .line 177
    :cond_38
    invoke-virtual {v6, v12}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->getAnimation(Landroid/content/Context;)Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    move-result-object v1

    if-nez v1, :cond_39

    .line 178
    invoke-virtual {v6}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->completeSpecialEffect()V

    goto :goto_1e

    .line 179
    :cond_39
    iget-object v5, v1, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;->animator:Landroid/animation/Animator;

    if-nez v5, :cond_3a

    .line 180
    invoke-virtual {v13, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 181
    :cond_3a
    iget-object v4, v6, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->mOperation:Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 182
    iget-object v1, v4, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 183
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v16, v5

    invoke-virtual {v8, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c

    const/4 v3, 0x2

    .line 184
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->isLoggingEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_3b

    .line 185
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Ignoring Animator set on "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " as this Fragment was involved in a Transition."

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    :cond_3b
    invoke-virtual {v6}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->completeSpecialEffect()V

    :goto_1e
    move-object/from16 v35, v8

    move/from16 p2, v9

    move-object/from16 v17, v25

    goto :goto_20

    .line 187
    :cond_3c
    iget-object v0, v4, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFinalState:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    if-ne v0, v14, :cond_3d

    move v5, v9

    goto :goto_1f

    :cond_3d
    const/4 v0, 0x0

    move v5, v0

    :goto_1f
    move-object/from16 v3, v25

    if-eqz v5, :cond_3e

    .line 188
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 189
    :cond_3e
    iget-object v2, v1, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 190
    invoke-virtual {v11, v2}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 191
    new-instance v1, Landroidx/fragment/app/DefaultSpecialEffectsController$2;

    move-object v0, v1

    move-object/from16 v35, v8

    move-object v8, v1

    move-object/from16 v1, p0

    move-object/from16 p1, v2

    move-object v2, v11

    move-object/from16 v17, v3

    move-object/from16 v3, p1

    move-object/from16 v18, v4

    move v4, v5

    move/from16 p2, v9

    move-object/from16 v9, v16

    move-object/from16 v5, v18

    move-object/from16 v16, v6

    invoke-direct/range {v0 .. v6}, Landroidx/fragment/app/DefaultSpecialEffectsController$2;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroid/view/ViewGroup;Landroid/view/View;ZLandroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;)V

    invoke-virtual {v9, v8}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    move-object/from16 v0, p1

    .line 192
    invoke-virtual {v9, v0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 193
    invoke-virtual {v9}, Landroid/animation/Animator;->start()V

    move-object/from16 v1, v16

    .line 194
    iget-object v0, v1, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->mSignal:Landroidx/core/os/CancellationSignal;

    .line 195
    new-instance v1, Landroidx/fragment/app/DefaultSpecialEffectsController$3;

    invoke-direct {v1, v7, v9}, Landroidx/fragment/app/DefaultSpecialEffectsController$3;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroid/animation/Animator;)V

    invoke-virtual {v0, v1}, Landroidx/core/os/CancellationSignal;->setOnCancelListener(Landroidx/core/os/CancellationSignal$OnCancelListener;)V

    move/from16 v0, p2

    :goto_20
    move/from16 v9, p2

    move-object/from16 v25, v17

    move-object/from16 v8, v35

    goto/16 :goto_1d

    :cond_3f
    move-object/from16 v17, v25

    .line 196
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_21
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_45

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;

    .line 197
    iget-object v4, v3, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->mOperation:Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 198
    iget-object v5, v4, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    const-string v6, "Ignoring Animation set on "

    if-eqz v10, :cond_41

    const/4 v4, 0x2

    .line 199
    invoke-static {v4}, Landroidx/fragment/app/FragmentManager;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_40

    .line 200
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " as Animations cannot run alongside Transitions."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    :cond_40
    invoke-virtual {v3}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->completeSpecialEffect()V

    goto :goto_21

    :cond_41
    if-eqz v0, :cond_43

    const/4 v4, 0x2

    .line 202
    invoke-static {v4}, Landroidx/fragment/app/FragmentManager;->isLoggingEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_42

    .line 203
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " as Animations cannot run alongside Animators."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    :cond_42
    invoke-virtual {v3}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->completeSpecialEffect()V

    goto :goto_21

    .line 205
    :cond_43
    iget-object v5, v5, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 206
    invoke-virtual {v3, v12}, Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;->getAnimation(Landroid/content/Context;)Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    move-result-object v6

    .line 207
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    iget-object v6, v6, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;->animation:Landroid/view/animation/Animation;

    .line 209
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    iget-object v4, v4, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFinalState:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 211
    sget-object v8, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->REMOVED:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    if-eq v4, v8, :cond_44

    .line 212
    invoke-virtual {v5, v6}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 213
    invoke-virtual {v3}, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->completeSpecialEffect()V

    goto :goto_22

    .line 214
    :cond_44
    invoke-virtual {v11, v5}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 215
    new-instance v4, Landroidx/fragment/app/FragmentAnim$EndViewTransitionAnimation;

    invoke-direct {v4, v6, v11, v5}, Landroidx/fragment/app/FragmentAnim$EndViewTransitionAnimation;-><init>(Landroid/view/animation/Animation;Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 216
    new-instance v6, Landroidx/fragment/app/DefaultSpecialEffectsController$4;

    invoke-direct {v6, v7, v11, v5, v3}, Landroidx/fragment/app/DefaultSpecialEffectsController$4;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroid/view/ViewGroup;Landroid/view/View;Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;)V

    invoke-virtual {v4, v6}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 217
    invoke-virtual {v5, v4}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 218
    :goto_22
    iget-object v4, v3, Landroidx/fragment/app/DefaultSpecialEffectsController$SpecialEffectsInfo;->mSignal:Landroidx/core/os/CancellationSignal;

    .line 219
    new-instance v6, Landroidx/fragment/app/DefaultSpecialEffectsController$5;

    invoke-direct {v6, v7, v5, v11, v3}, Landroidx/fragment/app/DefaultSpecialEffectsController$5;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController;Landroid/view/View;Landroid/view/ViewGroup;Landroidx/fragment/app/DefaultSpecialEffectsController$AnimationInfo;)V

    invoke-virtual {v4, v6}, Landroidx/core/os/CancellationSignal;->setOnCancelListener(Landroidx/core/os/CancellationSignal$OnCancelListener;)V

    goto/16 :goto_21

    .line 220
    :cond_45
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_23
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_46

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 221
    iget-object v2, v1, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFragment:Landroidx/fragment/app/Fragment;

    .line 222
    iget-object v2, v2, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 223
    iget-object v1, v1, Landroidx/fragment/app/SpecialEffectsController$Operation;->mFinalState:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 224
    invoke-virtual {v1, v2}, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->applyState(Landroid/view/View;)V

    goto :goto_23

    .line 225
    :cond_46
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public findNamedViews(Ljava/util/Map;Landroid/view/View;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 2
    invoke-virtual {p2}, Landroid/view/View;->getTransitionName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    :cond_0
    instance-of v0, p2, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    .line 5
    check-cast p2, Landroid/view/ViewGroup;

    .line 6
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 7
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 8
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_1

    .line 9
    invoke-virtual {p0, p1, v2}, Landroidx/fragment/app/DefaultSpecialEffectsController;->findNamedViews(Ljava/util/Map;Landroid/view/View;)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public retainMatchingViews(Landroidx/collection/ArrayMap;Ljava/util/Collection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/collection/ArrayMap<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroidx/collection/ArrayMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Landroidx/collection/ArrayMap$EntrySet;

    invoke-virtual {p0}, Landroidx/collection/ArrayMap$EntrySet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 2
    :cond_0
    :goto_0
    move-object p1, p0

    check-cast p1, Landroidx/collection/ArrayMap$MapIterator;

    invoke-virtual {p1}, Landroidx/collection/ArrayMap$MapIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3
    invoke-virtual {p1}, Landroidx/collection/ArrayMap$MapIterator;->next()Ljava/lang/Object;

    move-object v0, p1

    check-cast v0, Ljava/util/Map$Entry;

    .line 4
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getTransitionName()Ljava/lang/String;

    move-result-object v0

    .line 6
    invoke-interface {p2, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 7
    invoke-virtual {p1}, Landroidx/collection/ArrayMap$MapIterator;->remove()V

    goto :goto_0

    :cond_1
    return-void
.end method
