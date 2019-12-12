use v6.c;

use GTK::Compat::Types;

unit package GIMP::Raw::Enums;

# GIMP

constant GimpBrushApplicationMode is export := guint32;
our enum GimpBrushApplicationModeEnum is export <
    GIMP_BRUSH_HARD
    GIMP_BRUSH_SOFT
>;

constant GimpConvertDitherType is export := guint32;
our enum GimpConvertDitherTypeEnum is export <
    GIMP_CONVERT_DITHER_NONE
    GIMP_CONVERT_DITHER_FS
    GIMP_CONVERT_DITHER_FS_LOWBLEED
    GIMP_CONVERT_DITHER_FIXED
>;

constant GimpExportCapabilities is export := guint32;
our enum GimpExportCapabilitiesEnum is export (
    GIMP_EXPORT_CAN_HANDLE_RGB                 =>  1,
    GIMP_EXPORT_CAN_HANDLE_GRAY                =>  1 +< 1,
    GIMP_EXPORT_CAN_HANDLE_INDEXED             =>  1 +< 2,
    GIMP_EXPORT_CAN_HANDLE_BITMAP              =>  1 +< 3,
    GIMP_EXPORT_CAN_HANDLE_ALPHA               =>  1 +< 4,
    GIMP_EXPORT_CAN_HANDLE_LAYERS              =>  1 +< 5,
    GIMP_EXPORT_CAN_HANDLE_LAYERS_AS_ANIMATION =>  1 +< 6,
    GIMP_EXPORT_CAN_HANDLE_LAYER_MASKS         =>  1 +< 7,
    GIMP_EXPORT_NEEDS_ALPHA                    =>  1 +< 8,
);

constant GimpExportReturn is export := guint32;
our enum GimpExportReturnEnum is export <
    GIMP_EXPORT_CANCEL
    GIMP_EXPORT_IGNORE
    GIMP_EXPORT_EXPORT
>;

constant GimpHistogramChannel is export := guint32;
our enum GimpHistogramChannelEnum is export <
    GIMP_HISTOGRAM_VALUE
    GIMP_HISTOGRAM_RED
    GIMP_HISTOGRAM_GREEN
    GIMP_HISTOGRAM_BLUE
    GIMP_HISTOGRAM_ALPHA
    GIMP_HISTOGRAM_LUMINANCE
>;

constant GimpLayerColorSpace is export := guint32;
our enum GimpLayerColorSpaceEnum is export <
    GIMP_LAYER_COLOR_SPACE_AUTO
    GIMP_LAYER_COLOR_SPACE_RGB_LINEAR
    GIMP_LAYER_COLOR_SPACE_RGB_PERCEPTUAL
>;

constant GimpLayerCompositeMode is export := guint32;
our enum GimpLayerCompositeModeEnum is export <
    GIMP_LAYER_COMPOSITE_AUTO
    GIMP_LAYER_COMPOSITE_UNION
    GIMP_LAYER_COMPOSITE_CLIP_TO_BACKDROP
    GIMP_LAYER_COMPOSITE_CLIP_TO_LAYER
    GIMP_LAYER_COMPOSITE_INTERSECTION
>;

