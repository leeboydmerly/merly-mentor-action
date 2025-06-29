# Merly Mentor Action

A GitHub Action that installs MPCC Universal and runs MerlyMentor on your code.

## Usage

Add this step to your workflow (after `actions/checkout@v3`):

```yaml
- name: Merly Mentor Check
  uses: your-org/merly-mentor-action@v1.0.0
  with:
    mm-key: ${{ secrets.MM_KEY }}
