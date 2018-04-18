# JCE Cryptonote CPU Miner
Welcome to the Fastest Cryptonote CPU Miner ever!

### Is that a Virus? No!
Like all miners, JCE gets detected as a virus by most Antiviruses, including Windows Defender. But it's not. Read more about Privacy and Security below.

### Is it just yet-another fork of a common miner? No!
You're not losing your time testing a made-up rip of a common miner, JCE is brand new, using 100% new code.

### Are the new Monero-V, Cryptolight-V7 and Cryptonight-Heavy forks supported? Yes!
The *--variation* parameter let you choose the fork. More details below.

# Index

* [Speed](#speed)
* [Basic topics](#basic-topics)
* [Advanced topics](#advanced-topics)
* [Cryptonight Forks](#cryptonight-forks)
* [Configuration](#configuration)
* [Huge Pages](#huge-pages)
* [Privacy and Security](#privacy-and-security)

## Speed

In short, JCE is:
* Crazy fast on non-AES 64-bits, usually 35-40% faster than other miners
* Still a lot faster on non-AES 32-bits, usually beating even the other miners 64-bits versions
* Barely faster than the other best on AES 64-bits, beating them by ~1%, +2% on V7 fork
* A lot faster on AES 32-bits, but it's a rare case (mostly seen on Intel Atom tablets)

Here's a benchmark against three other common miners.\
**The test is fair**: run on the exact same Win10 Pro computer, all Huge Pages enabled, no background task, best configuration.
* XMRStak means: the released Unified binary from github (not recompiled myself)
* XMRig means: the respective best released binary *gcc* (32-bits) and *msvc* (64-bits) from github (not recompiled myself)
* Claymore means: best Claymore CPU (3.4 for 32-bits, 3.9 for 64-bits)
* When not supported, score is zero, if not tested yet, score is *?*
* Fees are included in the score


##### Core2 Quad 2.666 GHz, 4 threads, 64-bits, Cryptonight
JCE | XMRStak | XMRig | Claymore
------------ | ------------- | - | -
116 | 80 | 85 | 57

##### Core2 Quad 2.666 GHz, 4 threads, 32-bits, Cryptonight
JCE | XMRStak | XMRig | Claymore
------------ | ------------- | - | -
93 | 0 | 68 | 50

##### Ryzen 1600, 8 threads, 64-bits, Cryptonight
JCE | XMRStak | XMRig | Claymore
------------ | ------------- | - | -
506 | 502 | 502 | 443

##### Ryzen 1600, 8 threads, 32-bits, Cryptonight
JCE | XMRStak | XMRig | Claymore
------------ | ------------- | - | -
434 | 0 | 327 | 275

##### Ryzen 1600, 8 threads, 64-bits, Cryptonight V7
JCE | XMRStak | XMRig | Claymore
------------ | ------------- | - | -
503 | 492 | 491 | ?

##### Ryzen 1600, 8 threads, 32-bits, Cryptonight V7
JCE | XMRStak | XMRig | Claymore
------------ | ------------- | - | -
424 | 0 | 320 | ?

##### Ryzen 1600, 4 threads, 64-bits, Cryptonight Heavy
JCE | XMRStak | XMRig | Claymore
------------ | ------------- | - | -
252 | 169 | 250 | 0

##### Ryzen 1600, 4 threads, 32-bits, Cryptonight Heavy
JCE | XMRStak | XMRig | Claymore
------------ | ------------- | - | -
191 | 0 | 174 | 0

## Basic topics

#### Q. Is it free (as in beer, as in freedom)?
No and no. It has fees, and is not open source. But the program itself is free to distribute.



#### Q. How much cost the fees?
Current fees are:
* 3.0% when using at least one mining thread with non-AES architecture, or 32-bits
* 1.5% when using only 64-bits AES architecture

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
* Stellite (XTL)
* UltraNote (XUN)
* Intense (INTS)
* Crepcoin (CREP)
* Pluracoin (PLURA)
* Haven (XHV)
* FreelaBit (FBF)
* BlueberriesCoin (BBC)
* B2BCoin (B2B)
* Bitsum (BSM)
* Masari (MSR)
* SuperiorCoin (SUP)
* EDollar (EDL)
* Nicehash Cryptonight v7
* Minergate Cryptonight
* MiningPoolHub Cryptonight
* MiningRigRentals Cryptonight v7
* Suprnova Cryptonight

Normal pools (per-coin) are __all supported__, but Algo-based pools require a dedicated support.

#### Q. Is Nicehash supported?
Yes, see list above. The Nicehash-specific Nonce is then automatically enabled.

#### Q. Is SSL supported?
Yes, with parameter *--ssl*

#### Q. Is there a HTTP server to monitor the miner?
No, modern pools provide all you need to monitor your miners (average hashrate, worker-id...). Monitoring is now a pool's job.


## Advanced topics

#### Q. Are there requirements or dependencies?
No. JCE is just a big standalone .exe

#### Q. Is there a Linux version?
Not yet.

#### Q. Is there a 32-bits version?
Yes, both 32 and 64 are always in the same release.

#### Q. Do I get a discount on fees if I use SSL?
I'm not Claymore.

#### Q. How is developed JCE?
The network and stratum handling is C++14, and the mining algos are assembly (to be precise, GNU Extended Assembly). Hence the speed increase.

#### Q. Can I plug it to a stratum proxy?
No, it must mine on a real pool on Internet.

#### Q. Is it really new? It looks familiar to me...
Yes it is. But it reuses, on purpose, some de-facto conventions from other common miners, like a XMRStak-style cpu configuration, and the colors of Claymore (green=share, red=error, blue=hashrate, yellow=status).

#### Q. How is the hashrate calculated?
That's the average speed of the last 512 hashes (not *shares* found, computed *hashes*), rounded at 0.01. And it's fair, the displayed number has no tweak, and includes the fees. The total is first summed from exact per-thread values, then rounded (said differently, it's a rounded sum, not sum of rounded).

#### Q. Can I get a long-time speed average?
Better look at your pool's reports, but JCE also gives the average effective net hashrate when pressing R. It's usually slightly lower than the physical hashrate because of outdated shares and fees.

#### Q. Can I do pool auto-switch in case of failure? Or periodically?
Not directly, but the *--quit* and/or the *--autoclose* parameters, with the help of a simple .bat, can do the job.

#### Q. Can I mix architectures when mining (i.e. thread 1 uses core2, thread 2 uses pentium4)?
It sounds strange, but yes. However, that's mostly useful for tests.

#### Q. I used "use_cache":false and it still has a strong negative impact on other threads
The no-cache mode means the cache is instantly invalidated once used, not always entirely bypassed, depending on your hardware. And a mining thread always has an impact on TLB. So don't try to use extra mining threads playing with the no-cache mode, rather use the dual-thread mining, which is made for that precise purpose.

#### Q. What a great job! Can I make a donation?
Thanks bro. You can, with the *--donate* parameter which raise the fees to 80%, or by sending coins to the donation wallet (the one in the start.bat file included).

## Cryptonight Forks

All current forks are supported:
* N=0 *Automatic*
* N=1 Original Cryptonight
* N=2 Original Cryptolight (for AEON)
* N=3 Cryptonight V7 fork of April-2018
* N=4 Cryptolight V7 fork of April-2018
* N=5 Cryptonight-Heavy

The current *Automatic* mode **behaves the old way on alt-coins**:
* Monero, Monero-V and Stellite are now Cryptonight V7,
* Sumokoin and Haven are now Cryptonight-Heavy,
* Aeon is still Cryptolight
* TurtleCoin is now Cryptolight V7
* Everything else is still assumed Cryptonight

More will be updated once all coins have forked (~May-2018)

To use the new forks right now, set the *--variation N* parameter, with N as stated above.

## Configuration

Almost everything is configured with command-line parameters. The config file is for cpu fine tuning only. See the embedded .bat for an example.\
Mandatory parameters are:
* *-u* the Wallet/Login
* *-p* the password ("x" usually works)
* *-o* the pool:port
* *--auto* or *-c* for CPU configuration

Important extra parameters are:
* *--ssl* if you use SSL
* *--low* not to freeze your PC if you mine with all cores
* *--variation* to use one of the new Cryptonight forks

Type --help to get the complete list.

### Super Easy CPU configuration

Use --auto and you're good.

### Normal Easy CPU configuration

Use --auto with:
* *--archi* to set the CPU architecture (if you force SSE4 or AES on a CPU with no support, it will crash).
* and/or *-t* to set the number of threads.

The list of architectures is in the config.example.txt file in the Zip.

### Advanced CPU configuration

Use -c <configfile>\
See the config.example.txt file in the Zip for details.

### Dual-thread mining

This is an exclusive feature of JCE!\
It is **not** like the double-hash found on Stak, with one thread on two hashes. That's two threads on two hashes, but sharing the cache and the Huge Page, for CPUs with very low cache.\
The principle is closer to Claymore Dual: use the *smooth* parts of the Cryptonight algo to let another thread use the cache and memory, then take it back. It allows the main thread to run at ~90% and the side thread at ~25%, totaling a speed increase of ~15%.\
However, if this mode is powerful, it offers a gain only on some rare, old CPU:
* With no hardware AES (hardware AES is so fast that the master thread has no *time* to share)
* Not using Cryptonight-Heavy (it's so... heavy that the master thread has no *resource* to share)
* With low cache but decent compute power (read: no Atom or antique P4)

Remains some entry-level Core2, Athlons and Celeron/Pentium.

## Huge Pages

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

#### Q. I see the JCE process punching the attrib command, what is it doing?
JCE does never run attrib, nor any other command, but it disguises its mining process into a *attrib* to avoid being detected and erased by antiviruses. Again, JCE does nothing malicious, but like all other miners it's detected as a virus so I've to do such a trick. That's the normal behavior of the 64-bits version. I never had the 32-bits detected, so I don't use that trick with it.
