## Interpreter

- some programming problems are best solved by creating some specialized language and expressing a solution in theat language
- these problems tend to be self-contained, with crisp boundaries around them
  - searching for objects based on some specification: build a query language
  - creating complex object configurations: build a configuration language
  - creating lots of discrete chunks of code, which you find yourself combining in an ever expanding array of combinations

- uses ASTs (abstract syntax trees)
- language is a series of expressions that can be decomposed into a tree structure
- can supply clients with an API for building up the tree in code; or
- you can write a parser that takes strings and turn them into the AST
- once you have the AST you can use it to evaulate itself and come up with the solution

![interpreter](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/interpreter/interpreter.png)

- use with parser
```ruby
text = "and (and(bigger 2000)(filename *.png)) writeable"
parser = Parser.new(text)
ast = parser.expression
ast.evaluate(dir)
```

- use without parser
```ruby
expression = (Bigger.new(2000) & Not.new(Writable.new)) | FileName.new('*.png')
expression.evaluate(dir)
```
or
```ruby
expression = (bigger(2000) & except(writable)) | file_name('*.png')
expression.evaluate(dir)
```
