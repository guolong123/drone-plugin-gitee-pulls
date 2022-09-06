#!/bin/sh


# k8s中执行时环境变量的传递是通过共享文件来实现的；这里通过读文件并传递到环境变量中；避免此插件comment时状态错误问题。
if [ -f /run/drone/env ];then
  export `cat /run/drone/env|sed -e "s/\"//g" |grep DRONE`
fi
echo 'start...'
/bin/drone-plugin-gitee-pulls