# fabric_cluster

```
Error: got unexpected status: FORBIDDEN -- config update for existing channel did not pass initial checks: implicit policy evaluation failed - 0 sub-policies were satisfied, but this policy requires 1 of the 'Writers' sub-policies to be satisfied: permission denied
```

see https://stackoverflow.com/questions/54716671/failed-to-reach-implicit-threshold-of-1-sub-policies-required-1-remaining-perm

```yaml
- ORDERER_GENERAL_BOOTSTRAPMETHOD=file #启动排序节点的方法
- ORDERER_GENERAL_BOOTSTRAPFILE=/var/hyperledger/orderer/orderer.genesis.block # 创世区块的路径
```

因为 base.yaml 中这个，所以会产生一个系统 channel，只需各个节点加入，即可安装测试 chaincode
