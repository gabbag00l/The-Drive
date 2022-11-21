using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DialogueTrigger : MonoBehaviour
{
    public bool playerInRange;
    public bool autoStart;

    [Header("Ink JSON")]
    [SerializeField] private TextAsset inkJSON;

    private void Awake()
    {
        playerInRange = false;

        StartCoroutine(AutoStart());

    }

    private void Update()
    {
        if (playerInRange && !DialogueManager.GetInstance().dialogueIsPlaying)
        {
            if (Input.GetKeyDown(KeyCode.Space) || autoStart == true)
            {
                DialogueManager.GetInstance().EnterDialogueMode(inkJSON);

                Debug.Log("Pressed Space starting dialogue");
            }
        }
    }

    private void Start()
    {

       
    }

    private void OnTriggerEnter(Collider collider)
    {
        if (collider.CompareTag("Player"))
        {
            playerInRange = true;
        }
    }

    private void OnTriggerExit(Collider collider)
    {
        if (collider.CompareTag("Player"))
        {
            playerInRange = false;
        }
    }

    private IEnumerator AutoStart()
    {
        if (autoStart == true)
        {
            yield return new WaitForEndOfFrame();
            DialogueManager.GetInstance().EnterDialogueMode(inkJSON);
        }
    }
}
