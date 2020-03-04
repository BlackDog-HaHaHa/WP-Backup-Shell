## wordpress定时备份（Shell版）

**脚本可能并不适用与每个人，仅供参考**

环境：CentOS 7

简介：定时以“网站+日期”为名生成压缩包，使用rclone挂载Google Drive，利用rclone move上传至Google Drive。