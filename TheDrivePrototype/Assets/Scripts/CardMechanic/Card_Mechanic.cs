using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;

public class Card_Mechanic : MonoBehaviour
{
    
    private int cardNumber;

    [Header("Cards Panels")]
    [SerializeField] private GameObject[] cardsPanels;

    // Start is called before the first frame update
    void Start()
    {
        //cardNumber = ((Ink.Runtime.StringValue) DialogueManager.GetInstance().GetVariableState("random_number")).value;
    }

    // Update is called once per frame
    void Update()
    {
        cardNumber = ((Ink.Runtime.IntValue) DialogueManager.GetInstance().GetVariableState("random_number")).value;

        //CheckNumber();
        IsDialogueActive();
    }

    private void IsDialogueActive()
    {
        if (DialogueManager.GetInstance().dialogueIsPlaying)
        {
            CheckNumber();
        }

        else
        {
            
            foreach (GameObject panel in cardsPanels)
            {
                panel.SetActive(false);
            }
        }
    }

    private void CheckNumber()
    {
      /* if (cardNumber >=3)
        {
            Debug.Log("Card Number is more than or equal to 3");
        }
        else if (cardNumber < 3)
        {
            Debug.Log("Card Number is less than 3");
        }

        for (int i = 0; i < cardNumber; i++)
        {
            
        }*/

        switch (cardNumber) //remember that in the array cardNumber 1 equal to 0, 2 equal to 1, etc etc
        {
            case 0:
                Debug.Log("0 card");

                break;

            case 1:
                Debug.Log("1 card");

                cardsPanels[0].SetActive(true);
                break;

            case 2:
                Debug.Log("2 card");

                cardsPanels[1].SetActive(true);
                break;

            case 3:
                Debug.Log("3 card");

                cardsPanels[2].SetActive(true);
                break;

            case 4:
                Debug.Log("4 card");

                cardsPanels[3].SetActive(true);
                break;

            case 5:
                Debug.Log("5 card");
                cardsPanels[4].SetActive(true);
                break;
        }
    }
}
