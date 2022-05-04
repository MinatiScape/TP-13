.class public final Landroidx/constraintlayout/solver/widgets/Chain;
.super Ljava/lang/Object;
.source "Chain.java"


# direct methods
.method public static applyChainConstraints(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;Landroidx/constraintlayout/solver/LinearSystem;I)V
    .locals 40

    .line 0
    move-object/from16 v0, p0

    .line 1
    .line 2
    move-object/from16 v10, p1

    .line 3
    .line 4
    sget-object v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 5
    .line 6
    const/4 v12, 0x2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    iget v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    .line 10
    .line 11
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    .line 12
    .line 13
    move v14, v1

    .line 14
    move-object v15, v2

    .line 15
    const/16 v16, 0x0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    .line 19
    .line 20
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    .line 21
    .line 22
    move v14, v1

    .line 23
    move-object v15, v2

    .line 24
    move/from16 v16, v12

    .line 25
    .line 26
    :goto_0
    const/4 v9, 0x0

    .line 27
    :goto_1
    if-ge v9, v14, :cond_6a

    .line 28
    .line 29
    aget-object v1, v15, v9

    .line 30
    .line 31
    iget-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mDefined:Z

    .line 32
    .line 33
    const/16 v17, 0x0

    .line 34
    .line 35
    const/16 v8, 0x8

    .line 36
    .line 37
    const/4 v4, 0x1

    .line 38
    if-nez v2, :cond_16

    .line 39
    .line 40
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    .line 41
    .line 42
    mul-int/2addr v2, v12

    .line 43
    iget-object v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirst:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 44
    .line 45
    move-object v6, v5

    .line 46
    const/4 v7, 0x0

    .line 47
    :goto_2
    if-nez v7, :cond_11

    .line 48
    .line 49
    iget v13, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsCount:I

    .line 50
    .line 51
    add-int/2addr v13, v4

    .line 52
    iput v13, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsCount:I

    .line 53
    .line 54
    iget-object v13, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 55
    .line 56
    iget v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    .line 57
    .line 58
    aput-object v17, v13, v3

    .line 59
    .line 60
    iget-object v13, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListNextMatchConstraintsWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 61
    .line 62
    aput-object v17, v13, v3

    .line 63
    .line 64
    iget v13, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    .line 65
    .line 66
    if-eq v13, v8, :cond_c

    .line 67
    .line 68
    invoke-virtual {v5, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getDimensionBehaviour(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    if-eq v3, v11, :cond_1

    .line 73
    .line 74
    iget v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    .line 75
    .line 76
    :cond_1
    iget-object v3, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 77
    .line 78
    aget-object v3, v3, v2

    .line 79
    .line 80
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 81
    .line 82
    .line 83
    iget-object v3, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 84
    .line 85
    add-int/lit8 v13, v2, 0x1

    .line 86
    .line 87
    aget-object v3, v3, v13

    .line 88
    .line 89
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 90
    .line 91
    .line 92
    iget-object v3, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 93
    .line 94
    aget-object v3, v3, v2

    .line 95
    .line 96
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 97
    .line 98
    .line 99
    iget-object v3, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 100
    .line 101
    aget-object v3, v3, v13

    .line 102
    .line 103
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 104
    .line 105
    .line 106
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 107
    .line 108
    if-nez v3, :cond_2

    .line 109
    .line 110
    iput-object v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 111
    .line 112
    :cond_2
    iput-object v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLastVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 113
    .line 114
    iget-object v3, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 115
    .line 116
    iget v13, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    .line 117
    .line 118
    aget-object v3, v3, v13

    .line 119
    .line 120
    if-ne v3, v11, :cond_c

    .line 121
    .line 122
    iget-object v8, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    .line 123
    .line 124
    aget v8, v8, v13

    .line 125
    .line 126
    const/4 v4, 0x3

    .line 127
    if-eqz v8, :cond_3

    .line 128
    .line 129
    if-eq v8, v4, :cond_3

    .line 130
    .line 131
    if-ne v8, v12, :cond_c

    .line 132
    .line 133
    :cond_3
    iget v12, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    .line 134
    .line 135
    const/16 v21, 0x1

    .line 136
    .line 137
    add-int/lit8 v12, v12, 0x1

    .line 138
    .line 139
    iput v12, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    .line 140
    .line 141
    iget-object v12, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWeight:[F

    .line 142
    .line 143
    aget v12, v12, v13

    .line 144
    .line 145
    const/4 v13, 0x0

    .line 146
    cmpl-float v23, v12, v13

    .line 147
    .line 148
    if-lez v23, :cond_4

    .line 149
    .line 150
    iget v13, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalWeight:F

    .line 151
    .line 152
    add-float/2addr v13, v12

    .line 153
    iput v13, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalWeight:F

    .line 154
    .line 155
    :cond_4
    iget v13, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    .line 156
    .line 157
    const/16 v4, 0x8

    .line 158
    .line 159
    if-eq v13, v4, :cond_6

    .line 160
    .line 161
    if-ne v3, v11, :cond_6

    .line 162
    .line 163
    if-eqz v8, :cond_5

    .line 164
    .line 165
    const/4 v3, 0x3

    .line 166
    if-ne v8, v3, :cond_6

    .line 167
    .line 168
    :cond_5
    const/4 v3, 0x1

    .line 169
    goto :goto_3

    .line 170
    :cond_6
    const/4 v3, 0x0

    .line 171
    :goto_3
    if-eqz v3, :cond_9

    .line 172
    .line 173
    const/4 v3, 0x0

    .line 174
    cmpg-float v4, v12, v3

    .line 175
    .line 176
    if-gez v4, :cond_7

    .line 177
    .line 178
    const/4 v3, 0x1

    .line 179
    iput-boolean v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasUndefinedWeights:Z

    .line 180
    .line 181
    goto :goto_4

    .line 182
    :cond_7
    const/4 v3, 0x1

    .line 183
    iput-boolean v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasDefinedWeights:Z

    .line 184
    .line 185
    :goto_4
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWeightedMatchConstraintsWidgets:Ljava/util/ArrayList;

    .line 186
    .line 187
    if-nez v3, :cond_8

    .line 188
    .line 189
    new-instance v3, Ljava/util/ArrayList;

    .line 190
    .line 191
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 192
    .line 193
    .line 194
    iput-object v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWeightedMatchConstraintsWidgets:Ljava/util/ArrayList;

    .line 195
    .line 196
    :cond_8
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWeightedMatchConstraintsWidgets:Ljava/util/ArrayList;

    .line 197
    .line 198
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    :cond_9
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstMatchConstraintWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 202
    .line 203
    if-nez v3, :cond_a

    .line 204
    .line 205
    iput-object v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstMatchConstraintWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 206
    .line 207
    :cond_a
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLastMatchConstraintWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 208
    .line 209
    if-eqz v3, :cond_b

    .line 210
    .line 211
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListNextMatchConstraintsWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 212
    .line 213
    iget v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    .line 214
    .line 215
    aput-object v5, v3, v4

    .line 216
    .line 217
    :cond_b
    iput-object v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLastMatchConstraintWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 218
    .line 219
    :cond_c
    if-eq v6, v5, :cond_d

    .line 220
    .line 221
    iget-object v3, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 222
    .line 223
    iget v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    .line 224
    .line 225
    aput-object v5, v3, v4

    .line 226
    .line 227
    :cond_d
    iget-object v3, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 228
    .line 229
    add-int/lit8 v4, v2, 0x1

    .line 230
    .line 231
    aget-object v3, v3, v4

    .line 232
    .line 233
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 234
    .line 235
    if-eqz v3, :cond_e

    .line 236
    .line 237
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 238
    .line 239
    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 240
    .line 241
    aget-object v4, v4, v2

    .line 242
    .line 243
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 244
    .line 245
    if-eqz v4, :cond_e

    .line 246
    .line 247
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 248
    .line 249
    if-eq v4, v5, :cond_f

    .line 250
    .line 251
    :cond_e
    move-object/from16 v3, v17

    .line 252
    .line 253
    :cond_f
    if-eqz v3, :cond_10

    .line 254
    .line 255
    goto :goto_5

    .line 256
    :cond_10
    move-object v3, v5

    .line 257
    const/4 v7, 0x1

    .line 258
    :goto_5
    move-object v6, v5

    .line 259
    const/4 v4, 0x1

    .line 260
    const/16 v8, 0x8

    .line 261
    .line 262
    const/4 v12, 0x2

    .line 263
    move-object v5, v3

    .line 264
    goto/16 :goto_2

    .line 265
    .line 266
    :cond_11
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 267
    .line 268
    if-eqz v3, :cond_12

    .line 269
    .line 270
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 271
    .line 272
    aget-object v3, v3, v2

    .line 273
    .line 274
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 275
    .line 276
    .line 277
    :cond_12
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLastVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 278
    .line 279
    if-eqz v3, :cond_13

    .line 280
    .line 281
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 282
    .line 283
    add-int/lit8 v2, v2, 0x1

    .line 284
    .line 285
    aget-object v2, v3, v2

    .line 286
    .line 287
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 288
    .line 289
    .line 290
    :cond_13
    iput-object v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLast:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 291
    .line 292
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    .line 293
    .line 294
    if-nez v2, :cond_14

    .line 295
    .line 296
    iget-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mIsRtl:Z

    .line 297
    .line 298
    if-eqz v2, :cond_14

    .line 299
    .line 300
    iput-object v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHead:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 301
    .line 302
    goto :goto_6

    .line 303
    :cond_14
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirst:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 304
    .line 305
    iput-object v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHead:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 306
    .line 307
    :goto_6
    iget-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasDefinedWeights:Z

    .line 308
    .line 309
    if-eqz v2, :cond_15

    .line 310
    .line 311
    iget-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasUndefinedWeights:Z

    .line 312
    .line 313
    if-eqz v2, :cond_15

    .line 314
    .line 315
    const/4 v2, 0x1

    .line 316
    goto :goto_7

    .line 317
    :cond_15
    const/4 v2, 0x0

    .line 318
    :goto_7
    iput-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasComplexMatchWeights:Z

    .line 319
    .line 320
    const/4 v2, 0x1

    .line 321
    goto :goto_8

    .line 322
    :cond_16
    move v2, v4

    .line 323
    :goto_8
    iput-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mDefined:Z

    .line 324
    .line 325
    iget-object v12, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirst:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 326
    .line 327
    iget-object v13, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLast:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 328
    .line 329
    iget-object v8, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 330
    .line 331
    iget-object v7, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLastVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 332
    .line 333
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHead:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 334
    .line 335
    iget v3, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalWeight:F

    .line 336
    .line 337
    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 338
    .line 339
    aget-object v4, v4, p2

    .line 340
    .line 341
    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 342
    .line 343
    if-ne v4, v5, :cond_17

    .line 344
    .line 345
    const/4 v4, 0x1

    .line 346
    goto :goto_9

    .line 347
    :cond_17
    const/4 v4, 0x0

    .line 348
    :goto_9
    if-nez p2, :cond_1a

    .line 349
    .line 350
    iget v5, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    .line 351
    .line 352
    const/4 v6, 0x1

    .line 353
    if-nez v5, :cond_18

    .line 354
    .line 355
    const/16 v21, 0x1

    .line 356
    .line 357
    goto :goto_a

    .line 358
    :cond_18
    const/16 v21, 0x0

    .line 359
    .line 360
    :goto_a
    if-ne v5, v6, :cond_19

    .line 361
    .line 362
    move/from16 v22, v6

    .line 363
    .line 364
    move/from16 v23, v9

    .line 365
    .line 366
    const/4 v9, 0x2

    .line 367
    goto :goto_b

    .line 368
    :cond_19
    move/from16 v23, v9

    .line 369
    .line 370
    const/4 v9, 0x2

    .line 371
    const/16 v22, 0x0

    .line 372
    .line 373
    :goto_b
    move/from16 v6, v22

    .line 374
    .line 375
    move/from16 v22, v21

    .line 376
    .line 377
    if-ne v5, v9, :cond_1d

    .line 378
    .line 379
    goto :goto_e

    .line 380
    :cond_1a
    move/from16 v23, v9

    .line 381
    .line 382
    const/4 v6, 0x1

    .line 383
    const/4 v9, 0x2

    .line 384
    iget v5, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    .line 385
    .line 386
    if-nez v5, :cond_1b

    .line 387
    .line 388
    move/from16 v22, v6

    .line 389
    .line 390
    goto :goto_c

    .line 391
    :cond_1b
    const/16 v22, 0x0

    .line 392
    .line 393
    :goto_c
    if-ne v5, v6, :cond_1c

    .line 394
    .line 395
    const/4 v6, 0x1

    .line 396
    goto :goto_d

    .line 397
    :cond_1c
    const/4 v6, 0x0

    .line 398
    :goto_d
    if-ne v5, v9, :cond_1d

    .line 399
    .line 400
    :goto_e
    move/from16 v24, v22

    .line 401
    .line 402
    const/4 v5, 0x1

    .line 403
    :goto_f
    move/from16 v22, v6

    .line 404
    .line 405
    goto :goto_10

    .line 406
    :cond_1d
    move/from16 v24, v22

    .line 407
    .line 408
    const/4 v5, 0x0

    .line 409
    goto :goto_f

    .line 410
    :goto_10
    move/from16 v26, v3

    .line 411
    .line 412
    move-object v9, v12

    .line 413
    const/4 v6, 0x0

    .line 414
    :goto_11
    if-nez v6, :cond_2a

    .line 415
    .line 416
    iget-object v3, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 417
    .line 418
    aget-object v3, v3, v16

    .line 419
    .line 420
    if-eqz v5, :cond_1e

    .line 421
    .line 422
    const/16 v30, 0x1

    .line 423
    .line 424
    goto :goto_12

    .line 425
    :cond_1e
    const/16 v30, 0x4

    .line 426
    .line 427
    :goto_12
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 428
    .line 429
    .line 430
    move-result v31

    .line 431
    move/from16 v32, v6

    .line 432
    .line 433
    iget-object v6, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 434
    .line 435
    aget-object v6, v6, p2

    .line 436
    .line 437
    if-ne v6, v11, :cond_1f

    .line 438
    .line 439
    iget-object v6, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    .line 440
    .line 441
    aget v6, v6, p2

    .line 442
    .line 443
    if-nez v6, :cond_1f

    .line 444
    .line 445
    move/from16 v33, v14

    .line 446
    .line 447
    const/4 v6, 0x1

    .line 448
    goto :goto_13

    .line 449
    :cond_1f
    move/from16 v33, v14

    .line 450
    .line 451
    const/4 v6, 0x0

    .line 452
    :goto_13
    iget-object v14, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 453
    .line 454
    if-eqz v14, :cond_20

    .line 455
    .line 456
    if-eq v9, v12, :cond_20

    .line 457
    .line 458
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 459
    .line 460
    .line 461
    move-result v14

    .line 462
    add-int v31, v14, v31

    .line 463
    .line 464
    :cond_20
    move/from16 v14, v31

    .line 465
    .line 466
    if-eqz v5, :cond_21

    .line 467
    .line 468
    if-eq v9, v12, :cond_21

    .line 469
    .line 470
    if-eq v9, v8, :cond_21

    .line 471
    .line 472
    move-object/from16 v31, v15

    .line 473
    .line 474
    const/16 v30, 0x5

    .line 475
    .line 476
    goto :goto_14

    .line 477
    :cond_21
    move-object/from16 v31, v15

    .line 478
    .line 479
    :goto_14
    iget-object v15, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 480
    .line 481
    if-eqz v15, :cond_24

    .line 482
    .line 483
    if-ne v9, v8, :cond_22

    .line 484
    .line 485
    move-object/from16 v34, v2

    .line 486
    .line 487
    iget-object v2, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 488
    .line 489
    iget-object v15, v15, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 490
    .line 491
    move-object/from16 v35, v12

    .line 492
    .line 493
    const/4 v12, 0x6

    .line 494
    invoke-virtual {v10, v2, v15, v14, v12}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 495
    .line 496
    .line 497
    goto :goto_15

    .line 498
    :cond_22
    move-object/from16 v34, v2

    .line 499
    .line 500
    move-object/from16 v35, v12

    .line 501
    .line 502
    iget-object v2, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 503
    .line 504
    iget-object v12, v15, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 505
    .line 506
    const/4 v15, 0x7

    .line 507
    invoke-virtual {v10, v2, v12, v14, v15}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 508
    .line 509
    .line 510
    :goto_15
    if-eqz v6, :cond_23

    .line 511
    .line 512
    if-nez v5, :cond_23

    .line 513
    .line 514
    const/4 v2, 0x5

    .line 515
    goto :goto_16

    .line 516
    :cond_23
    move/from16 v2, v30

    .line 517
    .line 518
    :goto_16
    iget-object v6, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 519
    .line 520
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 521
    .line 522
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 523
    .line 524
    invoke-virtual {v10, v6, v3, v14, v2}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 525
    .line 526
    .line 527
    goto :goto_17

    .line 528
    :cond_24
    move-object/from16 v34, v2

    .line 529
    .line 530
    move-object/from16 v35, v12

    .line 531
    .line 532
    :goto_17
    if-eqz v4, :cond_26

    .line 533
    .line 534
    iget v2, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    .line 535
    .line 536
    const/16 v3, 0x8

    .line 537
    .line 538
    if-eq v2, v3, :cond_25

    .line 539
    .line 540
    iget-object v2, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 541
    .line 542
    aget-object v2, v2, p2

    .line 543
    .line 544
    if-ne v2, v11, :cond_25

    .line 545
    .line 546
    iget-object v2, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 547
    .line 548
    add-int/lit8 v3, v16, 0x1

    .line 549
    .line 550
    aget-object v3, v2, v3

    .line 551
    .line 552
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 553
    .line 554
    aget-object v2, v2, v16

    .line 555
    .line 556
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 557
    .line 558
    const/4 v6, 0x5

    .line 559
    const/4 v12, 0x0

    .line 560
    invoke-virtual {v10, v3, v2, v12, v6}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 561
    .line 562
    .line 563
    goto :goto_18

    .line 564
    :cond_25
    const/4 v12, 0x0

    .line 565
    :goto_18
    iget-object v2, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 566
    .line 567
    aget-object v2, v2, v16

    .line 568
    .line 569
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 570
    .line 571
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 572
    .line 573
    aget-object v3, v3, v16

    .line 574
    .line 575
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 576
    .line 577
    const/4 v6, 0x7

    .line 578
    invoke-virtual {v10, v2, v3, v12, v6}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 579
    .line 580
    .line 581
    :cond_26
    iget-object v2, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 582
    .line 583
    add-int/lit8 v3, v16, 0x1

    .line 584
    .line 585
    aget-object v2, v2, v3

    .line 586
    .line 587
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 588
    .line 589
    if-eqz v2, :cond_27

    .line 590
    .line 591
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 592
    .line 593
    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 594
    .line 595
    aget-object v3, v3, v16

    .line 596
    .line 597
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 598
    .line 599
    if-eqz v3, :cond_27

    .line 600
    .line 601
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 602
    .line 603
    if-eq v3, v9, :cond_28

    .line 604
    .line 605
    :cond_27
    move-object/from16 v2, v17

    .line 606
    .line 607
    :cond_28
    if-eqz v2, :cond_29

    .line 608
    .line 609
    move-object v9, v2

    .line 610
    move/from16 v6, v32

    .line 611
    .line 612
    goto :goto_19

    .line 613
    :cond_29
    const/4 v6, 0x1

    .line 614
    :goto_19
    move-object/from16 v15, v31

    .line 615
    .line 616
    move/from16 v14, v33

    .line 617
    .line 618
    move-object/from16 v2, v34

    .line 619
    .line 620
    move-object/from16 v12, v35

    .line 621
    .line 622
    goto/16 :goto_11

    .line 623
    .line 624
    :cond_2a
    move-object/from16 v34, v2

    .line 625
    .line 626
    move-object/from16 v35, v12

    .line 627
    .line 628
    move/from16 v33, v14

    .line 629
    .line 630
    move-object/from16 v31, v15

    .line 631
    .line 632
    if-eqz v7, :cond_2e

    .line 633
    .line 634
    iget-object v2, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 635
    .line 636
    add-int/lit8 v3, v16, 0x1

    .line 637
    .line 638
    aget-object v2, v2, v3

    .line 639
    .line 640
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 641
    .line 642
    if-eqz v2, :cond_2e

    .line 643
    .line 644
    iget-object v2, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 645
    .line 646
    aget-object v2, v2, v3

    .line 647
    .line 648
    iget-object v6, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 649
    .line 650
    aget-object v6, v6, p2

    .line 651
    .line 652
    if-ne v6, v11, :cond_2b

    .line 653
    .line 654
    iget-object v6, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    .line 655
    .line 656
    aget v6, v6, p2

    .line 657
    .line 658
    if-nez v6, :cond_2b

    .line 659
    .line 660
    const/4 v6, 0x1

    .line 661
    goto :goto_1a

    .line 662
    :cond_2b
    const/4 v6, 0x0

    .line 663
    :goto_1a
    if-eqz v6, :cond_2c

    .line 664
    .line 665
    if-nez v5, :cond_2c

    .line 666
    .line 667
    iget-object v6, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 668
    .line 669
    iget-object v9, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 670
    .line 671
    if-ne v9, v0, :cond_2c

    .line 672
    .line 673
    iget-object v9, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 674
    .line 675
    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 676
    .line 677
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 678
    .line 679
    .line 680
    move-result v12

    .line 681
    neg-int v12, v12

    .line 682
    const/4 v14, 0x5

    .line 683
    invoke-virtual {v10, v9, v6, v12, v14}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 684
    .line 685
    .line 686
    goto :goto_1b

    .line 687
    :cond_2c
    const/4 v14, 0x5

    .line 688
    if-eqz v5, :cond_2d

    .line 689
    .line 690
    iget-object v6, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 691
    .line 692
    iget-object v9, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 693
    .line 694
    if-ne v9, v0, :cond_2d

    .line 695
    .line 696
    iget-object v9, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 697
    .line 698
    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 699
    .line 700
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 701
    .line 702
    .line 703
    move-result v12

    .line 704
    neg-int v12, v12

    .line 705
    const/4 v15, 0x4

    .line 706
    invoke-virtual {v10, v9, v6, v12, v15}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 707
    .line 708
    .line 709
    :cond_2d
    :goto_1b
    iget-object v6, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 710
    .line 711
    iget-object v9, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 712
    .line 713
    aget-object v3, v9, v3

    .line 714
    .line 715
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 716
    .line 717
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 718
    .line 719
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 720
    .line 721
    .line 722
    move-result v2

    .line 723
    neg-int v2, v2

    .line 724
    const/4 v9, 0x6

    .line 725
    invoke-virtual {v10, v6, v3, v2, v9}, Landroidx/constraintlayout/solver/LinearSystem;->addLowerThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 726
    .line 727
    .line 728
    goto :goto_1c

    .line 729
    :cond_2e
    const/4 v14, 0x5

    .line 730
    :goto_1c
    if-eqz v4, :cond_2f

    .line 731
    .line 732
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 733
    .line 734
    add-int/lit8 v3, v16, 0x1

    .line 735
    .line 736
    aget-object v2, v2, v3

    .line 737
    .line 738
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 739
    .line 740
    iget-object v4, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 741
    .line 742
    aget-object v3, v4, v3

    .line 743
    .line 744
    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 745
    .line 746
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 747
    .line 748
    .line 749
    move-result v3

    .line 750
    const/4 v6, 0x7

    .line 751
    invoke-virtual {v10, v2, v4, v3, v6}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 752
    .line 753
    .line 754
    :cond_2f
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWeightedMatchConstraintsWidgets:Ljava/util/ArrayList;

    .line 755
    .line 756
    if-eqz v2, :cond_39

    .line 757
    .line 758
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 759
    .line 760
    .line 761
    move-result v3

    .line 762
    const/4 v4, 0x1

    .line 763
    if-le v3, v4, :cond_39

    .line 764
    .line 765
    iget-boolean v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasUndefinedWeights:Z

    .line 766
    .line 767
    if-eqz v6, :cond_30

    .line 768
    .line 769
    iget-boolean v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasComplexMatchWeights:Z

    .line 770
    .line 771
    if-nez v6, :cond_30

    .line 772
    .line 773
    iget v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    .line 774
    .line 775
    int-to-float v6, v6

    .line 776
    goto :goto_1d

    .line 777
    :cond_30
    move/from16 v6, v26

    .line 778
    .line 779
    :goto_1d
    move-object/from16 v15, v17

    .line 780
    .line 781
    const/4 v9, 0x0

    .line 782
    const/4 v12, 0x0

    .line 783
    :goto_1e
    if-ge v12, v3, :cond_39

    .line 784
    .line 785
    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 786
    .line 787
    .line 788
    move-result-object v21

    .line 789
    move-object/from16 v4, v21

    .line 790
    .line 791
    check-cast v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 792
    .line 793
    iget-object v14, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWeight:[F

    .line 794
    .line 795
    aget v14, v14, p2

    .line 796
    .line 797
    const/16 v19, 0x0

    .line 798
    .line 799
    cmpg-float v21, v14, v19

    .line 800
    .line 801
    if-gez v21, :cond_32

    .line 802
    .line 803
    iget-boolean v14, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasComplexMatchWeights:Z

    .line 804
    .line 805
    if-eqz v14, :cond_31

    .line 806
    .line 807
    iget-object v0, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 808
    .line 809
    add-int/lit8 v4, v16, 0x1

    .line 810
    .line 811
    aget-object v4, v0, v4

    .line 812
    .line 813
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 814
    .line 815
    aget-object v0, v0, v16

    .line 816
    .line 817
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 818
    .line 819
    move-object/from16 v21, v2

    .line 820
    .line 821
    const/4 v2, 0x0

    .line 822
    const/4 v14, 0x4

    .line 823
    invoke-virtual {v10, v4, v0, v2, v14}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 824
    .line 825
    .line 826
    move/from16 v27, v14

    .line 827
    .line 828
    const/4 v4, 0x7

    .line 829
    move v14, v2

    .line 830
    goto :goto_20

    .line 831
    :cond_31
    move-object/from16 v21, v2

    .line 832
    .line 833
    const/4 v2, 0x0

    .line 834
    const/high16 v14, 0x3f800000    # 1.0f

    .line 835
    .line 836
    const/16 v27, 0x4

    .line 837
    .line 838
    goto :goto_1f

    .line 839
    :cond_32
    move-object/from16 v21, v2

    .line 840
    .line 841
    const/16 v27, 0x4

    .line 842
    .line 843
    const/4 v2, 0x0

    .line 844
    :goto_1f
    cmpl-float v30, v14, v2

    .line 845
    .line 846
    if-nez v30, :cond_33

    .line 847
    .line 848
    iget-object v0, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 849
    .line 850
    add-int/lit8 v2, v16, 0x1

    .line 851
    .line 852
    aget-object v2, v0, v2

    .line 853
    .line 854
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 855
    .line 856
    aget-object v0, v0, v16

    .line 857
    .line 858
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 859
    .line 860
    const/4 v4, 0x7

    .line 861
    const/4 v14, 0x0

    .line 862
    invoke-virtual {v10, v2, v0, v14, v4}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 863
    .line 864
    .line 865
    :goto_20
    move/from16 v36, v3

    .line 866
    .line 867
    move/from16 v18, v4

    .line 868
    .line 869
    move/from16 v30, v6

    .line 870
    .line 871
    move-object/from16 v37, v11

    .line 872
    .line 873
    move/from16 v29, v14

    .line 874
    .line 875
    const/16 v19, 0x0

    .line 876
    .line 877
    goto/16 :goto_25

    .line 878
    .line 879
    :cond_33
    const/16 v18, 0x7

    .line 880
    .line 881
    const/16 v29, 0x0

    .line 882
    .line 883
    if-eqz v15, :cond_38

    .line 884
    .line 885
    iget-object v2, v15, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 886
    .line 887
    aget-object v15, v2, v16

    .line 888
    .line 889
    iget-object v15, v15, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 890
    .line 891
    add-int/lit8 v32, v16, 0x1

    .line 892
    .line 893
    aget-object v2, v2, v32

    .line 894
    .line 895
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 896
    .line 897
    iget-object v0, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 898
    .line 899
    move/from16 v36, v3

    .line 900
    .line 901
    aget-object v3, v0, v16

    .line 902
    .line 903
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 904
    .line 905
    aget-object v0, v0, v32

    .line 906
    .line 907
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 908
    .line 909
    move-object/from16 v32, v4

    .line 910
    .line 911
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    .line 912
    .line 913
    .line 914
    move-result-object v4

    .line 915
    move-object/from16 v37, v11

    .line 916
    .line 917
    const/4 v11, 0x0

    .line 918
    iput v11, v4, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    .line 919
    .line 920
    cmpl-float v19, v6, v11

    .line 921
    .line 922
    const/high16 v11, -0x40800000    # -1.0f

    .line 923
    .line 924
    if-eqz v19, :cond_37

    .line 925
    .line 926
    cmpl-float v19, v9, v14

    .line 927
    .line 928
    if-nez v19, :cond_34

    .line 929
    .line 930
    goto :goto_22

    .line 931
    :cond_34
    const/16 v19, 0x0

    .line 932
    .line 933
    cmpl-float v38, v9, v19

    .line 934
    .line 935
    if-nez v38, :cond_35

    .line 936
    .line 937
    iget-object v0, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 938
    .line 939
    const/high16 v3, 0x3f800000    # 1.0f

    .line 940
    .line 941
    invoke-virtual {v0, v15, v3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 942
    .line 943
    .line 944
    iget-object v0, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 945
    .line 946
    invoke-virtual {v0, v2, v11}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 947
    .line 948
    .line 949
    goto :goto_21

    .line 950
    :cond_35
    const/high16 v11, 0x3f800000    # 1.0f

    .line 951
    .line 952
    if-nez v30, :cond_36

    .line 953
    .line 954
    iget-object v2, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 955
    .line 956
    invoke-virtual {v2, v3, v11}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 957
    .line 958
    .line 959
    iget-object v2, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 960
    .line 961
    const/high16 v3, -0x40800000    # -1.0f

    .line 962
    .line 963
    invoke-virtual {v2, v0, v3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 964
    .line 965
    .line 966
    :goto_21
    move/from16 v30, v6

    .line 967
    .line 968
    goto :goto_23

    .line 969
    :cond_36
    div-float/2addr v9, v6

    .line 970
    div-float v30, v14, v6

    .line 971
    .line 972
    div-float v9, v9, v30

    .line 973
    .line 974
    move/from16 v30, v6

    .line 975
    .line 976
    iget-object v6, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 977
    .line 978
    invoke-virtual {v6, v15, v11}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 979
    .line 980
    .line 981
    iget-object v6, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 982
    .line 983
    const/high16 v11, -0x40800000    # -1.0f

    .line 984
    .line 985
    invoke-virtual {v6, v2, v11}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 986
    .line 987
    .line 988
    iget-object v2, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 989
    .line 990
    invoke-virtual {v2, v0, v9}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 991
    .line 992
    .line 993
    iget-object v0, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 994
    .line 995
    neg-float v2, v9

    .line 996
    invoke-virtual {v0, v3, v2}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 997
    .line 998
    .line 999
    goto :goto_23

    .line 1000
    :cond_37
    :goto_22
    move/from16 v30, v6

    .line 1001
    .line 1002
    move v6, v11

    .line 1003
    const/high16 v11, 0x3f800000    # 1.0f

    .line 1004
    .line 1005
    const/16 v19, 0x0

    .line 1006
    .line 1007
    iget-object v9, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 1008
    .line 1009
    invoke-virtual {v9, v15, v11}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 1010
    .line 1011
    .line 1012
    iget-object v9, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 1013
    .line 1014
    invoke-virtual {v9, v2, v6}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 1015
    .line 1016
    .line 1017
    iget-object v2, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 1018
    .line 1019
    invoke-virtual {v2, v0, v11}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 1020
    .line 1021
    .line 1022
    iget-object v0, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 1023
    .line 1024
    invoke-virtual {v0, v3, v6}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 1025
    .line 1026
    .line 1027
    :goto_23
    invoke-virtual {v10, v4}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 1028
    .line 1029
    .line 1030
    goto :goto_24

    .line 1031
    :cond_38
    move/from16 v36, v3

    .line 1032
    .line 1033
    move-object/from16 v32, v4

    .line 1034
    .line 1035
    move/from16 v30, v6

    .line 1036
    .line 1037
    move-object/from16 v37, v11

    .line 1038
    .line 1039
    const/16 v19, 0x0

    .line 1040
    .line 1041
    :goto_24
    move v9, v14

    .line 1042
    move-object/from16 v15, v32

    .line 1043
    .line 1044
    :goto_25
    add-int/lit8 v12, v12, 0x1

    .line 1045
    .line 1046
    const/4 v4, 0x1

    .line 1047
    const/4 v14, 0x5

    .line 1048
    move-object/from16 v0, p0

    .line 1049
    .line 1050
    move-object/from16 v2, v21

    .line 1051
    .line 1052
    move/from16 v6, v30

    .line 1053
    .line 1054
    move/from16 v3, v36

    .line 1055
    .line 1056
    move-object/from16 v11, v37

    .line 1057
    .line 1058
    goto/16 :goto_1e

    .line 1059
    .line 1060
    :cond_39
    move-object/from16 v37, v11

    .line 1061
    .line 1062
    const/16 v18, 0x7

    .line 1063
    .line 1064
    const/16 v27, 0x4

    .line 1065
    .line 1066
    const/16 v29, 0x0

    .line 1067
    .line 1068
    if-eqz v8, :cond_40

    .line 1069
    .line 1070
    if-eq v8, v7, :cond_3a

    .line 1071
    .line 1072
    if-eqz v5, :cond_40

    .line 1073
    .line 1074
    :cond_3a
    move-object/from16 v0, v35

    .line 1075
    .line 1076
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1077
    .line 1078
    aget-object v0, v0, v16

    .line 1079
    .line 1080
    iget-object v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1081
    .line 1082
    add-int/lit8 v2, v16, 0x1

    .line 1083
    .line 1084
    aget-object v1, v1, v2

    .line 1085
    .line 1086
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1087
    .line 1088
    if-eqz v0, :cond_3b

    .line 1089
    .line 1090
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1091
    .line 1092
    move-object v3, v0

    .line 1093
    goto :goto_26

    .line 1094
    :cond_3b
    move-object/from16 v3, v17

    .line 1095
    .line 1096
    :goto_26
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1097
    .line 1098
    if-eqz v0, :cond_3c

    .line 1099
    .line 1100
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1101
    .line 1102
    move-object v6, v0

    .line 1103
    goto :goto_27

    .line 1104
    :cond_3c
    move-object/from16 v6, v17

    .line 1105
    .line 1106
    :goto_27
    iget-object v0, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1107
    .line 1108
    aget-object v0, v0, v16

    .line 1109
    .line 1110
    iget-object v1, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1111
    .line 1112
    aget-object v1, v1, v2

    .line 1113
    .line 1114
    if-eqz v3, :cond_3e

    .line 1115
    .line 1116
    if-eqz v6, :cond_3e

    .line 1117
    .line 1118
    if-nez p2, :cond_3d

    .line 1119
    .line 1120
    move-object/from16 v2, v34

    .line 1121
    .line 1122
    iget v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalBiasPercent:F

    .line 1123
    .line 1124
    goto :goto_28

    .line 1125
    :cond_3d
    move-object/from16 v2, v34

    .line 1126
    .line 1127
    iget v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalBiasPercent:F

    .line 1128
    .line 1129
    :goto_28
    move v5, v2

    .line 1130
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1131
    .line 1132
    .line 1133
    move-result v4

    .line 1134
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1135
    .line 1136
    .line 1137
    move-result v9

    .line 1138
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1139
    .line 1140
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1141
    .line 1142
    const/4 v11, 0x5

    .line 1143
    move-object/from16 v1, p1

    .line 1144
    .line 1145
    move-object v12, v7

    .line 1146
    move-object v7, v0

    .line 1147
    move-object v14, v8

    .line 1148
    move v8, v9

    .line 1149
    move/from16 v15, v23

    .line 1150
    .line 1151
    const/16 v19, 0x2

    .line 1152
    .line 1153
    move v9, v11

    .line 1154
    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 1155
    .line 1156
    .line 1157
    goto :goto_29

    .line 1158
    :cond_3e
    move-object v12, v7

    .line 1159
    move-object v14, v8

    .line 1160
    move/from16 v15, v23

    .line 1161
    .line 1162
    const/16 v19, 0x2

    .line 1163
    .line 1164
    :cond_3f
    :goto_29
    move-object/from16 v18, v13

    .line 1165
    .line 1166
    move/from16 v20, v15

    .line 1167
    .line 1168
    goto/16 :goto_42

    .line 1169
    .line 1170
    :cond_40
    move-object v12, v7

    .line 1171
    move-object v14, v8

    .line 1172
    move/from16 v15, v23

    .line 1173
    .line 1174
    move-object/from16 v0, v35

    .line 1175
    .line 1176
    const/16 v19, 0x2

    .line 1177
    .line 1178
    if-eqz v24, :cond_52

    .line 1179
    .line 1180
    if-eqz v14, :cond_52

    .line 1181
    .line 1182
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    .line 1183
    .line 1184
    if-lez v2, :cond_41

    .line 1185
    .line 1186
    iget v1, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsCount:I

    .line 1187
    .line 1188
    if-ne v1, v2, :cond_41

    .line 1189
    .line 1190
    const/16 v26, 0x1

    .line 1191
    .line 1192
    goto :goto_2a

    .line 1193
    :cond_41
    move/from16 v26, v29

    .line 1194
    .line 1195
    :goto_2a
    move-object v9, v14

    .line 1196
    move-object v11, v9

    .line 1197
    :goto_2b
    if-eqz v11, :cond_3f

    .line 1198
    .line 1199
    iget-object v1, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 1200
    .line 1201
    aget-object v1, v1, p2

    .line 1202
    .line 1203
    move-object v8, v1

    .line 1204
    :goto_2c
    if-eqz v8, :cond_42

    .line 1205
    .line 1206
    iget v1, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    .line 1207
    .line 1208
    const/16 v7, 0x8

    .line 1209
    .line 1210
    if-ne v1, v7, :cond_43

    .line 1211
    .line 1212
    iget-object v1, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 1213
    .line 1214
    aget-object v8, v1, p2

    .line 1215
    .line 1216
    goto :goto_2c

    .line 1217
    :cond_42
    const/16 v7, 0x8

    .line 1218
    .line 1219
    :cond_43
    if-nez v8, :cond_45

    .line 1220
    .line 1221
    if-ne v11, v12, :cond_44

    .line 1222
    .line 1223
    goto :goto_2d

    .line 1224
    :cond_44
    move-object/from16 v20, v8

    .line 1225
    .line 1226
    move-object/from16 v21, v9

    .line 1227
    .line 1228
    move/from16 v28, v18

    .line 1229
    .line 1230
    const/16 v18, 0x5

    .line 1231
    .line 1232
    goto/16 :goto_35

    .line 1233
    .line 1234
    :cond_45
    :goto_2d
    iget-object v1, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1235
    .line 1236
    aget-object v1, v1, v16

    .line 1237
    .line 1238
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1239
    .line 1240
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1241
    .line 1242
    if-eqz v3, :cond_46

    .line 1243
    .line 1244
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1245
    .line 1246
    goto :goto_2e

    .line 1247
    :cond_46
    move-object/from16 v3, v17

    .line 1248
    .line 1249
    :goto_2e
    if-eq v9, v11, :cond_47

    .line 1250
    .line 1251
    iget-object v3, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1252
    .line 1253
    add-int/lit8 v4, v16, 0x1

    .line 1254
    .line 1255
    aget-object v3, v3, v4

    .line 1256
    .line 1257
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1258
    .line 1259
    goto :goto_2f

    .line 1260
    :cond_47
    if-ne v11, v14, :cond_49

    .line 1261
    .line 1262
    if-ne v9, v11, :cond_49

    .line 1263
    .line 1264
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1265
    .line 1266
    aget-object v3, v3, v16

    .line 1267
    .line 1268
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1269
    .line 1270
    if-eqz v3, :cond_48

    .line 1271
    .line 1272
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1273
    .line 1274
    goto :goto_2f

    .line 1275
    :cond_48
    move-object/from16 v3, v17

    .line 1276
    .line 1277
    :cond_49
    :goto_2f
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1278
    .line 1279
    .line 1280
    move-result v1

    .line 1281
    iget-object v4, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1282
    .line 1283
    add-int/lit8 v5, v16, 0x1

    .line 1284
    .line 1285
    aget-object v4, v4, v5

    .line 1286
    .line 1287
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1288
    .line 1289
    .line 1290
    move-result v4

    .line 1291
    if-eqz v8, :cond_4a

    .line 1292
    .line 1293
    iget-object v6, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1294
    .line 1295
    aget-object v6, v6, v16

    .line 1296
    .line 1297
    iget-object v7, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1298
    .line 1299
    move-object/from16 v21, v6

    .line 1300
    .line 1301
    iget-object v6, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1302
    .line 1303
    aget-object v6, v6, v5

    .line 1304
    .line 1305
    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1306
    .line 1307
    :goto_30
    move-object/from16 v39, v21

    .line 1308
    .line 1309
    move-object/from16 v21, v6

    .line 1310
    .line 1311
    move-object/from16 v6, v39

    .line 1312
    .line 1313
    goto :goto_32

    .line 1314
    :cond_4a
    iget-object v6, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1315
    .line 1316
    aget-object v6, v6, v5

    .line 1317
    .line 1318
    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1319
    .line 1320
    if-eqz v6, :cond_4b

    .line 1321
    .line 1322
    iget-object v7, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1323
    .line 1324
    move-object/from16 v21, v6

    .line 1325
    .line 1326
    goto :goto_31

    .line 1327
    :cond_4b
    move-object/from16 v21, v6

    .line 1328
    .line 1329
    move-object/from16 v7, v17

    .line 1330
    .line 1331
    :goto_31
    iget-object v6, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1332
    .line 1333
    aget-object v6, v6, v5

    .line 1334
    .line 1335
    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1336
    .line 1337
    goto :goto_30

    .line 1338
    :goto_32
    if-eqz v6, :cond_4c

    .line 1339
    .line 1340
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1341
    .line 1342
    .line 1343
    move-result v6

    .line 1344
    add-int/2addr v4, v6

    .line 1345
    :cond_4c
    if-eqz v9, :cond_4d

    .line 1346
    .line 1347
    iget-object v6, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1348
    .line 1349
    aget-object v6, v6, v5

    .line 1350
    .line 1351
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1352
    .line 1353
    .line 1354
    move-result v6

    .line 1355
    add-int/2addr v1, v6

    .line 1356
    :cond_4d
    if-eqz v2, :cond_44

    .line 1357
    .line 1358
    if-eqz v3, :cond_44

    .line 1359
    .line 1360
    if-eqz v7, :cond_44

    .line 1361
    .line 1362
    if-eqz v21, :cond_44

    .line 1363
    .line 1364
    if-ne v11, v14, :cond_4e

    .line 1365
    .line 1366
    iget-object v1, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1367
    .line 1368
    aget-object v1, v1, v16

    .line 1369
    .line 1370
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1371
    .line 1372
    .line 1373
    move-result v1

    .line 1374
    :cond_4e
    move v6, v1

    .line 1375
    if-ne v11, v12, :cond_4f

    .line 1376
    .line 1377
    iget-object v1, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1378
    .line 1379
    aget-object v1, v1, v5

    .line 1380
    .line 1381
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1382
    .line 1383
    .line 1384
    move-result v1

    .line 1385
    move/from16 v23, v1

    .line 1386
    .line 1387
    goto :goto_33

    .line 1388
    :cond_4f
    move/from16 v23, v4

    .line 1389
    .line 1390
    :goto_33
    if-eqz v26, :cond_50

    .line 1391
    .line 1392
    move/from16 v25, v18

    .line 1393
    .line 1394
    goto :goto_34

    .line 1395
    :cond_50
    const/16 v25, 0x5

    .line 1396
    .line 1397
    :goto_34
    const/high16 v5, 0x3f000000    # 0.5f

    .line 1398
    .line 1399
    move-object/from16 v1, p1

    .line 1400
    .line 1401
    move/from16 v28, v18

    .line 1402
    .line 1403
    const/16 v18, 0x5

    .line 1404
    .line 1405
    move v4, v6

    .line 1406
    move-object v6, v7

    .line 1407
    const/16 v20, 0x8

    .line 1408
    .line 1409
    move-object/from16 v7, v21

    .line 1410
    .line 1411
    move-object/from16 v20, v8

    .line 1412
    .line 1413
    move/from16 v8, v23

    .line 1414
    .line 1415
    move-object/from16 v21, v9

    .line 1416
    .line 1417
    move/from16 v9, v25

    .line 1418
    .line 1419
    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 1420
    .line 1421
    .line 1422
    :goto_35
    iget v1, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    .line 1423
    .line 1424
    const/16 v9, 0x8

    .line 1425
    .line 1426
    if-eq v1, v9, :cond_51

    .line 1427
    .line 1428
    move-object/from16 v21, v11

    .line 1429
    .line 1430
    :cond_51
    move-object/from16 v11, v20

    .line 1431
    .line 1432
    move-object/from16 v9, v21

    .line 1433
    .line 1434
    move/from16 v18, v28

    .line 1435
    .line 1436
    goto/16 :goto_2b

    .line 1437
    .line 1438
    :cond_52
    move/from16 v28, v18

    .line 1439
    .line 1440
    const/16 v9, 0x8

    .line 1441
    .line 1442
    if-eqz v22, :cond_3f

    .line 1443
    .line 1444
    if-eqz v14, :cond_3f

    .line 1445
    .line 1446
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    .line 1447
    .line 1448
    if-lez v2, :cond_53

    .line 1449
    .line 1450
    iget v1, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsCount:I

    .line 1451
    .line 1452
    if-ne v1, v2, :cond_53

    .line 1453
    .line 1454
    const/16 v26, 0x1

    .line 1455
    .line 1456
    goto :goto_36

    .line 1457
    :cond_53
    move/from16 v26, v29

    .line 1458
    .line 1459
    :goto_36
    move-object v8, v14

    .line 1460
    move-object v11, v8

    .line 1461
    :goto_37
    if-eqz v11, :cond_5e

    .line 1462
    .line 1463
    iget-object v1, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 1464
    .line 1465
    aget-object v1, v1, p2

    .line 1466
    .line 1467
    :goto_38
    if-eqz v1, :cond_54

    .line 1468
    .line 1469
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    .line 1470
    .line 1471
    if-ne v2, v9, :cond_54

    .line 1472
    .line 1473
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 1474
    .line 1475
    aget-object v1, v1, p2

    .line 1476
    .line 1477
    goto :goto_38

    .line 1478
    :cond_54
    if-eq v11, v14, :cond_5c

    .line 1479
    .line 1480
    if-eq v11, v12, :cond_5c

    .line 1481
    .line 1482
    if-eqz v1, :cond_5c

    .line 1483
    .line 1484
    if-ne v1, v12, :cond_55

    .line 1485
    .line 1486
    move-object/from16 v7, v17

    .line 1487
    .line 1488
    goto :goto_39

    .line 1489
    :cond_55
    move-object v7, v1

    .line 1490
    :goto_39
    iget-object v1, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1491
    .line 1492
    aget-object v1, v1, v16

    .line 1493
    .line 1494
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1495
    .line 1496
    iget-object v3, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1497
    .line 1498
    add-int/lit8 v4, v16, 0x1

    .line 1499
    .line 1500
    aget-object v3, v3, v4

    .line 1501
    .line 1502
    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1503
    .line 1504
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1505
    .line 1506
    .line 1507
    move-result v1

    .line 1508
    iget-object v5, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1509
    .line 1510
    aget-object v5, v5, v4

    .line 1511
    .line 1512
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1513
    .line 1514
    .line 1515
    move-result v5

    .line 1516
    if-eqz v7, :cond_57

    .line 1517
    .line 1518
    iget-object v6, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1519
    .line 1520
    aget-object v6, v6, v16

    .line 1521
    .line 1522
    iget-object v9, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1523
    .line 1524
    move-object/from16 v18, v7

    .line 1525
    .line 1526
    iget-object v7, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1527
    .line 1528
    if-eqz v7, :cond_56

    .line 1529
    .line 1530
    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1531
    .line 1532
    goto :goto_3b

    .line 1533
    :cond_56
    move-object/from16 v7, v17

    .line 1534
    .line 1535
    goto :goto_3b

    .line 1536
    :cond_57
    move-object/from16 v18, v7

    .line 1537
    .line 1538
    iget-object v6, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1539
    .line 1540
    aget-object v6, v6, v16

    .line 1541
    .line 1542
    if-eqz v6, :cond_58

    .line 1543
    .line 1544
    iget-object v7, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1545
    .line 1546
    goto :goto_3a

    .line 1547
    :cond_58
    move-object/from16 v7, v17

    .line 1548
    .line 1549
    :goto_3a
    iget-object v9, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1550
    .line 1551
    aget-object v9, v9, v4

    .line 1552
    .line 1553
    iget-object v9, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1554
    .line 1555
    move-object/from16 v39, v9

    .line 1556
    .line 1557
    move-object v9, v7

    .line 1558
    move-object/from16 v7, v39

    .line 1559
    .line 1560
    :goto_3b
    if-eqz v6, :cond_59

    .line 1561
    .line 1562
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1563
    .line 1564
    .line 1565
    move-result v6

    .line 1566
    add-int/2addr v6, v5

    .line 1567
    move/from16 v20, v6

    .line 1568
    .line 1569
    goto :goto_3c

    .line 1570
    :cond_59
    move/from16 v20, v5

    .line 1571
    .line 1572
    :goto_3c
    iget-object v5, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1573
    .line 1574
    aget-object v4, v5, v4

    .line 1575
    .line 1576
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1577
    .line 1578
    .line 1579
    move-result v4

    .line 1580
    add-int/2addr v4, v1

    .line 1581
    if-eqz v26, :cond_5a

    .line 1582
    .line 1583
    move/from16 v21, v28

    .line 1584
    .line 1585
    goto :goto_3d

    .line 1586
    :cond_5a
    move/from16 v21, v27

    .line 1587
    .line 1588
    :goto_3d
    if-eqz v2, :cond_5b

    .line 1589
    .line 1590
    if-eqz v3, :cond_5b

    .line 1591
    .line 1592
    if-eqz v9, :cond_5b

    .line 1593
    .line 1594
    if-eqz v7, :cond_5b

    .line 1595
    .line 1596
    const/high16 v5, 0x3f000000    # 0.5f

    .line 1597
    .line 1598
    move-object/from16 v1, p1

    .line 1599
    .line 1600
    move/from16 v6, v27

    .line 1601
    .line 1602
    move-object v6, v9

    .line 1603
    move-object/from16 v23, v8

    .line 1604
    .line 1605
    move/from16 v8, v20

    .line 1606
    .line 1607
    move/from16 v20, v15

    .line 1608
    .line 1609
    const/16 v15, 0x8

    .line 1610
    .line 1611
    move/from16 v9, v21

    .line 1612
    .line 1613
    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 1614
    .line 1615
    .line 1616
    goto :goto_3e

    .line 1617
    :cond_5b
    move-object/from16 v23, v8

    .line 1618
    .line 1619
    move/from16 v20, v15

    .line 1620
    .line 1621
    const/16 v15, 0x8

    .line 1622
    .line 1623
    :goto_3e
    move-object/from16 v8, v18

    .line 1624
    .line 1625
    goto :goto_3f

    .line 1626
    :cond_5c
    move-object/from16 v23, v8

    .line 1627
    .line 1628
    move/from16 v20, v15

    .line 1629
    .line 1630
    move v15, v9

    .line 1631
    move-object v8, v1

    .line 1632
    :goto_3f
    iget v1, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    .line 1633
    .line 1634
    if-eq v1, v15, :cond_5d

    .line 1635
    .line 1636
    move-object/from16 v23, v11

    .line 1637
    .line 1638
    :cond_5d
    move-object v11, v8

    .line 1639
    move v9, v15

    .line 1640
    move/from16 v15, v20

    .line 1641
    .line 1642
    move-object/from16 v8, v23

    .line 1643
    .line 1644
    const/16 v27, 0x4

    .line 1645
    .line 1646
    goto/16 :goto_37

    .line 1647
    .line 1648
    :cond_5e
    move/from16 v20, v15

    .line 1649
    .line 1650
    iget-object v1, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1651
    .line 1652
    aget-object v1, v1, v16

    .line 1653
    .line 1654
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1655
    .line 1656
    aget-object v0, v0, v16

    .line 1657
    .line 1658
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1659
    .line 1660
    iget-object v2, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1661
    .line 1662
    add-int/lit8 v3, v16, 0x1

    .line 1663
    .line 1664
    aget-object v11, v2, v3

    .line 1665
    .line 1666
    iget-object v2, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1667
    .line 1668
    aget-object v2, v2, v3

    .line 1669
    .line 1670
    iget-object v15, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1671
    .line 1672
    if-eqz v0, :cond_61

    .line 1673
    .line 1674
    if-eq v14, v12, :cond_5f

    .line 1675
    .line 1676
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1677
    .line 1678
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1679
    .line 1680
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1681
    .line 1682
    .line 1683
    move-result v1

    .line 1684
    const/4 v9, 0x4

    .line 1685
    invoke-virtual {v10, v2, v0, v1, v9}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 1686
    .line 1687
    .line 1688
    goto :goto_40

    .line 1689
    :cond_5f
    const/4 v9, 0x4

    .line 1690
    if-eqz v15, :cond_60

    .line 1691
    .line 1692
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1693
    .line 1694
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1695
    .line 1696
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1697
    .line 1698
    .line 1699
    move-result v4

    .line 1700
    const/high16 v5, 0x3f000000    # 0.5f

    .line 1701
    .line 1702
    iget-object v6, v11, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1703
    .line 1704
    iget-object v7, v15, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1705
    .line 1706
    invoke-virtual {v11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1707
    .line 1708
    .line 1709
    move-result v8

    .line 1710
    const/4 v0, 0x4

    .line 1711
    move-object/from16 v1, p1

    .line 1712
    .line 1713
    move-object/from16 v18, v13

    .line 1714
    .line 1715
    move v13, v9

    .line 1716
    move v9, v0

    .line 1717
    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 1718
    .line 1719
    .line 1720
    goto :goto_41

    .line 1721
    :cond_60
    :goto_40
    move-object/from16 v18, v13

    .line 1722
    .line 1723
    move v13, v9

    .line 1724
    goto :goto_41

    .line 1725
    :cond_61
    move-object/from16 v18, v13

    .line 1726
    .line 1727
    const/4 v13, 0x4

    .line 1728
    :goto_41
    if-eqz v15, :cond_62

    .line 1729
    .line 1730
    if-eq v14, v12, :cond_62

    .line 1731
    .line 1732
    iget-object v0, v11, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1733
    .line 1734
    iget-object v1, v15, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1735
    .line 1736
    invoke-virtual {v11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1737
    .line 1738
    .line 1739
    move-result v2

    .line 1740
    neg-int v2, v2

    .line 1741
    invoke-virtual {v10, v0, v1, v2, v13}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 1742
    .line 1743
    .line 1744
    :cond_62
    :goto_42
    if-nez v24, :cond_63

    .line 1745
    .line 1746
    if-eqz v22, :cond_69

    .line 1747
    .line 1748
    :cond_63
    if-eqz v14, :cond_69

    .line 1749
    .line 1750
    iget-object v0, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1751
    .line 1752
    aget-object v1, v0, v16

    .line 1753
    .line 1754
    iget-object v2, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1755
    .line 1756
    add-int/lit8 v3, v16, 0x1

    .line 1757
    .line 1758
    aget-object v2, v2, v3

    .line 1759
    .line 1760
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1761
    .line 1762
    if-eqz v4, :cond_64

    .line 1763
    .line 1764
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1765
    .line 1766
    goto :goto_43

    .line 1767
    :cond_64
    move-object/from16 v4, v17

    .line 1768
    .line 1769
    :goto_43
    iget-object v5, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1770
    .line 1771
    if-eqz v5, :cond_65

    .line 1772
    .line 1773
    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1774
    .line 1775
    goto :goto_44

    .line 1776
    :cond_65
    move-object/from16 v5, v17

    .line 1777
    .line 1778
    :goto_44
    move-object/from16 v6, v18

    .line 1779
    .line 1780
    if-eq v6, v12, :cond_67

    .line 1781
    .line 1782
    iget-object v5, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1783
    .line 1784
    aget-object v5, v5, v3

    .line 1785
    .line 1786
    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1787
    .line 1788
    if-eqz v5, :cond_66

    .line 1789
    .line 1790
    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1791
    .line 1792
    move-object/from16 v17, v5

    .line 1793
    .line 1794
    :cond_66
    move-object/from16 v6, v17

    .line 1795
    .line 1796
    goto :goto_45

    .line 1797
    :cond_67
    move-object v6, v5

    .line 1798
    :goto_45
    if-ne v14, v12, :cond_68

    .line 1799
    .line 1800
    aget-object v2, v0, v3

    .line 1801
    .line 1802
    :cond_68
    if-eqz v4, :cond_69

    .line 1803
    .line 1804
    if-eqz v6, :cond_69

    .line 1805
    .line 1806
    const/high16 v5, 0x3f000000    # 0.5f

    .line 1807
    .line 1808
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1809
    .line 1810
    .line 1811
    move-result v0

    .line 1812
    iget-object v7, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 1813
    .line 1814
    aget-object v3, v7, v3

    .line 1815
    .line 1816
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    .line 1817
    .line 1818
    .line 1819
    move-result v8

    .line 1820
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1821
    .line 1822
    iget-object v7, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 1823
    .line 1824
    const/4 v9, 0x5

    .line 1825
    move-object/from16 v1, p1

    .line 1826
    .line 1827
    move-object v2, v3

    .line 1828
    move-object v3, v4

    .line 1829
    move v4, v0

    .line 1830
    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 1831
    .line 1832
    .line 1833
    :cond_69
    add-int/lit8 v9, v20, 0x1

    .line 1834
    .line 1835
    move-object/from16 v0, p0

    .line 1836
    .line 1837
    move/from16 v12, v19

    .line 1838
    .line 1839
    move-object/from16 v15, v31

    .line 1840
    .line 1841
    move/from16 v14, v33

    .line 1842
    .line 1843
    move-object/from16 v11, v37

    .line 1844
    .line 1845
    goto/16 :goto_1

    .line 1846
    .line 1847
    :cond_6a
    return-void
.end method
