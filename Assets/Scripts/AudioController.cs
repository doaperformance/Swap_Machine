
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

public class AudioController : UdonSharpBehaviour
{
    public Slider volumSlider;
    public AudioSource[] sources;
    void Start()
    {
        for (int i = 0; i < sources.Length; i++)
        {
            if (sources[i] != null) sources[i].volume = volumSlider.value;
        }
    }
    public void VolumeChange()
    {
        for (int i = 0; i < sources.Length; i++)
        {
            if (sources[i] != null) sources[i].volume = volumSlider.value;
        }
    }
}
