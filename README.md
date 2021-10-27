# Redux-modularization

Idea: https://github.com/ReSwift/ReSwift/issues/377

1 store.

Each feature module has:
- Reducer
- Action

All state definations and protocols are defined in Contract module (can be seperated to CounterContract, RoomContract...).

![Workflow](redux.png)

## On going:
- Problem: Cannot use storyboard or nib file (investigating...)
- Try injecting store for whole module (eg. `Room.config(store: mainStore)`) - now only inject when creating UIView
