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

Major parts of a WAP:

- Antenna
- Transciever
- Bridging Software
- NIC

### Security

> _"War Driving"_ - the act of driving around, snooping for vulnerable access points

#### WEP

Normally:

- 64b Key Length
- 24b IV

Can be enhanced with TKIP:

- 64b MIC (Message Integrity Check - HMAC) value
- 128b Key Length
- IV increased to 48b
- Passphrases are used to derive a shared master key
- session keys are derived from master key + MAC

#### WPA2

- AES-CCMP
  - AES-256 with 13 rounds
- WPA Personal is authenticated with PSK

#### EAP

- Four packet types: Request, Response, Success, Failure
- _Supplicant_ sends identity information to _Authenticator_
- _Authenticator_ is responsible for issuing EAP request packets

#### Captive Portal AP

#### 802.1x Authentication

- Most secure is _certificate-based authentication_

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