constant GimpLayerMode is export := guint32;
our enum GimpLayerModeEnum is export <
    GIMP_LAYER_MODE_NORMAL_LEGACY
    GIMP_LAYER_MODE_DISSOLVE
    GIMP_LAYER_MODE_BEHIND_LEGACY
    GIMP_LAYER_MODE_MULTIPLY_LEGACY
    GIMP_LAYER_MODE_SCREEN_LEGACY
    GIMP_LAYER_MODE_OVERLAY_LEGACY
    GIMP_LAYER_MODE_DIFFERENCE_LEGACY
    GIMP_LAYER_MODE_ADDITION_LEGACY
    GIMP_LAYER_MODE_SUBTRACT_LEGACY
    GIMP_LAYER_MODE_DARKEN_ONLY_LEGACY
    GIMP_LAYER_MODE_LIGHTEN_ONLY_LEGACY
    GIMP_LAYER_MODE_HSV_HUE_LEGACY
    GIMP_LAYER_MODE_HSV_SATURATION_LEGACY
    GIMP_LAYER_MODE_HSL_COLOR_LEGACY
    GIMP_LAYER_MODE_HSV_VALUE_LEGACY
    GIMP_LAYER_MODE_DIVIDE_LEGACY
    GIMP_LAYER_MODE_DODGE_LEGACY
    GIMP_LAYER_MODE_BURN_LEGACY
    GIMP_LAYER_MODE_HARDLIGHT_LEGACY
    GIMP_LAYER_MODE_SOFTLIGHT_LEGACY
    GIMP_LAYER_MODE_GRAIN_EXTRACT_LEGACY
    GIMP_LAYER_MODE_GRAIN_MERGE_LEGACY
    GIMP_LAYER_MODE_COLOR_ERASE_LEGACY
    GIMP_LAYER_MODE_OVERLAY
    GIMP_LAYER_MODE_LCH_HUE
    GIMP_LAYER_MODE_LCH_CHROMA
    GIMP_LAYER_MODE_LCH_COLOR
    GIMP_LAYER_MODE_LCH_LIGHTNESS
    GIMP_LAYER_MODE_NORMAL
    GIMP_LAYER_MODE_BEHIND
    GIMP_LAYER_MODE_MULTIPLY
    GIMP_LAYER_MODE_SCREEN
    GIMP_LAYER_MODE_DIFFERENCE
    GIMP_LAYER_MODE_ADDITION
    GIMP_LAYER_MODE_SUBTRACT
    GIMP_LAYER_MODE_DARKEN_ONLY
    GIMP_LAYER_MODE_LIGHTEN_ONLY
    GIMP_LAYER_MODE_HSV_HUE
    GIMP_LAYER_MODE_HSV_SATURATION
    GIMP_LAYER_MODE_HSL_COLOR
    GIMP_LAYER_MODE_HSV_VALUE
    GIMP_LAYER_MODE_DIVIDE
    GIMP_LAYER_MODE_DODGE
    GIMP_LAYER_MODE_BURN
    GIMP_LAYER_MODE_HARDLIGHT
    GIMP_LAYER_MODE_SOFTLIGHT
    GIMP_LAYER_MODE_GRAIN_EXTRACT
    GIMP_LAYER_MODE_GRAIN_MERGE
    GIMP_LAYER_MODE_VIVID_LIGHT
    GIMP_LAYER_MODE_PIN_LIGHT
    GIMP_LAYER_MODE_LINEAR_LIGHT
    GIMP_LAYER_MODE_HARD_MIX
    GIMP_LAYER_MODE_EXCLUSION
    GIMP_LAYER_MODE_LINEAR_BURN
    GIMP_LAYER_MODE_LUMA_DARKEN_ONLY
    GIMP_LAYER_MODE_LUMA_LIGHTEN_ONLY
    GIMP_LAYER_MODE_LUMINANCE
    GIMP_LAYER_MODE_COLOR_ERASE
    GIMP_LAYER_MODE_ERASE
    GIMP_LAYER_MODE_MERGE
    GIMP_LAYER_MODE_SPLIT
    GIMP_LAYER_MODE_PASS_THROUGH
>;

constant GimpPrecision is export := guint;
our enum GimpPrecisionEnum (
  GIMP_PRECISION_U8_LINEAR     => 100, # 8-bit linear integer
  GIMP_PRECISION_U8_GAMMA      => 150, # 8-bit gamma integer
  GIMP_PRECISION_U16_LINEAR    => 200, # 16-bit linear integer
  GIMP_PRECISION_U16_GAMMA     => 250, # 16-bit gamma integer
  GIMP_PRECISION_U32_LINEAR    => 300, # 32-bit linear integer
  GIMP_PRECISION_U32_GAMMA     => 350, # 32-bit gamma integer
  GIMP_PRECISION_HALF_LINEAR   => 500, # 16-bit linear floating point
  GIMP_PRECISION_HALF_GAMMA    => 550, # 16-bit gamma floating point
  GIMP_PRECISION_FLOAT_LINEAR  => 600, # 32-bit linear floating point
  GIMP_PRECISION_FLOAT_GAMMA   => 650, # 32-bit gamma floating point
  GIMP_PRECISION_DOUBLE_LINEAR => 700, # 64-bit linear floating point
  GIMP_PRECISION_DOUBLE_GAMMA  => 750  # 64-bit gamma floating point
);

constant GimpPixbufTransparency is export := guint32;
our enum GimpPixbufTransparencyEnum is export <
    GIMP_PIXBUF_KEEP_ALPHA
    GIMP_PIXBUF_SMALL_CHECKS
    GIMP_PIXBUF_LARGE_CHECKS
>;

constant GimpPixelFetcherEdgeMode is export := guint32;
our enum GimpPixelFetcherEdgeModeEnum is export <
    GIMP_PIXEL_FETCHER_EDGE_NONE
    GIMP_PIXEL_FETCHER_EDGE_WRAP
    GIMP_PIXEL_FETCHER_EDGE_SMEAR
    GIMP_PIXEL_FETCHER_EDGE_BLACK
    GIMP_PIXEL_FETCHER_EDGE_BACKGROUND
>;

# GIMPBASE

constant GimpAddMaskType is export := guint32;
our enum GimpAddMaskTypeEnum is export (
    'GIMP_ADD_MASK_WHITE',
    'GIMP_ADD_MASK_BLACK',
    'GIMP_ADD_MASK_ALPHA',
    'GIMP_ADD_MASK_ALPHA_TRANSFER',
    'GIMP_ADD_MASK_SELECTION',
    'GIMP_ADD_MASK_COPY',
    'GIMP_ADD_MASK_CHANNEL'
);
our enum GimpAddMaskTypeDeprecatedEnum is export (
    GIMP_ADD_WHITE_MASK          => GIMP_ADD_MASK_WHITE,
    GIMP_ADD_BLACK_MASK          => GIMP_ADD_MASK_BLACK,
    GIMP_ADD_ALPHA_MASK          => GIMP_ADD_MASK_ALPHA,
    GIMP_ADD_ALPHA_TRANSFER_MASK => GIMP_ADD_MASK_ALPHA_TRANSFER,
    GIMP_ADD_SELECTION_MASK      => GIMP_ADD_MASK_SELECTION,
    GIMP_ADD_COPY_MASK           => GIMP_ADD_MASK_COPY,
    GIMP_ADD_CHANNEL_MASK        => GIMP_ADD_MASK_CHANNEL
);

