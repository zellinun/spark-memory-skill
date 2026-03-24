---
name: spark-memory
description: "Persistent memory that learns. Records what matters, reflects overnight, recalls with intelligence. Powered by Spark — memory infrastructure for AI agents. Not flat storage. A brain."
metadata:
  openclaw:
    emoji: "🧠"
    requires:
      anyBins: ["curl", "python3"]
---

# Spark Memory

You have access to persistent memory powered by Spark. This means you can remember things across sessions — preferences, decisions, facts, corrections — and get smarter over time. Here's how to use it.

## Session Start

At the beginning of every session, run `scripts/spark-recall.sh` with the user's first message to load relevant memories. Inject the results into your context. This gives you continuity — you'll know what happened in previous sessions.

```bash
scripts/spark-recall.sh "the user's first message or topic"
```

If memories come back, use them naturally. Don't announce "I found 3 memories." Just *know* things. If a user said last week they prefer morning appointments, say "Want me to look at morning slots again?" — not "According to my records from March 16th..."

## During Conversation

When the user shares something important, record it using `scripts/spark-record.sh`. Don't record everything. Record what MATTERS:

- **Preferences:** "I prefer morning appointments" → `scripts/spark-record.sh "User prefers morning appointments" preference 6`
- **Decisions:** "We decided to use Stripe not Square" → `scripts/spark-record.sh "Decision: using Stripe instead of Square for payments" decision 7`
- **Corrections:** "Actually our hours are 7am not 8am" → `scripts/spark-record.sh "CORRECTION: Business hours start at 7am, not 8am" correction 9`
- **Business facts:** "Gate code for the Johnson property is 4521" → `scripts/spark-record.sh "Johnson property gate code: 4521" observation 7`
- **Lessons:** "The QuickBooks sync takes 30 seconds, not instant" → `scripts/spark-record.sh "QuickBooks sync takes ~30 seconds to complete" observation 5`
- **User feedback:** "I don't like when you list things in bullet points" → `scripts/spark-record.sh "User dislikes bullet-point formatting, prefers prose" user_feedback 8`

**Do NOT record:** greetings, acknowledgments, small talk, system messages, things you already know, or anything the user would find creepy to have stored.

### Importance Scoring (1-10)

- **1-3:** Nice to know but forgettable. Background context.
- **4-6:** Useful. Preferences, routine facts, general decisions.
- **7-8:** Important. Key business facts, significant decisions, client details.
- **9-10:** Critical. Corrections to wrong information, safety-relevant facts, high-value client data.

When in doubt, score a 5. Corrections should almost always be 8+.

## Session End

At the end of a conversation (or when the topic naturally wraps), record a session summary:

```bash
scripts/spark-record.sh "Session summary: Discussed Q2 marketing plan. Decided to focus on Instagram over TikTok. User wants draft copy by Friday." conversation 5
```

Keep summaries brief — what was discussed, what was decided, what's next.

## How Spark is Different

Spark doesn't just store text. Every night, it reflects on accumulated memories and synthesizes patterns — things like "This user always schedules on Thursdays" or "Client Martinez is high-value, $12K lifetime revenue." These reflections make you smarter over time without you doing anything. The more sessions you have, the more intelligent your recall becomes.

You can check memory status anytime:

```bash
scripts/spark-status.sh
```

This shows how many memories are stored, how many reflections have been generated, and overall memory health.
