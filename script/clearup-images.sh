#!/bin/bash

# docker images 와 비슷한 포맷의 리스트가 주어졌다고 가정
# 첫 번째 라인 헤더(IMAGE …) 제외하고 ID(두 번째 컬럼)만 추출

image_ids=$(docker images --format "{{.ID}}")

if [ -z "$image_ids" ]; then
    echo "There's no image to delete."
    exit 0
fi

echo "Delete following images:"
echo "$image_ids"
echo

for id in $image_ids; do
    echo "Processing...: $id"
    docker rmi -f "$id"
done

echo "Complete!"
