rm -rf crypto-config && rm -rf channel-artifacts

# 生成证书和密钥文件
cryptogen generate --config=./config/crypto-config.yaml

# 生成创世区块
configtxgen -profile SampleMultiNodeEtcdRaft -channelID mychannel1 -configPath ./config -outputBlock ./channel-artifacts/genesis.block

# 生成创建通道使用的配置交易文件
configtxgen -profile TwoOrgsChannel -configPath ./config -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID mychannel

# 为组织Org1配置锚节点
configtxgen -profile TwoOrgsChannel -configPath ./config -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID mychannel -asOrg Org1MSP

# 为组织Org2配置锚节点
configtxgen -profile TwoOrgsChannel -configPath ./config -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID mychannel -asOrg Org2MSP

docker-compose -f ./docker-compose/docker-compose-up.yaml up -d

