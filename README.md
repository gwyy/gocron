## 备注
nodejs版本必须是9.0  先安装nvm回退nodejs版本
```shell
//安装nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source .zshrc

//安装nodejs
nvm install 8.17.0

//安装yarn
npm install -g yarn

//安装vue
yarn install

//测试运行前台项目
cd web/vue && yarn install

//前台打包成二进制
make package

//打包go项目
make build

//运行
./bin/gocron web
```


## 运行
```shell
  //运行主程序
  gocron web
  //运行node
  
  //生成前端项目
```

## 数据库配置
```sql
127.0.0.1
root
123456
crontab
```
## 后台账号密码
```shell
admin
aaaaaa
```
