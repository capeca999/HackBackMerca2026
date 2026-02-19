CREATE TABLE IF NOT EXISTS app_user (
                                        id            BIGSERIAL PRIMARY KEY,
                                        username      VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
    );

CREATE TABLE IF NOT EXISTS app_user_roles (
                                              user_id BIGINT NOT NULL,
                                              role    VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_id, role),
    CONSTRAINT fk_app_user_roles_user
    FOREIGN KEY (user_id) REFERENCES app_user(id)
    ON DELETE CASCADE
    );

CREATE INDEX IF NOT EXISTS idx_app_user_username
    ON app_user(username);
