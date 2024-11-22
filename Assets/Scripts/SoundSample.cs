
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

[RequireComponent(typeof(AudioSource))]

public class SoundSample : UdonSharpBehaviour
{
    AudioSource aS;
    public AudioClip[] samples;
    void Start()
    {
        aS = GetComponent<AudioSource>();
    }
    public void PlaySounds()
    {
        int rnd = Random.Range(0, samples.Length);
        Debug.Log(rnd + " random nuber");
        if(samples[rnd]!=null) aS.PlayOneShot(samples[rnd]);
    }
}
