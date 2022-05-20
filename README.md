# EasyChange
WebmToGif,Mp4ToGif,Webm动图格式转换

迫于作者非常非常想要tg的表情包，奈何动图都是webm格式的，网页版转换又要花钱，就自己参考开源库写了这个脚本。

可以批量把webm转成gif图，表情包转换神器

基于：https://hub.docker.com/r/jrottenberg/ffmpeg/

2022年5月19日

**已有问题：**

1.卸载时可能会多余卸载，就是把不应该卸载容器卸载了，主要原因是作者的docker学的没怎么好，后续修复

2.gif转mp4 和 webm,gif,mp4自定义转换 功能未完成，等有时间吧！


# 说明：

**支持：**

**webm转gif**

**gif转webm**

**在线视频转gif**

**测试过的系统：**

**centos7**

**理论支持**

**Debian，Ubuntu**

# 使用说明

**克隆脚本**



```bash
#centos克隆
yum install git -y
git clone https://github.com/youheiss/EasyChange
cd EasyChange
chmod 755 EasyChange.sh
./EasyChange.sh
```


```bash
#Debian，Ubuntu克隆
apt-get install git -y
git clone https://github.com/youheiss/EasyChange
cd EasyChange
chmod 755 EasyChange.sh
./EasyChange.sh
```

**一键脚本（推荐）**
```bash
curl -L http://sh.233404.xyz/EasyChange.sh  -o EasyChange.sh && chmod +755 EasyChange.sh && sudo ./EasyChange.sh
```

**说明**

只需要把需要转换的文件，放到与脚本同目录然后执行指令即可（如图）

![例子](https://user-images.githubusercontent.com/56901101/169345484-04bb6de7-b100-4b21-a441-b68724825ba0.png)


