# 使用 Node 20 的轻量 Alpine 镜像
FROM node:20-alpine3.20

# 设置工作目录
WORKDIR /tmp

# 复制项目文件
COPY index.js package.json ./

# 暴露端口
EXPOSE 3000

# 安装依赖，并安装额外工具
RUN apk update && apk add --no-cache openssl curl \
    && npm install \
    && chmod +x index.js

# 启动应用
CMD ["node", "index.js"]
