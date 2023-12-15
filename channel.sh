# 分别进入 cli-peer0-org1、cli-peer1-org1、cli-peer0-org2、cli-peer1-org2
# docker exec -it cli-peer0-org1 bash
peer channel create -o orderer0.consortiums.com:7050 -c mychannel -f /hyperledger/opt/peer/channel-artifacts/channel.tx --tls --cafile /hyperledger/opt/peer/crypto-config/ordererOrganizations/consortiums.com/orderers/orderer0.consortiums.com/msp/tlscacerts/tlsca.consortiums.com-cert.pem
peer channel join -b /hyperledger/opt/peer/channel-artifacts/genesis.block



# 设置 cli-peer0-org1 为 Org1MSP 锚节点
# docker exec -it cli-peer0-org1 bash 
peer channel update -o orderer0.consortiums.com:7050 -c mychannel -f /hyperledger/opt/peer/channel-artifacts/Org1MSPanchors.tx --tls --cafile /hyperledger/opt/peer/crypto-config/ordererOrganizations/consortiums.com/orderers/orderer0.consortiums.com/msp/tlscacerts/tlsca.consortiums.com-cert.pem


# 设置 cli-peer0-org2 为 Org2MSP 锚节点
# docker exec -it cli-peer0-org2 bash
peer channel update -o orderer0.consortiums.com:7050 -c mychannel -f /hyperledger/opt/peer/channel-artifacts/Org2MSPanchors.tx --tls --cafile /hyperledger/opt/peer/crypto-config/ordererOrganizations/consortiums.com/orderers/orderer0.consortiums.com/msp/tlscacerts/tlsca.consortiums.com-cert.pem