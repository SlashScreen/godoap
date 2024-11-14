# GodOAP - GOAP implementation for Godot 4.3+

This is GodOAP, a work in progress implementation of a GOAP AI system for Godot 4.3+.
This is in *theory* production ready, but it has not been battle-tested. Use with caution.
If you don't know what GOAP AI is, the explanation is out of scope for this document. There are many resources online that can explain it to you.

## How to use

### Install

For now, you have 2 options:

1. Download or clone the repo into your addons folder.
2. Add the repo as a git submodule in your addons folder.

### The Theory

Inspired by [crashkonjin's implementation](https://github.com/crashkonijn/GOAP), the goals, instead of using boolean values, use integer values. This allows for greater flexibility and reduces redundancy. GodOAP takes this a step further, and allows theoretically *any* value to serve as a goal, provided you satisfy certain requirements.

### What's included

No actions are included in the repo, but there are default integer conditions and effects. 

### Making your own...

TODO

#### Goals

#### Actions

### In-game

In your NPC's scene, there should be a GOAPAgent node somewhere, and all of that agent's available actions should be nodes underneath it. 

### Debugging

Included is a helpful graph view (viewed using a button in the `GOAPAgent` inspector) that shows which actions can connect to eachother, and what goals can connect to actions. By following these connections, you can see all the possible action plans the agent can take.
