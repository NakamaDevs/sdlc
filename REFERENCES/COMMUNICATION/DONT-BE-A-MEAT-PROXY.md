# SOURCE SNAPSHOT\n\n- Source URL: https://gruhn.me/blog/2026-08-03/\n- Title: Don't be a meat proxy\n- Retrieved: 2026-08-27\n- Conversion: Turndown 7.2.4\n- Status: archival copy; verify the live source for current facts.\n\n---\n\n[Niklas Gruhn / Blog](/)

 [![RSS feed](/rss.svg)](/feed.xml "RSS")[![LinkedIn](/linkedin-box-fill.svg) ](https://www.linkedin.com/in/niklas-gruhn-b615a6245/ "LinkedIn")[![GitHub logo](/github-mark.svg)](https://github.com/gruhn "GitHub")

# Don't be a meat proxy

Aug 03, 2026

Too often I ask a question in Slack or leave feedback under a merge/pull request or argue with friends in a WhatsApp group and get back:

> Claude said: \[giant response verbatim\]

Please don't do this. I mean, I've done this. But I've been on the receiving end too many times now. This is not adding value. I can talk to Claude myself. It's going to be faster and I get to control the context. I don't need a meat proxy in between.

Reading AI output is extra effort. It's verbose, frequently contains all too plausible nonsense, and is increasingly jargon dense. I recently got this sentence from Claude:

> NATS control-plane events: stream leader election / R3 quorum re-form during pod churn.

Jesus. I had to lookup almost every word to make sense of this.

By all means, prompt AI. But don't just relay the output. Read it, understand it, validate it, and then write a response in your own words (a decent certificate that you've done the prior steps). Making that effort is value you can add.

Take code review in particular. Shipping _some_ code can be done with close to zero effort now: Copy/paste the ticket description into Claude Code. Don't look at the code or read what Claude has written. If there's any feedback from reviewers, copy/paste that into Claude Code as well. If necessary, iterate.

That works. But who has done the implementation? The reviewers did, using Claude Code, and you as a meat proxy.

[Comments on Hacker News](https://news.ycombinator.com/item?id=49151933)