## Domain-specific languages DSL

- not a GoF pattern
- programming language that instead of expressing programming ideas, expresses things about the user's specific domain of interest (accounting, rocket science, ...)
- external DSLs: there is a parser and an interpreter for the DSL and there are the programms written in the DSL, and the two are completely distinct (e.g. accounting DSL and a parser and interpreter in Ruby)
- internal DSL: bend the implementation language into being the DSL
  - need to define the DSL that it fits within the ruby sythax rules
  - uses `eval` to execute the ruby code
