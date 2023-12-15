export CA_FILE=/hyperledger/opt/peer/crypto-config/ordererOrganizations/consortiums.com/orderers/orderer0.consortiums.com/tls/ca.crt
export CLIENT_CERT=/hyperledger/opt/peer/crypto-config/ordererOrganizations/consortiums.com/orderers/orderer0.consortiums.com/tls/server.crt
export CLIENT_KEY=/hyperledger/opt/peer/crypto-config/ordererOrganizations/consortiums.com/orderers/orderer0.consortiums.com/tls/server.key
osnadmin channel list -o orderer0.consortiums.com:7053 --ca-file=$CA_FILE --client-cert=$CLIENT_CERT --client-key=$CLIENT_KEY
osnadmin channel join -o orderer0.consortiums.com:7053 --channelID mychannel --config-block /hyperledger/opt/peer/channel-artifacts/genesis.block --ca-file=$CA_FILE --client-cert=$CLIENT_CERT --client-key=$CLIENT_KEY