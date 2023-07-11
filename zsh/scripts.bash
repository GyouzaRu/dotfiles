# proxy setting
proxy(){
    host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
    host_ip_part=$(cut -f 1-3 -d "." <<< $host_ip)
    if [ $host_ip_part = "127.0.0" ]; then
        export ALL_PROXY="sock5://127.0.0.1:7890"
        export all_proxy="sock5://127.0.0.1:7890"
        export http_proxy="http://127.0.0.1:7890"
        export https_proxy="http://127.0.0.1:7890"
        echo "start proxy"
    else
        export ALL_PROXY="sock5://$host_ip:7890"
        export all_proxy="sock5://$host_ip:7890"
        export http_proxy="http://$host_ip:7890"
        export https_proxy="http://$host_ip:7890"
        echo "start wsl proxy, $host_ip"
    fi
}

unproxy(){
    unset ALL_PROXY
    unset all_proxy
    unset http_proxy
    unset https_proxy
    echo "unset all proxy"
}
