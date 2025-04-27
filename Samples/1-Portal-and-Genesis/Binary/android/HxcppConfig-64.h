#ifndef HXCPP_CONFIG_INCLUDED
#define HXCPP_CONFIG_INCLUDED

#if !defined(HXCPP_ARM64) && !defined(NO_HXCPP_ARM64)
#define HXCPP_ARM64 
#endif

#if !defined(HXCPP_M64) && !defined(NO_HXCPP_M64)
#define HXCPP_M64 
#endif

#if !defined(HXCPP_VISIT_ALLOCS) && !defined(NO_HXCPP_VISIT_ALLOCS)
#define HXCPP_VISIT_ALLOCS 
#endif

#if !defined(HX_SMART_STRINGS) && !defined(NO_HX_SMART_STRINGS)
#define HX_SMART_STRINGS 
#endif

#if !defined(HXCPP_API_LEVEL) && !defined(NO_HXCPP_API_LEVEL)
#define HXCPP_API_LEVEL 430
#endif

#if !defined(ANDROID) && !defined(NO_ANDROID)
#define ANDROID ANDROID
#endif

#if !defined(HXCPP_CLANG) && !defined(NO_HXCPP_CLANG)
#define HXCPP_CLANG 
#endif

#if !defined(HX_ANDROID) && !defined(NO_HX_ANDROID)
#define HX_ANDROID 
#endif

#if !defined(HXCPP_ANDROID_PLATFORM) && !defined(NO_HXCPP_ANDROID_PLATFORM)
#define HXCPP_ANDROID_PLATFORM 21
#endif

#include <hxcpp.h>

#endif
