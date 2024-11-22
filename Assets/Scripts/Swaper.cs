
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;
using TMPro;

public class Swaper : UdonSharpBehaviour
{
   
    public Animator sceneAnimator;
    public string mainTriggerName;
    public TextMeshProUGUI midiInfo;
    public SoundSample soundSample;
    
    private void Start()
    {
        midiInfo.text = "Миди команд не было";
    }
    public override void MidiNoteOn(int channel, int number, int velocity)
    {
        Debug.Log("pressed MIDI key: " + number);
        midiInfo.text = "Информация о Midi:" + "\n" +
        "channel: "+channel+"\n"+
        "number: "+number+ "\n"+
        "velcity: "+velocity + "\n" +
        "last pressed: "+System.DateTime.Now.ToString("HH:mm:ss:ff");

        if (velocity == 127)
        {   
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "PublicAnimChange");
        }        
   
    }
    public void ManualSceneChange()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "PublicAnimChange");
    }
    public void PublicAnimChange()
    {
        sceneAnimator.SetTrigger(mainTriggerName);
        
        soundSample.SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "PlaySounds");
    }

}
