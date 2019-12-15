use v6;

unit package GIMP::Raw::GEGL_Enums;

constant GeglBlitFlags is export := guint32;
our enum GeglBlitFlagsEnum is export (
    GEGL_BLIT_DEFAULT =>  0,
    GEGL_BLIT_CACHE   =>  1 +< 0,
    GEGL_BLIT_DIRTY   =>  1 +< 1,
);

constant GeglCachePolicy is export := guint32;
our enum GeglCachePolicyEnum is export <
    GEGL_CACHE_POLICY_AUTO
    GEGL_CACHE_POLICY_NEVER
    GEGL_CACHE_POLICY_ALWAYS
>;

constant GeglClColorOp is export := guint32;
our enum GeglClColorOpEnum is export (
    GEGL_CL_COLOR_NOT_SUPPORTED =>  0,
    GEGL_CL_COLOR_EQUAL         =>  1,
    GEGL_CL_COLOR_CONVERT       =>  2,
);

constant GeglDebugFlag is export := guint32;
our enum GeglDebugFlagEnum is export (
    GEGL_DEBUG_PROCESS      =>  1,
    GEGL_DEBUG_BUFFER_LOAD  =>  1 +< 1,
    GEGL_DEBUG_BUFFER_SAVE  =>  1 +< 2,
    GEGL_DEBUG_TILE_BACKEND =>  1 +< 3,
    GEGL_DEBUG_PROCESSOR    =>  1 +< 4,
    GEGL_DEBUG_CACHE        =>  1 +< 5,
    GEGL_DEBUG_MISC         =>  1 +< 6,
    GEGL_DEBUG_INVALIDATION =>  1 +< 7,
    GEGL_DEBUG_OPENCL       =>  1 +< 8,
    GEGL_DEBUG_BUFFER_ALLOC =>  1 +< 9,
    GEGL_DEBUG_LICENSE      =>  1 +< 10,
);

constant GeglDistanceMetric is export := guint32;
our enum GeglDistanceMetricEnum is export <
    GEGL_DISTANCE_METRIC_EUCLIDEAN
    GEGL_DISTANCE_METRIC_MANHATTAN
    GEGL_DISTANCE_METRIC_CHEBYSHEV
>;

constant GeglDitherMethod is export := guint32;
our enum GeglDitherMethodEnum is export <
    GEGL_DITHER_NONE
    GEGL_DITHER_FLOYD_STEINBERG
    GEGL_DITHER_BAYER
    GEGL_DITHER_RANDOM
    GEGL_DITHER_RANDOM_COVARIANT
    GEGL_DITHER_ARITHMETIC_ADD
    GEGL_DITHER_ARITHMETIC_ADD_COVARIANT
    GEGL_DITHER_ARITHMETIC_XOR
    GEGL_DITHER_ARITHMETIC_XOR_COVARIANT
>;

constant GeglOrientation is export := guint32;
our enum GeglOrientationEnum is export <
    GEGL_ORIENTATION_HORIZONTAL
    GEGL_ORIENTATION_VERTICAL
>;

constant GeglSamplerType is export := guint32;
our enum GeglSamplerTypeEnum is export <
    GEGL_SAMPLER_NEAREST
    GEGL_SAMPLER_LINEAR
    GEGL_SAMPLER_CUBIC
    GEGL_SAMPLER_NOHALO
    GEGL_SAMPLER_LOHALO
>;

constant GeglScCreationError is export := guint32;
our enum GeglScCreationErrorEnum is export (
    GEGL_SC_CREATION_ERROR_NONE =>  0,
    'GEGL_SC_CREATION_ERROR_EMPTY',
    'GEGL_SC_CREATION_ERROR_TOO_SMALL',
    'GEGL_SC_CREATION_ERROR_HOLED_OR_SPLIT'
);

constant GeglScDirection is export := guint32;
our enum GeglScDirectionEnum is export (
    GEGL_SC_DIRECTION_N     =>  0,
    GEGL_SC_DIRECTION_NE    =>  1,
    GEGL_SC_DIRECTION_E     =>  2,
    GEGL_SC_DIRECTION_SE    =>  3,
    GEGL_SC_DIRECTION_S     =>  4,
    GEGL_SC_DIRECTION_SW    =>  5,
    GEGL_SC_DIRECTION_W     =>  6,
    GEGL_SC_DIRECTION_NW    =>  7,
    GEGL_SC_DIRECTION_COUNT =>  8,
);

constant GeglSplitStrategy is export := guint32;
our enum GeglSplitStrategyEnum is export <
    GEGL_SPLIT_STRATEGY_AUTO
    GEGL_SPLIT_STRATEGY_HORIZONTAL
    GEGL_SPLIT_STRATEGY_VERTICAL
>;

constant NPDSettings is export := guint32;
our enum NPDSettingsEnum is export (
    NPD_BILINEAR_INTERPOLATION =>  1,
    NPD_ALPHA_BLENDING         =>  1 +< 1,
);
