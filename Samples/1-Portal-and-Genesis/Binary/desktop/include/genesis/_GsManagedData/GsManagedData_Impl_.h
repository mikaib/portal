// Generated by Haxe 4.3.3
#ifndef INCLUDED_genesis__GsManagedData_GsManagedData_Impl_
#define INCLUDED_genesis__GsManagedData_GsManagedData_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(genesis,_GsManagedData,GsManagedDataHolder)
HX_DECLARE_CLASS2(genesis,_GsManagedData,GsManagedData_Impl_)

namespace genesis{
namespace _GsManagedData{


class HXCPP_CLASS_ATTRIBUTES GsManagedData_Impl__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef GsManagedData_Impl__obj OBJ_;
		GsManagedData_Impl__obj();

	public:
		enum { _hx_ClassId = 0x3374e337 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="genesis._GsManagedData.GsManagedData_Impl_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"genesis._GsManagedData.GsManagedData_Impl_"); }

		inline static ::hx::ObjectPtr< GsManagedData_Impl__obj > __new() {
			::hx::ObjectPtr< GsManagedData_Impl__obj > __this = new GsManagedData_Impl__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< GsManagedData_Impl__obj > __alloc(::hx::Ctx *_hx_ctx) {
			GsManagedData_Impl__obj *__this = (GsManagedData_Impl__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(GsManagedData_Impl__obj), false, "genesis._GsManagedData.GsManagedData_Impl_"));
			*(void **)__this = GsManagedData_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~GsManagedData_Impl__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("GsManagedData_Impl_",9d,1d,08,a0); }

		static  ::genesis::_GsManagedData::GsManagedDataHolder _new(void * star,int size);
		static ::Dynamic _new_dyn();

		static  ::genesis::_GsManagedData::GsManagedDataHolder fromIntArray(::Array< int > data);
		static ::Dynamic fromIntArray_dyn();

		static  ::genesis::_GsManagedData::GsManagedDataHolder fromFloatArray(::Array< float > data);
		static ::Dynamic fromFloatArray_dyn();

};

} // end namespace genesis
} // end namespace _GsManagedData

#endif /* INCLUDED_genesis__GsManagedData_GsManagedData_Impl_ */ 
