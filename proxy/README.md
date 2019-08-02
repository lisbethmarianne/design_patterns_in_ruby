## Proxy
- used when
  - you need to controll access to an object (Protection Proxy)
  - you need to provide a location independent way of getting to that object (Remote Proxy)
  - you need to delay the creation of the object (Virtual Proxy)

- when client asks for an object we give it back a proxy, an object that looks like the object requested but is an imposter
- inside the proxy the real object is hidden and the proxy forwards all calls from the client to the proxy

![proxy](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/proxy/proxy.png)
