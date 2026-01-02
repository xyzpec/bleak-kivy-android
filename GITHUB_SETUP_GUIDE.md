# GitHub Setup Guide - Personal Access Token

## 🚨 重要提醒

你提供的 `3WedxVhPq7BYRTcw8J2Vb6FxNnv+ax6x55Akubw4Xn8` **不是有效的GitHub Personal Access Token**。

GitHub不再接受密码认证，你需要创建一个 **Personal Access Token (PAT)**。

## 📝 详细步骤 - 创建Personal Access Token

### 步骤1: 访问GitHub Token设置页面
1. 打开浏览器
2. 访问: https://github.com/settings/tokens
3. 使用你的GitHub账号登录（如果还没登录）

### 步骤2: 生成新Token
1. 点击绿色的 **"Generate new token (classic)"** 按钮

2. 填写Token信息：
   - **Note**: `Bleak Kivy Android Build` （或者其他你容易记住的名字）
   - **Expiration**: 选择 **"No expiration"** （永不过期）或者选择一个未来的日期

3. 选择权限范围：
   - 在列表中找到 **"repo"**
   - **务必勾选** `repo` （这给予了仓库的完整控制权限）

4. **其他权限保持默认**（不要勾选太多权限）

5. 点击页面底部的 **"Generate token"** 按钮

### 步骤3: 保存Token
1. **立即复制** 显示的token
   - Token格式类似：`ghp_xxxxxxxxxxxxxxxxxxxx`
   - **重要**: 这个页面关闭后，你将永远看不到这个token了！

2. 将token保存在安全的地方

## 🔧 推送代码到GitHub

### 方法1: 使用自动化脚本（推荐）
```bash
cd "C:\Users\Lozical\work\hzc\blueapp\bleak-develop\bleak-develop\examples\kivy"
push-to-github.bat
```

### 方法2: 手动设置
如果脚本有问题，可以手动操作：
```bash
# 设置远程仓库（替换 YOUR_TOKEN_HERE 为你的实际token）
git remote set-url origin https://xyzpec:YOUR_TOKEN_HERE@github.com/xyzpec/bleak-kivy-android.git

# 推送代码
git push -u origin main
```

## ✅ 验证成功

推送成功后，你会看到类似这样的输出：
```
Enumerating objects: 10, done.
Counting objects: 100% (10/10), done.
...
To https://github.com/xyzpec/bleak-kivy-android.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

## 🚀 构建Android APK

1. 访问: https://github.com/xyzpec/bleak-kivy-android
2. 点击 **"Actions"** 标签页
3. 点击 **"Build Android APK"** workflow
4. 点击 **"Run workflow"** 按钮开始构建
5. 等待10-15分钟构建完成
6. 在构建结果页面下载APK文件

## 🔒 安全提醒

- **Personal Access Token 等同于你的GitHub密码**
- 妥善保管，不要告诉任何人
- 如果怀疑泄露，立即在GitHub设置中撤销该token
- 不要将token提交到代码仓库中

## ❓ 常见问题

### Q: 为什么不能用密码？
A: GitHub在2021年底禁用了密码认证，要求使用Personal Access Token以提高安全性。

### Q: Token过期了怎么办？
A: 返回 https://github.com/settings/tokens 重新生成一个新的token。

### Q: 构建失败怎么办？
A: 检查GitHub Actions的日志，查看具体的错误信息。

### Q: 如何撤销token？
A: 去 https://github.com/settings/tokens 点击要撤销的token右侧的 "Delete" 按钮。

---

按照这个指南操作，你应该能够成功推送代码并构建Android APK！🎯
