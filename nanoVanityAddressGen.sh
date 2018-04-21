#!/bin/sh
i=0
g=0
while :
do
        RUNNING=$(curl -g -d '{ "action": "account_create", "wallet": "831DB5F7B53CA04AF47F40A873CC198BA21302DE5416085E522456C363230AE0" }' 127.0.01:7076);
        echo $RUNNING
        addr=$(echo $RUNNING | tr '"' '\n')

        for addr in $addr
        do
                if [[ "$addr" == *"xrb"* ]]; then
                        if [[ "$addr" == *"czar"* ]] || [[ "$addr" == *"chase"* ]] || [[ "$addr" == *"caesar"* ]]; then
                                g=$((g + 1))
                                echo WALLET FOUND
                                echo "Saved wallets :$g          Deleted wallets:$i"
                        else
                                RUNNING=$(curl -g -d '{ "action": "account_remove", "wallet": "831DB5F7B53CA04AF47F40A873CC198BA21302DE5416085E522456C363230AE0", "account": "'"$addr"'" }' 127.0.01:7076);
                                echo $RUNNING
                                i=$((i + 1))
                                echo "Saved wallets :$g          Deleted wallets:$i"
                                sleep 2
                        fi
                fi
        done
done