constant GimpCpuAccelFlags is export := guint32;
our enum GimpCpuAccelFlagsEnum is export (
  GIMP_CPU_ACCEL_NONE        => 0x0,
  GIMP_CPU_ACCEL_X86_MMX     => 0x80000000,
  GIMP_CPU_ACCEL_X86_3DNOW   => 0x40000000,
  GIMP_CPU_ACCEL_X86_MMXEXT  => 0x20000000,
  GIMP_CPU_ACCEL_X86_SSE     => 0x10000000,
  GIMP_CPU_ACCEL_X86_SSE2    => 0x08000000,
  GIMP_CPU_ACCEL_X86_SSE3    => 0x02000000,
  GIMP_CPU_ACCEL_X86_SSSE3   => 0x01000000,
  GIMP_CPU_ACCEL_X86_SSE4_1  => 0x00800000,
  GIMP_CPU_ACCEL_X86_SSE4_2  => 0x00400000,
  GIMP_CPU_ACCEL_X86_AVX     => 0x00200000,
  GIMP_CPU_ACCEL_PPC_ALTIVEC => 0x04000000
);

constant GimpPDBArgType is export := guint32;
our enum GimpPDBArgTypeEnum is export <
  GIMP_PDB_INT32
  GIMP_PDB_INT16
  GIMP_PDB_INT8
  GIMP_PDB_FLOAT
  GIMP_PDB_STRING
  GIMP_PDB_INT32ARRAY
  GIMP_PDB_INT16ARRAY
  GIMP_PDB_INT8ARRAY
  GIMP_PDB_FLOATARRAY
  GIMP_PDB_STRINGARRAY
  GIMP_PDB_COLOR
  GIMP_PDB_ITEM
  GIMP_PDB_DISPLAY
  GIMP_PDB_IMAGE
  GIMP_PDB_LAYER
  GIMP_PDB_CHANNEL
  GIMP_PDB_DRAWABLE
  GIMP_PDB_SELECTION
  GIMP_PDB_COLORARRAY
  GIMP_PDB_VECTORS
  GIMP_PDB_PARASITE
  GIMP_PDB_STATUS
  GIMP_PDB_END
>;
our enum GimpPDBArgTypeDeprecatedEnum is export (
  GIMP_PDB_PATH     => GIMP_PDB_VECTORS,
  GIMP_PDB_BOUNDARY => GIMP_PDB_COLORARRAY,
  GIMP_PDB_REGION   => GIMP_PDB_ITEM
);

constant GimpBlendMode is export := guint32;
our enum GimpBlendModeEnum is export (
    'GIMP_BLEND_FG_BG_RGB',
    'GIMP_BLEND_FG_BG_HSV',
    'GIMP_BLEND_FG_TRANSPARENT',
    'GIMP_BLEND_CUSTOM'
);
our enum GimpBlendModeDeprecatedEnum is export (
    GIMP_FG_BG_RGB_MODE      => GIMP_BLEND_FG_BG_RGB,
    GIMP_FG_BG_HSV_MODE      => GIMP_BLEND_FG_BG_HSV,
    GIMP_FG_TRANSPARENT_MODE => GIMP_BLEND_FG_TRANSPARENT,
    GIMP_CUSTOM_MODE         =>  GIMP_BLEND_CUSTOM
);

constant GimpBrushGeneratedShape is export := guint32;
our enum GimpBrushGeneratedShapeEnum is export <
    GIMP_BRUSH_GENERATED_CIRCLE
    GIMP_BRUSH_GENERATED_SQUARE
    GIMP_BRUSH_GENERATED_DIAMOND
>;

constant GimpBucketFillMode is export := guint32;
our enum GimpBucketFillModeEnum is export (
    'GIMP_BUCKET_FILL_FG',
    'GIMP_BUCKET_FILL_BG',
    'GIMP_BUCKET_FILL_PATTERN'
);
our enum GimpBucketFillModeDeprecatedEnum is export (
    GIMP_FG_BUCKET_FILL      => GIMP_BUCKET_FILL_FG,
    GIMP_BG_BUCKET_FILL      => GIMP_BUCKET_FILL_BG,
    GIMP_PATTERN_BUCKET_FILL => GIMP_BUCKET_FILL_PATTERN,
);

constant GimpCapStyle is export := guint32;
our enum GimpCapStyleEnum is export <
    GIMP_CAP_BUTT
    GIMP_CAP_ROUND
    GIMP_CAP_SQUARE
