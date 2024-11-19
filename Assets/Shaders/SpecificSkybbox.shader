// Made with Amplify Shader Editor v1.9.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SpecificSkybbox"
{
	Properties
	{
		_Texture("Texture", CUBE) = "white" {}
		_Vector0("Vector 0", Vector) = (0,0,0,0)
		_Pow("Pow", Float) = 0
		_Mul("Mul", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#include "Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc"
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float3 uv_texcoord;
		};

		uniform float3 _Vector0;
		uniform samplerCUBE _Texture;
		uniform float4 _Texture_ST;
		uniform float _Pow;
		uniform float _Mul;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float3 uv_Texture3 = i.uv_texcoord;
			uv_Texture3.xy = i.uv_texcoord.xy * _Texture_ST.xy + _Texture_ST.zw;
			float4 temp_cast_0 = (_Pow).xxxx;
			o.Emission = ( pow( texCUBE( _Texture, uv_Texture3 ) , temp_cast_0 ) * _Mul ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19200
Node;AmplifyShaderEditor.SamplerNode;8;-476,466.5;Inherit;True;Property;_TextureSample13;Texture Sample 13;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;2;-1279,203.5;Inherit;False;RotateUVFill;-1;;1;459952d587cbfe742a7e7f4a8a0a4169;0;2;1;FLOAT2;1,1;False;2;FLOAT;3.37;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector3Node;11;-1500,280.5;Inherit;False;Property;_Vector0;Vector 0;2;0;Create;True;0;0;0;True;0;False;0,0,0;0,1,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TextureCoordinatesNode;4;-1203,-25.5;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RotatorNode;3;-979,113.5;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,1;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldReflectionVector;10;-840,291.5;Inherit;False;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode;14;-1502,488.5;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RotateAboutAxisNode;6;-1100,396.5;Inherit;False;False;4;0;FLOAT3;0,1,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;15;-152.3594,117.0802;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;208,33;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;SpecificSkybbox;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-483,277.5;Inherit;False;Property;_Pow;Pow;3;0;Create;True;0;0;0;True;0;False;0;1.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;38.12891,140.8249;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-165.8711,274.8249;Inherit;False;Property;_Mul;Mul;4;0;Create;True;0;0;0;True;0;False;0;12.93;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-485.4002,69.39996;Inherit;True;Property;_Texture;Texture;0;0;Create;True;0;0;0;True;0;False;-1;ee281ac5303b36b40af02ec6f73ce038;None;True;0;False;white;Auto;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
WireConnection;3;0;11;0
WireConnection;6;0;11;0
WireConnection;6;3;14;0
WireConnection;15;0;1;0
WireConnection;15;1;12;0
WireConnection;0;2;17;0
WireConnection;17;0;15;0
WireConnection;17;1;16;0
ASEEND*/
//CHKSM=C2D8F434E0B468DEFFCE2F3EEE6E6B8CA604989B