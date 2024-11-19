
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
        if (avatarId == null) return;
        pedestal.blueprintId = avatarId;
        pedestal.SetAvatarUse(Networking.LocalPlayer);

        if (avatarName == null) return;
        field.text = "Текущий аватар: " + avatarName;
    }
}
