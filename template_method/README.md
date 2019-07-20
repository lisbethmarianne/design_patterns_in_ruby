## Template Method
- build an abstract base class with a skeletal method
- this skeletal method (template method) drives the bit of the processing that needs to vary, but it does so by making calls to abstract methods, which are supplied by the subclasses
- the abstract base class controls the higher-level-processing through the template method; the subclasses simply fill in the details
- hook methods are non-abstract methods that provide default behaviour in the base class, they can be overwritten by the subclasses
- are frequently empty, let subclasses know what is happening

![template method](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/template_method/template_method.png)
