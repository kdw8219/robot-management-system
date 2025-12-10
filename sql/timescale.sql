CREATE EXTENSION IF NOT EXISTS timescaledb;

CREATE TABLE robot_heartbeat (
    robot_id     TEXT NOT NULL,
    is_alive     BOOLEAN NOT NULL,
    timestamp           TIMESTAMPTZ NOT NULL,
    PRIMARY KEY (robot_id, timestamp)
);

SELECT create_hypertable('robot_heartbeat', 'timestamp', if_not_exists => TRUE);

SELECT add_retention_policy('robot_heartbeat', INTERVAL '10 days');

ALTER TABLE robot_heartbeat SET (
    timescaledb.compress,
    timescaledb.compress_segmentby = 'robot_id'
);

SELECT add_compression_policy('robot_heartbeat', INTERVAL '7 days');


CREATE TABLE robot_status (
    robot_id     TEXT NOT NULL,
    battery     DOUBLE PRECISION NOT NULL,
    status     TEXT NOT NULL,
    error     TEXT NOT NULL,
    timestamp           TIMESTAMPTZ NOT NULL,
    PRIMARY KEY (robot_id, timestamp)
);

SELECT create_hypertable('robot_status', 'timestamp', if_not_exists => TRUE);

SELECT add_retention_policy('robot_status', INTERVAL '10 days');

ALTER TABLE robot_status SET (
    timescaledb.compress,
    timescaledb.compress_segmentby = 'robot_id'
);

SELECT add_compression_policy('robot_status', INTERVAL '7 days');

CREATE TABLE robot_pos (
    robot_id     TEXT NOT NULL,
    x           DOUBLE PRECISION NOT NULL,
    y           DOUBLE PRECISION NOT NULL,
    z           DOUBLE PRECISION NOT NULL,
    orig_x           DOUBLE PRECISION NOT NULL,
    orig_y           DOUBLE PRECISION NOT NULL,
    orig_z           DOUBLE PRECISION NOT NULL,
    orig_w           DOUBLE PRECISION NOT NULL,
    linear_speed           DOUBLE PRECISION NOT NULL,
    angular_speed           DOUBLE PRECISION NOT NULL,
    timestamp           TIMESTAMPTZ NOT NULL,
    PRIMARY KEY (robot_id, timestamp)
);

SELECT create_hypertable('robot_pos', 'timestamp', if_not_exists => TRUE);

SELECT add_retention_policy('robot_pos', INTERVAL '10 days');

ALTER TABLE robot_pos SET (
    timescaledb.compress,
    timescaledb.compress_segmentby = 'robot_id'
);

SELECT add_compression_policy('robot_pos', INTERVAL '7 days');