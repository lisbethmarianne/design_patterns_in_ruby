## Composite

- sum acts like one of the parts
- useful when you are trying to build a hierarchy or tree of objects, and you do not want to worry if you are dealing with a leaf (single object) or a bushy branch (composite) of your tree
- 3 parts
  - base class or interface for all your objects (= component)
  - one or more leaf classes, the simple, indivisable building block (implements the component interface)
  - at least one higher-level class (= composite), is build from subcomponents (implements the component interface)

![composite](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/composite/composite.png)
