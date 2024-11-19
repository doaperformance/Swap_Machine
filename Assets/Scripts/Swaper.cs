
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;
using TMPro;

public class Swaper : UdonSharpBehaviour
{
    //public Text modeName;
    //public int currentMode;
    public Animator sceneAnimator;
    public string mainTriggerName;
    public TextMeshProUGUI midiInfo;
    //public int currentSceneValue;
    //public int maxSceneValue;

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
        /*
        switch (currentMode)
        {
            case 1:                
                break;
            case 2:
                if (-1 < number && 8 > number)
                {
                    //mainScript.sceneNumber = number;
                    //mainScript.Interact();
                }
                break;


            default:
                break;
        }
        */
    }
    public void ManualSceneChange()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "PublicAnimChange");
    }
    public void PublicAnimChange()
    {
        sceneAnimator.SetTrigger(mainTriggerName);
    }






    /*
    public Button buttonMode;
    
    
    
    public Animator BGAnimator;
    public string triggerAnimatorName;
    public string BGAnimatorName;
    


    public SceneChanger mainScript;
    public void Start()
    {
        currentMode = 0;
        ButtonInteract();
    }
    public void ButtonInteract()
    {
        Debug.Log("button pressed");

        switch (currentMode)
        {
            case 0:
                currentMode = 1;
                modeName.text = "1";//mode 1- it's 1 midi button, enum
                break;

            case 1:
                currentMode = 2;
                modeName.text = "7";//mode 2- it's 7 midi button, 1 per scena

                break;

            case 2:
                currentMode = 0;
                modeName.text = "M";//mode 0(M)- it's manual, with out midi

                break;


            default:
                currentMode = 0;
                modeName.text = "M";
                break;
        }

    }

   

    public void publicAnimChange()
    {
        //sceneAnimator.SetTrigger(triggerAnimatorName);
        //BGAnimator.SetTrigger(BGAnimatorName);
    }
    */
}
