#!/bin/bash

# docker images 와 비슷한 포맷의 리스트가 주어졌다고 가정
# 첫 번째 라인 헤더(IMAGE …) 제외하고 ID(두 번째 컬럼)만 추출

echo "Deleting all Docker volumes..."
docker volume rm $(docker volume ls -q)
echo "✔ All volumes deleted."