>;

constant GimpChannelOps is export := guint32;
our enum GimpChannelOpsEnum is export <
    GIMP_CHANNEL_OP_ADD
    GIMP_CHANNEL_OP_SUBTRACT
    GIMP_CHANNEL_OP_REPLACE
    GIMP_CHANNEL_OP_INTERSECT
>;

constant GimpChannelType is export := guint32;
our enum GimpChannelTypeEnum is export <
  GIMP_CHANNEL_RED
  GIMP_CHANNEL_GREEN
  GIMP_CHANNEL_BLUE
  GIMP_CHANNEL_GRAY
  GIMP_CHANNEL_INDEXED
  GIMP_CHANNEL_ALPHA
>;
our enum GimpChannmelTypeDeprecatedEnum is export (
  GIMP_RED_CHANNEL     => GIMP_CHANNEL_RED,
  GIMP_GREEN_CHANNEL   => GIMP_CHANNEL_GREEN,
  GIMP_BLUE_CHANNEL    => GIMP_CHANNEL_BLUE,
  GIMP_GRAY_CHANNEL    => GIMP_CHANNEL_GRAY,
  GIMP_INDEXED_CHANNEL => GIMP_CHANNEL_INDEXED,
  GIMP_ALPHA_CHANNEL   => GIMP_CHANNEL_ALPHA
);

# From #define entries, so no associated type
our enum GimpCheckDefinesEnum is export (
  GIMP_CHECK_SIZE    => 8,
  GIMP_CHECK_SIZE_SM => 4
);
our enum GimpCheckDefinesNumEnum is export (
  GIMP_CHECK_DARK    => 0.4,
  GIMP_CHECK_LIGHT   => 0.8
);

constant GimpCheckSize is export := guint32;
our enum GimpCheckSizeEnum is export (
  GIMP_CHECK_SIZE_SMALL_CHECKS  => 0,
  GIMP_CHECK_SIZE_MEDIUM_CHECKS => 1,
  GIMP_CHECK_SIZE_LARGE_CHECKS  => 2
);

constant GimpCheckType is export := guint32;
our enum GimpCheckTypeEnum is export (
  GIMP_CHECK_TYPE_LIGHT_CHECKS => 0,
  GIMP_CHECK_TYPE_GRAY_CHECKS  => 1,
  GIMP_CHECK_TYPE_DARK_CHECKS  => 2,
  GIMP_CHECK_TYPE_WHITE_ONLY   => 3,
  GIMP_CHECK_TYPE_GRAY_ONLY    => 4,
  GIMP_CHECK_TYPE_BLACK_ONLY   => 5
);

constant GimpCloneType is export := guint32;
our enum GimpCloneTypeEnum is export (
    'GIMP_CLONE_IMAGE',
    'GIMP_CLONE_PATTERN'
);
our enum GimpCloneTypeDeprecatedEnum is export (
    GIMP_IMAGE_CLONE   => GIMP_CLONE_IMAGE,
    GIMP_PATTERN_CLONE => GIMP_CLONE_PATTERN,
);

constant GimpColorTag is export := guint32;
our enum GimpColorTagEnum is export <
    GIMP_COLOR_TAG_NONE
    GIMP_COLOR_TAG_BLUE
    GIMP_COLOR_TAG_GREEN
    GIMP_COLOR_TAG_YELLOW
    GIMP_COLOR_TAG_ORANGE
    GIMP_COLOR_TAG_BROWN
    GIMP_COLOR_TAG_RED
    GIMP_COLOR_TAG_VIOLET
    GIMP_COLOR_TAG_GRAY
>;

constant GimpConvertPaletteType is export := guint32;
our enum GimpConvertPaletteTypeEnum is export (
    'GIMP_CONVERT_PALETTE_GENERATE',
    'GIMP_CONVERT_PALETTE_REUSE',
    'GIMP_CONVERT_PALETTE_WEB',
    'GIMP_CONVERT_PALETTE_MONO',
    'GIMP_CONVERT_PALETTE_CUSTOM'
);
our enum GimpConvertPaletteTypeDeprecatedEnum is export (
    GIMP_MAKE_PALETTE   => GIMP_CONVERT_PALETTE_GENERATE,
    GIMP_REUSE_PALETTE  => GIMP_CONVERT_PALETTE_REUSE,
    GIMP_WEB_PALETTE    => GIMP_CONVERT_PALETTE_WEB,
    GIMP_MONO_PALETTE   => GIMP_CONVERT_PALETTE_MONO,
    GIMP_CUSTOM_PALETTE => GIMP_CONVERT_PALETTE_CUSTOM,
);

constant GimpConvolveType is export := guint32;
our enum GimpConvolveTypeEnum is export (
    'GIMP_CONVOLVE_BLUR',
    'GIMP_CONVOLVE_SHARPEN'
);
our enum GimpConvolveTypeDeprecatedEnum is export (
    GIMP_BLUR_CONVOLVE    => GIMP_CONVOLVE_BLUR,
    GIMP_SHARPEN_CONVOLVE => GIMP_CONVOLVE_SHARPEN
);

