# EasyChange
WebmToGif,Mp4ToGif,Webm动图格式转换
迫于作者非常非常想要tg的表情包，奈何动图都是webm格式的，网页版转换又要花钱，就自己参考开源库写了这个脚本。
可以批量把webm转成gif图，表情包转换神器
基于：https://hub.docker.com/r/jrottenberg/ffmpeg/
2022年5月19日

# 说明：

**支持：**

**webm转gif**

**gif转webm**

**在线视频转gif**

**测试过的系统：**

**centos7**

**理论支持**

**Debian，Ubuntu**

# 使用方法（克隆厂库）
**centos**

```bash
yum install git -y
cd EasyChange
git clone https://github.com/youheiss/EasyChange
chmod 755 EasyChange.sh
./EasyChange.sh
```
**Debian，Ubuntu**

```bash
apt-get install git -y
git clone https://github.com/youheiss/EasyChange
cd EasyChange
chmod 755 EasyChange.sh
./EasyChange.sh
```

# 使用方法推荐
curl -L https://sh.233404.xyz/EasyChange.sh  -o EasyChange.sh && chmod +755 EasyChange.sh && sudo ./EasyChange.sh
