## Adapter

- an adaper is an object that crosses the chasm between the interface you have and the interface you need
- need to build an adapter because the interface that the client is expecting is not the interface that the adaptee is offering
- the client expects the target to have a certain interface
- unknown to the client the target is really an adapter
- burried in the adapter is a second object the adaptee, that performs the actual work

![adapter](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/adapter/adapter.png)
