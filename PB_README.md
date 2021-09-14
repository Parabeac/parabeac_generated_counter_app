# How to leverage Parabeac to manage visual development & business logic.

Parabeac is a design to development tool aimed to continuously integrate design changes into the project repo. Parabeac generates UI code from Figma/Sketch to Flutter. Knowing how to handle the UI code generated is crucial to having a successful project integration. There are just a few things to understand which can be laid out below. 

1. Parabeac generates static UI code (.g)
2. Providers wrap UI code (bloc, provider, riverpod)
3. Dynamic UI elements need to be tagged (`<custom>`)

A good example project based on the Flutter counter app can be found [here](https://github.com/Parabeac/parabeac_generated_counter_app) to show how to follow these rules.

* How to wrap screens and views with state & business logic
* How to reference state & logic on specific widgets
* How to leverage views (Components/Symbols)
* When the UI can't be automatically interpreted & generated

### How to wrap screens and views with state & business logic
### How to reference state & logic on specific widgets
### How to leverage views (Components/Symbols)
### When the UI can't be automatically interpreted & generated