constant GimpDesaturateMode is export := guint32;
our enum GimpDesaturateModeEnum is export (
    'GIMP_DESATURATE_LIGHTNESS',
    'GIMP_DESATURATE_LUMA',
    'GIMP_DESATURATE_AVERAGE',
    'GIMP_DESATURATE_LUMINANCE',
    'GIMP_DESATURATE_VALUE'
);
our enum GimpDesaturateModeDeprecatedEnum is export (
    GIMP_DESATURATE_LUMINOSITY => GIMP_DESATURATE_LUMA,
);

constant GimpDodgeBurnType is export := guint32;
our enum GimpDodgeBurnTypeEnum is export (
    'GIMP_DODGE_BURN_TYPE_DODGE',
    'GIMP_DODGE_BURN_TYPE_BURN'
);
our enum GimpDodgeBurnTypeDeprecatedEnum is export (
    GIMP_DODGE => GIMP_DODGE_BURN_TYPE_DODGE,
    GIMP_BURN  => GIMP_DODGE_BURN_TYPE_BURN
);

constant GimpFillType is export := guint32;
our enum GimpFillTypeEnum is export (
    'GIMP_FILL_FOREGROUND',
    'GIMP_FILL_BACKGROUND',
    'GIMP_FILL_WHITE',
    'GIMP_FILL_TRANSPARENT',
    'GIMP_FILL_PATTERN'
);
our enum GimpFillTypeDeprecatedEnum is export (
    GIMP_FOREGROUND_FILL  => GIMP_FILL_FOREGROUND,
    GIMP_BACKGROUND_FILL  => GIMP_FILL_BACKGROUND,
    GIMP_WHITE_FILL       => GIMP_FILL_WHITE,
    GIMP_TRANSPARENT_FILL => GIMP_FILL_TRANSPARENT,
    GIMP_PATTERN_FILL     => GIMP_FILL_PATTERN
);

constant GimpForegroundExtractMode is export := guint32;
our enum GimpForegroundExtractModeEnum is export <
    GIMP_FOREGROUND_EXTRACT_SIOX
    GIMP_FOREGROUND_EXTRACT_MATTING
>;

constant GimpGradientBlendColorSpace is export := guint32;
our enum GimpGradientBlendColorSpaceEnum is export <
    GIMP_GRADIENT_BLEND_RGB_PERCEPTUAL
    GIMP_GRADIENT_BLEND_RGB_LINEAR
    GIMP_GRADIENT_BLEND_CIE_LAB
>;

constant GimpGradientSegmentColor is export := guint32;
our enum GimpGradientSegmentColorEnum is export <
    GIMP_GRADIENT_SEGMENT_RGB
    GIMP_GRADIENT_SEGMENT_HSV_CCW
    GIMP_GRADIENT_SEGMENT_HSV_CW
>;

constant GimpGradientSegmentType is export := guint32;
our enum GimpGradientSegmentTypeEnum is export <
    GIMP_GRADIENT_SEGMENT_LINEAR
    GIMP_GRADIENT_SEGMENT_CURVED
    GIMP_GRADIENT_SEGMENT_SINE
    GIMP_GRADIENT_SEGMENT_SPHERE_INCREASING
    GIMP_GRADIENT_SEGMENT_SPHERE_DECREASING
    GIMP_GRADIENT_SEGMENT_STEP
>;

constant GimpGradientType is export := guint32;
our enum GimpGradientTypeEnum is export <
    GIMP_GRADIENT_LINEAR
    GIMP_GRADIENT_BILINEAR
    GIMP_GRADIENT_RADIAL
    GIMP_GRADIENT_SQUARE
    GIMP_GRADIENT_CONICAL_SYMMETRIC
    GIMP_GRADIENT_CONICAL_ASYMMETRIC
    GIMP_GRADIENT_SHAPEBURST_ANGULAR
    GIMP_GRADIENT_SHAPEBURST_SPHERICAL
    GIMP_GRADIENT_SHAPEBURST_DIMPLED
    GIMP_GRADIENT_SPIRAL_CLOCKWISE
    GIMP_GRADIENT_SPIRAL_ANTICLOCKWISE
>;

constant GimpGridStyle is export := guint32;
our enum GimpGridStyleEnum is export <
    GIMP_GRID_DOTS
    GIMP_GRID_INTERSECTIONS
    GIMP_GRID_ON_OFF_DASH
    GIMP_GRID_DOUBLE_DASH
    GIMP_GRID_SOLID
>;

