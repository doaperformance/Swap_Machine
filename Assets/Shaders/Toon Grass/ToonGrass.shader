// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ToonGrass"
{
	Properties
	{
		_Color("Color", Color) = (0,0,0,0)
		_GroundColor("GroundColor", Color) = (1,1,1,0)
		_HeightGradient("HeightGradient", Float) = 0
		_Wind("Wind", Vector) = (-0.01,0.1,0,0)
		_WIndSpeed("WIndSpeed", Float) = 2
		_Turb("Turb", Float) = 0.25
		_Randomize("Randomize", Float) = 0
		_WindTex("WindTex", 2D) = "white" {}
		_Smooth("Smooth", Range( 0 , 1)) = 0
		_Test("Test", Vector) = (0,1,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha noshadow vertex:vertexDataFunc 
		struct Input
		{
			half2 uv_texcoord;
		};

		uniform half3 _Test;
		uniform sampler2D _WindTex;
		uniform half2 _Wind;
		uniform half _WIndSpeed;
		uniform half _Turb;
		uniform half _Randomize;
		uniform float4 _WindTex_ST;
		uniform half4 _GroundColor;
		uniform half4 _Color;
		uniform half _HeightGradient;
		uniform half _Smooth;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float localWind19 = ( 0.0 );
			float height19 = v.texcoord.xy.y;
			float4 transform18 = mul(unity_ObjectToWorld,(v.texcoord.xy).xyyy);
			float3 pos19 = transform18.xyz;
			float turb19 = _Turb;
			float randomize19 = _Randomize;
			float tilingUV19 = _WindTex_ST.xy.x;
			float offsetUV19 = _WindTex_ST.zw.x;
			sampler2D noise19 = _WindTex;
			float3 offset19 = float3( 0,0,0 );
			float3 p3 = frac(pos19.xzz * float3(443.897, 441.423, 437.195));
			p3 += dot(p3, p3.yxz + 19.19);
			p3 = frac((p3.xxy + p3.yxx) * p3.zyx);
			float2 uv = pos19.xz - _Time.y * _Wind.x * _WIndSpeed;
			uv = uv * tilingUV19 + offsetUV19;
			offset19.y = 0;
			offset19.xz = UnpackNormal(tex2Dlod(noise19, float4(uv, 0, 0))).xy;
			offset19.xz *= turb19 * _WIndSpeed;
			offset19.xz += _Wind.x;
			offset19.xz += (p3 - 0.5) * randomize19;
			offset19.xz *= height19 * height19;
			v.vertex.xyz += offset19;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 lerpResult6 = lerp( _GroundColor , _Color , saturate( ( i.uv_texcoord.y * _HeightGradient ) ));
			o.Emission = (lerpResult6).rgba.xyz;
			o.Smoothness = _Smooth;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16800
-2134;333.6;1920;1013;1840.938;-814.1057;1;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;1;-1256,328.7;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4;-1099,514.7;Float;False;Property;_HeightGradient;HeightGradient;2;0;Create;True;0;0;True;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;2;-1014,361.7;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.TextureCoordinatesNode;14;-1362.001,1053.01;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-754,395.7;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;5;-611,379.7;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;9;-745,45.69998;Float;False;Property;_GroundColor;GroundColor;1;0;Create;True;0;0;True;0;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;8;-872,200.7;Float;False;Property;_Color;Color;0;0;Create;True;0;0;True;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;20;-1332.916,792.4755;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;27;-1076.612,1452.395;Float;True;Property;_WindTex;WindTex;7;0;Create;True;0;0;True;0;None;None;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.SwizzleNode;15;-1048.982,1067.112;Float;False;FLOAT4;0;1;1;1;1;0;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureTransformNode;29;-737.6117,1456.395;Float;False;-1;1;0;SAMPLER2D;;False;2;FLOAT2;0;FLOAT2;1
Node;AmplifyShaderEditor.Vector2Node;22;-1043.012,1151.695;Float;False;Property;_Wind;Wind;3;0;Create;True;0;0;True;0;-0.01,0.1;-0.01,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.LerpOp;6;-429,270.7;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-809.6117,1278.295;Float;False;Property;_Turb;Turb;5;0;Create;True;0;0;True;0;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;21;-1057.476,841.3354;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;25;-811.6117,1353.695;Float;False;Property;_Randomize;Randomize;6;0;Create;True;0;0;True;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;18;-858.4281,1008.517;Float;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;23;-818.2117,1201.695;Float;False;Property;_WIndSpeed;WIndSpeed;4;0;Create;True;0;0;True;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;38;261.4622,1220.816;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexToFragmentNode;39;313.4622,877.8156;Float;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SwizzleNode;10;-245,306.7129;Float;False;FLOAT4;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TangentVertexDataNode;37;254.4622,1076.816;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;26;-826.6117,1563.395;Float;True;Property;_TextureSample0;Texture Sample 0;8;0;Create;True;0;0;True;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;30;153.9763,948.5297;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-462,431.7;Float;False;Property;_Smooth;Smooth;8;0;Create;True;0;0;True;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;12;35,494.7;Float;False;Property;_Test;Test;9;0;Create;True;0;0;True;0;0,1,0;0,1,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode;31;-177.8142,738.598;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PosVertexDataNode;36;-170.2289,1131.188;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FractNode;33;-53.46155,1629.589;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;19;-421.5097,1051.233;Float;False;float3 p3 = frac(pos.xzz * float3(443.897, 441.423, 437.195))@$p3 += dot(p3, p3.yxz + 19.19)@$p3 = frac((p3.xxy + p3.yxx) * p3.zyx)@$$float2 uv = pos.xz - _Time.y * direction * speed@$uv = uv * tilingUV + offsetUV@$offset.y = 0@$offset.xz = UnpackNormal(tex2Dlod(noise, float4(uv, 0, 0))).xy@$offset.xz *= turb * speed@$offset.xz += direction@$offset.xz += (p3 - 0.5) * randomize@$offset.xz *= height * height@;3;True;10;False;height;FLOAT;0;In;;Float;False;False;pos;FLOAT3;0,0,0;In;;Float;False;True;direction;FLOAT;0;In;;Float;True;True;speed;FLOAT;0;In;;Float;True;False;turb;FLOAT;0;In;;Float;False;False;randomize;FLOAT;0;In;;Float;False;False;tilingUV;FLOAT;0;In;;Float;False;False;offsetUV;FLOAT;0;In;;Float;False;True;noise;SAMPLER2D;_Sampler819;In;;Float;False;False;offset;FLOAT3;0,0,0;Out;;Float;False;Wind;False;False;0;11;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;9;SAMPLER2D;_Sampler819;False;10;FLOAT3;0,0,0;False;2;FLOAT;0;FLOAT3;11
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;588.9496,208.1819;Half;False;True;2;Half;ASEMaterialInspector;0;0;Standard;ToonGrass;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;1;0
WireConnection;3;0;2;1
WireConnection;3;1;4;0
WireConnection;5;0;3;0
WireConnection;15;0;14;0
WireConnection;29;0;27;0
WireConnection;6;0;9;0
WireConnection;6;1;8;0
WireConnection;6;2;5;0
WireConnection;21;0;20;0
WireConnection;18;0;15;0
WireConnection;39;0;30;0
WireConnection;10;0;6;0
WireConnection;26;0;27;0
WireConnection;30;0;36;0
WireConnection;30;1;19;11
WireConnection;19;1;21;1
WireConnection;19;2;18;0
WireConnection;19;3;22;0
WireConnection;19;4;23;0
WireConnection;19;5;24;0
WireConnection;19;6;25;0
WireConnection;19;7;29;0
WireConnection;19;8;29;1
WireConnection;19;9;27;0
WireConnection;0;2;10;0
WireConnection;0;4;11;0
WireConnection;0;11;19;11
ASEEND*/
//CHKSM=47B850F92021C522E15F725F04B9CF16DAE03FF5