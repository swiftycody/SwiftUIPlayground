

```mermaid
flowchart TD
	DIDWalletSDK --> DIDCoreSDK
	DIDWalletSDK --> DIDCommunicationSDK
	DIDWalletSDK --> CoreData

	DIDCoreSDK --> openssl
	DIDCoreSDK --> DIDUtilitySDK
	DIDCoreSDK --> DIDDataModelSDK

	DIDUtilitySDK --> CryptoKit
	DIDUtilitySDK --> CommonCrypto
```


---

