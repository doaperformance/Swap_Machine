
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using TMPro;
using UnityEngine.UI;

public class ForceAvatarChange : UdonSharpBehaviour
{
    public VRC_AvatarPedestal pedestal;
    public string avatarId;

    public string avatarName;
    public TextMeshProUGUI field;
    public Toggle nonChangeAvi;

    public void ButtonInteract()
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
        SendCustomEventDelayedSeconds("DelayedAvatarChange", 1f);
    }
    public void DelayedAvatarChange()
    {
        if (!nonChangeAvi.isOn)
        {
            pedestal.SetAvatarUse(Networking.LocalPlayer);
            Networking.LocalPlayer.SetAvatarEyeHeightByMeters(1.6f);
            field.text = "Текущий аватар: " + avatarName;
        }
        
    }
}
