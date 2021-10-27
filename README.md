# Redux-modularization

Idea: https://github.com/ReSwift/ReSwift/issues/377

1 store.

Each feature module has:
- Reducer
- Action

All state definations and protocols are defined in Contract module (can be seperated).

Problem: Cannot use storyboard or nib file (investigating...)

![Workflow](redux.png)
