# proxy setting
proxy(){
    export ALL_PROXY="sock5://127.0.0.1:7890"
    export all_proxy="sock5://127.0.0.1:7890"
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
    echo "start proxy"
}

wslproxy(){
    wsl_hostip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
    export ALL_PROXY="sock5://$wsl_hostip:7890"
    export all_proxy="sock5://$wsl_hostip:7890"
    export http_proxy="http://$wsl_hostip:7890"
    export https_proxy="http://$wsl_hostip:7890"
    echo "start wsl proxy, $wsl_hostip"
}

unproxy(){
    unset ALL_PROXY
    unset all_proxy
    unset http_proxy
    unset https_proxy
    echo "unset all proxy"
}
