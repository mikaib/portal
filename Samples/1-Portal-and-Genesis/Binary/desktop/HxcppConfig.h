#ifndef HXCPP_CONFIG_INCLUDED
#define HXCPP_CONFIG_INCLUDED

#if !defined(HX_LINUX) && !defined(NO_HX_LINUX)
#define HX_LINUX 
#endif

#if !defined(HXCPP_M64) && !defined(NO_HXCPP_M64)
#define HXCPP_M64 
#endif

#if !defined(HXCPP_VISIT_ALLOCS) && !defined(NO_HXCPP_VISIT_ALLOCS)
#define HXCPP_VISIT_ALLOCS 
#endif

#if !defined(HXCPP_STACK_TRACE) && !defined(NO_HXCPP_STACK_TRACE)
#define HXCPP_STACK_TRACE 
#endif

#if !defined(HXCPP_TELEMETRY) && !defined(NO_HXCPP_TELEMETRY)
#define HXCPP_TELEMETRY 
#endif

#if !defined(HXCPP_STACK_LINE) && !defined(NO_HXCPP_STACK_LINE)
#define HXCPP_STACK_LINE 
#endif

#if !defined(HX_SMART_STRINGS) && !defined(NO_HX_SMART_STRINGS)
#define HX_SMART_STRINGS 
#endif

#if !defined(HXCPP_API_LEVEL) && !defined(NO_HXCPP_API_LEVEL)
#define HXCPP_API_LEVEL 430
#endif

#if !defined(HXCPP_TRACY) && !defined(NO_HXCPP_TRACY)
#define HXCPP_TRACY 
#endif

#if !defined(HXCPP_M64) && !defined(NO_HXCPP_M64)
#define HXCPP_M64 
#endif

#include <hxcpp.h>

#endif
