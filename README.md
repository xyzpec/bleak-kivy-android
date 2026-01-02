# Bleak Kivy Android Demo

这是一个使用Bleak库的Kivy应用程序，用于扫描和显示附近的蓝牙设备。

## 功能特性

- **桌面运行**: 可以在Windows、macOS、Linux桌面运行
- **Android APK构建**: 通过GitHub Actions自动构建Android APK
- **蓝牙扫描**: 扫描附近的蓝牙LE设备
- **设备连接**: 连接到发现的设备并显示其GATT服务和特征
- **实时日志**: 显示扫描和连接过程中的日志信息

## 桌面运行

### 环境要求
- Python 3.9+
- Windows: pip install kivy bleak
- macOS/Linux: pip install kivy bleak

### 运行方法
```bash
pip install kivy bleak
python main.py
```

## Android APK构建

由于Windows无法直接构建Android APK，我们使用GitHub Actions进行云构建。

### 自动构建设置

#### 步骤1: 推送代码到GitHub（已完成）
代码已经使用Personal Access Token推送到GitHub仓库。

#### 步骤2: 访问GitHub Actions
1. 打开: https://github.com/xyzpec/bleak-kivy-android
2. 点击 **"Actions"** 标签页
3. 如果看到多个workflows，选择 **"Build Android APK"**
4. 点击 **"Run workflow"** 按钮（右上角 ▶️）
5. 等待构建完成（约10-15分钟）

#### 步骤3: 下载APK
构建成功后：
1. 在workflow结果页面找到 **"Artifacts"** 部分
2. 点击 **"bleak-kivy-apk"** 下载APK文件
3. 将APK传输到Android设备安装

#### 故障排除
如果Actions页面显示"No workflow runs yet":
1. 刷新页面等待几分钟
2. 检查workflow文件语法是否正确
3. 尝试手动推送最新更改：
   ```bash
   git push origin main
   ```

### APK安装

1. 下载生成的APK文件（bleak-kivy-apk.zip）
2. 解压后将APK传输到Android设备
3. 在Android设备上安装APK
4. 授予蓝牙权限

## 应用权限

Android版本需要以下权限：
- `BLUETOOTH`: 基础蓝牙功能
- `BLUETOOTH_SCAN`: 扫描蓝牙设备
- `BLUETOOTH_CONNECT`: 连接蓝牙设备
- `ACCESS_FINE_LOCATION`: 位置权限（Android 6.0+必需）
- `ACCESS_BACKGROUND_LOCATION`: 后台位置权限

## 技术细节

- **架构**: arm64-v8a (默认)
- **Python版本**: 3.9.18
- **Kivy版本**: 2.3.0
- **Bleak版本**: 1.1.1

## 故障排除

### 构建失败
- 检查GitHub Actions日志中的错误信息
- 确认所有依赖版本兼容

### 应用无法扫描设备
- 确保Android设备支持蓝牙LE
- 检查位置权限是否已授予
- 确认蓝牙已开启

### Windows本地构建（不推荐）
如果一定要在本地构建，需要Linux环境：

```bash
# Ubuntu/Debian
sudo apt install python3-pip git openjdk-11-jdk
pip3 install buildozer cython kivy
buildozer android debug
```
