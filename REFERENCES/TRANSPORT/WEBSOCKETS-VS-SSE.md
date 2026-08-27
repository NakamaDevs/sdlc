# SOURCE SNAPSHOT\n\n- Source URL: https://dashbit.co/blog/websockets-vs-sse\n- Title: WebSockets vs Server-Sent Events\n- Retrieved: 2026-08-27\n- Conversion: Turndown 7.2.4\n- Status: archival copy; verify the live source for current facts.\n\n---\n\n[![Dashbit](/images/logo-166c057038a97186c76e9f48807c096e.png?vsn=d)](/)

[Get in touch](/#contact)

*   [Services](/#services)
*   [About](/#about)
*   [Team](/#team)
*   [Contact](/#contact)
*   [Blog](/blog)
*   [E-books](javascript:void\(0\))
    *   [Free The Little Ecto Cookbook](/ebooks/the-little-ecto-cookbook)

# WebSockets vs. SSE should be about ordering and correctness

*   José Valim
*   August 25th, 2026
*   [liveview](/blog/tags/liveview) , [websockets](/blog/tags/websockets) , [sse](/blog/tags/sse)

A couple days ago, Andros, the maintainer of Django LiveView, wrote an article called [HTML over WebSockets: real-time SPAs with barely any JavaScript](https://en.andros.dev/blog/ef4968f5/html-over-websockets-real-time-spas-with-barely-any-javascript/). While the article does an overall good job of outlining the pros and cons of WebSockets and the LiveView architecture (reduced payloads, simplified stack, etc.), the top comment in the Hacker News discussion for said article says:

> For most apps just use SSE and the built-in code for making HTTP requests (Fetch) instead of hacking up your own client side JS to make requests over a WebSocket. The latency is the same because modern browsers multiplex HTTP requests over a single TCP connection that is left open.

To begin with, while Fetch will indeed reuse existing connections, requests are still stateless and therefore every request has to do the same work of decrypting session information, fetching the user from database or cache, and so on. With WebSockets, the connection is authenticated once and the user data is in memory, avoiding all this extra work. Furthermore, in the case of Phoenix LiveView, it actually [sends diffs over the wire, rather than HTML](/blog/latency-rendering-liveview), which reduces payload sizes drastically.

However, I’d say those benefits are secondary. The discussion around delivering HTML over WebSockets vs. Server-Sent Events (SSE) with Fetch should really be about event ordering and correctness. When using different data streams, it is very easy to receive and render events in the wrong order, resulting in confusing user experiences or misleading users into making the wrong decisions. As we will see, attempts to fix this typically mean more client complexity, increased latency, or both!

## The ordering issue

Imagine you have an article with three tags: “erlang”, “clojure”, and “javascript”. Then, at the same time, you decide to add the “elixir” tag, while another user decides to remove the “javascript” tag. Here is what most people expect to happen:

Loading event sequence…

In the example above, the database ends up with a list of “erlang”, “clojure”, and “elixir”. And your UI shows the exact same list, with “erlang”, “clojure”, and “elixir”. All is good!

However, thanks to the network, garbage-collectors, proxies, and other factors, the following is also a possible ordering of those events:

Loading event sequence…

In this new version, the delete operation executed first, but its update with the list of tags arrived later. This means your interface will briefly flash a list with “erlang”, “clojure”, and “elixir” as tags, but ultimately display only “erlang” and “clojure”. Basically, your interface will act as if the “elixir” tag was not added at all. And it won’t fix itself unless you refresh or a new event is sent over the wire.

At this point, some people like to yell, “that’s fine, it is eventually consistent.” Except that’s not what eventually consistent means. Generally speaking, an eventually consistent system guarantees that, if no new updates happen, all copies of the data will eventually converge to the same value. That won’t happen here. The interface can remain stale indefinitely, until you refresh the page or another event happens to bring it back in sync.

The root cause of the issue above is data being delivered over two different streams, it is not really intrinsic to SSE. For example, any application using WebSockets + Fetch to deliver different streams that update the same UI components would have the same race. The difference is that WebSockets are bidirectional, so you can do both reads and writes over the same connection:

Loading event sequence…

In the example above, the WebSocket connection is responsible for processing user events and recomputing updates, ensuring the correct tags list is delivered regardless of the order of events.

## Making concurrent requests work

As we have seen above, when using SSE + Fetch, we may have two concurrent requests. If both deliver data, we can have data races as there is no causal ordering between them.

The simplest solution is to make it so only one of those streams deliver updates. For example, you could make it so Fetch only performs the update but doesn’t deliver or render the tags list. Instead, the client waits until the update is delivered via SSE. The trouble with this approach is increased latency, as you need to rely on a queue system to deliver your own updates between servers:

Loading latency sequence…

The above is actually similar to how the long polling transport works in Phoenix. Except that we can skip one hop in Phoenix, as the nodes can communicate directly with each other via Distributed Erlang:

Loading latency sequence…

Using a bidirectional connection can skip those additionals hops altogether:

Loading latency sequence…

Because WebSockets are bidirectional, they provide a cheap way to preserve ordering between client operations and their responses, without the need to route your own operations through a separate delivery channel.

Another alternative is to use the SSE channel to simply tell the client, “hey, refresh, you have new data.” Then you don’t need additional hops on the server for your own writes. However, it will most likely lead to increased server load, as you must do additional requests to fetch the latest data instead of them being delivered over SSE. Also, you must [be careful not to perform multiple fetches concurrently](/blog/remix-concurrent-submissions-flawed), instead queue operations on the client and give higher priority to user interactions.

You could even make multiple streams work by receiving the events out of order and ordering them on the client. This unfortunately sounds much simpler than it actually is. For example, you may have no guarantee that an event creating a resource arrives before its deletion, or that the order of updates matches the database operations. That’s why there are whole platforms, [like Electric](https://electric.ax), designed to solve those issues for you.

## Summing up

Next time you are debating WebSockets versus SSE, ask yourself: how will I guarantee events are delivered in the right order, and avoid confusing users with stale or incorrect data?

Whenever you have multiple streams of data, they can race each other, regardless if you are using WebSockets or SSE. WebSockets give you a bidirectional channel that can act as a simple foundation for preserving causal ordering between user actions and server updates. SSE + Fetch can be made to work, but it often comes with additional latency from routing data internally. And regardless of whether you pick WebSockets or SSE, Phoenix gives you the best bang for your buck, as you can simplify your operations and reduce latency thanks to Elixir and Distributed Erlang.

> This article was fully written by a human and proof-read by LLMs. The interactive examples were fully produced by a coding agent under adult supervision.

[See all posts](/blog)

 

Something went wrong with your subscription. Please try again.

You have been successfully subscribed.

###### Subscribe to Dashbit Updates

Add your e-mail below to receive e-mails with Dashbit Updates on free ebooks, technical articles, and more. By doing so, you agree with our [Privacy Policy](https://www.iubenda.com/privacy-policy/94751149 "Privacy Policy ").

SUBSCRIBE

 

#### Follow us

*   [](https://twitter.com/dashbit "GitHub")
*   [](https://github.com/dashbitco "Twitter")
*   [](/feed "Feed")

#### Recent Posts

[WebSockets vs. SSE should be about ordering and correctness](/blog/websockets-vs-sse) José Valim - August 25th, 2026

[Distributed Python dataframes and machine learning with Livebook and Elixir](/blog/distributed-python-livebook) José Valim - March 11th, 2026

[Type systems are leaky abstractions: the case of Map.take!/2](/blog/type-systems-are-leaky-abstractions-map-take) José Valim - March 3rd, 2026

[See all](/blog)

Copyright © 2026 Dashbit. All rights reserved.

Made with <3 using the Elixir programming language.

[Privacy Policy](https://www.iubenda.com/privacy-policy/94751149 "Privacy Policy ")

[](#)