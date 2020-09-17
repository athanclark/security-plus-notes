Networking and Server Attacks
====================================

## Interception Attacks

- _Man-in-the-Middle_ - Between two hosts
- _Man-in-the-Browser_ - Between the browser and underlying computer, usually by Trojan-installed extension
- _Replay Attacks_ - copies credentials or session token - _not_ a MitM
  
## Poisoning Attacks

- _ARP Poisoning_ - "Yep, I'm x:x:x:x! I promise!", "you hear that guys, he's x:x:x:x!"
- _DNS Poisoning_ - "Yep, x.x.x.x is the ip of foo.com!", "you hear that guys, x.x.x.x is foo.com!"
  - can be performed locally or at a higher echelon
  - Due to DNS _zone transfers_
- _Privilege escalation_ - exploits vulnerabilities in a trusted process, or, hijacks control of a horizontal _other_ user

## Server Attacks

### Denial of Service

> overwhelms a server by saturating its resources, either by looping in the network, exceeding bandwidth, or
> depleting it's hardware

- _DDoS_ - performed by a botnet
- _Smurf attack_ - spoofed echo request with target as `from`
- _DNS amplification_ - pretend like the target is asking for DNS lookups; utilize public infrastructure through botnets
- _SYN flooding_ - spoofed with bogus IP, asks target to sync with it - forever waiting for ACK

### Hijacking

- Session hijacking - stolen session token - via XSS, MITM, or guessing
- URL hijacking - aka "typo squatting" - also "bit squatting"
- Domain hijacking - attacker somehow changes DNS record
- Clickjacking - Zero-pixel element in HTML

### Overflow Attacks

- Buffer overflow - bleed out a buffer, and write an instruction into forbidden memory space
- Integer overflow - goes negative

### Advertising Attacks

- Malvertising - poisoned ads; using ads to distribute malware
- Ad Fraud - forges / spoofs "clicks" to steal revenue

### Exploiting Browser Vulnerabilities

- Extensions, plugins, add-ons
- Extensions affect a single site, FIXME check graph

### Zero-Day Attack

> nobody saw it coming, because nobody knew the vulnerability existed

### Web Server Application Attacks

#### Cross-Site Attacks

- Cross-Site Scripting (XSS) - attacker's facebook bio is a script, and victim looks at their profile
  - _Non-persistent XSS_ - embeds a script in the URL, or something similar
  - _Persistent XSS_ - stored on a website (i.e. facebook post), viewed / executed by many
- Cross-Site Request Forgery (XSRF) - Clicks on threat agent's web page (with CORS enabled) and obtains their previous session tokens

#### Injection Attacks

- SQL Injection - unsanitized input that's used in a SQL query can have its command overridden
- LDAP Injection - gets phone numbers
- XML Injection

## Browsers

- _Extensions_ - expand the normal capability of a browser
- _Plugins_ - adds new functionality (video, music, graphics, Java, Adobe, QuickTime)
- _Addons_ - greater degree of functionality (toolbars, menus)
