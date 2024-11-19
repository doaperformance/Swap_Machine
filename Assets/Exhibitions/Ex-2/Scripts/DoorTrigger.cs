using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

[RequireComponent(typeof(Collider))]
public class DoorTrigger : MonoBehaviour
{
    public event Action OnTriggeredEnter;
    public event Action OnTriggeredExit;
    [SerializeField] private UnityEvent _onTriggeredEnter;
    [SerializeField] private UnityEvent _onTriggeredExit;


    private void OnTriggerEnter(Collider other)
    {
        if (other.GetComponentInChildren<Camera>())
        {
            OnTriggeredEnter?.Invoke();
            _onTriggeredEnter?.Invoke();
            //Debug.Log("DoorTriggerActivate");
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.GetComponentInChildren<Camera>())
        {
            OnTriggeredExit?.Invoke();
            _onTriggeredExit?.Invoke();
        }
    }
}
