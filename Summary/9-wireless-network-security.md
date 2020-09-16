Wireless Network Security
===============================

## Wireless Basics

Uses Radio Frequency (RF) to communicate

- if same (or comparable) frequency is interfering, effect is _jamming_, also called _incidental interference_
- NICs have MAC addresses (48b, 6B)
- IEEE 802.11 max output is 200 mW
- Wireless Access Points (WAP)
- _Channel Width_ - how much of the spectrum is tuned for this WAP
- WAPs traditionally radiate in all directions, and should be centrally located
- May require a _site survey_ to make decisions on optimal WAP placement
- _Fat APs_ are self-contained, while _Thin APs_ are usually PoE and relay the same wireless signal
- _Air Snort_ - software for listening to packets, in "promiscuous mode"

Major parts of a WAP:

- Antenna
- Transciever
- Bridging Software
- NIC

### Security

> _"War Driving"_ - the act of driving around, snooping for vulnerable access points

#### Wired Equivalent Privacy (WEP)

- Uses RC4
- can take only a few hours to crack, 4/5 million packets (due to weak IVs)

Normally:

- 64b Key Length (802.11 a and g extended to 152b)
- 24b IV

Can be enhanced with TKIP:

- 64b MIC (Message Integrity Check - HMAC) value
- 128b Key Length
- IV increased to 48b
- Passphrases are used to derive a shared master key
- session keys are derived from master key + MAC
- new key for every **packet**

#### Wi-Fi Protected Access (WPA)

> WEP + TKIP

- lack of forward secrecy protection - if attacker knows WPA key,
  they can listen to _all_ connections
- _Open-System Authentication_ - session key based on SSID, issued to client

#### WPA2 - 802.11i

- Uses 802.1X for authentication
- AES-CCMP for encryption (Counter Mode with Cipher Block Chaining - Message Authentication Code Protocol)
  - AES-256 with 13 rounds
  - provides message integrity in AES
  - requires new hardware

##### PSK (Pre-Shared Key) vs Enterprise

- WPA Personal is authenticated with PSK, passphrase up to 63 characters, converted to 256b key
  - should be at least 20 chars
- WPA Enterprise uses 802.1X and RADIUS server
  - can integrate NAC

##### Captive Portal

- Uses HTTP to handle authentication (public hotspots)

### Authentication Protocols

#### Extensible Authentication Protocol (EAP)

- Heritage from PPP
- Framework to secure the authentication process
- Four packet types: Request, Response, Success, Failure
- _Supplicant_ sends identity information to _Authenticator_
- _Authenticator_ is responsible for issuing EAP request packets
- Supports many authentication methods - tokens, smart cards, certs, one-time-passwords, public keys
- Wi-Fi Protected Setup (WPS)
  - 8-digit PIN
  - not secure

#### EAP-FAST (Flexible Authentication via Secure Tunneling)

- 2010, Cisco, replacement for LEAP (also Cisco)
- Passes a Protected Access Credential (PAC) to establish TLS, through which client creds are verified

#### EAP-TLS

- 2010, IETF
- one of the most secure
- Uses client-side certs

#### EAP-TTLS (EAP-Tunneled TLS)

- 2010
- Like EAP-TLS, but tunnels the client's authentication
- Allows secure use of legacy auth like
  - Password Authentication Protocol (PAP)
  - Challenge-Handshake Authentication Protocol (CHAP)
  - MS-CHAP, MS-CHAPv2
- Doesn't necessarily require client-side certs

#### 802.1X Authentication

- Most secure is _certificate-based authentication_
- "port-based" authentication service
- When used over wireless, either 802.11i or EAP is used

#### RADIUS

- "Federated" logins

## BlueTooth

- Current version: 5
  - max-range: 800ft
- Vulnerable to _bluesnarfing_ and _bluejacking_
  - snarfing - smell, jacking - uh...
- uses _short-range_ radio
- _Personal Area Networks_
- make _piconets_
  - _active_ and _parked_ slaves
  - interconnected piconets form _scatternets_

