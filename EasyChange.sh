#版本1.0.0
#最后更新"2022年5月19日"
#厂库地址"https://github.com/youheiss/EasyChange"

#判断gif文件夹
GifMk(){
    if [ ! -d $(pwd)/gif ];then
    mkdir -p $(pwd)/gif
    echo "创建Gif文件夹完成"
    fi
}
#判断webm文件夹
WebmMk(){
    if [ ! -d $(pwd)/webm ];then
    mkdir -p $(pwd)/webm
    echo "创建Gif文件夹完成"
    fi
}

WebmToGif(){
    echo "-------------------------"
    echo "Webm顺序转Gif"
    echo "例如：有10个文件分别为0.webm，1.webm至9.webm，最小值为0，最大值为9，脚本会转换10次"
    echo "脚本(作者)很笨，用的是for遍历。如果gif文件已存在将会替换(可能吧)"
    echo "-------------------------"
    read -p "最小值: " SXmin
    read -p "最大值: " SXmax
    GifMk #gif目录是否存在,不存在就创建
    for((i=$SXmin;i<=$SXmax;i++));do
    let Vwebp=i
    docker run -v $(pwd):$(pwd) -w $(pwd)        jrottenberg/ffmpeg:3.2-scratch -stats         -i $Vwebp.webp         $(pwd)/gif/$Vwebp.gif
    done
    echo ""
    echo "-------------------------"
    echo "GIF动图目录:$(pwd)/gif"
    echo "WebM转GIF已完成:"
    echo "-------------------------"
    echo ""
}
GifToWebm(){
    echo ""
    echo "-------------------------"
    echo "Gif顺序转Webm"
    echo "例如：有10个文件分别为0.gif，1.gif至9.gif，最小值为0，最大值为9，脚本会转换10次"
    echo "如果只有一个文件，可以最小值和最大值一样"
    echo "脚本(作者)很笨，用的是for遍历。如果webm文件已存在将会替换(可能吧)"
    echo "-------------------------"
    echo ""
    read -p "最小值: " SXmin
    read -p "最大值: " SXmax
    WebmMk #gif目录是否存在,不存在就创建
    for((i=$SXmin;i<=$SXmax;i++));do
    let Vgif=i
    docker run -v $(pwd):$(pwd) -w $(pwd)        jrottenberg/ffmpeg:3.2-scratch -stats         -i $Vgif.gif         $(pwd)/webm/$Vgif.webm
    done
    echo ""
    echo "-------------------------"
    echo "Webm目录:$(pwd)/webm"
    echo "GIF转Webm已完成:"
    echo "-------------------------"
    echo ""
}
OnlineMp4ToGif(){
    echo ""
    echo "-------------------------"
    echo "在线Mp4顺序转gif"
    echo "带添加"
    echo "脚本(作者)很笨，用的是for遍历。如果webm文件已存在将会替换(可能吧)"
    echo "-------------------------"
    echo  "在线地址例子：http://archive.org/download/thethreeagesbusterkeaton/Buster.Keaton.The.Three.Ages.ogv"
    echo  "时长段例子：00:49:42，请严格遵守"
    echo  "截取时长例子：5"
    echo  "帧率例子：30，注意帧率越高文件越大"
    echo  "输出文件的帧率例子：30，注意帧率越高文件越大"
    echo  "转换后的名称：test"
    echo "-------------------------"
    echo ""
    read -p "请输入视频在线地址: " Mp4Url
    read -p "请输入转换的时间段: " mp4Time
    read -p "请输入截取时长: " mp4Length
    read -p "请输入帧率: " mp4Fps
    read -p "请输入输出文件的帧率: " mp4OutFps
    read -p "请输入转换后的名称: " mp4Nema
    GifMk #gif目录是否存在,不存在就创建
    docker run jrottenberg/ffmpeg -stats          -i $Mp4Url         -loop 0          -final_delay 500 -c:v gif -f gif -ss $mp4Time -t $mp4Length -r $mp4Fps -vframes $mp4OutFps  - > $(pwd)/gif/$mp4Nema.gif
    echo ""
    echo "-------------------------"
    echo "GIF动图目录:$(pwd)/gif"
    echo "在线Mp4转GIF已完成:"
    echo "-------------------------"
    echo ""
}


install(){
    # check release
	if [ -f /etc/redhat-release ]; then
	    osName="centos"
	elif cat /etc/issue | grep -Eqi "debian"; then
	    osName="debian"
	elif cat /etc/issue | grep -Eqi "ubuntu"; then
	    osName="ubuntu"
	elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
	    osName="centos"
	elif cat /proc/version | grep -Eqi "debian"; then
	    osName="debian"
	elif cat /proc/version | grep -Eqi "ubuntu"; then
	    osName="ubuntu"
	elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
	    osName="centos"
	fi
	
# install docker and ffmpeg
    if [ "${osName}" == "centos" ]; then
    	yum update 
    	yum -y install docker 
    	docker pull jrottenberg/ffmpeg
	else
    	apt-get update 
    	apt-get -y install docker 
    	docker pull jrottenberg/ffmpeg
	fi

}
Uninstall(){
    docker rm $(docker ps -a -q)

}
WcChange(){

    echo ""
    echo "############################################"
    echo "####欢迎使用Easy change"
    echo "####目前支持：webm,gif,mp4格式相互转换"
    echo "############################################"
    echo "0.安装Easy change"
    echo "1.webm转gif"
    echo "2.gif转webm"
    echo "3.在线视频转gif"  
    echo "4.gif转mp4"   
    echo "5.webm,gif,mp4自定义转换" 
    echo "99.卸载Easy change(慎重选择将会清理暂停的docker容器)" 
    echo ""
    read -r -e -p "请输入数字: " MenuNum && echo
         case "$MenuNum" in
                0)
                   install
                    ;;
                1)
                   WebmToGif
                    ;;
                2)
                   GifToWebm
                    ;;
                3)
                    OnlineMp4ToGif
                    ;;
                4)
                    echo  "即将完成"
                    ;;
                5)
                    echo  "即将完成"
                    ;;
                99)
                    Uninstall
                    ;;
                *)
                    echo  "输入错误! 请输入正确的数字!"
                    ;;
         esac
 
 
}
WcChange
