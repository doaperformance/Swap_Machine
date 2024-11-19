
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class SubSceneLight : UdonSharpBehaviour
{
    public Material skyBoxMat;
    
    public Color fogColor;
    public float fogDensity;
    void OnEnable()
    {
        RenderSettings.skybox = skyBoxMat;
        
            RenderSettings.fogColor = fogColor;
            RenderSettings.fogDensity = fogDensity;
        
    }
}
