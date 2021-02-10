ENGLISH | [简体中文](#简介)

## Introduction

This project is to combine the docker images built by myself together, which are all available in Docker Hub.

This project will be updated frequently. Happy to use it.

Here are the docker images list:

| Name | Features | Remarks |
| ---- | ---- | ---- |
| zhonger/ubuntu:latest | support zsh and a no-root sudo user | Ubuntu 20.04 |
| zhonger/slurm:latest | support slurm and pbs commands | only for slurm single node |
| zhonger/ubuntu:ssh | support ssh access without passwords | import the public key from github with the specific username |
| zhonger/oneapi-hpckit:latest | personal intel oneapi | support zsh and a no-root sudo user |
| zhonger/conquest:1.0.6 | The latest CONQUEST with MKL library |  |
| zhonger/conquest:slurm | The latest CONQUEST with slurm and pbs |  |
| zhonger/conquest:slurm-ssh | support slur, pbs and ssh |  |
| zhonger/conquest:latest | The latest CONQUEST with MKL library | the same as `slurm` version |

More images are beging added.

## 简介

本项目将一些本人构建使用的个性化镜像整合在一起，均可从 Docker Hub 下载。

本项目将保持可持续版本更新，欢迎大家使用。

以下为镜像列表：

| 镜像名 | 特性 | 备注 |
| ---- | ---- | ---- |
| zhonger/ubuntu:latest | zsh, 非 root 用户 | 20.04 |
| zhonger/slurm:latest | 同时支持 slurm 和 pbs 命令 | 仅限 slurm 单节点 |
| zhonger/ubuntu:ssh | 支持 ssh 无密码登录 | 从 Github 导入指定用户名的所有公钥 |
| zhonger/oneapi-hpckit:latest | 个性化 intel oneapi | 增加 zsh 和 非 root 用户 |
| zhonger/conquest:1.0.6 | 基于 MKL 的最新 CONQUEST 编译 |  |
| zhonger/conquest:slurm | 支持 slurm 和 pbs 的 CONQUEST 编译版本 |  |
| zhonger/conquest:slurm-ssh | 支持 slurm、pbs 和 ssh |  |
| zhonger/conquest:latest | 支持 slurm 和 pbs 的 CONQUEST 编译版本 | 与 slurm 版本一致 |

更多镜像正在继续加入中。