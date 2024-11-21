
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using TMPro;

public class AvatarChanger : UdonSharpBehaviour
{
    public VRC_AvatarPedestal pedestal;
    public string avatarId;

    public string avatarName;
    public TextMeshProUGUI field;


    void OnEnable()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "AvatarChange");
    }
    public void AvatarChange()
    {
        if (avatarId == null && avatarName == null)
        {
            field.text = "Недопустимый аватар";
            return;
        }
        pedestal.blueprintId = avatarId;
        SendCustomEventDelayedSeconds("DelayedAvatarChange", 0.5f);             
    }
    public void DelayedAvatarChange()
    {
        pedestal.SetAvatarUse(Networking.LocalPlayer);
        field.text = "Текущий аватар: " + avatarName;
    }
}