constant GimpHueRange is export := guint32;
our enum GimpHueRangeEnum is export (
    'GIMP_HUE_RANGE_ALL',
    'GIMP_HUE_RANGE_RED',
    'GIMP_HUE_RANGE_YELLOW',
    'GIMP_HUE_RANGE_GREEN',
    'GIMP_HUE_RANGE_CYAN',
    'GIMP_HUE_RANGE_BLUE',
    'GIMP_HUE_RANGE_MAGENTA'
);
our enum GimpHueRangeDeprecatedEnum is export (
    GIMP_ALL_HUES     =>  GIMP_HUE_RANGE_ALL,
    GIMP_RED_HUES     =>  GIMP_HUE_RANGE_RED,
    GIMP_YELLOW_HUES  =>  GIMP_HUE_RANGE_YELLOW,
    GIMP_GREEN_HUES   =>  GIMP_HUE_RANGE_GREEN,
    GIMP_CYAN_HUES    =>  GIMP_HUE_RANGE_CYAN,
    GIMP_BLUE_HUES    =>  GIMP_HUE_RANGE_BLUE,
    GIMP_MAGENTA_HUES =>  GIMP_HUE_RANGE_MAGENTA,
);

constant GimpIconType is export := guint32;
our enum GimpIconTypeEnum is export (
    'GIMP_ICON_TYPE_ICON_NAME',
    'GIMP_ICON_TYPE_INLINE_PIXBUF',
    'GIMP_ICON_TYPE_IMAGE_FILE'
);
our enum GimpIconTypeDeprecatedEnum is export (
    GIMP_ICON_TYPE_STOCK_ID => GIMP_ICON_TYPE_ICON_NAME,
);

constant GimpImageBaseType is export := guint32;
our enum GimpImageBaseTypeEnum is export <
    GIMP_RGB
    GIMP_GRAY
    GIMP_INDEXED
>;

constant GimpImageType is export := guint32;
our enum GimpImageTypeEnum is export <
    GIMP_RGB_IMAGE
    GIMP_RGBA_IMAGE
    GIMP_GRAY_IMAGE
    GIMP_GRAYA_IMAGE
    GIMP_INDEXED_IMAGE
    GIMP_INDEXEDA_IMAGE
>;

constant GimpInkBlobType is export := guint32;
our enum GimpInkBlobTypeEnum is export <
    GIMP_INK_BLOB_TYPE_CIRCLE
    GIMP_INK_BLOB_TYPE_SQUARE
    GIMP_INK_BLOB_TYPE_DIAMOND
>;

constant GimpInterpolationType is export := guint32;
our enum GimpInterpolationTypeEnum is export (
    'GIMP_INTERPOLATION_NONE',
    'GIMP_INTERPOLATION_LINEAR',
    'GIMP_INTERPOLATION_CUBIC',
    'GIMP_INTERPOLATION_NOHALO',
    'GIMP_INTERPOLATION_LOHALO'
);

our enum GimpInterpolationTypeDeprecatedEnum is export (
    GIMP_INTERPOLATION_LANCZOS => GIMP_INTERPOLATION_NOHALO
);

constant GimpJoinStyle is export := guint32;
our enum GimpJoinStyleEnum is export <
    GIMP_JOIN_MITER
    GIMP_JOIN_ROUND
    GIMP_JOIN_BEVEL
>;

constant GimpMaskApplyMode is export := guint32;
our enum GimpMaskApplyModeEnum is export <
    GIMP_MASK_APPLY
    GIMP_MASK_DISCARD
>;

constant GimpMergeType is export := guint32;
our enum GimpMergeTypeEnum is export <
    GIMP_EXPAND_AS_NECESSARY
    GIMP_CLIP_TO_IMAGE
    GIMP_CLIP_TO_BOTTOM_LAYER
    GIMP_FLATTEN_IMAGE
>;

constant GimpMessageHandlerType is export := guint32;
our enum GimpMessageHandlerTypeEnum is export <
    GIMP_MESSAGE_BOX
    GIMP_CONSOLE
    GIMP_ERROR_CONSOLE
>;

constant GimpMetadataColorspace is export := guint32;
our enum GimpMetadataColorspaceEnum is export <
    GIMP_METADATA_COLORSPACE_UNSPECIFIED
    GIMP_METADATA_COLORSPACE_UNCALIBRATED
    GIMP_METADATA_COLORSPACE_SRGB
    GIMP_METADATA_COLORSPACE_ADOBERGB
>;

constant GimpMetadataLoadFlags is export := guint32;
our enum GimpMetadataLoadFlagsEnum is export (
  GIMP_METADATA_LOAD_COMMENT     => 1,
  GIMP_METADATA_LOAD_RESOLUTION  => 1 +< 1,
  GIMP_METADATA_LOAD_ORIENTATION => 1 +< 2,
  GIMP_METADATA_LOAD_COLORSPACE  => 1 +< 3,
  GIMP_METADATA_LOAD_ALL         => 0xffffffff
);

constant GimpMetadataSaveFlags is export := guint32;
our enum GimpMetadataSaveFlagsEnum is export (
  GIMP_METADATA_SAVE_EXIF      => 1,
  GIMP_METADATA_SAVE_XMP       => 1 +< 1,
  GIMP_METADATA_SAVE_IPTC      => 1 +< 2,
  GIMP_METADATA_SAVE_THUMBNAIL => 1 +< 3,
  GIMP_METADATA_SAVE_ALL       => 0xffffffff
);

