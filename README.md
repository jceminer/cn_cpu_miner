# JCE Cryptonote CPU Miner
Welcome to the Fastest Cryptonote CPU Miner ever!

BitcoinTalk Topic: https://bitcointalk.org/index.php?topic=3281187.0

:heavy_exclamation_mark: Security Alert! Some hackers pack a Trojan in a fake JCE release, complete with the doc. :heavy_exclamation_mark: That's usually a small .rar when official JCE are big .zip\
Download JCE only from this Github page.

### Version 0.33j and later provide a big performance boost on CN-v8 and related (Masari v8, Stellite v8...), for modern CPUs, updating is highly recommended.
### TurtleCoin has just forked, an upgrade to 0.33q or later is recommended.

#### Take a look at the GPU version!

https://github.com/jceminer/cn_gpu_miner

Fork current status as of January-2019
```
Waltz/Graft fork available starting from 0.33q with --variation 22
Masari defaults to v8 starting from 0.33p, manually supported by 0.33n with --variation 21
Stellite v8 fork supported starting from 0.33n with --variation 21, automatic starting from 0.33p
Turtle v2 fork supported starting from 0.33m with --variation 20, enabled by default starting from 0.33q
uPlexa fork supported starting from 0.33j
V8 fork supported starting from 0.33a, enabled by default on Monero, Wownero and Graft
Cryptonight-Fest is supported, use the same algo as for Arto: --variation 10
Cryptonight-FreeHaven supported starting from 0.33g, use: --variation 18
Cryptolight-Dark (CryoNote) supported starting from 0.33f, use: --variation 17
MoneroOcean pool uses the Pool-managed Autoswitch by default
ITA defaults to CN-Haven starting from 0.33f
TUBE v2 fork supported starting from 0.31a, enabled by default
Sumokoin rolled back to CN-Classic
B2N natively supported starting from 0.32m, on old JCE version, use: --any --variation 9
MOX/Red is supported starting from 0.32m
```

### Is that a Virus? No!
Like all miners, JCE gets detected as a virus/trojan by most Antiviruses, including Windows Defender. But it's not. Read more about Privacy and Security below.

### Is it just yet-another fork of a common miner? No!
You're not losing your time testing a made-up rip of a common miner, JCE is brand new, using 100% new code.

### Are the new Monero-V7, Cryptolight-V7, V8, Cryptonight-Heavy, IPBC/BitTube, Alloy, MKT/B2N, Arto/Fest, MSR/Fast, Red, XHV, FreeHaven, Waltz, Dark and XTL forks supported? Yes!
The *--variation* parameter let you choose the fork. More details below.

# Index

