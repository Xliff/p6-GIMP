use v6.c;

unit package GIMP::Raw::Enums;

constant GimpBrushGeneratedShape is export := guint32;
our enum GimpBrushGeneratedShapeEnum is export <
    GIMP_BRUSH_GENERATED_CIRCLE
    GIMP_BRUSH_GENERATED_SQUARE
    GIMP_BRUSH_GENERATED_DIAMOND
>;

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

constant GimpConversionPaletteType := guint;
our enum GimpConversionPaletteTypeEnum is export (
  'GIMP_CONVERT_PALETTE_GENERATE', # Generate optimum palette
  'GIMP_CONVERT_PALETTE_REUSE',    # Skip
  'GIMP_CONVERT_PALETTE_WEB',      # Use web-optimized palette
  'GIMP_CONVERT_PALETTE_MONO',     # Use black and white (1-bit) palette
  'GIMP_CONVERT_PALETTE_CUSTOM',   # Use custom palette
);

our enum GimpConversionPaletteTypeDeprecatedEnum is export (
  GIMP_MAKE_PALETTE   => GIMP_CONVERT_PALETTE_GENERATE, # skip, pdb-skip
  GIMP_REUSE_PALETTE  => GIMP_CONVERT_PALETTE_REUSE,    # skip, pdb-skip
  GIMP_WEB_PALETTE    => GIMP_CONVERT_PALETTE_WEB,      # skip, pdb-skip
  GIMP_MONO_PALETTE   => GIMP_CONVERT_PALETTE_MONO,     # skip, pdb-skip
  GIMP_CUSTOM_PALETTE => GIMP_CONVERT_PALETTE_CUSTOM    # skip, pdb-skip
);

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
