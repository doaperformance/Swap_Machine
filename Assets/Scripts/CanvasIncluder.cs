
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

public class CanvasIncluder : UdonSharpBehaviour
{
    public Toggle toggle;
    public Canvas[] canvases;
    void Start()
    {
        toggle.isOn = false;
        for(int i=0; i < canvases.Length; i++)
        {
            canvases[i].enabled = toggle.isOn;
        }
    }
    public void ToggleInteract()
    {
        for (int i = 0; i < canvases.Length; i++)
        {
            canvases[i].enabled = toggle.isOn;
        }
    }
}
