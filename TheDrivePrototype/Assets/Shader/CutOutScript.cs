using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CutOutScript : MonoBehaviour
{
    [SerializeField]

    private Transform targetObject;

    [SerializeField]

    private LayerMask wallMask;

    private Camera mainCamera;
    

    public float cutOutSize;
    public float fallOffSize;

    private void Awake()
    {
        mainCamera = GetComponent<Camera>();
        
    }
    void Update()
    {
        Vector2 cutoutPos = mainCamera.WorldToViewportPoint(targetObject.position);
        cutoutPos.y /= (Screen.width / Screen.height);

        Vector3 offset = targetObject.position - transform.position;
        RaycastHit[] hitObjects = Physics.RaycastAll(transform.position, offset, offset.magnitude, wallMask);

        for(int i = 0; i < hitObjects.Length; ++i)
        {
            Material[] materials = hitObjects[i].transform.GetComponent<Renderer>().materials;

            for (int m = 0; m < materials.Length; ++m)
            {
                materials[m].SetVector("_CutoutPos", cutoutPos);
                materials[m].SetFloat("_CutoutSize", cutOutSize);
                materials[m].SetFloat("_FalloffSize", fallOffSize);
            }
        }
    }
}