* [Speed](#speed)
* [Getting started](#getting-started)
* [Third Party integration](#third-party-integration)
* [Basic topics](#basic-topics)
* [Advanced topics](#advanced-topics)
* [Cryptonight Forks](#cryptonight-forks)
* [Configuration](#configuration)
* [Remote Managment](#remote-managment)
* [Pool-managed Autoswitch](#pool-managed-autoswitch)
* [Large Pages](#large-pages)
* [Privacy and Security](#privacy-and-security)

## Speed

In short, JCE is:
* Crazy fast on non-AES 64-bits, usually 35-40% faster than other miners
* Compared to other 32-bits miners, still faster on non-AES 32-bits, sometimes beating even the other miners 64-bits versions
* And still comparatively faster on non-AES 32-bits Cryptonight-Heavy, with usually +50% speed.
* Slightly faster than the other best on AES 64-bits, beating them by ~1% on CN-classic, +2.8% on v7 fork, +2% on v8, +4% on Cryptonight-Heavy
* A lot faster than any other miner when mining BitTube v2, on any processor, with ~30% extra speed.
* Also a lot faster on AES 32-bits, but it's a rare case (mostly seen on Intel Atom tablets)

## Getting started

If you're new at mining Cryptonight, here's the simplest way:

1. Choose the coin to mine, see the list below. The most common is Monero.
2. Get a wallet, that's a ~95 character long identifier. If you don't have one yet, you can create it [here](https://cn-wallet-generator.hashvault.pro/monero-wallet-generator.html)
3. Choose a pool to mine on, and its port. For example Pool *pool.minexmr.com* and port *4444*
4. Edit the *start.bat* that's shipped in the .zip
	1. Change the example POOL by yours
	2. Change the example PORT by yours
	3. Change the example WALLET by yours
	4. You can leave the default password *x*
5. (Optional) If your coin is *exotic*, maybe you also need to change FORK=0 to another number. See the list in the *start.bat*
6. Run start.bat

Note: the same applies to the Linux version *start.sh*


## Third Party integration

If you're a Mining Tool dev (like Forager, Awesome Miner...) and want to integrate JCE, here's a good command to spawn JCE.
Most parameters are similar to other common miners.

```
jce_cn_cpu_miner64 --auto --any --forever --variation FORK --low -o POOL:PORT -u WALLET -p PASSWORD --mport MONITOR SSL
```

And replace:
* FORK by the Fork number, see list below, or set 0 for automatic
* POOL:PORT by the pool address (name or IP):(port), e.g. pool.minexmr.com:4444
* WALLET by the miner wallet
* PASSWORD by the miner password
* MONITOR by the local HTTP monitor server port
* SSL by either nothing, or "--ssl" if SSL is to be used

To monitor the miner, read http (not https!) at localhost:MONITOR and you'll get some simple JSON like

```
{
  "hashrate":
  {
    "thread_0": 13.75,
    "thread_1": 18.29,
    "thread_2": 21.19,
    "thread_3": 18.85,
    "thread_all": [13.75, 18.29, 21.19, 2.71, 18.85],
    "total": 72.06,
    "max": 72.87
  },
  "result":
  {
     "pool": "pool.minexmr.com:4444",
     "ssl": false,
     "currency": "Monero (XMR/XMV/XMC/XMO)",
     "difficulty": 23684,
     "shares": 5,
     "hashes": 84473,
     "uptime": "0:08:28",
     "effective": 166.29
  }
}
```

Quite self-explanatory,\
*"effective"* is the net effective hashrate, fees, outdated and invalid shares deduced,\
*"total"* is the instant physical hashrate

#### XMRStak mode

If your mining tool does not support JCE yet, you can get a XMR-Stak compatible json by adding parameter --stakjson\
In such case, the JSON will be like

```
{"version":"jce/0.27c/cpu","hashrate":{"threads":[[28.0,28.0,28.0],[25.7,25.7,25.7],[26.3,26.3,26.3],[26.5,26.5,26.5]],"total":[106.5,106.5,106.5],"highest":108.5},"results":{"diff_current":15000,"shares_good":1,"shares_total":1,"avg_time":12.0,"hashes_total":15000,"best":[118228,0,0,0,0,0,0,0,0,0],"error_log":[]},"connection":{"pool": "pool.minexmr.com:4444","uptime":12,"ping":0,"error_log":[]}}
```

## Basic topics

#### Q. Is it free (as in beer, as in freedom)?
No and no. It has fees, and is not open source. But the program itself is free to distribute.

#### Q. How much cost the fees?
Current fees are:
* 3.0% when using at least one mining thread with non-AES architecture, or 32-bits
* 1.5% when using only 64-bits AES architecture
* 0.9% on the GPUs

The fees are twice higher in non-AES mode and/or 32-bits because JCE offers a huge performance gain here.

#### Q. Can I avoid fees?
Not really. I plan to offer a paying per-licence-no-fee (pay-once-for-all) version, but it's a lot more complicated to set up than a fee-based miner.\
Also, JCE never takes any fee during the first minute, so if you run it, and kill it after one minute, and repeat again and again, then you'll never pay any fee, but JCE takes a few seconds to start, and your Pool probably won't let your reconnect continuously.

#### Q. Will it work on my computer?
Minimum is Windows Vista 32-bits, with a SSE2 capable CPU. 64-bits is faster, prefer it.\
Vista64 is no longer supported, the minimum Win64 is now Seven-64.\
For best performance, Huge Pages must be enabled, JCE will try to auto-configure them, but it may work or not depending on your Windows version and security configuration.\
Maximum configuration is 256 threads on 256 (Win64) or 64 (Win32) CPUs and/or GPUs.

#### Q. What currency can I mine? On which pools?
You can mine **any coin on any pool**.\
If your coin is listed, all is automatic.\
Run the miner with *--coins* parameter to get the up-to-date list. Current list is:
* Aeon (AEON)
* Alloy (XAO)
* ArQmA (ARQ)
* ArtoCash (RTO)
* B2BCoin (B2B)
* Bitcoin2network (B2N)
* BBSCoin (BBS)
* Bitcoal (COAL)
* BitcoiNote (BTCN)
* Bitsum (BSM)
* BlackRose (BLR)
* Bloc (BLOC)
* BitTube (TUBE)
* BlueberriesCoin (BBC)
* Bytecoin (BCN)
* Caliber (CAL)
* Catalyst (XAT)
* Citadel (CTL)
* Citicash (CCH)
* Constella (XCC)
* Crepcoin (CREP)
* CryoNote (XCN)
* Dero (DERO)
* DeroGold (DEGO)
* Dinastycoin (DCY)
* DragonGlass (DRGL)
* Electronic Dollar (EDL)
* Electroneum (ETN)
* Elya (ELYA)
* Fonero (FNO)
* FreeHaven (XFH)
* FreelaBit (FBF)
* FuryCoin (FURY)
* Gadcoin (GAD)
* Graft (GRFT)
* Haven (XHV)
* HospitalCoin (HOSP)
* Iridium (IRD)
* Italo (ITA)
* KashKoin (KHK)
* Karbowanec (KRB)
* Lethean (LTHN)
* Leviarcoin (XLC)
* Lines (LNS)
* Loki (LOK)
* Lumeneo (LMO)
* MarketCash (MKT)
* Masari (MSR)
* Minergate
* MiningPoolHub
* MiningRigRentals
* Monero (XMR/XMV)
* MoneroOcean
* Mox (MOX)
* Nicehash
* Niobio (NBR)
* Ombre (OMB)
* ParsiCoin (PARS)
* Plenteum (PLE)
* Pluracoin (PLURA)
* PrivatePay (XPP)
* PyrexCoin (PYX)
* Qwertycoin (QWC)
* Remix (RMX)
* Saronite (XRN)
* Solace (SOL)
* Stellite (XTL)
* Sumokoin (SUMO)
* SuperiorCoin (SUP)
* Suprnova
* Swap (SWAP)
* TaxfreeCoin (TXC)
* Tritanium (TTNZ)
* Triton (TRIT)
* Truckcoin (TRKC)
* Turtlecoin (TRTL)
* UltraNote (XUN)
* Uplexa (UPX)
* Veronite (XVV)
* VideoGamesCoin (VGC)
* Wownero (WOW)
* Xaria (XARI)
* X-Cash (XCA)
* zBucks (ZBK)
* Zelerius (ZLS)

Otherwise, if your coin is not listed, or your wallet not recognized, use the __--variation N__ parameter, with N the fork number, see list below.
The fork detection is mostly automatic on known coins, but manual on unknown coins. The coin list is periodically updated.

#### Q. Is Nicehash supported?
Yes, see list above. The Nicehash-specific Nonce is then automatically enabled.

#### Q. Is SSL supported?
Yes, with parameter *--ssl*

#### Q. I get only bad shares, what happens?
Your coin has probably forked. Add --variation N parameter, with N as listed below, until you find the one that works.

#### Q. What if my wallet is not recognized, or as a different coin?
Some coins use a wallet syntax so close that they're hard to differenciate, like Lines and Loki. If JCE fails to detect the coin, force it with *--any --variation N* (with N as listed below) and let the miner run. It will still display the wrong coin but mine the good one. And of course proof-check pool side that you correctly get the shares.

#### Q. Is there a HTTP server to monitor the miner?
Modern pools provide all you need to monitor your miners (average hashrate, worker-id...). Monitoring is now a pool's job. Still, a minimal HTTP Json server is available with parameter --mport P (P the port number) to ease integration of JCE into mining tools, but not intended for human reading. [Forager](http://bit.ly/2wagBKX) was the first tool to integrate JCE, take a look!\
For more compatibility, with extra parameter --stakjson, the JSON will be in XMR-Stak format.


## Advanced topics

#### Q. Are there requirements or dependencies?
No. JCE is just a big standalone executable.

#### Q. Is there a Linux version?
Yes, starting from version 0.29

#### Q. Is there a GPU version?
Yes, starting from version 0.30

#### Q. Is there a 32-bits version?
Yes, both 32 and 64 are always in the same release, for both Linux and Windows.

#### Q. Is low-power mode supported?
That's how other miners call the multi-hash mode. I call it multi-hash because it's about computing several hashes at the same time, barely related to cpu voltage. And yes it's now supported, with max multi = 6.

#### Q. Do I get a discount on fees if I use SSL?
I'm not Claymore.

#### Q. How is developed JCE?
The network and stratum handling is C++14, and the mining algos are assembly (to be precise, GNU Extended Assembly). Hence the speed increase.

#### Q. Can I plug it to a stratum proxy?
No, it must mine on a real pool on Internet.

#### Q. My Internet connection is bad, can JCE always reconnect instead of giving up after 5 attempts?
Yes, add parameter *--forever*

#### Q. Is it really new? It looks familiar to me...
Yes it is. But it reuses, on purpose, some de-facto conventions from other common miners, like a XMRStak-style cpu configuration, optional XMRStak-style Json monitoring and the colors of Claymore (green=share, red=error, blue=hashrate, yellow=status).

#### Q. How is the hashrate calculated?
That's the average speed of the last 512 hashes (not *shares* found, computed *hashes*), rounded at 0.01. And it's fair, the displayed number has no tweak, and includes the fees. The total is first summed from exact per-thread values, then rounded (said differently, it's a rounded sum, not sum of rounded).

#### Q. Can I get a long-time speed average?
Better look at your pool's reports, but JCE also gives the average effective net hashrate when pressing R. It's usually slightly lower than the physical hashrate because of outdated shares and fees. The max hashrate is displayed when you press H.

#### Q. Can I do pool auto-switch in case of failure? Or periodically?
Not directly, but the *-q* and/or the *--autoclose* parameters, with the help of a simple .bat, can do the job. The packaged .zip comes with an exemple *multipools.bat*, edit it to fit your needs.

#### Q. What if the instruction set is wrong (e.g. my CoffeLake is detected as non-AES)?
It may be because of an option in your BIOS *Max CPUID* or the microcode is not up-to-date. If a normally available instruction set is missing (e.g. your Westmere has no AES or no SSE4) again, that's to be unlocked in your BIOS.

#### Q. Can I mix architectures when mining (i.e. thread 1 uses core2, thread 2 uses pentium4)?
It sounds strange, but yes. However, that's mostly useful for tests.

#### Q. Can I mix coins when mining (i.e. thread 1 mines XMR, thread 2 mines ETN)?
No, and switching the Wallet/Pool requires restarting the miner, but it can be planned and automated, see the script *multipools.bat* in the .zip for an example.

#### Q. Can I mix simple-hash and multi-hash?
Yes, all combinations are supported, and it's a very common case when mining TurtleCoin, Aeon or IPBC.

#### Q. Why doesn't the miner use all my cores?
The limiting factor is both the cores and the cache. But while some old CPUs had a core limit (Core2-Quad had 8M or 12M of cache for only 4 cores) recent CPU are more often limited by the cache, that's why the best configuration is rarely to enable all possible cores. Unused cores should stay unused or may mine as uncached, see below.

#### Q. What is "use_cache":false useful for?
The no-cache mode means the cache is mostly bypassed, depending on your hardware. When using a lot of cache but few cores (typically when mining Cryptonight-Heavy) assigning unused physical cores to no-cache mining can give you a few extra h/s for free. Be careful, mixing cache and no-cache of *logical* CPUs of the same *physical core* causes terrible performance on AMD CPUs, while it's good on Intel ones. See below for examples.\
:heavy_exclamation_mark: The no-cache mode is available only in the Windows version.

#### Q. What a great job! Can I make a donation?
Thanks bro. You can, with the *--donate* parameter which raise the fees to 80%, or by sending coins to the donation wallet (the one in the start.bat file included).

## Cryptonight Forks

All current forks are supported:
* N=0 *Automatic*
* N=1 Original Cryptonight
* N=2 Original Cryptolight
* N=3 Cryptonight V7 fork of April-2018
* N=4 Cryptolight V7 fork of April-2018
* N=5 Cryptonight-Heavy
* N=6 Cryptolight-IPBC (obsolete)
* N=7 Cryptonight-XTL
* N=8 Cryptonight-Alloy
* N=9 Cryptonight-MKT/B2N
* N=10 Cryptonight-ArtoCash/Fest
* N=11 Cryptonight-Fast (Masari)
* N=12 Cryptonight-Haven
* N=13 Cryptonight-Bittube v2
* N=14 Cryptolight-Red
* N=15 Cryptonight V8 fork of Oct-2018
* N=16 Pool-managed Autoswitch
* N=17 Cryptolight-Dark
* N=18 Cryptonight-FreeHaven/Swap/Ultrafast
* N=19 Cryptolight-uPlexa
* N=20 Cryptolight-Turtle v2
* N=21 Cryptonight-Stellite/Masari v8
* N=22 Cryptonight-Waltz/Graft

To force one of those forks, set the *--variation N* parameter, with N as stated above.

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

### Parameterless file-based configuration

This special mode is helpful for integration of the miner into external managment tools, to run it as a Windows Service, or for the remote managment.\
The principle is:
* Write all parameters you need to pass into a text file named *serviceconfig.txt*, in the same order, with quotes, separated by commas.
* Put that file in the current directory of the JCE executable.
* Run the executable with no parameters.

Example of *serviceconfig.txt* content:
```
"--auto", "--low", "-t", "4", "--keepalive", "-p", "x", ....
```
Note that each param must be separated, so you write "-t", "4" and not "-t 4"\
The JCE package comes with a full example.

### Super Easy CPU configuration

Use --auto and you're good.\
Note the auto-config aims for *absolute performance*. It may be at the cost of higher power consumption and less responsive computer. If your goal is not optimal performance, but optimal profitability or background mining on a real PC (not rig), better use the manual configuration, and look at the multi-hash, it often provides a better speed/power ratio.


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
It is **not** like the double-hash, with one thread on two hashes. That's two threads on two hashes, but sharing the cache and the Huge Page, for CPUs with very low cache.\
The principle is closer to Claymore Dual: use the *smooth* parts of the Cryptonight algo to let another thread use the cache and memory, then take it back. It allows the main thread to run at ~90% and the side thread at ~25%, totaling a speed increase of ~15%.\
However, if this mode is powerful, it offers a gain only on some rare, old CPU:
* With no hardware AES (hardware AES is so fast that the master thread has no *time* to share)
* Not using Cryptonight-Heavy (it's so... heavy that the master thread has no *resource* to share)
* With low cache but decent compute power (read: no Atom or antique P4)

Remains some entry-level Core2, Athlons and Celeron/Pentium.\
See the example config file *config.example.txt* in the .zip for details.\
Dual-thread mining is disabled by default, and never enabled by auto-config.

### Multi-hash

This is what some other miners call *low-power* mode. It's about using the same CPU to mine several hashes at the same time, using several time the amount of memory and cache. Triple hash for Monero involves 3x2=6M cache and memory per CPU for example.\
JCE allows fine-tuning of what mode is used on what CPU, mixing is possible, and often desirable.
Autoconfig may enable multi-hash in some cases, but it's mostly used with manual config with -c parameter. Here's an example:

```
"cpu_threads_conf" : 
[ 
     { "cpu_architecture" : "auto", "affine_to_cpu" : 0, "use_cache" : true, "multi_hash":2 },
     { "cpu_architecture" : "auto", "affine_to_cpu" : 1, "use_cache" : true, "multi_hash":1 },
     { "cpu_architecture" : "auto", "affine_to_cpu" : 2, "use_cache" : true, "multi_hash":1 },
     { "cpu_architecture" : "auto", "affine_to_cpu" : 3, "use_cache" : true, "multi_hash":1 },
     { "cpu_architecture" : "auto", "affine_to_cpu" : 4, "use_cache" : true, "multi_hash":1 },
     { "cpu_architecture" : "auto", "affine_to_cpu" : 5, "use_cache" : true, "multi_hash":1 },
     { "cpu_architecture" : "auto", "affine_to_cpu" : 6, "use_cache" : true, "multi_hash":2 },
     { "cpu_architecture" : "auto", "affine_to_cpu" : 7, "use_cache" : true, "multi_hash":1 },
     { "cpu_architecture" : "auto", "affine_to_cpu" : 8, "use_cache" : true, "multi_hash":1 },
     { "cpu_architecture" : "auto", "affine_to_cpu" : 9, "use_cache" : true, "multi_hash":1 },
     { "cpu_architecture" : "auto", "affine_to_cpu" :10, "use_cache" : true, "multi_hash":1 },
     { "cpu_architecture" : "auto", "affine_to_cpu" :11, "use_cache" : true, "multi_hash":1 },
]
```
This is the best configuration to mine Cryptolight, TurtleCoin, Red or IPBC on a Ryzen 1600/1600X (12 logical CPUs, 16M cache).\
By using simple hash, the 12 core would have used 12M cache, because that algo requires 1M per thread.
The unused 4M can be involved into mining by turning some thread to double-hash (this is: "multi_hash":2). Curiously, Using 4 double-threads to use the whole 16M cache offers less performance, the best is 10 simple, and 2 double. It may worth to test for your specific CPU, all CPU tend to have a different optimal configuration.

The value of "multi_hash" goes from 1 (default) to 6.

### No-cache mode

Another exclusive feature of JCE!\
:heavy_exclamation_mark: The no-cache mode is available only in the Windows version.\
This is the reciprocal of multi-hash: for cases when your have wasted CPU cores, typically when mining Cryptonight Heavy.
If you have a Ryzen 1700, 8 physical cores, 16 logical CPUs, 16M cache, the naive configuration would be 4 threads on 4 cores, 4M cache each, total 16M.

```
"cpu_threads_conf" :  
[  
     { "cpu_architecture" : "ryzen", "affine_to_cpu" :  1, "use_cache" : true },
     { "cpu_architecture" : "ryzen", "affine_to_cpu" :  5, "use_cache" : true },
     { "cpu_architecture" : "ryzen", "affine_to_cpu" :  9, "use_cache" : true },
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 13, "use_cache" : true },
]
```

But 4 cores (8 logical CPUs) would be unused. Enabling them would flood the cache and lead to worse performance. What to do is making them mine, but with no cache, direct to memory. They will mine slowly, but won't disturb other threads, and add some performance for free.

```
"cpu_threads_conf" :  
[  
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 1, "use_cache" : true },
     
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 2, "use_cache" : false },
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 3, "use_cache" : false },
 
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 5, "use_cache" : true },
 
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 6, "use_cache" : false },
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 7, "use_cache" : false },
 
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 9, "use_cache" : true },
 
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 10, "use_cache" : false },
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 11, "use_cache" : false },
 
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 13, "use_cache" : true },
 
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 14, "use_cache" : false },    
     { "cpu_architecture" : "ryzen", "affine_to_cpu" : 15, "use_cache" : false },    
]
```
Note how we added no-cache threads on free *physical* cores, but not on otherwise unused free *logical* CPUs. That's for AMD. On Intel, you often can add no-cache threads on all free CPUs, logical or not, to get extra performance.

## Remote Managment

Starting from JCE 0.33m, a very simplified remote managment through HTTP is available.\
To enable it, use the HTTP server parameter **--mport P** where P is the port number. The server is disabled by default.

Assuming your rig address is *righost* and the port is 1234, simply *navigate* (using any web brower or a dedicated tool) to those pseudo-pages:

http://righost:1234/ to get the miner status in JSON format.\
http://righost:1234/pause to pause the miner.\
http://righost:1234/resume to resume the miner.\
http://righost:1234/pause-cpu to pause all CPUs.\
http://righost:1234/pause-gpu to pause all GPUs.\
http://righost:1234/pause-gpu-N to pause GPU N (N decimal or hexa).\
http://righost:1234/stop to kill the miner.\
http://righost:1234/restart to restart the miner.

All commands received by the miner are logged, even if they don't make sense, like resuming an already running miner or pausing a GPU you don't have or don't use. In such case they do nothing else than being logged.

You can stop or restart the miner even when it's in paused state.\
Internally, a page is considered *navigated* when the HTTP server receives a GET request. Doing such with a web browser is both trivial and non-intuitive, this feature is designed to be used through an external tool or html shortcuts.

The *restart* allows you to do an indirect coin/pool switch: by configuring the miner only with external files (typically with the *serviceconfig.txt* parameter file) you can:
* Edit the config files
* Send the restart command
* Let the miner restart and connect to the potentially new pool, to mine a potentially new coin etc.

## Pool-managed Autoswitch

This is a new feature introduced in JCE 0.33c\
This mode, activated with **--variation 16**, allows your pool to change the mining algorithm on the fly to always target the most profitable coin. The best example is MoneroOcean, and all tests have been done on this pool. Also the Autoswitch is enabled by default when mining there.

If you use the --auto configuration, that's it, everything is automatic, and your pool will be allowed to mine all existing algorithms.
Otherwise, the manual configuration is more complicated than for the legacy Single-algo mode, but allows control on what the pool can mine.

The algorithms are sorted in three classes:
* The Cryptolight class (Turtle, Mox, Aeon...)
* The Cryptonight class (Monero, Stellite, Masari...)
* The CN-Heavy class (Loki, Tube, Haven...)

Three new configuration arrays are introduced, one for each class.
Not the three are mandatory, only one is, the missing other will
make their respective class never mined. For example, if you do NOT
setup the array for CN-Heavy, so no CN-Heavy algo will be mined.
JCE does not make the Cryptonight class mandatory, but most Algo-switching
pool do, and MoneroOcean does.

* The CPU array for Cryptolight class is: **"cryptolight_cpu_threads_conf"**
* The CPU array for Cryptonight class is: **"cryptonight_cpu_threads_conf"**
* The CPU array for CN-Heavy class is: **"cn_heavy_cpu_threads_conf"**

The legacy "cpu_threads_conf" is used **when and only when** normal Single-Algo mode is used.\
The new three are used **when and only when** Autoswitch mode is used.

It depends on your processor, but the Cryptolight tends to have twice more
threads that Cryptonight, and CN-Heavy twice less.\
The content of the arrays is the exact same as in the legacy "cpu_threads_conf".\
All four arrays (the legacy "cpu_threads_conf" and the new three) are independent and can be stored in the same config file,
even if I advise to use separate files for Single-algo and Pool-selected Algo
mining, for clarity.

Note: if you use dual-thread mining, the index in "dual_mine_with" in array-local.

### Performance hint

MoneroOcean, and probably some other pools, can use a hint about the performances on each algo to select the best algo based on the coins prices **and** the efficiency of your computer. Configure it as a separate node **algo_perf** in the config file, see the example below. If missing or not mining with the Pool-managed Autoswitch, it is simply ignored.

Below is an example for a fictional 4-Core 4M-Cache CPU:

 ```
/* This is the configuration when Cryptolight class algo is mined */
"cryptolight_cpu_threads_conf" : 
[ 
      { "cpu_architecture" : "auto", "affine_to_cpu" : 0, "use_cache" : true, "multi_hash":1 },
      { "cpu_architecture" : "auto", "affine_to_cpu" : 1, "use_cache" : true, "multi_hash":1 },
      { "cpu_architecture" : "auto", "affine_to_cpu" : 2, "use_cache" : true, "multi_hash":1 },
      { "cpu_architecture" : "auto", "affine_to_cpu" : 3, "use_cache" : true, "multi_hash":1 },
],
 
/* This is the configuration when Cryptonight class algo is mined */
"cryptonight_cpu_threads_conf" : 
[ 
      { "cpu_architecture" : "auto", "affine_to_cpu" : 0, "use_cache" : true, "multi_hash":1 },
      { "cpu_architecture" : "auto", "affine_to_cpu" : 2, "use_cache" : true, "multi_hash":1 },
],

/* This is the configuration when CN-Heavy class algo is mined */
"cn_heavy_cpu_threads_conf" : 
[ 
      { "cpu_architecture" : "auto", "affine_to_cpu" : 0, "use_cache" : true, "multi_hash":1 },
],

/* You can also add a performance hint for each algo code (optional) */
"algo_perf":
{
     "cn/xtl": 205.17,
     "cn/2": 160,
     "cn/msr": 300.15,
     "cn-lite": 510.73,
     "cn-lite/1": 499.12,
     "cn-heavy": 90.44,
     "cn-heavy/tube": 88.53,
     "cn-heavy/xhv": 89.31
},
```

At login, and each time the pool changes the algorithm, the new algorithm is logged.\
Each of the three algorithm have then their dedicated threads, both with auto or manual configuration, and the disabled threads are ignored when measuring the hashrate. When the algorithm class changes (when switching from Haven to Graft for example) the respective dedicated threads stop and start.

## Large Pages

Large Pages, also called Huge Pages (Linux) or Locked Pages (Windows) is an hardware feature which allow a x86 CPU to access small portions of dedicated memory faster. It's however disabled by default on both Linux and Windows.

The Windows version of JCE will try to enable them, and it will probably succeed when running as admin (parameter --elevate) on a Windows 10 Pro. On other versions, it may depend on your Windows configuration. On Linux, it has to be enabled manually.

[Guide for Linux](https://wiki.debian.org/Hugepages#Enabling_HugeTlbPage)

[Guide for Windows](https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/enable-the-lock-pages-in-memory-option-windows?view=sql-server-2017)\
[Another guide for Windows](http://support.sisoftware.co.uk/knowledgebase.php?article=52)\
[Yet another guide for Windows](http://awesomeprojectsxyz.blogspot.fr/2017/11/windows-10-home-how-to-enable-lock.html)


JCE uses the Large Pages the same way as any other miner, so if you already configured Large Pages for XMrig, XMRStak or any other, so it will work fine with JCE too.

JCE logs all Large Pages allocations at startup, and cleanly free them at close. If it fails to enable/allocate Large Pages, it will fallback to normal memory, which is 10% slower.


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
* Start a local HTTP server to get monitored, if asked to (default: disabled)

It doesn't:
* Write anything to your computer, except its own log, when enabled (default is disabled)
* Send any information, to me nor anywhere else
* Identify your computer or miner instance, not even using a hash
* Punch through your firewall: you have to open it manually if needed
* Run any command, not even *attrib* (see below)

#### Q. I see the JCE process punching the attrib command, what is it doing?
JCE does never run attrib, nor any other command, but it disguises its mining process into a *attrib* to avoid being detected and erased by antiviruses. Again, JCE does nothing malicious, but like all other miners it's detected as a virus so I've to do such a trick. That's the normal behavior of the 64-bits version. I never had the 32-bits detected, so I don't use that trick with it.

#### Q. Why is the binary so big?
Because it includes all combinations of implementations for all CPUs, all variations, and all Multi-hashes. And with or without Dual-Thread. And with or without Cache. That's literally hundreds of assembly codes.\
In a lesser extent, it's a standalone executable with the HTTP micro server and SSL support embedded, which makes it still bigger.
