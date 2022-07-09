# Notes

There are three main issues

- Pop up modal (turbo frames/stream)
  - Render partial within index
  - Add stimulus to close modal

- Dynamic validation (stimulus)
  - Activate input fields as soon as the previous one is properly inputted

- Multi-step modal (session to preserve changes to @employee created in index controller)
  - Multistep implies two modals but also activate input fields as soon as the previous one is properly inputted
  - Update `@employee` in two steps