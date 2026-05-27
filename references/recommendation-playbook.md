# Recommendation Playbook

## Input Extraction

Extract these user facts:

- task: what they want done
- discipline: 学科 / 专业 / 研究方向
- software: specific software or platform
- output: desired deliverable
- language: Chinese / English / bilingual
- automation tolerance: wants real execution or just guidance
- risk: manuscript, medical, simulation, data, or other high-stakes output

If the user only says "推荐工具", ask one short question. If the user names a task
or software, recommend directly.

## Scoring

Start with 0 points.

- +8 exact software match in `name`, `local_software`, `summary`, or `subject_tags`
- +6 exact task match in `research_need`, `plain_purpose`, or `summary`
- +4 discipline match
- +4 `priority` is `P0`
- +2 `priority` is `P1`
- +4 `execution_level` is `real-execution` when the user wants automation
- +3 `execution_level` is `guided-workflow` when the user wants writing/review guidance
- +3 `source_type` is `skill+mcp` when the user asks for both Skill and MCP
- +3 `mcp` is `yes` when the user asks for MCP
- +2 `chinese_friendly` is `high` when the user asks in Chinese
- -3 `status` is `gap`, unless no collected item matches
- -2 `risk_level` is `high` for manuscript/medical/simulation conclusions unless the user explicitly accepts risk

Sort by score. If scores tie, prefer P0, then real-execution, then lower risk.

## Recommendation Types

### Direct Recommendation

Use when a task is concrete, such as:

- "Abaqus 有什么 skill/mcp"
- "论文润色用什么"
- "文献综述怎么做"

Return 3 to 5 entries.

### Workflow Recommendation

Use when the task has multiple stages, such as:

- "我想从选题到投稿"
- "我想做一篇综述"
- "我想做 Nature 论文返修"

Return a sequence:

1. search / collect
2. read / structure
3. draft / execute
4. check / revise

### Gap Recommendation

Use when no collected item matches well. Return:

- closest alternatives
- missing capability
- keywords to search next
- whether to submit this as a catalog gap

## Response Constraints

- Use Chinese unless the user asks for English.
- Do not over-explain the scoring.
- Do not recommend more than 7 tools.
- Put the best recommendation first.
- Mention risk in plain language, not legal language.
- Include source URLs when available.
- Include the direct website card link when an `id` is present.

## Output Template

```markdown
**先用这个**
1. `name`
   适合：...
   为什么：...
   输入：...
   输出：...
   注意：...
   来源：...
   卡片：...

**备选**
2. ...

**我的建议路线**
先 ...，再 ...，最后 ...
```

## Direct Website Card Link

Use:

```text
graduate-agent-skill-dashboard.html?tool=<ID>&q=<encoded-name>#collection
```

Before producing card links, read `references/site-config.md` if present. If
`dashboard_base_url` is set, treat it as the full dashboard HTML URL and append
the query/hash:

```text
<dashboard_base_url>?tool=<ID>&q=<encoded-name>#collection
```

If the user gives a different deployed base URL in the current conversation,
prefer the user's URL for that answer. If no base URL is known, provide the
relative link only and remind the user to set `dashboard_base_url` after
deployment.
