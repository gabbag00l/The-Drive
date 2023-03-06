using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Ink.Runtime;
using UnityEngine.EventSystems;
using UnityEngine.UI;


public class DialogueManager : MonoBehaviour
{
    private static DialogueManager instance;

    [Header("Paramaters")]
    [SerializeField] private float textSpeed = 0.02f;
    
    [Header("Dialogue UI")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;

    [Header("Choices UI")]
    [SerializeField] private GameObject[] choices;

    [Header("Load Globals JSON")]
    [SerializeField] private TextAsset loadGlobalsJSON;
    
    private TextMeshProUGUI[] choicesText;

    public Story currentStory;

    private Coroutine typingTextCoroutine;

    private bool canContinueToNextLine = false;

    public int cardsValue;

    public bool dialogueIsPlaying { get; private set; }

    private DialogueVariables dialogueVariables;

    private void Awake()
    {
        if (instance != null)
        {
            Debug.LogWarning("More than one Dialogue Manager in Scene");
        }

        instance = this;

        dialogueVariables = new DialogueVariables(loadGlobalsJSON);
    }

    public static DialogueManager GetInstance()
    {
        return instance;
    }

    private void Start()
    {
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);

        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
        foreach (GameObject choice in choices)
        {
            choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }
    }

    private void Update()
    {
        if (!dialogueIsPlaying)
        {
            return;
        }

        if (canContinueToNextLine 
            && Input.GetKeyDown(KeyCode.Space)
            && currentStory.currentChoices.Count == 0)
        {
            Debug.Log("Continuing Story");
            ContinueStory();
        }
    }

    public void EnterDialogueMode (TextAsset inkJSON)
    {
        currentStory = new Story(inkJSON.text);
     
       
        
        dialogueIsPlaying = true;
        dialoguePanel.SetActive(true);

        dialogueVariables.StartListening(currentStory);

        ContinueStory();
        
      
    }

    private IEnumerator ExitDialogueMode()
    {
        yield return new WaitForSeconds(0.1f);

        dialogueVariables.StopListening(currentStory);
        
        dialogueIsPlaying = false;
        dialoguePanel.GetComponentInChildren<Scrollbar>().value = 1;
        dialoguePanel.SetActive(false);
        dialogueText.text = "";
    }

    private void ContinueStory()
    {
        if (currentStory.canContinue)
        {
            if( typingTextCoroutine != null)
            {
                StopCoroutine(typingTextCoroutine);
            }
            
           typingTextCoroutine = StartCoroutine(TypingText(currentStory.ContinueMaximally()));
            
            
            
            Debug.Log("can Continue");
           
            dialoguePanel.GetComponentInChildren<Scrollbar>().value = 1;

        }
        else
        {
            StartCoroutine(ExitDialogueMode());
        }
    }

    private IEnumerator TypingText(string line)
    {
        dialogueText.text = "";

        HideChoices();
        
        canContinueToNextLine = false;

        foreach (char letter in line.ToCharArray())
        {
            
            dialogueText.text += letter;
            yield return new WaitForSeconds(textSpeed);
        }

        DisplayChoices();
        

        canContinueToNextLine = true;
    }

    private void HideChoices()
    {
        foreach(GameObject choiceButton in choices)
        {
            choiceButton.SetActive(false);
        }
    }

    private void DisplayChoices()
    {
        List<Choice> currentChoices = currentStory.currentChoices;

        if (currentChoices.Count > choices.Length)
        {
            Debug.LogError("More choices than UI can support. Number of choices = " + currentChoices.Count);
        }

        int index = 0;

        foreach (Choice choice in currentChoices)
        {
            choices[index].gameObject.SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }

        for (int i = index; i < choices.Length; i++)
        {
            choices[i].gameObject.SetActive(false);
        }

        StartCoroutine(SelectFirstChoice());
    }

    public void MakeChoice(int choiceIndex)
    {
        if (canContinueToNextLine)
        {
            currentStory.ChooseChoiceIndex(choiceIndex);
            ContinueStory();
            
        }
        
        
    }

    private IEnumerator SelectFirstChoice()
    {
        EventSystem.current.SetSelectedGameObject(null);
        yield return new WaitForEndOfFrame();
        EventSystem.current.SetSelectedGameObject(choices[0].gameObject);

    }

    //this makes the variables usable in other scripts which is helpful for the card mechanic

    public Ink.Runtime.Object GetVariableState(string variableName)
    {
        Ink.Runtime.Object variableValue = null;
        dialogueVariables.variables.TryGetValue(variableName, out variableValue);
        if (variableValue == null)
        {
            Debug.LogWarning("Ink Variable was found to be null" + variableName);
        }

        return variableValue;
    }

    }

