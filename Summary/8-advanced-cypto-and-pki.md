Advanced Cryptography and PKI
====================================

- _crypto service provider_ - calls crypto functions as a service
- _digital certificate_ - associates a user's _identity_ with their public key
- _master secret_ - used to derive session keys
- A _Cipher Suite_ is the combination of encryption, signing, and hashing algorithms supported

Three characteristics of _key strength_:

- randomness
- length
- cryptoperiod - expiration

> Need to explore about half of keyspace in order to break

Block Cipher Modes of Operation:

- Electronic Code Block (ECB)
  - Each plaintext block is ciphered separately - orthogonal map
- Cipher Block Chaining (CBC)
  - Block is ciphered, ciphertext is XORd with next plaintext block
- Counter (CTR)
- Galios / Counter (GCM)
  - Encrypts the plaintext and includes an encrypted MAC

## PKI

- _Certificate Authorities_ issue digital certificates
  - They may be arranged _heirarchical_ (one master / root, self-signed CA)
  - _distributed_ (tree of CAs)
  - _bridge_ - link between multiple CA networks, with one acting as a _facilitator_
- _Certificate Repositories_ manage a centralized directory of digital certificates
- _Certificate Revocation Lists_ declare what certificates are no longer (or temporarily) invalid
- _Online Certificate Status Protocol_ (OCSP) checks a cert's status
- _Extended Validation Certificates_ showcase the name of the company, as further trust. FIXME
- _Certificate Policies_ are a set of rules that govern the operation of PKI
- _Certificate Signing Request_ (CSR) - how someone associates their identity to their public key
- _Subject Alternative Name_ (SAN) / _Unified Communications Certificate_ (UCC) - an extension
  to a certificate to include one or more domain names, or a user principal name (UPN),
  for added identity authenticity.
- _Web-Client Certificates_ ensure for a web-browser that a web-server is authentic w.r.t. their domain.
- _Certificate Practice Statement_ (CPS) is a document detailing how a CA manages its certificates, and
  how to register for one
- _Domain Validation Digital Certificate_ - validates control over the domain name
- _Extended Validation_ - Allows enhancing the certificate with the company name for further validation
- _destruction_ - removing affiliation with a certificate, and private / public keys

Four stages of certificate life cycle:

- Creation
- Suspension
- Revocation
- Expiration

> Distributed trust is the basis for most trust models on the internet, but there exists others as well,
> including 3rd-party trust models.

- A distributed CA model, where only one CA facilitates all other CAs is considered a 3rd party trust model.

## IPSec

- Authentication Header - Integrity
- Encapsulating Security Payload - Confidentiality
- _transparent_ - nobody has to install anything to use it
- useful for VPNs
- manages Authentication, Confidentiality, and Key-Management
