CREATE TABLE metrics (
    id SERIAL PRIMARY KEY,
    collected_at TIMESTAMPTZ DEFAULT NOW(),
    source TEXT NOT NULL,
    metric_name TEXT NOT NULL,
    metric_va
    labels JSONB
);

CREATE TABLE catalog (
    id SERIAL PRIMARY KEY,
    source TEXT NOT NULL,
    external_id TEXT NOT NULL,
    title TEXT NOT NULL,
    status TEXT,
    size_on_disk BIGINT DEFAULT 0,
    details JSONB,
    first_seen TIMESTAMPTZ DEFAULT NOW(),
    last_seen TIMESTAMPTZ DEFAULT NOW()
    UNIQUE (source, external_id)
);

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    occured_at TIMESTAMPTZ DEFAULT NOW(),
    source TEXT NOT NULL,
    event_type TEXT NOT NULL,
    title TEXT NOT NULL,
    details JSONB
);

CREATE INDEX idx_metrics_collected_at ON metrics(collected_at);
CREATE INDEX idx_metrics_name ON metrics(metric_name);
CREATE INDEX idx_events_occured_at ON events(occured_at DESC);