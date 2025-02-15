#!/bin/bash 
__dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $__dir/useful_commands.sh
. ${__dir}/vars/variables.sh
# Making sure old screens are not running
killall screen
screen -wipe
GASPRICE="0.000000001ulava"
lavad tx gov submit-proposal spec-add ./cookbook/spec_add_ethereum.json,./cookbook/spec_add_cosmoshub.json,./cookbook/spec_add_lava.json,./cookbook/spec_add_osmosis.json,./cookbook/spec_add_fantom.json,./cookbook/spec_add_celo.json -y --from alice --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx gov vote 1 yes -y --from alice --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

sleep 4

lavad tx gov submit-proposal spec-add ./cookbook/spec_add_arbitrum.json,./cookbook/spec_add_starknet.json,./cookbook/spec_add_aptos.json,./cookbook/spec_add_juno.json,./cookbook/spec_add_polygon.json -y --from alice --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx gov vote 2 yes -y --from alice --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

CLIENTSTAKE="500000000000ulava"
PROVIDERSTAKE="500000000000ulava"

sleep 4
lavad tx pairing stake-client "ETH1"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-client "GTH1"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-client "COS3"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-client "FTM250" $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-client "CELO"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-client "LAV1"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-client "COS4"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto"  --gas-prices $GASPRICE
lavad tx pairing stake-client "ALFAJORES" $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto"  --gas-prices $GASPRICE
lavad tx pairing stake-client "ARB1"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto"  --gas-prices $GASPRICE
lavad tx pairing stake-client "ARBN"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto"  --gas-prices $GASPRICE
lavad tx pairing stake-client "APT1"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto"  --gas-prices $GASPRICE
lavad tx pairing stake-client "STRK"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto"  --gas-prices $GASPRICE
lavad tx pairing stake-client "JUN1"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-client "COS5"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-client "POLYGON1"   $CLIENTSTAKE 1 -y --from user1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE


# Ethereum providers
lavad tx pairing stake-provider "ETH1" $PROVIDERSTAKE "127.0.0.1:2221,jsonrpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "ETH1" $PROVIDERSTAKE "127.0.0.1:2222,jsonrpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "ETH1" $PROVIDERSTAKE "127.0.0.1:2223,jsonrpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "ETH1" $PROVIDERSTAKE "127.0.0.1:2224,jsonrpc,1" 1 -y --from servicer4 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "ETH1" $PROVIDERSTAKE "127.0.0.1:2225,jsonrpc,1" 1 -y --from servicer5 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

#Goerli providers
lavad tx pairing stake-provider "GTH1" $PROVIDERSTAKE "127.0.0.1:2121,jsonrpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "GTH1" $PROVIDERSTAKE "127.0.0.1:2122,jsonrpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "GTH1" $PROVIDERSTAKE "127.0.0.1:2123,jsonrpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "GTH1" $PROVIDERSTAKE "127.0.0.1:2124,jsonrpc,1" 1 -y --from servicer4 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "GTH1" $PROVIDERSTAKE "127.0.0.1:2125,jsonrpc,1" 1 -y --from servicer5 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

# Fantom providers
lavad tx pairing stake-provider "FTM250" $PROVIDERSTAKE "127.0.0.1:2251,jsonrpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "FTM250" $PROVIDERSTAKE "127.0.0.1:2252,jsonrpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "FTM250" $PROVIDERSTAKE "127.0.0.1:2253,jsonrpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "FTM250" $PROVIDERSTAKE "127.0.0.1:2254,jsonrpc,1" 1 -y --from servicer4 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "FTM250" $PROVIDERSTAKE "127.0.0.1:2255,jsonrpc,1" 1 -y --from servicer5 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

# Celo providers
lavad tx pairing stake-provider "CELO" $PROVIDERSTAKE "127.0.0.1:5241,jsonrpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "CELO" $PROVIDERSTAKE "127.0.0.1:5242,jsonrpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "CELO" $PROVIDERSTAKE "127.0.0.1:5243,jsonrpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

#Celo alfahores testnet providers
lavad tx pairing stake-provider "ALFAJORES" $PROVIDERSTAKE "127.0.0.1:6241,jsonrpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "ALFAJORES" $PROVIDERSTAKE "127.0.0.1:6242,jsonrpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "ALFAJORES" $PROVIDERSTAKE "127.0.0.1:6243,jsonrpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

#Arbitrum mainet providers
lavad tx pairing stake-provider "ARB1" $PROVIDERSTAKE "127.0.0.1:7241,jsonrpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "ARB1" $PROVIDERSTAKE "127.0.0.1:7242,jsonrpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "ARB1" $PROVIDERSTAKE "127.0.0.1:7243,jsonrpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

