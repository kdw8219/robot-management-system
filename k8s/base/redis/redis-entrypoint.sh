#!/bin/sh
set -e

# redis.conf 복사
cp /base.conf /tmp/redis.conf

# requirepass 추가
echo "requirepass $REDIS_PASSWORD" >> /tmp/redis.conf

# appendonly, 기타 설정도 override 가능
# echo "appendonly yes" >> /tmp/redis.conf

# 실행
exec redis-server /tmp/redis.conf
