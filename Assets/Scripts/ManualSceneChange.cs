
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class ManualSceneChange : UdonSharpBehaviour
{
    public int sceneNumber;
    public Animator sceneAnimator;
    public string mainTriggerName;
    public string sceneIntName;

    public void ButtonPress()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "SceneChange");
    }
    public void SceneChange()
    {
        sceneAnimator.SetTrigger(mainTriggerName);
        sceneAnimator.SetInteger(sceneIntName, sceneNumber);
    }
}
