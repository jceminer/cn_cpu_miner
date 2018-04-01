# JCE Cryptonote CPU Miner
Welcome to the Fastest Cryptonote CPU Miner ever!

### Is that a Virus? No!
Like all miners, JCE gets detected as a virus by most Antiviruses, including Windows Defender. But it's not. Read more about Privacy and Security below.

### Is it just yet-another fork of a common miner? No!
You're not losing your time testing a made-up rip of a common miner, JCE is brand new, using 100% new code.

### Are the new Monero-V and Cryptonight-Heavy fork supported? Yes!
The *--variation* parameter let you choose the fork. Default is 0: original Cryptonight.

# Index

* [Speed](#speed)
* [Basic topics](#basic-topics)
* [Advanced topics](#advanced-topics)
* [Configuration](#configuration)
* [Privacy and Security](#privacy-and-security)

## Speed

In short, JCE is:
* Crazy fast on non-AES 64-bits, usually 35-40% faster than other miners
* Still a lot faster on non-AES 32-bits, usually beating even the other miners 64-bits versions
* Barely faster than the other best (Stak) on AES 64-bits, beating it by ~1%
* A lot faster on AES 32-bits, but it's a rare case (mostly seen on Intel Atom tablets)

Here's a benchmark against three other common miners.\
**The test is fair**: run on the exact same Win10 Pro computer, all Huge Pages enabled, no background task, best configuration.
* XMRStak means: the released Unified binary from github (not recompiled myself)
* XMRig means: the respective best released binary *gcc* (32-bits) and *msvc* (64-bits) from github (not recompiled myself)
* Claymore means: best Claymore CPU (3.4 for 32-bits, 3.9 for 64-bits)
* When not supported, score is zero
* Fees are included in the score


##### Core2 Quad 2.666 GHz, 4 threads, 64-bits
JCE | XMRStak | XMRig | Claymore
------------ | ------------- | - | -
116 | 80 | 85 | 57

##### Core2 Quad 2.666 GHz, 4 threads, 32-bits
JCE | XMRStak | XMRig | Claymore
------------ | ------------- | - | -
88 | 0 | 68 | 50

##### Ryzen 1600, 8 threads, 64-bits
JCE | XMRStak | XMRig | Claymore
------------ | ------------- | - | -
506 | 502 | 458 | 443

##### Ryzen 1600, 8 threads, 32-bits
JCE | XMRStak | XMRig | Claymore
------------ | ------------- | - | -
431 | 0 | 313 | 275


## Basic topics

#### Q. Is it free (as in beer, as in freedom)?
No and no. It has fees, and is not open source.

#### Q. How much cost the fees?
Current fees are:
* 3.0% when using at least one mining thread with non-AES architecture, or 32-bits
* 1.5% when using only AES architecture

The fees are twice higher in non-AES mode and/or 32-bits because JCE offers a huge performance gain here.

#### Q. Can I avoid fees?
Not really. I plan to offer a paying per-licence-no-fee (pay-once-for-all) version, but it's a lot more complicated to set up than a fee-based miner.\
Also, JCE never takes any fee during the first minute, so if you run it, and kill it after one minute, and repeat again and again, then you'll never pay any fee, but JCE takes a few seconds to start, and your Pool probably won't let your reconnect continuously.
#### Q. Will it work on my computer?
Minimum is Windows 7 32-bits, with a SSE2 capable CPU. 64-bits is faster, prefer it.\
For best performance, Huge Pages must be enabled, JCE will try to auto-configure them, but it may work or not depending on your Windows version and security configuration.

#### Q. What currency can I mine? On which pools?
Run the miner with *--coins* parameter to get the up-to-date list. Current list is:
* Monero (XMR)
* Monero-V (XMV)
* Electroneum (ETN)
* Karbowanec (KRB)
* Bytecoin (BCN)
* Sumokoin (SUMO)
* Bitcoal (COAL)
* Bitcedi (BXC)
* Dinastycoin (DCY)
* Leviarcoin (XLC)
* Fonero (FNO)
* Turtlecoin (TRTL)
* Graft (GRFT)
* Dero (DERO)
* Nicehash Cryptonight
* Minergate Cryptonight
* MiningPoolHub Cryptonight
* Suprnova Cryptonight

Normal pools (per-coin) are __all supported__, but Algo-based pools require a dedicated support.

#### Q. Is Nicehash supported?
Yes, see list above. The Nicehash-specific Nonce is then automatically enabled.

## Advanced topics

#### Q. Are there dependencies?
No. JCE is just a big standalone .exe

#### Q. Is there a Linux version?
Not yet.

#### Q. Is there a 32-bits version?
Yes, both 32 and 64 are always in the same release.

#### Q. How is developed JCE?
The network and stratum handling is C++, and the mining algos are assembly (to be precise, GNU Extended Assembly). Hence the speed increase.

#### Q. Can I plug it to a stratum proxy?
No, it must mine on a real pool on Internet.

#### Q. Is it really new? It looks familiar to me...
Yes it is. But it reuses, on purpose, some de-facto conventions from other common miners, like a XMRStak-style cpu configuration, and the colors of Claymore (green=share, red=error, blue=hashrate, yellow=status).

#### Q. What a great job! Can I make a donation?
Thanks bro. You can, with the *--donate* parameter which raise the fees to 80%, or by sending coins to the donation wallet (the one in the start.bat file included).

## Configuration

## Privacy and Security

#### Q. Is it a virus?
No. There's no malicious code at all, but since the source code is closed, I cannot prove it. The best I can do is to give a complete list of what the program does and doesn't.

#### Q. So, what does it do or not?
It does:
* Read the configuration file, if asked to (parameter -c)
* Scan your CPU and cache to autoconfigure and/or check the manual configuration
* Connect to pools on Internet to mine
* Write the log, if asked to (parameter --log)
* Try to autoconfigure the Huge Pages privileges if they're not working at first. That's the only *intrusive* action, but when it does it, it says so.

It doesn't:
* Write anything to your computer, except its own log, when enabled (default is disabled)
* Send any information, to me nor anywhere else
* Identify your computer or miner instance, not even using a hash
* Punch through your firewall: you have to open it manually if needed