constant GimpOffsetType is export := guint32;
our enum GimpOffsetTypeEnum is export <
    GIMP_OFFSET_BACKGROUND
    GIMP_OFFSET_TRANSPARENT
>;

constant GimpOrientationType is export := guint32;
our enum GimpOrientationTypeEnum is export <
    GIMP_ORIENTATION_HORIZONTAL
    GIMP_ORIENTATION_VERTICAL
    GIMP_ORIENTATION_UNKNOWN
>;

constant GimpPDBErrorHandler is export := guint32;
our enum GimpPDBErrorHandlerEnum is export <
    GIMP_PDB_ERROR_HANDLER_INTERNAL
    GIMP_PDB_ERROR_HANDLER_PLUGIN
>;

constant GimpPDBProcType is export := guint32;
our enum GimpPDBProcTypeEnum is export <
    GIMP_INTERNAL
    GIMP_PLUGIN
    GIMP_EXTENSION
    GIMP_TEMPORARY
>;

constant GimpPDBStatusType is export := guint32;
our enum GimpPDBStatusTypeEnum is export <
    GIMP_PDB_EXECUTION_ERROR
    GIMP_PDB_CALLING_ERROR
    GIMP_PDB_PASS_THROUGH
    GIMP_PDB_SUCCESS
    GIMP_PDB_CANCEL
>;

constant GimpPaintApplicationMode is export := guint32;
our enum GimpPaintApplicationModeEnum is export <
    GIMP_PAINT_CONSTANT
    GIMP_PAINT_INCREMENTAL
>;

constant GimpProgressCommand is export := guint32;
our enum GimpProgressCommandEnum is export <
    GIMP_PROGRESS_COMMAND_START
    GIMP_PROGRESS_COMMAND_END
    GIMP_PROGRESS_COMMAND_SET_TEXT
    GIMP_PROGRESS_COMMAND_SET_VALUE
    GIMP_PROGRESS_COMMAND_PULSE
    GIMP_PROGRESS_COMMAND_GET_WINDOW
>;

constant GimpRepeatMode is export := guint32;
our enum GimpRepeatModeEnum is export <
    GIMP_REPEAT_NONE
    GIMP_REPEAT_SAWTOOTH
    GIMP_REPEAT_TRIANGULAR
    GIMP_REPEAT_TRUNCATE
>;

constant GimpRotationType is export := guint32;
our enum GimpRotationTypeEnum is export <
  GIMP_ROTATE_90
  GIMP_ROTATE_180
  GIMP_ROTATE_270
>;

constant GimpRunMode is export := guint32;
our enum GimpRunModeEnum is export <
    GIMP_RUN_INTERACTIVE
    GIMP_RUN_NONINTERACTIVE
    GIMP_RUN_WITH_LAST_VALS
>;

constant GimpSelectCriterion is export := guint32;
our enum GimpSelectCriterionEnum is export <
    GIMP_SELECT_CRITERION_COMPOSITE
    GIMP_SELECT_CRITERION_R
    GIMP_SELECT_CRITERION_G
    GIMP_SELECT_CRITERION_B
    GIMP_SELECT_CRITERION_H
    GIMP_SELECT_CRITERION_S
    GIMP_SELECT_CRITERION_V
    GIMP_SELECT_CRITERION_A
    GIMP_SELECT_CRITERION_LCH_L
    GIMP_SELECT_CRITERION_LCH_C
    GIMP_SELECT_CRITERION_LCH_H
>;

constant GimpSizeType is export := guint32;
our enum GimpSizeTypeEnum is export <
    GIMP_PIXELS
    GIMP_POINTS
>;

constant GimpStackTraceMode is export := guint32;
our enum GimpStackTraceModeEnum is export <
    GIMP_STACK_TRACE_NEVER
    GIMP_STACK_TRACE_QUERY
    GIMP_STACK_TRACE_ALWAYS
>;

constant GimpStrokeMethod is export := guint32;
our enum GimpStrokeMethodEnum is export <
    GIMP_STROKE_LINE
    GIMP_STROKE_PAINT_METHOD
>;

constant GimpTextDirection is export := guint32;
our enum GimpTextDirectionEnum is export <
    GIMP_TEXT_DIRECTION_LTR
    GIMP_TEXT_DIRECTION_RTL
    GIMP_TEXT_DIRECTION_TTB_RTL
    GIMP_TEXT_DIRECTION_TTB_RTL_UPRIGHT
    GIMP_TEXT_DIRECTION_TTB_LTR
    GIMP_TEXT_DIRECTION_TTB_LTR_UPRIGHT
>;

constant GimpTextHintStyle is export := guint32;
our enum GimpTextHintStyleEnum is export <
    GIMP_TEXT_HINT_STYLE_NONE
    GIMP_TEXT_HINT_STYLE_SLIGHT
    GIMP_TEXT_HINT_STYLE_MEDIUM
    GIMP_TEXT_HINT_STYLE_FULL
>;

