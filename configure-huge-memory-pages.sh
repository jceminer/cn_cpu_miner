#!/bin/sh


sysctl_conf=/etc/sysctl.d/50-jce-cn-cpu-miner.conf
current_hugepages_count=`sysctl vm.nr_hugepages -n`


echo_and_create_sysctl_conf() {

  reason="${1}"

  if [ "${reason}" = "too_low" ]; then
      echo "Current hugepages count is ${current_hugepages_count} while jce-cn-cpu-miner-cpu recommends 128"
      echo "I will now create ${sysctl_conf} to raise vm.nr_hugepages to 128"
      echo "# https://wiki.debian.org/Hugepages" > "${sysctl_conf}"
      echo "vm.nr_hugepages=128" >> "${sysctl_conf}"
      sysctl -q -p "${sysctl_conf}"
      echo 
  elif [ "${reason}" = "ok_but_xmr_stak" ]; then
      echo "Current hugepages count is ${current_hugepages_count} but this settings comes from xmr-stak package"
      echo "I will now create ${sysctl_conf} to set vm.nr_hugepages to 128"
      echo "# https://wiki.debian.org/Hugepages" > "${sysctl_conf}"
      echo "vm.nr_hugepages=128" >> "${sysctl_conf}"
  elif [ "${reason}" = "ok_but_myself" ]; then
      echo "Current hugepages count is ${current_hugepages_count} but this settings comes from me"
      echo "I will now create ${sysctl_conf} to set vm.nr_hugepages to 128"
      echo "# https://wiki.debian.org/Hugepages" > "${sysctl_conf}"
      echo "vm.nr_hugepages=128" >> "${sysctl_conf}"
  elif [ "${reason}" = "ok_no_xmr_stak_or_myself" ]; then
      echo "I will now create ${sysctl_conf} but with commented settings as your system"
      echo "seems to be already overriding this value"
      echo "# https://wiki.debian.org/Hugepages" > "${sysctl_conf}"
      echo "# Line below is commented because your system was already having" >> "${sysctl_conf}"
      echo "# hugepage enabled when installing this package" >> "${sysctl_conf}"
      echo "#vm.nr_hugepages=128" >> "${sysctl_conf}"
  fi

}


if [ ${current_hugepages_count} -lt 128 ]; then
    echo_and_create_sysctl_conf too_low
else
    if [ -f "${sysctl_conf}" ]; then
        if `grep -q '^vm.nr_hugepages=128' "${sysctl_conf}"`; then
            echo_and_create_sysctl_conf ok_but_myself
        else
            echo_and_create_sysctl_conf ok_no_xmr_stak_or_myself
        fi
    elif [ -f "/etc/sysctl.d/50-xmr-stak-cpu.conf" ]; then
        if `grep -q '^vm.nr_hugepages=128' /etc/sysctl.d/50-xmr-stak-cpu.conf`; then
            echo_and_create_sysctl_conf ok_but_xmr_stak
        else
            echo_and_create_sysctl_conf ok_no_xmr_stak
        fi
    elif [ -f "/etc/sysctl.d/50-xmr-stak.conf" ]; then
        if `grep -q '^vm.nr_hugepages=128' /etc/sysctl.d/50-xmr-stak.conf`; then
            echo_and_create_sysctl_conf ok_but_xmr_stak
        else
            echo_and_create_sysctl_conf ok_no_xmr_stak
        fi
    else
        echo_and_create_sysctl_conf ok_no_xmr_stak_or_myself
    fi
fi
