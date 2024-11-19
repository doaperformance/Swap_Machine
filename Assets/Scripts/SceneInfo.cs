
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using TMPro;

public class SceneInfo : UdonSharpBehaviour
{
    public string sceneNumber;
    public TextMeshProUGUI field;
    void OnEnable()
    {
        field.text = "Текущая сцена: "+ sceneNumber;
    }
}
