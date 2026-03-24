#!/bin/bash
# Check Spark memory status — how many memories, reflections, patterns
SPARK_API_KEY="${SPARK_API_KEY:-}"
SPARK_ORG_ID="${SPARK_ORG_ID:-}"
SPARK_API_URL="${SPARK_API_URL:-https://aotmggizxfetxguthmuf.supabase.co/functions/v1}"

if [ -z "$SPARK_API_KEY" ] || [ -z "$SPARK_ORG_ID" ]; then
  echo '{"error": "SPARK_API_KEY and SPARK_ORG_ID must be set. Get yours at https://zellin.ai"}'
  exit 1
fi

curl -s -X POST "${SPARK_API_URL}/spark-memory-status" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${SPARK_API_KEY}" \
  -d "{\"org_id\": \"${SPARK_ORG_ID}\"}"
