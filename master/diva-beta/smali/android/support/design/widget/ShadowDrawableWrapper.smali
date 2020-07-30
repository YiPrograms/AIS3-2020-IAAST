.class Landroid/support/design/widget/ShadowDrawableWrapper;
.super Landroid/support/v7/graphics/drawable/DrawableWrapper;
.source "ShadowDrawableWrapper.java"


# static fields
.field static final COS_45:D

.field static final SHADOW_BOTTOM_SCALE:F = 1.0f

.field static final SHADOW_HORIZ_SCALE:F = 0.5f

.field static final SHADOW_MULTIPLIER:F = 1.5f

.field static final SHADOW_TOP_SCALE:F = 0.25f


# instance fields
.field private mAddPaddingForCorners:Z

.field final mContentBounds:Landroid/graphics/RectF;

.field mCornerRadius:F

.field final mCornerShadowPaint:Landroid/graphics/Paint;

.field mCornerShadowPath:Landroid/graphics/Path;

.field private mDirty:Z

.field final mEdgeShadowPaint:Landroid/graphics/Paint;

.field mMaxShadowSize:F

.field private mPrintedShadowClipWarning:Z

.field mRawMaxShadowSize:F

.field mRawShadowSize:F

.field private final mShadowEndColor:I

.field private final mShadowMiddleColor:I

.field mShadowSize:F

.field private final mShadowStartColor:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 39
    const-wide v0, 0x4046800000000000L    # 45.0

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    sput-wide v0, Landroid/support/design/widget/ShadowDrawableWrapper;->COS_45:D

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;FFF)V
    .locals 3
    .param p1, "resources"    # Landroid/content/res/Resources;
    .param p2, "content"    # Landroid/graphics/drawable/Drawable;
    .param p3, "radius"    # F
    .param p4, "shadowSize"    # F
    .param p5, "maxShadowSize"    # F

    .prologue
    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 81
    invoke-direct {p0, p2}, Landroid/support/v7/graphics/drawable/DrawableWrapper;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 66
    iput-boolean v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mDirty:Z

    .line 72
    iput-boolean v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mAddPaddingForCorners:Z

    .line 77
    iput-boolean v2, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mPrintedShadowClipWarning:Z

    .line 83
    sget v0, Landroid/support/design/R$color;->design_fab_shadow_start_color:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowStartColor:I

    .line 84
    sget v0, Landroid/support/design/R$color;->design_fab_shadow_mid_color:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowMiddleColor:I

    .line 85
    sget v0, Landroid/support/design/R$color;->design_fab_shadow_end_color:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowEndColor:I

    .line 87
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPaint:Landroid/graphics/Paint;

    .line 88
    iget-object v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 89
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    .line 90
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    .line 91
    new-instance v0, Landroid/graphics/Paint;

    iget-object v1, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPaint:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mEdgeShadowPaint:Landroid/graphics/Paint;

    .line 92
    iget-object v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mEdgeShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 93
    invoke-virtual {p0, p4, p5}, Landroid/support/design/widget/ShadowDrawableWrapper;->setShadowSize(FF)V

    .line 94
    return-void
.end method

.method private buildComponents(Landroid/graphics/Rect;)V
    .locals 6
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 309
    iget v1, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    const/high16 v2, 0x3fc00000    # 1.5f

    mul-float v0, v1, v2

    .line 310
    .local v0, "verticalOffset":F
    iget-object v1, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v2, p1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget v3, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    add-float/2addr v2, v3

    iget v3, p1, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    add-float/2addr v3, v0

    iget v4, p1, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    iget v5, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    sub-float/2addr v4, v5

    iget v5, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v5, v5

    sub-float/2addr v5, v0

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 313
    invoke-virtual {p0}, Landroid/support/design/widget/ShadowDrawableWrapper;->getWrappedDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-object v2, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    float-to-int v2, v2

    iget-object v3, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    float-to-int v3, v3

    iget-object v4, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    float-to-int v4, v4

    iget-object v5, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    float-to-int v5, v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 316
    invoke-direct {p0}, Landroid/support/design/widget/ShadowDrawableWrapper;->buildShadowCorners()V

    .line 317
    return-void
.end method

