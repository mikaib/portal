// Generated by Haxe 4.3.3
#include <hxcpp.h>

#ifndef INCLUDED_haxe_iterators_ArrayIterator
#include <haxe/iterators/ArrayIterator.h>
#endif
#ifndef INCLUDED_genesis__GsManagedData_GsManagedData_Impl_
#include <genesis/_GsManagedData/GsManagedData_Impl_.h>
#endif
#ifndef INCLUDED_genesis__GsManagedData_GsManagedDataHolder
#include <genesis/_GsManagedData/GsManagedDataHolder.h>
#endif
#ifndef INCLUDED_genesis_GsMainloop
#include <genesis/GsMainloop.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_Main
#include <Main.h>
#endif

void __files__boot();

void __boot_all()
{
__files__boot();
::hx::RegisterResources( ::hx::GetResources() );
::haxe::iterators::ArrayIterator_obj::__register();
::genesis::_GsManagedData::GsManagedData_Impl__obj::__register();
::genesis::_GsManagedData::GsManagedDataHolder_obj::__register();
::genesis::GsMainloop_obj::__register();
::Std_obj::__register();
::Main_obj::__register();
}

