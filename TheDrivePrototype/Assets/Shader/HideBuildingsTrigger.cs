using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HideBuildingsTrigger : MonoBehaviour
{
    public bool inBuilding = false;
    public Material[] material;
    Renderer rend;


    private void Start()
    {
        rend = GetComponent<Renderer>();
        rend.enabled = true;
        rend.sharedMaterial = material[0];
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player" && inBuilding == false)
        {
            rend.sharedMaterial = material[1];
            inBuilding = true;
        }
 
    }

     void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Player" && inBuilding == true)
        {
            rend.sharedMaterial = material[0];
            inBuilding = false;
        }

    }

}
