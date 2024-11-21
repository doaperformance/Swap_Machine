
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using TMPro;

public class Timer : UdonSharpBehaviour
{
    public float timeSeconds;
    public TextMeshProUGUI field;
    float tS;
    public void FixedUpdate()
    {
        float timeRemain = tS - Time.time;

        
        float minutes = Mathf.Floor(timeRemain / 60);
        float seconds = timeRemain % 60;
        if (timeRemain < 0)
        {
            tS = timeSeconds + Time.time;
        }
        field.text = minutes + ":" + Mathf.RoundToInt(seconds).ToString();
        //Debug.Log(minutes+":"+ Mathf.RoundToInt(seconds));
    }
    public void timerReset()
    {
        tS = timeSeconds + Time.time;
    }
}