constant GimpTextJustification is export := guint32;
our enum GimpTextJustificationEnum is export <
    GIMP_TEXT_JUSTIFY_LEFT
    GIMP_TEXT_JUSTIFY_RIGHT
    GIMP_TEXT_JUSTIFY_CENTER
    GIMP_TEXT_JUSTIFY_FILL
>;

constant GimpTransferMode is export := guint32;
our enum GimpTransferModeEnum is export (
    'GIMP_TRANSFER_SHADOWS',
    'GIMP_TRANSFER_MIDTONES',
    'GIMP_TRANSFER_HIGHLIGHTS'
);
our enum GimpTransferModeDeprecatedEnum is export (
    GIMP_SHADOWS    => GIMP_TRANSFER_SHADOWS,
    GIMP_MIDTONES   => GIMP_TRANSFER_MIDTONES,
    GIMP_HIGHLIGHTS => GIMP_TRANSFER_HIGHLIGHTS,
);

constant GimpTransformDirection is export := guint32;
our enum GimpTransformDirectionEnum is export <
    GIMP_TRANSFORM_FORWARD
    GIMP_TRANSFORM_BACKWARD
>;

constant GimpTransformResize is export := guint32;
our enum GimpTransformResizeEnum is export <
    GIMP_TRANSFORM_RESIZE_ADJUST
    GIMP_TRANSFORM_RESIZE_CLIP
    GIMP_TRANSFORM_RESIZE_CROP
    GIMP_TRANSFORM_RESIZE_CROP_WITH_ASPECT
>;

constant GimpUnit is export := guint32;
our enum GimpUnitEnum is export (;
  GIMP_UNIT_PIXEL   => 0,
  GIMP_UNIT_INCH    => 1,
  GIMP_UNIT_MM      => 2,
  GIMP_UNIT_POINT   => 3,
  GIMP_UNIT_PICA    => 4,
  GIMP_UNIT_END     => 5,
  GIMP_UNIT_PERCENT => 65536
);

constant GimpUserDirectory is export := guint32;
our enum GimpUserDirectoryEnum is export <
    GIMP_USER_DIRECTORY_DESKTOP
    GIMP_USER_DIRECTORY_DOCUMENTS
    GIMP_USER_DIRECTORY_DOWNLOAD
    GIMP_USER_DIRECTORY_MUSIC
    GIMP_USER_DIRECTORY_PICTURES
    GIMP_USER_DIRECTORY_PUBLIC_SHARE
    GIMP_USER_DIRECTORY_TEMPLATES
    GIMP_USER_DIRECTORY_VIDEOS
>;

constant GimpVectorsStrokeType is export := guint32;
our enum GimpVectorsStrokeTypeEnum is export <
    GIMP_VECTORS_STROKE_TYPE_BEZIER
>;

# GIMPCONFIG

constant GimpColorManagementMode is export := guint32;
our enum GimpColorManagementModeEnum is export <
    GIMP_COLOR_MANAGEMENT_OFF
    GIMP_COLOR_MANAGEMENT_DISPLAY
    GIMP_COLOR_MANAGEMENT_SOFTPROOF
>;

constant GimpColorRenderingIntent is export := guint32;
our enum GimpColorRenderingIntentEnum is export <
    GIMP_COLOR_RENDERING_INTENT_PERCEPTUAL
    GIMP_COLOR_RENDERING_INTENT_RELATIVE_COLORIMETRIC
    GIMP_COLOR_RENDERING_INTENT_SATURATION
    GIMP_COLOR_RENDERING_INTENT_ABSOLUTE_COLORIMETRIC
>;

constant GimpConfigError is export := guint32;
our enum GimpConfigErrorEnum is export <
    GIMP_CONFIG_ERROR_OPEN
    GIMP_CONFIG_ERROR_OPEN_ENOENT
    GIMP_CONFIG_ERROR_WRITE
    GIMP_CONFIG_ERROR_PARSE
    GIMP_CONFIG_ERROR_VERSION
>;

constant GimpConfigPathType is export := guint32;
our enum GimpConfigPathTypeEnum is export <
    GIMP_CONFIG_PATH_FILE
    GIMP_CONFIG_PATH_FILE_LIST
    GIMP_CONFIG_PATH_DIR
    GIMP_CONFIG_PATH_DIR_LIST
>;

# GIMPCOLOR

constant GimpColorTransformFlags is export := guint32;
our enum GimpColorTransformFlagsEnum is export (
    GIMP_COLOR_TRANSFORM_FLAGS_NOOPTIMIZE               => 0x0100,
    GIMP_COLOR_TRANSFORM_FLAGS_GAMUT_CHECK              => 0x1000,
    GIMP_COLOR_TRANSFORM_FLAGS_BLACK_POINT_COMPENSATION => 0x2000,
);

constant GimpRGBCompositeMode is export := guint32;
our enum GimpRGBCompositeModeEnum is export (
    GIMP_RGB_COMPOSITE_NONE =>  0,
    'GIMP_RGB_COMPOSITE_NORMAL',
    'GIMP_RGB_COMPOSITE_BEHIND'
);
