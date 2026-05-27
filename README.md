# 科研司南 Skill

把“科研 AI 工具库”变成一个 Codex 可调用的推荐器。你描述科研任务，它从目录里推荐合适的 Skill、MCP 和工具，并说明先用哪个、怎么输入、会产出什么、哪里必须人工检查。

适合这些问题：

- 我想做 Abaqus 仿真，有没有 Skill 或 MCP？
- Nature 论文润色、图表检查、返修信怎么做？
- 文献综述、CNKI、Zotero、论文笔记该用什么工具？
- MATLAB、SPSS、QGIS、问卷、PPT、画图表有什么可用工具？

## 安装

如果你已经有 Codex 的 `skill-installer`，可以直接安装这个仓库根目录：

```powershell
python C:\Users\Administrator\.codex\skills\.system\skill-installer\scripts\install-skill-from-github.py --repo ZMoe2024/research-ai-toolkit-skill --path . --name research-ai-toolkit
```

如果你不用安装器，也可以手动复制：

```powershell
git clone https://github.com/ZMoe2024/research-ai-toolkit-skill.git
Copy-Item -Recurse -Force .\research-ai-toolkit-skill C:\Users\Administrator\.codex\skills\research-ai-toolkit
```

## 安装后怎么问

安装后重启 Codex，最短用法是：

```text
/keyan + 你的科研任务
```

比如：

```text
/keyan 我想做 Abaqus 仿真
/keyan 论文润色和图表返修用什么 Skill？
/keyan 我要做问卷数据分析，找合适的 MCP
/keyan 帮我从查文献到写综述配一套工具
```

也可以不用斜杠，直接说：

```text
科研司南：研究生写 Nature 论文润色和返修信，用什么工具？
```

## 科研 AI 交流群

这是科研 AI 工具库的交流群。可以在群里聊 Skill、MCP 和各种科研工具怎么用，也可以问具体科研任务该怎么配工具。

适合讨论：

- 某个 Skill 或 MCP 到底怎么安装、怎么调用。
- 写论文、查文献、跑仿真、做问卷、整理数据这类任务该用什么工具。
- 使用过程里的报错、踩坑、输入模板和结果检查。
- 发现了好用工具，也可以顺手发到群里。

> 二维码如果过期，以网站首页的最新入口为准。

<img src="assets/community-qr.jpg" alt="科研交流微信群二维码" width="260">

## 它会怎么回答

它不会替你直接写论文或跑实验，而是先做“工具路由”：

- 推荐 3 到 7 个最匹配的工具。
- 说明每个工具适合什么任务。
- 告诉你应该输入什么材料。
- 告诉你可能输出什么结果。
- 标注它是可真实执行、流程辅助，还是只是目录入口。
- 标注风险和必须人工检查的地方。
- 给出工具库直达链接，方便跳到对应卡片。

## 数据来源

目录数据来自“科研 AI 工具库”的本地采集表，核心文件是：

```text
references/tool-catalog.json
```

推荐规则在：

```text
references/recommendation-playbook.md
references/task-taxonomy.md
references/priority-shortlist.md
```

网站直达链接配置在：

```text
references/site-config.md
```

默认不写死服务器 IP。部署后把它改成你的正式域名，例如：

```text
https://your-domain.example/graduate-agent-skill-dashboard.html
```

以后换域名，只需要改 `references/site-config.md` 里的 `dashboard_base_url`。

## 更新目录数据

如果主站 `graduate-agent-skill-dashboard.html` 里的采集表更新了，运行：

```powershell
powershell -ExecutionPolicy Bypass -File E:\ai\research-ai-toolkit-skill\scripts\extract-dashboard-catalog.ps1
```

然后提交更新后的 `references/tool-catalog.json`。

## 触发词

`SKILL.md` 已写入这些触发词：

```text
/keyan
/科研
/科研司南
科研司南
科研工具推荐
帮我推荐 skill
帮我找 MCP
```

## 目录结构

```text
research-ai-toolkit-skill/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── assets/
│   └── community-qr.jpg
├── prompts/
├── references/
│   ├── priority-shortlist.md
│   ├── recommendation-playbook.md
│   ├── site-config.md
│   ├── task-taxonomy.md
│   └── tool-catalog.json
└── scripts/
    └── extract-dashboard-catalog.ps1
```
