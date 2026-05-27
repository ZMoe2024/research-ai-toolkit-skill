# Priority Shortlist

Use this only when `tool-catalog.json` is unavailable.

## P0 / Hot Entries

### scientific-agent-skills / claude-scientific-skills

- Best for: broad scientific computing, databases, visualization, scientific workflows.
- Type: skill + MCP.
- Strength: real execution with Python/scientific stack.
- Source: https://github.com/K-Dense-AI/scientific-agent-skills

### academic-research-skills

- Best for: research → write → review → revise → finalize.
- Type: skill.
- Strength: Chinese-friendly academic workflow.
- Source: https://github.com/Imbad0202/academic-research-skills/blob/main/README.zh-CN.md

### nature-skills

- Best for: Nature-style writing, polishing, paper reading, figures, reviewer response, paper-to-PPT.
- Type: skill collection.
- Strength: strong manuscript-related workflow.
- Source: https://github.com/Yuan1z0825/nature-skills

### Agent-Reach

- Best for: agent-assisted search across Twitter, Reddit, YouTube, GitHub, Bilibili, Xiaohongshu.
- Type: agent/web collection.
- Strength: finding tutorials, social proof, examples.

### xiaohongshu-mcp

- Best for: Xiaohongshu search/content collection.
- Type: MCP.
- Strength: Chinese social-media research collection.

### text-to-cae

- Best for: turning natural-language CAE requirements into simulation scripts.
- Type: engineering/simulation tool.
- Source: https://github.com/Cai-aa/text-to-cae

### abaqus-mcp

- Best for: connecting AI agents to Abaqus workflows.
- Type: MCP.
- Source: https://github.com/Cai-aa/abaqus-mcp

## Task Routes

- 文献检索：nature-academic-search, academic-research-skills, Zotero/CNKI-related entries.
- 论文润色：nature-polishing, nature-skills, academic-research-skills.
- 图表：nature-figure, scientific-agent-skills.
- 审稿回复：nature-response, academic-research-skills.
- PPT：nature-paper2ppt.
- 仿真：text-to-cae, abaqus-mcp, scientific-agent-skills.
- 社媒采集：Agent-Reach, xiaohongshu-mcp.
- MCP 连接：prefer `source_type=mcp` or `mcp=yes`.
