peer lifecycle chaincode package basic.tar.gz --path /hyperledger/cluster/chaincode/go/chaincode-go --lang golang --label basic_1.0

peer lifecycle chaincode install basic.tar.gz

export CC_PACKAGE_ID=basic_1.0:4ec191e793b27e953ff2ede5a8bcc63152cecb1e4c3f301a26e22692c61967ad
export CA_FILE=/hyperledger/opt/peer/crypto-config/ordererOrganizations/consortiums.com/orderers/orderer0.consortiums.com/msp/tlscacerts/tlsca.consortiums.com-cert.pem
peer lifecycle chaincode approveformyorg -o orderer0.consortiums.com:7050 --channelID mychannel --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile $CA_FILE 

peer lifecycle chaincode checkcommitreadiness --channelID mychannel --name basic --version 1.0 --sequence 1 --tls --cafile $CA_FILE --output json


# 提交
peer lifecycle chaincode commit -o orderer0.consortiums.com:7050 --channelID mychannel --name basic --version 1.0 --sequence 1 --tls --cafile $CA_FILE \
    --peerAddresses peer0.org1.com:7051 --tlsRootCertFiles /hyperledger/opt/peer/crypto-config/peerOrganizations/org1.com/peers/peer0.org1.com/tls/ca.crt \
    --peerAddresses peer1.org1.com:8051 --tlsRootCertFiles /hyperledger/opt/peer/crypto-config/peerOrganizations/org1.com/peers/peer1.org1.com/tls/ca.crt \
    --peerAddresses peer0.org2.com:9051 --tlsRootCertFiles /hyperledger/opt/peer/crypto-config/peerOrganizations/org2.com/peers/peer0.org2.com/tls/ca.crt \
    --peerAddresses peer1.org2.com:10051 --tlsRootCertFiles /hyperledger/opt/peer/crypto-config/peerOrganizations/org2.com/peers/peer1.org2.com/tls/ca.crt

peer lifecycle chaincode querycommitted --channelID mychannel --name basic --cafile $CA_FILE


peer chaincode invoke -o orderer0.consortiums.com:7050 --tls --cafile $CA_FILE -C mychannel -n basic \
    --peerAddresses peer0.org1.com:7051 --tlsRootCertFiles /hyperledger/opt/peer/crypto-config/peerOrganizations/org1.com/peers/peer0.org1.com/tls/ca.crt \
    --peerAddresses peer1.org1.com:8051 --tlsRootCertFiles /hyperledger/opt/peer/crypto-config/peerOrganizations/org1.com/peers/peer1.org1.com/tls/ca.crt \
    --peerAddresses peer0.org2.com:9051 --tlsRootCertFiles /hyperledger/opt/peer/crypto-config/peerOrganizations/org2.com/peers/peer0.org2.com/tls/ca.crt \
    --peerAddresses peer1.org2.com:10051 --tlsRootCertFiles /hyperledger/opt/peer/crypto-config/peerOrganizations/org2.com/peers/peer1.org2.com/tls/ca.crt \
    -c '{"function":"InitLedger","Args":[]}'

peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'


