
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class ForceSceneChange : UdonSharpBehaviour
{
    public Animator animator;
    public string animName;

    public void ButtonPressed()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "AllChange");
    }
    public void AllChange()
    {
        animator.Play(animName);
    }
}