#Aptos mainet providers
lavad tx pairing stake-provider "APT1" $PROVIDERSTAKE "127.0.0.1:10031,rest,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "APT1" $PROVIDERSTAKE "127.0.0.1:10032,rest,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "APT1" $PROVIDERSTAKE "127.0.0.1:10033,rest,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

#Starknet mainet providers
lavad tx pairing stake-provider "STRK" $PROVIDERSTAKE "127.0.0.1:8241,jsonrpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "STRK" $PROVIDERSTAKE "127.0.0.1:8242,jsonrpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "STRK" $PROVIDERSTAKE "127.0.0.1:8243,jsonrpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

# Polygon Providers
lavad tx pairing stake-provider "POLYGON1" $PROVIDERSTAKE "127.0.0.1:4344,jsonrpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "POLYGON1" $PROVIDERSTAKE "127.0.0.1:4345,jsonrpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "POLYGON1" $PROVIDERSTAKE "127.0.0.1:4346,jsonrpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

# Cosmos Chains:

# Osmosis providers
lavad tx pairing stake-provider "COS3" $PROVIDERSTAKE "127.0.0.1:2241,tendermintrpc,1 127.0.0.1:2231,rest,1 127.0.0.1:2234,grpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "COS3" $PROVIDERSTAKE "127.0.0.1:2242,tendermintrpc,1 127.0.0.1:2232,rest,1 127.0.0.1:2235,grpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "COS3" $PROVIDERSTAKE "127.0.0.1:2243,tendermintrpc,1 127.0.0.1:2233,rest,1 127.0.0.1:2236,grpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

# Lava Providers
lavad tx pairing stake-provider "LAV1" $PROVIDERSTAKE "127.0.0.1:2261,tendermintrpc,1 127.0.0.1:2271,rest,1 127.0.0.1:2274,grpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "LAV1" $PROVIDERSTAKE "127.0.0.1:2262,tendermintrpc,1 127.0.0.1:2272,rest,1 127.0.0.1:2275,grpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "LAV1" $PROVIDERSTAKE "127.0.0.1:2263,tendermintrpc,1 127.0.0.1:2273,rest,1 127.0.0.1:2276,grpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

# Juno providers
lavad tx pairing stake-provider "JUN1" $PROVIDERSTAKE "127.0.0.1:2361,tendermintrpc,1 127.0.0.1:2371,rest,1 127.0.0.1:2374,grpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "JUN1" $PROVIDERSTAKE "127.0.0.1:2362,tendermintrpc,1 127.0.0.1:2372,rest,1 127.0.0.1:2375,grpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "JUN1" $PROVIDERSTAKE "127.0.0.1:2363,tendermintrpc,1 127.0.0.1:2373,rest,1 127.0.0.1:2376,grpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

# Osmosis testnet providers
lavad tx pairing stake-provider "COS4" $PROVIDERSTAKE "127.0.0.1:4241,tendermintrpc,1 127.0.0.1:4231,rest,1 127.0.0.1:4234,grpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "COS4" $PROVIDERSTAKE "127.0.0.1:4242,tendermintrpc,1 127.0.0.1:4232,rest,1 127.0.0.1:4235,grpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "COS4" $PROVIDERSTAKE "127.0.0.1:4243,tendermintrpc,1 127.0.0.1:4233,rest,1 127.0.0.1:4236,grpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

# Cosmoshub Providers
lavad tx pairing stake-provider "COS5" $PROVIDERSTAKE "127.0.0.1:2344,tendermintrpc,1 127.0.0.1:2331,rest,1 127.0.0.1:2334,grpc,1" 1 -y --from servicer1 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "COS5" $PROVIDERSTAKE "127.0.0.1:2342,tendermintrpc,1 127.0.0.1:2332,rest,1 127.0.0.1:2335,grpc,1" 1 -y --from servicer2 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE
lavad tx pairing stake-provider "COS5" $PROVIDERSTAKE "127.0.0.1:2343,tendermintrpc,1 127.0.0.1:2333,rest,1 127.0.0.1:2336,grpc,1" 1 -y --from servicer3 --gas-adjustment "1.5" --gas "auto" --gas-prices $GASPRICE

echo "---------------Queries------------------"
lavad query pairing providers "ETH1"
lavad query pairing clients "ETH1"

# we need to wait for the next epoch for the stake to take action.
sleep_until_next_epoch

. ${__dir}/setup_providers.sh
