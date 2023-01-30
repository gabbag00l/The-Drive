using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ThirdPersonMovementController : MonoBehaviour
{
      public CharacterController characterController;
      public float speed = 6f;
      public float turnSmoothTime = 0.1f;
      float turnSmoothVelocity;

    public Animator animator;

    public Transform cam;

    public Transform groundCheck;
    public float groundDistance = 0.4f;
    public LayerMask groundLayer;
    Vector3 velocity;
    bool isGrounded;
    public float gravity = -9.81f;

      // Update is called once per frame
      void Update()
      {
        if (DialogueManager.GetInstance().dialogueIsPlaying)
        {
            return;
        }

        velocity.y += gravity * Time.deltaTime;

        characterController.Move(velocity * Time.deltaTime);

        isGrounded = Physics.CheckSphere(groundCheck.position, groundDistance, groundLayer);

        if (isGrounded && velocity.y < 0)
        {
            velocity.y = -2f;
        }

         
        
        float horizontal = Input.GetAxisRaw("Horizontal");
          float vertical = Input.GetAxisRaw("Vertical");

          Vector3 direction = new Vector3(horizontal, 0f, vertical).normalized;
          if (direction.magnitude >= 0.1f)
              {
              float targetAngle = Mathf.Atan2(direction.x, direction.z) * Mathf.Rad2Deg + cam.eulerAngles.y;
              float angle = Mathf.SmoothDampAngle(transform.eulerAngles.y, targetAngle, ref turnSmoothVelocity, turnSmoothTime);
              transform.rotation = Quaternion.Euler(0f, angle, 0f);

              Vector3 moveDirection = Quaternion.Euler(0f, targetAngle, 0f) * Vector3.forward;
              characterController.Move(moveDirection.normalized * speed * Time.deltaTime);
              animator.SetBool("animatorIsRunning", true);
              }

          else
        {
            animator.SetBool("animatorIsRunning", false);
        }

      }

      
}