.method private buildShadowCorners()V
    .locals 17

    .prologue
    .line 268
    new-instance v13, Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    neg-float v1, v1

    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    neg-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    move-object/from16 v0, p0

    iget v5, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    invoke-direct {v13, v1, v2, v3, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 269
    .local v13, "innerBounds":Landroid/graphics/RectF;
    new-instance v15, Landroid/graphics/RectF;

    invoke-direct {v15, v13}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 270
    .local v15, "outerBounds":Landroid/graphics/RectF;
    move-object/from16 v0, p0

    iget v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowSize:F

    neg-float v1, v1

    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowSize:F

    neg-float v2, v2

    invoke-virtual {v15, v1, v2}, Landroid/graphics/RectF;->inset(FF)V

    .line 272
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    if-nez v1, :cond_1

    .line 273
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    move-object/from16 v0, p0

    iput-object v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    .line 277
    :goto_0
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    sget-object v2, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {v1, v2}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 278
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    neg-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 279
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowSize:F

    neg-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 281
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    const/high16 v2, 0x43340000    # 180.0f

    const/high16 v3, 0x42b40000    # 90.0f

    const/4 v5, 0x0

    invoke-virtual {v1, v15, v2, v3, v5}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 283
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    const/high16 v2, 0x43870000    # 270.0f

    const/high16 v3, -0x3d4c0000    # -90.0f

    const/4 v5, 0x0

    invoke-virtual {v1, v13, v2, v3, v5}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 284
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 286
    iget v1, v15, Landroid/graphics/RectF;->top:F

    neg-float v4, v1

    .line 287
    .local v4, "shadowRadius":F
    const/4 v1, 0x0

    cmpl-float v1, v4, v1

    if-lez v1, :cond_0

    .line 288
    move-object/from16 v0, p0

    iget v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    div-float v16, v1, v4

    .line 289
    .local v16, "startRatio":F
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v1, v1, v16

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float v14, v16, v1

    .line 290
    .local v14, "midRatio":F
    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/RadialGradient;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x4

    new-array v5, v5, [I

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput v7, v5, v6

    const/4 v6, 0x1

    move-object/from16 v0, p0

    iget v7, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowStartColor:I

    aput v7, v5, v6

    const/4 v6, 0x2

    move-object/from16 v0, p0

    iget v7, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowMiddleColor:I

    aput v7, v5, v6

    const/4 v6, 0x3

    move-object/from16 v0, p0

    iget v7, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowEndColor:I

    aput v7, v5, v6

    const/4 v6, 0x4

    new-array v6, v6, [F

    const/4 v7, 0x0

    const/4 v9, 0x0

    aput v9, v6, v7

    const/4 v7, 0x1

    aput v16, v6, v7

    const/4 v7, 0x2

    aput v14, v6, v7

    const/4 v7, 0x3

    const/high16 v9, 0x3f800000    # 1.0f

    aput v9, v6, v7

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v1 .. v7}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v8, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 299
    .end local v14    # "midRatio":F
    .end local v16    # "startRatio":F
    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mEdgeShadowPaint:Landroid/graphics/Paint;

    new-instance v5, Landroid/graphics/LinearGradient;

    const/4 v6, 0x0

    iget v7, v13, Landroid/graphics/RectF;->top:F

    const/4 v8, 0x0

    iget v9, v15, Landroid/graphics/RectF;->top:F

    const/4 v2, 0x3

    new-array v10, v2, [I

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowStartColor:I

    aput v3, v10, v2

    const/4 v2, 0x1

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowMiddleColor:I

    aput v3, v10, v2

    const/4 v2, 0x2

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowEndColor:I

    aput v3, v10, v2

    const/4 v2, 0x3

    new-array v11, v2, [F

    fill-array-data v11, :array_0

    sget-object v12, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v5 .. v12}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 302
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mEdgeShadowPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 303
    return-void

    .line 275
    .end local v4    # "shadowRadius":F
    :cond_1
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    goto/16 :goto_0

    .line 299
    nop

    :array_0
    .array-data 4
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static calculateHorizontalPadding(FFZ)F
    .locals 6
    .param p0, "maxShadowSize"    # F
    .param p1, "cornerRadius"    # F
    .param p2, "addPaddingForCorners"    # Z

    .prologue
    .line 165
    if-eqz p2, :cond_0

    .line 166
    float-to-double v0, p0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sget-wide v4, Landroid/support/design/widget/ShadowDrawableWrapper;->COS_45:D

    sub-double/2addr v2, v4

    float-to-double v4, p1

    mul-double/2addr v2, v4

    add-double/2addr v0, v2

    double-to-float p0, v0

    .line 168
    .end local p0    # "maxShadowSize":F
    :cond_0
    return p0
.end method

.method public static calculateVerticalPadding(FFZ)F
    .locals 6
    .param p0, "maxShadowSize"    # F
    .param p1, "cornerRadius"    # F
    .param p2, "addPaddingForCorners"    # Z

    .prologue
    const/high16 v0, 0x3fc00000    # 1.5f

    .line 156
    if-eqz p2, :cond_0

    .line 157
    mul-float/2addr v0, p0

    float-to-double v0, v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sget-wide v4, Landroid/support/design/widget/ShadowDrawableWrapper;->COS_45:D

    sub-double/2addr v2, v4

    float-to-double v4, p1

    mul-double/2addr v2, v4

    add-double/2addr v0, v2

    double-to-float v0, v0

    .line 159
    :goto_0
    return v0

    :cond_0
    mul-float/2addr v0, p0

    goto :goto_0
.end method

.method private drawShadow(Landroid/graphics/Canvas;)V
    .locals 19
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 199
    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    neg-float v3, v3

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowSize:F

    sub-float v5, v3, v4

    .line 200
    .local v5, "edgeShadowTop":F
    move-object/from16 v0, p0

    iget v12, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    .line 201
    .local v12, "shadowOffset":F
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v4, v12

    sub-float/2addr v3, v4

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-lez v3, :cond_4

    const/4 v9, 0x1

    .line 202
    .local v9, "drawHorizontalEdges":Z
    :goto_0
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v4, v12

    sub-float/2addr v3, v4

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-lez v3, :cond_5

    const/4 v10, 0x1

    .line 204
    .local v10, "drawVerticalEdges":Z
    :goto_1
    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawShadowSize:F

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawShadowSize:F

    const/high16 v6, 0x3e800000    # 0.25f

    mul-float/2addr v4, v6

    sub-float v15, v3, v4

    .line 205
    .local v15, "shadowOffsetTop":F
    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawShadowSize:F

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawShadowSize:F

    const/high16 v6, 0x3f000000    # 0.5f

    mul-float/2addr v4, v6

    sub-float v14, v3, v4

    .line 206
    .local v14, "shadowOffsetHorizontal":F
    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawShadowSize:F

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawShadowSize:F

    const/high16 v6, 0x3f800000    # 1.0f

    mul-float/2addr v4, v6

    sub-float v13, v3, v4

    .line 208
    .local v13, "shadowOffsetBottom":F
    add-float v3, v12, v14

    div-float v17, v12, v3

    .line 209
    .local v17, "shadowScaleHorizontal":F
    add-float v3, v12, v15

    div-float v18, v12, v3

    .line 210
    .local v18, "shadowScaleTop":F
    add-float v3, v12, v13

    div-float v16, v12, v3

    .line 213
    .local v16, "shadowScaleBottom":F
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v11

    .line 214
    .local v11, "saved":I
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    add-float/2addr v3, v12

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    add-float/2addr v4, v12

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 215
    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 216
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 217
    if-eqz v9, :cond_0

    .line 219
    const/high16 v3, 0x3f800000    # 1.0f

    div-float v3, v3, v17

    const/high16 v4, 0x3f800000    # 1.0f

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->scale(FF)V

    .line 220
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v6, v12

    sub-float v6, v3, v6

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    neg-float v7, v3

    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mEdgeShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 224
    :cond_0
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 226
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v11

    .line 227
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v12

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v12

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 228
    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 229
    const/high16 v3, 0x43340000    # 180.0f

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/graphics/Canvas;->rotate(F)V

    .line 230
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 231
    if-eqz v9, :cond_1

    .line 233
    const/high16 v3, 0x3f800000    # 1.0f

    div-float v3, v3, v17

    const/high16 v4, 0x3f800000    # 1.0f

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->scale(FF)V

    .line 234
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v6, v12

    sub-float v6, v3, v6

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    neg-float v3, v3

    move-object/from16 v0, p0

    iget v7, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowSize:F

    add-float/2addr v7, v3

    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mEdgeShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 238
    :cond_1
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 240
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v11

    .line 241
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    add-float/2addr v3, v12

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v12

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 242
    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 243
    const/high16 v3, 0x43870000    # 270.0f

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/graphics/Canvas;->rotate(F)V

    .line 244
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 245
    if-eqz v10, :cond_2

    .line 247
    const/high16 v3, 0x3f800000    # 1.0f

    div-float v3, v3, v16

    const/high16 v4, 0x3f800000    # 1.0f

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->scale(FF)V

    .line 248
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v6, v12

    sub-float v6, v3, v6

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    neg-float v7, v3

    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mEdgeShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 251
    :cond_2
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 253
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v11

    .line 254
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v12

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    add-float/2addr v4, v12

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 255
    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 256
    const/high16 v3, 0x42b40000    # 90.0f

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/graphics/Canvas;->rotate(F)V

    .line 257
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 258
    if-eqz v10, :cond_3

    .line 260
    const/high16 v3, 0x3f800000    # 1.0f

    div-float v3, v3, v18

    const/high16 v4, 0x3f800000    # 1.0f

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->scale(FF)V

    .line 261
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mContentBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v6, v12

    sub-float v6, v3, v6

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    neg-float v7, v3

    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/design/widget/ShadowDrawableWrapper;->mEdgeShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 264
    :cond_3
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 265
    return-void

    .line 201
    .end local v9    # "drawHorizontalEdges":Z
    .end local v10    # "drawVerticalEdges":Z
    .end local v11    # "saved":I
    .end local v13    # "shadowOffsetBottom":F
    .end local v14    # "shadowOffsetHorizontal":F
    .end local v15    # "shadowOffsetTop":F
    .end local v16    # "shadowScaleBottom":F
    .end local v17    # "shadowScaleHorizontal":F
    .end local v18    # "shadowScaleTop":F
    :cond_4
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 202
    .restart local v9    # "drawHorizontalEdges":Z
    :cond_5
    const/4 v10, 0x0

    goto/16 :goto_1
.end method

.method private static toEven(F)I
    .locals 3
    .param p0, "value"    # F

    .prologue
    .line 100
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 101
    .local v0, "i":I
    rem-int/lit8 v1, v0, 0x2

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    add-int/lit8 v0, v0, -0x1

    .end local v0    # "i":I
    :cond_0
    return v0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 189
    iget-boolean v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mDirty:Z

    if-eqz v0, :cond_0

    .line 190
    invoke-virtual {p0}, Landroid/support/design/widget/ShadowDrawableWrapper;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/design/widget/ShadowDrawableWrapper;->buildComponents(Landroid/graphics/Rect;)V

    .line 191
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mDirty:Z

    .line 193
    :cond_0
    invoke-direct {p0, p1}, Landroid/support/design/widget/ShadowDrawableWrapper;->drawShadow(Landroid/graphics/Canvas;)V

    .line 195
    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/DrawableWrapper;->draw(Landroid/graphics/Canvas;)V

    .line 196
    return-void
.end method

.method public getCornerRadius()F
    .locals 1

    .prologue
    .line 320
    iget v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    return v0
.end method

.method public getMaxShadowSize()F
    .locals 1

    .prologue
    .line 336
    iget v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    return v0
.end method

.method public getMinHeight()F
    .locals 6

    .prologue
    const/high16 v5, 0x3fc00000    # 1.5f

    const/high16 v4, 0x40000000    # 2.0f

    .line 346
    iget v1, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    iget v2, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    iget v3, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    mul-float/2addr v3, v5

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    mul-float v0, v4, v1

    .line 348
    .local v0, "content":F
    iget v1, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    mul-float/2addr v1, v5

    mul-float/2addr v1, v4

    add-float/2addr v1, v0

    return v1
.end method

.method public getMinWidth()F
    .locals 5

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    .line 340
    iget v1, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    iget v2, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    iget v3, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    mul-float v0, v4, v1

    .line 342
    .local v0, "content":F
    iget v1, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    mul-float/2addr v1, v4

    add-float/2addr v1, v0

    return v1
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 174
    const/4 v0, -0x3

    return v0
.end method

.method public getPadding(Landroid/graphics/Rect;)Z
    .locals 5
    .param p1, "padding"    # Landroid/graphics/Rect;

    .prologue
    .line 146
    iget v2, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    iget v3, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    iget-boolean v4, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mAddPaddingForCorners:Z

    invoke-static {v2, v3, v4}, Landroid/support/design/widget/ShadowDrawableWrapper;->calculateVerticalPadding(FFZ)F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v1, v2

    .line 148
    .local v1, "vOffset":I
    iget v2, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    iget v3, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    iget-boolean v4, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mAddPaddingForCorners:Z

    invoke-static {v2, v3, v4}, Landroid/support/design/widget/ShadowDrawableWrapper;->calculateHorizontalPadding(FFZ)F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v0, v2

    .line 150
    .local v0, "hOffset":I
    invoke-virtual {p1, v0, v1, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 151
    const/4 v2, 0x1

    return v2
.end method

.method public getShadowSize()F
    .locals 1

    .prologue
    .line 332
    iget v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawShadowSize:F

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 118
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mDirty:Z

    .line 119
    return-void
.end method

.method public setAddPaddingForCorners(Z)V
    .locals 0
    .param p1, "addPaddingForCorners"    # Z

    .prologue
    .line 105
    iput-boolean p1, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mAddPaddingForCorners:Z

    .line 106
    invoke-virtual {p0}, Landroid/support/design/widget/ShadowDrawableWrapper;->invalidateSelf()V

    .line 107
    return-void
.end method

.method public setAlpha(I)V
    .locals 1
    .param p1, "alpha"    # I

    .prologue
    .line 111
    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/DrawableWrapper;->setAlpha(I)V

    .line 112
    iget-object v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 113
    iget-object v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mEdgeShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 114
    return-void
.end method

.method public setCornerRadius(F)V
    .locals 1
    .param p1, "radius"    # F

    .prologue
    .line 178
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-float p1, v0

    .line 179
    iget v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    .line 185
    :goto_0
    return-void

    .line 182
    :cond_0
    iput p1, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mCornerRadius:F

    .line 183
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mDirty:Z

    .line 184
    invoke-virtual {p0}, Landroid/support/design/widget/ShadowDrawableWrapper;->invalidateSelf()V

    goto :goto_0
.end method

.method public setMaxShadowSize(F)V
    .locals 1
    .param p1, "size"    # F

    .prologue
    .line 328
    iget v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawShadowSize:F

    invoke-virtual {p0, v0, p1}, Landroid/support/design/widget/ShadowDrawableWrapper;->setShadowSize(FF)V

    .line 329
    return-void
.end method

.method public setShadowSize(F)V
    .locals 1
    .param p1, "size"    # F

    .prologue
    .line 324
    iget v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    invoke-virtual {p0, p1, v0}, Landroid/support/design/widget/ShadowDrawableWrapper;->setShadowSize(FF)V

    .line 325
    return-void
.end method

.method setShadowSize(FF)V
    .locals 3
    .param p1, "shadowSize"    # F
    .param p2, "maxShadowSize"    # F

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 122
    cmpg-float v0, p1, v1

    if-ltz v0, :cond_0

    cmpg-float v0, p2, v1

    if-gez v0, :cond_1

    .line 123
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid shadow size"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_1
    invoke-static {p1}, Landroid/support/design/widget/ShadowDrawableWrapper;->toEven(F)I

    move-result v0

    int-to-float p1, v0

    .line 126
    invoke-static {p2}, Landroid/support/design/widget/ShadowDrawableWrapper;->toEven(F)I

    move-result v0

    int-to-float p2, v0

    .line 127
    cmpl-float v0, p1, p2

    if-lez v0, :cond_2

    .line 128
    move p1, p2

    .line 129
    iget-boolean v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mPrintedShadowClipWarning:Z

    if-nez v0, :cond_2

    .line 130
    iput-boolean v2, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mPrintedShadowClipWarning:Z

    .line 133
    :cond_2
    iget v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawShadowSize:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_3

    iget v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    cmpl-float v0, v0, p2

    if-nez v0, :cond_3

    .line 142
    :goto_0
    return-void

    .line 136
    :cond_3
    iput p1, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawShadowSize:F

    .line 137
    iput p2, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mRawMaxShadowSize:F

    .line 138
    const/high16 v0, 0x3fc00000    # 1.5f

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mShadowSize:F

    .line 139
    iput p2, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mMaxShadowSize:F

    .line 140
    iput-boolean v2, p0, Landroid/support/design/widget/ShadowDrawableWrapper;->mDirty:Z

    .line 141
    invoke-virtual {p0}, Landroid/support/design/widget/ShadowDrawableWrapper;->invalidateSelf()V

    goto :goto_0
.end method
